Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKApl-0000sM-Pm
	for linux-mtd@lists.infradead.org; Wed, 11 May 2011 14:56:18 +0000
Received: by iwn36 with SMTP id 36so705734iwn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 May 2011 07:56:16 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 11 May 2011 17:56:15 +0300
Message-ID: <BANLkTi=0DP6QE9eLK6wS4L3gNv2Mb9ib+A@mail.gmail.com>
Subject: UBI bad image sequence number error
From: Alex Levin <s.alex.levin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am working on a mips embedded system, and I'm trying to do is to
read a ubifs image(that went through mkfs and ubinize) from ram - the
CPU that linux runs on doesn't aware that its not from the NAND - I
have changed the NAND access API implementation.
I use a 6 MB static volume (when ubinizing) and I use a 10MiB ram, and
that is the size I pass to the mtd device.

After trying to attach I get the following error:
UBI: attaching mtd0 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI error: process_eb: bad image sequence number 1726164069 in PEB 47,
expected 648536469
UBI error: ubi_init: cannot attach mtd0
UBI error: ubi_init: UBI error: cannot initialize UBI, error -22

Please help.

Thanks,
Alex.

P.S- if even more information is needed I'd be happy to provide it.
