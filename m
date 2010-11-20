Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJriL-00065W-UD
	for linux-mtd@lists.infradead.org; Sat, 20 Nov 2010 17:59:06 +0000
Received: by wwc33 with SMTP id 33so6397964wwc.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 Nov 2010 09:59:04 -0800 (PST)
Date: Sat, 20 Nov 2010 18:58:58 +0100
From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: block2mtd and ubi
Message-ID: <20101120175856.GD9645@vicerveza.homeunix.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to use the qemu mipsel malta board to boot an ubifs image, prepared
with 'ubinize', and using block2mtd on /dev/hda, where qemu receives the image
through -hda ubifs.img.

The problem I have summarizes in this UBI complain while booting:
block2mtd: mtd0: [/dev/hda] erase_size = 512KiB [524288]
UBI: attaching mtd0 to ubi0
UBI: physical eraseblock size:   524288 bytes (512 KiB)
UBI: logical eraseblock size:    524160 bytes
UBI: smallest flash I/O unit:    1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI warning: check_what_we_have: 1008 PEBs are corrupted
corrupted PEBs are: 0 1 2 3 4 5 6 7 .....
UBI error: check_what_we_have: too many corrupted PEBs, refusing this device
UBI error: ubi_init: cannot attach mtd0

The ubifs.img file I create first with ubinize, and then I append zeros until it
has the size of 512MiB.
The ubi volume is set to be dynamic and of 256MiB in size (so there should be
plenty of space in the block2mtd mtd0 device)

The kernel commandline I use is
root=ubi0:rootfs rootfstype=ubifs block2mtd.block2mtd=/dev/hda,524288 ubi.mtd=0

I don't know what I am doing bad. Other examples I see on the net seem to do as
I do, and everything works. Not in my case.

Can somebody explain me what I am missing on block2mtd and ubi?

Thank you,
Lluís.
