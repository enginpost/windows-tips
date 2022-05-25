# GATHER DETAILS
echo What kind of file?
echo 1:Blog Post, 2:Article, 3:Slideshow, 4:Cardset
read pageType
pageCategory=0
if [ $pageType != 1 ]
then
    echo Which category?
    echo 1:Learning, 2:Coaching, 3:Tools, 4:Analytics
    read pageCategory
fi

echo New page name?
read pageName
# replace spaces with underscores
pageName="${pageName// /_}"
#convert to lowercase
pageName=$(echo $pageName | tr '[:upper:]' '[:lower:]')

# build command
template=''
pageTypeName=''
if [ $pageType = 1 ]
then
    pageTypeName='Blog Post'
    template='./_resources/_templates/template.blogpost.html'
fi
if [ $pageType = 2 ]
then
    pageTypeName='Article'
    template='./_resources/_templates/template.article.html'
fi
if [ $pageType = 3 ]
then
    pageTypeName='Slideshow'
    template='./_resources/_templates/template.slideshow.html'
fi
if [ $pageType = 4 ]
then
    pageTypeName='Cardset'
    template='./_resources/_templates/template.cardset.html'
fi

pageCategoryName=''
destination=''
if [ $pageCategory = 0 ]
then
    pageCategoryName='Blog'
    destination="./docs/blog/${pageName}.md"
fi
if [ $pageCategory = 1 ]
then
    pageCategoryName='Learning'
    destination="./docs/learning/${pageName}.md"
fi
if [ $pageCategory = 2 ]
then
    pageCategoryName='Coaching'
    destination="./docs/coaching/${pageName}.md"
fi
if [ $pageCategory = 3 ]
then
    pageCategoryName='Tools'
    destination="./docs/tools/${pageName}.md"
fi
if [ $pageCategory = 4 ]
then
    pageCategoryName='Analytics'
    destination="./docs/analytics/${pageName}.md"
fi

cp $template $destination
echo Your new $pageTypeName called \'$pageName\' was created in the $pageCategoryName Docs subfolder.