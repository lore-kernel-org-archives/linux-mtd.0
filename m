From: eddy@emsoftltd.com (Eddy Yeung)
Date: Thu, 27 Feb 2003 16:14:09 +0800
Subject: Help on bad block table handling
Message-ID: <3E5DC8D1.9000900@emsoftltd.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

I have questions about the bad block table handling on nand flash with 
ext2.  Do you update the bad block table when you have erase and program 
failures?  The implementation that I am having creates the bad block 
table only when the flash is being formated.  That is, there will be no 
updating of the bad block table until next formating of the flash. 
 Should I update the bad block table when erase and program failures are 
detected?  Does anyone know whether there is an implementation for that? 
 Please advise!!  Thank you.

Best regards,
Eddy
eddy at emsoftltd.com
