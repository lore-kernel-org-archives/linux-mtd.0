Received: from bay0-omc3-s31.bay0.hotmail.com ([65.54.246.231])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HSUSc-0004fx-0S
	for linux-mtd@lists.infradead.org; Sat, 17 Mar 2007 08:40:32 +0000
Message-ID: <BAY107-F20DDEF29A5BA389380A768ED700@phx.gbl>
From: "Tian Jin" <tad2k@msn.com>
To: linux-mtd@lists.infradead.org
Subject: how can I use MTD partition with large size ( >= 4G bytes)?
Date: Sat, 17 Mar 2007 16:40:10 +0800
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I want to use NAND flash chips to storage large audio data, the max 
storage size will be 3.6G bytes£¨may be 7G bytes in the future£©, so I have 
to use four 1GB NAND flash chips to make up a single 4GB MTD partition, but 
mtd->size was defined as 32bit integer in MTD driver(linux-2.6.20-rc1), so 
mtd->size just overflowed in function nand_scan_ident():

/* Store the number of chips and calc total size for mtd */
chip->numchips = i;
mtd->size = i * chip->chipsize; // 4 * 40000000 = 0x100000000 = 0xFFFFFFFF + 
0x01

I've tried to modify the data type of mtd->size to usinged long long, but 
kernel can not be compiled successfully£¬Is there any solution for this?

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
