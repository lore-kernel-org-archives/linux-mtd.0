Received: from esteem.com ([198.65.249.253])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hClo-0006Tr-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 18:26:20 +0100
Message-ID: <3D627BC7.DD6B6823@esteem.com>
Date: Tue, 20 Aug 2002 10:26:31 -0700
From: Conn Clark <clark@esteem.com>
MIME-Version: 1.0
To: Christopher Hoover <ch@murgatroid.com>
CC: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Re: How does one mount an existing jffs2 partition so it is  
 writeable?
References: <007201c247e0$1022fcd0$a15f040f@SNAGGLE>
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
> Do you need to unlock your flash before you can write to it?  That's not
> done automatically by mtd or jffs2.  There's a diff in the ARM patch
> system by me that might be applicable.
> 
> -ch
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

This is what I needed to know and is probably the culprit. However my unlock
utility is broken. I can tell this because it doesn't even try to move through
the sectors in the partition like the lock command does.


I think I have it under control now.

Thanks.

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
