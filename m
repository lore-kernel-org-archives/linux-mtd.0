Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEasr-0004yV-AZ
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 11:59:39 +0000
Received: by mail-wm0-x232.google.com with SMTP id g23so164386375wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2016 03:59:15 -0800 (PST)
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Wed, 7 Dec 2016 11:59:13 +0000
Message-ID: <CABatt_wrGTdp9Waw=1ysEUsDFtgT1zoq8YgFZSmkvpzUgov3Rw@mail.gmail.com>
Subject: Retrieving number of free unused eraseblocks in a UBI filesystem
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm running a 4.1 Kernel and have a UBI Filesystem with 2 volumes
taking up all the NAND.
ubinfo -d 0
ubi0
Volumes count:                           2
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     4016 (509935616 bytes, 486.3 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       56
Count of reserved physical eraseblocks:  24
Current maximum erase counter value:     15
Minimum input/output unit size:          2048 bytes
Character device major/minor:            249:0
Present volumes:                         0, 1

So I'm guessing that the Total amount of logical erase blocks is 0 as
this is because I have 2 volumes of a fixed size that take up all the
available eraseblocks of the /dev/ubi0 device.

Is there a way of getting, per volume preferably, the number of
eraseblocks that aren't being used? Or conversely get the number of
eraseblocks that are used as I can work it out from the total amount
of logical eraseblocks.

Many Thanks,
Martin.
