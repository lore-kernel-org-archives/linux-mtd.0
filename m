Received: from [202.153.40.245] (helo=hyd.hyd.hellosoft.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IATEW-0007JK-AJ
	for linux-mtd@lists.infradead.org; Mon, 16 Jul 2007 12:15:39 -0400
Received: from [192.168.2.243] (unknown [192.168.4.187])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hyd.hyd.hellosoft.com (Postfix) with ESMTP id EE172F580FB
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jul 2007 21:55:17 +0530 (IST)
Message-ID: <469B9993.9020702@hyd.hellosoft.com>
Date: Mon, 16 Jul 2007 21:45:15 +0530
From: Ranga Raju B <brraju@hyd.hellosoft.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Doubts regarding MTD
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: brraju@hyd.hellosoft.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    We are using ARASAN NFC with Micron NAND Device. I am writing a 
driver based on ndfc.c I have few problems here.

1. ARASAN NFC doesn't give me read or write access to spare area. I can 
know a block is bad (Manufacture Bad Block) using a command and it gives 
the status.
2. NFC itself generates NAND_ECC_HW3_512, writes into the spare area 
when we specify the Spare Area Address where the ECC to written or read 
for a 512 byte. It never allows us to know what the ECC is as we can't 
read the content of spare area.
3. NFC handles the single bit errors if any but doesn't handle the multi 
bit errors.

I don't know how to handle this. I know that we need to return the value 
of the ECC into the ECC buffer whenever a read/write is requested. What 
is the placement scheme that is recommended for this situation. How do I 
handle the ECC from MTD. Should I use Software ECC or shall I specify 
ECC_NONE.

Summary: How do handle the situation when NFC doesn't give access to the 
spare area of the NAND Device.

Regards
Ranga
