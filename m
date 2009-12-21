Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMkdJ-0001k8-HL
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 15:57:22 +0000
Received: by ewy23 with SMTP id 23so4504451ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 07:57:14 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 21 Dec 2009 10:57:14 -0500
Message-ID: <dbdb2ea60912210757q22ee209fi24363e9f236c3597@mail.gmail.com>
Subject: confusion UBI overhead and volume size calculations
From: twebb <taliaferro62@gmail.com>
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

I'm very confused about the calculations for determining max-leb-cnt
argument for mkfs.ubifs and vol_size for ubinize cfg file.

I have a 4GiB MLC nand device that has a 64M reserved area from
0x0-0x04000000.  The rest, 0x04000000-0x100000000 (4032M), is
dedicated to a single MTD partition.  A single UBI device will attach
to the single MTD partition and have 4 volumes.  I'm using mkfs.ubifs
and ubinize at build time to create a single UBI image to be flashed
to the MTD device.

The four volumes are...
vol1 = 352M
vol2 = 352M
vol3 = 352M
vol4 = 2976M

The device data sheet specifies that the minimum valid block count is
7992 (of 8192 possible), so it seems like I should reserve 200 blocks
(100M) to allow for this.

My questions are:
1.  How does the 100M reserved for "potentially bad blocks" get
handled when calculating the vol_size for each volume in the .cfg
file?  I'd like to leave vol1-3 intact and only take space from vol4.
Would the vol_sizes be as follows?

vol1 vol_size = 352M
vol2 vol_size = 352M
vol3 vol_size = 352M
vol4 vol_size = 2976M-100M = 2876M


2.  How is the overhead calculation from the linux-mtd site used in
determining the vol_sizes?  ("The UBI overhead is (B + 4) * SP + O *
(P - B - 4) i.e., this amount of bytes will not be accessible for
users.")

3.  Is max-leb-cnt simple the vol_size/LEB_size?

I'm really lost on this.  I'd appreciate any input anyone may have on this.

Thanks,
twebb
