From: matsunaga_kazuhisa@yahoo.co.jp (matsunaga)
Date: Mon, 10 Mar 2003 08:10:40 +0900
Subject: Memory leak
References: <000e01c2e65b$71ca7020$210486da@ybb> <200303092010.44211.tglx@linutronix.de>
Message-ID: <000f01c2e691$1a319a60$210486da@ybb>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

----- Original Message ----- 
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>; <linux-mtd@lists.infradead.org>
Sent: Monday, March 10, 2003 4:10 AM
Subject: Re: Memory leak


> On Sunday 09 March 2003 17:46, matsunaga wrote:
> > Hi all
> >
> > I am testing on NAND flash.
> > There seems memory leak when you mount and unmount a device with some data.
> > Dnode resource acquired during mount seems not to be freed during unmount.
> This is not a Problem of NAND Flash. It's a filesystem related problem. 
> Do you use JFFS2 ?
> If yes, which Dnode resource do you mean ? Where is it allocated ? Can you 
> please give more precise information ?

Sorry for lacking details.

Yes, I use JFFS2. 
If you mount a device with a file on JFFS2, a dirent node and a dnode are alloced.
But upper layer does not issue, jffs2_clear_inode for an inode of the dnode during unmount.
You can see it just by free command if my implementation is not wrong.

Best regards.
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
