Received: from esteem.com ([198.65.249.253])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hDxL-0006bV-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 19:42:19 +0100
Message-ID: <3D628D95.9447D6B6@esteem.com>
Date: Tue, 20 Aug 2002 11:42:29 -0700
From: Conn Clark <clark@esteem.com>
MIME-Version: 1.0
To: Christopher Hoover <ch@murgatroid.com>
CC: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: How does one mount an existing jffs2 partition so it is   writeable?
References: <004001c24876$0c2ad670$7800000a@derelict>
Content-Type: text/plain; charset=us-ascii
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

Christopher Hoover wrote:
> 
> At one point locking and unlocking flash with variable-sized blocks
> (such as Intel C3 flash) simply didn't work.  I fixed it -- the correct
> code is in CVS and in current 2.4 (after some release I cannot
> remember), but the changes unfortunately aren't in 2.5.
> 
> Check drivers/mtd/chips/cfi_cmdset_0001.c in your sources.   You should
> see a changelog entry from me dated 02/05/2002; if you don't see it, you
> don't have the fix.
> 
> -ch
> ch@murgatroid.com
> ch@hpl.hp.com

I don't have it. Can I just drop it in or are there other files I need to
get/update? I haven't used CVS before so I will need help doing that if thats
the best way of getting all relevant files. 

Thanks

	Conn
-- 

*****************************************************************
  If you live at home long enough, your parents will move out.
 (Warning they may try to sell their house out from under you.)
*****************************************************************

Conn Clark
Engineering Stooge				clark@esteem.com
Electronic Systems Technology Inc.		www.esteem.com

Stock Ticker Symbol				ELST

"clark@esteem.com" Copyright 2000 By Electronic Systems Technology
 This email address may be used to communicate to Conn Clark
 provided it is not being used for advertisement purposes, unless
 prior written consent is given. This email address may not be 
 sold under any circumstances. All other rights reserved.
