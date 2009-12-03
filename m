Received: from mail-qy0-f204.google.com ([209.85.221.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGFWW-0008QB-Oc
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 17:31:29 +0000
Received: by qyk42 with SMTP id 42so659911qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Dec 2009 09:31:24 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 3 Dec 2009 12:31:23 -0500
Message-ID: <dbdb2ea60912030931j380a7702hc92d4fbe72341730@mail.gmail.com>
Subject: ubifs wear leveling across entire device
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

I'm confused about how wear leveling occurs across the entire device
in the following example.  Could someone help me understand what I'm
missing?

4 GiB flash device (nand MLC):
4 MTD partitions defined:
0 - "p1" - 0x00000000 - 0x00800000
1 - "p2" - 0x00800000 - 0x10000000
2 - "p3" - 0x10000000 - 0x80000000
3 - "p4" - 0x80000000 - 0x100000000

kernel args specify 3 ubi volumes:
ubi.mtd=p1 ubi.mtd=p2 ubi.mtd=p3
(p4 is reserved and no volumes or filesystems sit on top of it)

The "vol_size" for each of the ubi volumes (as specified in the
ubinize cfg file) is slightly less than the corresponding mtd
partition size.  The volumes are specified as dynamic because they
need to be RW.

Thanks,
twebb
