Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hGsZ-0006vt-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 22:49:36 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Conn Clark'" <clark@esteem.com>
Cc: "'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: RE: How does one mount an existing jffs2 partition so it is   writeable?
Date: Tue, 20 Aug 2002 14:50:12 -0700
Message-ID: <005001c24893$8f78b480$7800000a@derelict>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D628D95.9447D6B6@esteem.com>
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

Here's the patch against 2.5.18-rmk1. It applies cleanly to all kernels
since.

http://www.murgatroid.com/badge4/release/ch-release-2002-07-14/src/kerne
l-patches/linux-2.5.18-rmk1-mtd-intel-varsize.patch

-ch


> -----Original Message-----
> From: root@esteem.com [mailto:root@esteem.com] On Behalf Of Conn Clark
> Sent: Tuesday, August 20, 2002 11:42 AM
> To: Christopher Hoover
> Cc: MTD Mailing List
> Subject: Re: How does one mount an existing jffs2 partition 
> so it is writeable?
> 
> 
> Christopher Hoover wrote:
> > 
> > At one point locking and unlocking flash with variable-sized blocks
> > (such as Intel C3 flash) simply didn't work.  I fixed it -- 
> the correct
> > code is in CVS and in current 2.4 (after some release I cannot
> > remember), but the changes unfortunately aren't in 2.5.
> > 
> > Check drivers/mtd/chips/cfi_cmdset_0001.c in your sources.  
>  You should
> > see a changelog entry from me dated 02/05/2002; if you 
> don't see it, you
> > don't have the fix.
> > 
> > -ch
> > ch@murgatroid.com
> > ch@hpl.hp.com
> 
> I don't have it. Can I just drop it in or are there other 
> files I need to
> get/update? I haven't used CVS before so I will need help 
> doing that if thats
> the best way of getting all relevant files. 
> 
> Thanks
> 
> 	Conn
> -- 
> 
> *****************************************************************
>   If you live at home long enough, your parents will move out.
>  (Warning they may try to sell their house out from under you.)
> *****************************************************************
> 
> Conn Clark
> Engineering Stooge				clark@esteem.com
> Electronic Systems Technology Inc.		www.esteem.com
> 
> Stock Ticker Symbol				ELST
> 
> "clark@esteem.com" Copyright 2000 By Electronic Systems Technology
>  This email address may be used to communicate to Conn Clark
>  provided it is not being used for advertisement purposes, unless
>  prior written consent is given. This email address may not be 
>  sold under any circumstances. All other rights reserved.
> 
