Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M64x-0003Xb-Gv
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 14:07:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Dharm <mdharm@momenco.com>
In-Reply-To: <1052490920.23135.215.camel@passion.cambridge.redhat.com>
References: <NEBBLJGMNKKEEMNLHGAIKEFKDAAA.mdharm@momenco.com>
	 <1052490354.23135.208.camel@passion.cambridge.redhat.com>
	 <1052490920.23135.215.camel@passion.cambridge.redhat.com>
Message-Id: <1054386483.8432.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 31 May 2003 14:08:03 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Normally I just bounce broken mail to the list but I'll make an
exception and forward this one...

-- 
dwmw2

-----Forwarded Message-----


From: Zachi Friedman <zachi.friedman@m-sys.com>
To: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
Date: Fri, 30 May 2003 10:53:06 -0700

Here is the deal:
Newer (and higher capacity) DiskOnChip 2000 devices have a new ASIC
controller. This ASIC controller has the chip ID of 0x30 (instead of 0x20).
I guess that is the reason the MTD driver identifies the 128MB as a
Millennium... 
Also, to solve the confusion here once and for all: Millennium comes _ONLY_
8MB. There never was, and never will be a Millennium is different capacity!
There is the Millennium Plus (comes in 16MB, 32MB and 64MB), but its chip
IDs are 0x40 and 0x41.

So, once you have chip ID of 0x30, how can you tell whether it's a
Millennium or the newer DiskOnChip 2000?  You have to read chip ID 4 times.
If the 4th read is NOT 0x30 - it's a new DiskOnChip 2000 !

Also, these new DiskOnChip 2000 SHOULD be used with INFTL. The reason being
these newer devices use newer NAND flash that have a lower PPP (of 3). NFTL
needs PPP=5 (at least the original M-systems' implementation does). If MTD
group's implementation of NFTL needs PPP>3 or if low-level format
compatibility with M-Systems is important enough, then INFTL is the way to
go with those devices!
Regarding the INFTL - since SnapGear has released the 1st implementation a
week ago, I guess it can be used as the basis for the supporting these
devices as well :)

Good luck,
Zachi. 
