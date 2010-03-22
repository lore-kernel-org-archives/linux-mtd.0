Received: from a2s40.a2hosting.com ([74.126.24.200])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ntkwj-0006Ck-Qt
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2010 16:57:50 +0000
Received: from [207.35.173.122] (helo=[192.168.220.108])
	by a2s40.a2hosting.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <psanchez@fosstel.com>)
	id 1Ntkwd-0003h1-TA
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2010 12:57:39 -0400
Message-ID: <4BA7A183.7040206@fosstel.com>
Date: Mon, 22 Mar 2010 12:57:39 -0400
From: "Pedro I. Sanchez" <psanchez@fosstel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS and MLC NAND Flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a few questions regarding this topic.

1. The UBIFS FAQ has a summary of the state of the support for MLC NAND 
flash here:

  http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

The question is, is this still the case? Does the FAQ reflect the 
current state of affairs?

2. I have several boards with MLC NAND flash running the Linux kernel 
2.6.29 and UBIFS. I am seeing a fairly large rate of file "corruption" 
errors, files that all of a sudden become unreadable. Curiously enough, 
they have been read-only files in all cases, program executables and 
shared libraries.

Would upgrading to a more recent kernel, or back porting the latest 
UBIFS code, help? Shall I expect better support for MLC NAND flash in 
the latest UBIFS code?

3. I am also seeing other errors where it is the U-Boot or the Kernel 
partitions that become corrupted. UBIFS is not involved there directly 
since these partitions are at the mtd level and outside the UBI layer.

More specifically, my flash is partitioned as mtd0, mtd1, mtd2, mtd3, 
mtd4. Only mtd4 has UBI/UBIFS on top. Is it possible that some flash 
handling problems in UBIFS (mtd4) "spill over" other non-UBIFS mtd 
partitions?

4. Other than minimizing flash writes, is there any other suggestion on 
what to do to improve on the failure rate I see in the file system?

Thank you in advance, I would very much appreciate you answers.

-- 
Pedro
