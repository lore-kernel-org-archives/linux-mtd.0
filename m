Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwXbf-0008Sh-61
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 10:24:03 +0000
Received: by eyh6 with SMTP id 6so1278770eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 02:24:01 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 7 Mar 2011 15:54:01 +0530
Message-ID: <AANLkTin4FHcpvhsQJkU7pOUPk3-gV+N+1cb0W6_3KC8P@mail.gmail.com>
Subject: Perf issue with UBIFS
From: Bhavesh Parekh <bhaveshparekh1@gmail.com>
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

Hi all,
I am facing performance issue wil using the UBIFS on our platform.

Kernel version 2.6.36
Nand device info : Micron chip with 2K page size & 128K erase-size
ECC : ECC is done by the NAnd-controller.

We have YAFFS2 working on our platform and recently tried UBIFS on our
platform. YAFF2 Perf is 18MB/s and UBIFS is 11.2 MB/s. Looking at the
driver log we found that the UBIFS access pattern to the device is
4096+48 byte read in the main area, which means that there are lots of
unaligned read. Our platform only support aligned read, so we did an
optimization by simplying storing the last read page in the buffer
hopping that on the next read we will be reading the same page and
gain the perf. Doing this we were able to increase the perf to 14.5
MB/s

Is there any way we can make UBI to have the access in the aligned way
only ? Other wise perf will be lesser than YAFFS2.

Further we twick the nand-driver and implemented the page-cache mode
support in the driver. And change the mtd->writesize to 16K so that
request from the upper layer comes in 16K. It work fine with the
YAFFS2 and we see a perf gain of 3-4MB/s but UBIFS request pattern
remains same 4K +48 byte. Is there anything we can do here so that
UBIFS respect mtd->writesize

-Thanks
Bhavesh
