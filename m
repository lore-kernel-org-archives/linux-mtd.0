Received: from 206-248-137-77.dsl.teksavvy.com ([206.248.137.77]
	helo=mail.isoar.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JmZ2f-000722-63
	for linux-mtd@lists.infradead.org; Thu, 17 Apr 2008 18:41:06 +0000
Received: from [10.0.200.99] (vpn02.rossvideo.com [209.5.118.98])
	by mail.isoar.ca (8.14.1/8.13.8) with ESMTP id m3HIdspE025648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2008 14:39:55 -0400
Message-ID: <48079979.3030201@isoar.ca>
Date: Thu, 17 Apr 2008 14:39:53 -0400
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problem with Micron 256 MB NAND on 440EPx
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm looking for some pointers in the right direction with this problem
I'm having with Micron 256 MB NAND part MT29F2G08AACWP:C with a JFFS2
filesystem on a AMCC PowerPC 440EPx board using the NDFC driver.

This NAND part has a 2 KB page size, 64 byte OOB area, 128 KB block
size.  I'm basically using the a stock Sequoia eval board code in a Denx
kernel, but with a 64 byte ECC layout copied from nand_oob_64 in
drivers/mtd/nand/nand_base.c

On any write over the 2 KB page size, the Linux kernel reports errors on
trying to verify 2 KB pages after the first.  It seems writes of 2 KB or
less are fine.

For example:
   dd if=/dev/urandom of=test bs=2k count=2

Write verify error (ECC correction failed) at 0e480000. Wrote:
00000000: 19 85 e0 02 00 00 04 44 c0 83 e7 3a 00 00 00 03
...
Read back:
00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
00000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
00000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
00000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
00000040: 19 85 e0 02 00 00 04 44 c0 83 e7 3a 00 00 00 03

Notice that the data appears to be "offset" by 64 bytes, which just
happens to be the size of the OOB, but that could be a coincidence.

I've tried increasing bus timings to max with no change in behavior.
Reducing NR_SCAN_PAGES to 1 from 4 in fs/jffs2/wbuf.c reduces the
"offset" to 28 bytes (I was seeing 152 byte OOB operations, which seemed
odd when there are only 64 bytes, so I tried this).

Also as a secondary problem, how do set the NAND_BBT_SCAN2NDPAGE flag?
I don't see how to reach the BBT option field via the structures passed
to platform_device_register().

Thanks.

-- 
Andrew E. Mileski
