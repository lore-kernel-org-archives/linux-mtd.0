Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aF5p-00010t-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 13:30:13 +0100
Message-ID: <001001c23957$3a290520$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: <tglx@linutronix.de>, "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, "? ??" <djh@gv.com.tw>, <cms@gv.com.tw>
References: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de>
Subject: thanks , after this patch , i mount jffs2 successfully
Date: Thu, 1 Aug 2002 20:30:31 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

dear all,

thanks , after this patch , i mount jffs2 successfully
(i also patched to make zlib_deflate/zlib_inflate inside kernel's lib
instead of module)

best regards,
kevin

----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "??" <kevin@gv.com.tw>; "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, August 01, 2002 5:28 PM
Subject: Re: do i have to "eraseall" first?


> On Thursday, 1. August 2002 05:23, ?? wrote:
> > dear all,
> >
> > the only different config settings is CONFIG_JFFS2_FS_NAND
> > but there is no "CONFIG_JFFS2_FS_NAND" in source of jffs2/mtd here!!
> > (i'm using lastest jffs2/mtd source from cvs)
> > please help
> Sorry, CONFIG_JFFS2_FS_NAND is not patched in. Please add it manually.
>
> See updated information at
http://www.linux-mtd.infradead.org/tech/nand.html
>
> --
> Thomas
> ___________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
