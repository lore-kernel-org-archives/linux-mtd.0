Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8VJ3-000385-Am
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2004 03:18:17 +0100
Received: from setabox.com (miller.setabox.com.tw [192.168.1.45])
	(authenticated bits=0)
	by pluto.setabox.com.tw (8.12.8/8.12.5) with ESMTP id i2V2Kw10022456
	for <linux-mtd@lists.infradead.org>; Wed, 31 Mar 2004 10:20:58 +0800
Message-ID: <406A2A5F.7040005@setabox.com>
Date: Wed, 31 Mar 2004 10:18:07 +0800
From: "William J. Beksi" <wjbeksi@setabox.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: bad block replacement
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using a Samsung KM29U256T 32Mb nand flash with 4 partitions on a 
cramfs. I'm trying to implement ECC and a method for replacing bad 
blocks. The spare array consists of 16 bytes, positions 512-528, the 
517th position being reserved for the bad block marker.

Can I arbitrarily pick where to store the 6 byte ECC code in the spare 
array as long as I don't erase and/or overwrite the bad block marker?

Concerning the replacement of bad blocks, Samsung guarantees that the 
1st or 2nd page of every invalid block has non-FFh data at the 517th 
position of the array. They recommend keeping a table of valid/invalid 
blocks.

When replacing blocks, should one start at the end of the flash and 
replace a bad block with a good free block? How many free good blocks 
should one typically allocate for the duration of the flash's life?

thank you
-Bill
