From: matsunaga_kazuhisa@yahoo.co.jp (matsunaga)
Date: Thu, 13 Mar 2003 00:47:36 +0900
Subject: dnode of meta data
References: <000e01c2e65b$71ca7020$210486da@ybb> <1047405009.24808.254.camel@passion.cambridge.redhat.com>
Message-ID: <000601c2e8ae$b46ea9a0$210486da@ybb>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> > I am testing on NAND flash.
> > There seems memory leak when you mount and unmount a device with some data.
> > Dnode resource acquired during mount seems not to be freed during unmount.
> 
> Mea Culpa. It was introduced with the latest round of GC/crc changes. It
> should be fixed in CVS now.

Thank you for the quick reaction. I would apreciate it.
By the way, if you write a file, a dnode of meta data is written and obsoleted just after that.
It consumes flash area(not much though) and might be caused by old fasioned format, 
but could the process be omitted in advance?

BR.
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
