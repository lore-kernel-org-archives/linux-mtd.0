Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8fBn-0005Sg-9r
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 10:28:20 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR007.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0ILU00EM12SBX1@VL-MO-MR007.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 10:26:35 -0400 (EDT)
Date: Fri, 26 Aug 2005 10:26:35 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <430C46B4.10406@dev.rtsoft.ru>
To: Dmitry Krivoschokov <dkrivoschokov@dev.rtsoft.ru>
Message-id: <Pine.LNX.4.63.0508261017000.15345@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <430C46B4.10406@dev.rtsoft.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: flash status after unlocking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 24 Aug 2005, Dmitry Krivoschokov wrote:

>    Hi all,
> 
> it appears that cfi flash unlocking routines always leaves a flash chip in
> status mode (if CONFIG_MTD_XIP is not set).
> But in some cases it is desired that the chip remains in read array mode, for
> linear cramfs at least.
> So I've added code to put a chip in read array mode after unlocking, see patch
> below (the patch against 2.4 kernel, sorry), tested on OMAP1610. The patch is
> for Intel's command set only,  though it is easy to add the fix to others.
> If  no complaints for the fix I can test it with the latest kernel and submit
> a patch.

Please don't do that.

The thing is that most MTD methods have the same issue like write for 
example.

If you're using the flash for linear cramfs without the MTD XIP support 
then you probably already know that you must pay special attention to 
how you use MTD in parallel with linear cramfs.  Therefore if you must 
unlock the flash for whatever reason that's certainly because you want 
to erase and/or write the flash which will have the same 
remain-in-status-mode issue.

In those cases the best line of action is to always read back a bit from 
the flash to manually force it back into array mode.  Something like:

	flash-unlock /dev/mtd2 && dd if=/dev/mtd2 of=/dev/null count=1

Sames goes for flash write, lock, erase, etc.

This way the driver doesn't need to be modified for this very particular 
usage case.


Nicolas
