Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14gSVg-0001C1-00
	for mtd-list@infradead.org; Fri, 23 Mar 2001 14:25:48 +0000
Date: Fri, 23 Mar 2001 09:25:34 -0500 (EST)
Message-Id: <200103231425.f2NEPYH21217@new-york.lcs.mit.edu>
From: "Douglas S. J. De Couto" <decouto@lcs.mit.edu>
To: dwmw2@infradead.org
CC: mtd@infradead.org, ipaq@handhelds.org
In-reply-to: <11429.985336657@redhat.com> (message from David Woodhouse on
	Fri, 23 Mar 2001 08:37:37 +0000)
Subject: Re: jffs2 problem
Reply-to: decouto@lcs.mit.edu
References: <200103230202.f2N22R612056@new-york.lcs.mit.edu> <11429.985336657@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> >  is this likely to happen if i forgot to erase the flash with eflash
> > in the boat loader before loading the jffs2 image?  e.g. i had one
> > jffs2 image, and then i loaded another without eflashing.
> 
> Yes.

i tried it again, but definitely erasing first.  similar thing:

Argh. Special inode #1011 had more than one node
...

> A date should be sufficient.

hmmm.  my last checkout and compile was say weds 21 march.

[jffs2] bermuda% cat *.c *.h | grep Id:
 * $Id: background.c,v 1.10 2001/03/15 15:38:23 dwmw2 Exp $
 * $Id: build.c,v 1.16 2001/03/15 15:38:23 dwmw2 Exp $
 * $Id: compr.c,v 1.16 2001/03/15 15:38:23 dwmw2 Exp $
 * $Id: compr_rtime.c,v 1.5 2001/03/15 15:38:23 dwmw2 Exp $
 * $Id: compr_rubin.c,v 1.9 2001/03/15 15:38:23 dwmw2 Exp $
/* $Id: comprtest.c,v 1.4 2001/02/21 14:03:20 dwmw2 Exp $ */
 * $Id: compr_zlib.c,v 1.5 2001/03/15 15:38:24 dwmw2 Exp $
/* $Id: crc32.c,v 1.3 2001/02/07 16:45:32 dwmw2 Exp $ */
 * $Id: dir.c,v 1.38 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: erase.c,v 1.16 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: file.c,v 1.50 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: gc.c,v 1.47 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: ioctl.c,v 1.5 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: malloc.c,v 1.16 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: nodelist.c,v 1.27 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: nodemgmt.c,v 1.37 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: pushpull.c,v 1.6 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: read.c,v 1.11 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: readinode.c,v 1.54 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: scan.c,v 1.31 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: super.c,v 1.37 2001/03/19 23:21:31 dwmw2 Exp $
 * $Id: symlink.c,v 1.5 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: write.c,v 1.24 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: zlib.c,v 1.3 1997/12/23 10:47:42 paulus Exp $
/* $Id: compr_rubin.h,v 1.5 2001/02/26 13:50:01 dwmw2 Exp $ */
/* $Id: crc32.h,v 1.3 2001/02/26 14:44:37 dwmw2 Exp $ */
 * $Id: nodelist.h,v 1.44 2001/03/15 15:38:24 dwmw2 Exp $
 * $Id: pushpull.h,v 1.4 2001/03/15 15:38:24 dwmw2 Exp $
/*      $Id: zlib.h,v 1.2 1997/12/23 10:47:44 paulus Exp $      */

-- 
Douglas S. J. De Couto    decouto@lcs.mit.edu



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
