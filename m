Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Ohlp-0004B5-00
	for mtd-list@infradead.org; Tue, 15 Aug 2000 15:32:49 +0100
Received: from [202.108.126.193] (helo=dns.rabbit.redflag-linux.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Ohln-0004Az-00
	for mtd@infradead.org; Tue, 15 Aug 2000 15:32:47 +0100
Message-ID: <001a01c006c6$0fc47b40$2cc809c0@zheng.redflag-linux.com>
From: "zhengliangchen" <liangchenzheng@redflag-linux.com>
To: "David Woodhouse" <dwmw2@redhat.com>
Cc: <mtd@infradead.org>
Subject: re: Help me: How to support two Msys Diskonchip devices? 
Date: Tue, 15 Aug 2000 22:35:26 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="hz-gb-2312"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

   I have downloaded the latest mtd,but the error is still the same,
After "insmod mtdcore.o" and "insmod doc2001.o" ,when I "insmod docprobe.o",
It tell me can't find the driver.
The information in the /var/log/messages like that:

"...modprobe: Cannot locate modules doc2001
>>  .... kernel:Cannot find driver for DiskOnChip Millennium at 0xD8000"

LC.zheng
2000/8/15



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
