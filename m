Received: from fed1rmmtao08.cox.net ([68.230.241.31])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQX5I-00063p-Tz
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2005 16:55:10 -0400
Received: from [192.168.123.165] (really [70.179.62.151])
	by fed1rmmtao08.cox.net
	(InterMail vM.6.01.04.00 201-2131-118-20041027) with ESMTP
	id <20050426205452.NMSK16890.fed1rmmtao08.cox.net@[192.168.123.165]>
	for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2005 16:54:52 -0400
From: rick adams <rgadams@cox.net>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1DLiOu-0006Ah-1b@canuck.infradead.org>
References: <E1DLiOu-0006Ah-1b@canuck.infradead.org>
Content-Type: text/plain
Date: Tue, 26 Apr 2005 13:54:38 -0700
Message-Id: <1114548884.9606.123.camel@laptop.sandiego.IdealSolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: Fixup Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-13 at 09:59 -0400, linux-mtd-
request@lists.infradead.org 
> Message: 2
> Date: Tue, 12 Apr 2005 18:03:15 -0700
> From: Todd Poynor <tpoynor@mvista.com>
> Subject: Fixup Intel flash that powers up locked
>
> Any comments on whether this is or is not the way to go appreciated.
> 

What I have done when I have encountered this Intel "feature" of their
version "K" of their stataFlash devices is to unlock all sectors in the
boot code. This is done before the kernel even loads, so the kernel
doesn't even know it's not using the "J" version of the part (the device
the driver was written for). The boot code reads the device ID register
and if it's not a "J" version it unlocks all the sectors. I had to do
this anyhow in the boot code since my boot code needs to write to FLASH.
There are several reasons I feel this is a better approach to address
the Intel "feature" the most important reason is the KISS philosophy.
Why add all the complexity to the kernel when it can be done simply in
the boot code and the kernel doesn't even know (or need to know) the
joys of these version differences of the FLASH chip on the board. It
just needs to now that it can talk to either the "J" or "K" version with
the same code. If you don't do the boot code and have a problem with
this dependency on non kernel code, you can always add it to head.s,
headxxxx.s, or some board specific code that runs before the file system
(or any write to FLASH) is used.

NOTE:: Intel is obsoleting the "J" part and selling the "K" part as a
direct replacement. So if you have a product in production that uses the
Intel StrataFLASH device you may want to address this "feature" before
you get the call that production has stopped (accompanied by more help
from management they you can imagine).

Rick Adams
rick@thePTRgroup.com
