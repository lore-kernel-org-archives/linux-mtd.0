Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GuJ1j-0008Aj-El
	for linux-mtd@lists.infradead.org; Wed, 13 Dec 2006 01:35:23 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kBD1T9XA008844
	for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2006 20:29:09 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kBD1SgIa282340
	for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2006 20:28:42 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kBD1SfUp009662
	for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2006 20:28:42 -0500
Subject: Re: intel p30, unlocking before loading driver, again
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Daniel Robinson <danielgrobinson@gmail.com>
In-Reply-To: <90e974410612121501x67c7650aq9549b3d508bcf939@mail.gmail.com>
References: <90e974410612121501x67c7650aq9549b3d508bcf939@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 12 Dec 2006 19:31:12 -0600
Message-Id: <1165973472.2505.4.camel@crusty.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-12-12 at 15:01 -0800, Daniel Robinson wrote:
> I have a board with a P30 part on it and here are the knowns:
> 
> 1) the P30 powers up with all blocks locked.

Yes.

> 
> 2) if the driver gets loaded with the blocks locked, mode is 0660
> (rw-rw----), which allows me to open the device in O_RDWR mode, will
> let me do ioctl() calls to unlock blocks, but won't let me write to
> the device.  The ioctl() returns without error, but writing fails
> because it is a read only file system.
> 
> 3) In an attempt to increase robustness for a system that will be
> embedded, I want to limit the amount of the part that is unlocked and
> available for writing.  Ideally, I would like to control that
> parametrically.
> 
> I can't find the place in the flash device is checked for being
> unlocked and the bits are set that indicate that it is a read-only
> device.

There are commands you can send to the chip to query this status.  See
the datasheet for the flash chip.

You can partition up your device and unlock partitions as needed.  Or
you can do it from within a board driver if you need it at boot time for
things like a root filesystem.

josh
