Received: from mail.fccps.cz ([195.146.112.10])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAswg-0001oR-I3
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 12:01:36 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fccps.cz (Postfix) with ESMTP id 4BABB77C8D
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Mar 2005 18:01:28 +0100 (CET)
Received: from mail.fccps.cz ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 25821-08 for <linux-mtd@lists.infradead.org>;
	Mon, 14 Mar 2005 18:01:27 +0100 (CET)
Received: from frr (frr.in.fccps.cz [192.168.2.14])
	by mail.fccps.cz (Postfix) with ESMTP id 6CFCB77C7C
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Mar 2005 18:01:26 +0100 (CET)
From: "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To: linux-mtd@lists.infradead.org
Date: Mon, 14 Mar 2005 18:06:08 +0100
MIME-Version: 1.0
Message-ID: <4235D290.15983.3536316E@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: lilo vs. diskonchip (again, sorry)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear MTD users and maintainers,

first of all I'd like to apologize for asking for help
while I still work with Linux 2.4 - I guess my problem
could be unrelated to the minor kernel version.

I'm having trouble with Lilo on a 32meg DiskOnChip.

I'm using a homebrew boot CD with some scripts starting
with sfdisk and mkfs.ext2, then unpacking a prepared
system tarball onto the diskonchip, then running Lilo.

I have an old kernel, maybe a year and a half old,
it's 2.4.21 with a MTD patch from those days, that
works just fine.

Then I have several recent kernels (2.4.26, 2.4.28,
2.4.29) with recent MTD patches: 2.4.29 with the
"last 2.4-compatible MTD snapshot".
These use the NAND-based re-implemented diskonchip
driver and appear to consistently hamper Lilo installation
for some reason.

If I boot the ancient kernel from CD and install Lilo
on the DoC, the recent kernel installed on the DoC
is able to boot and accesses the DoC just fine.

If I boot the recent kernel from CD and install Lilo,
although the filesystem appears to be created just fine,
Lilo refuses to boot, saying
L 40 40 40 40 40 40 40... etc. a million times.

I'm using the bios=0x80 option, to no avail - it works
that way with the old kernel, but not with the new ones.

I've tried switching between a vanilla lilo (+boot.b)
and the M-Systems hacked lilo - no difference there.
I'm not surprised though, as the OS MTD drivers use
a different major number than the M-Systems semi-closed-source 
driver.

I take care to run a full graceful system shutdown after each
install, though I'm sure Lilo does a sync() before and after 
it messes with the MBR on the DoC, so a plain cold reset
should work just fine.

I'm puzzled.
Is this something intrinsic to the re-implemented
DoC driver? Is "use docboot" the only right answer?
Or should the block device abstraction work to the
extent that Lilo should work, using BIOS services
to load the kernel?
BTW, is docboot only intended for inftl devices, or
does it work for nftl DoC's too?


Thanks for any ideas

Frank Rysanek
