Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbqIg-0005zz-8u
 for linux-mtd@lists.infradead.org; Sun, 20 Apr 2014 11:52:46 +0000
Received: from [192.168.0.103] (93-173-56-17.bb.netvision.net.il
 [93.173.56.17])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tlinder@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F50913F362
 for <linux-mtd@lists.infradead.org>; Sun, 20 Apr 2014 11:52:24 +0000 (UTC)
Message-ID: <5353B4F5.6040603@codeaurora.org>
Date: Sun, 20 Apr 2014 14:52:21 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: nandsim configuration question
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

Hi

I'm trying to use the nandsim but unfortunately encountered some 
difficulties in configuring it. I need to simulate mtd device with the 
following parameters:

Eraseblock size:                131072 bytes, 128.0 KiB
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
OOB size:                       64 bytes
Bad blocks are allowed:         true
Device is writable:             true
Default UBI VID header offset:  2048
Default UBI data offset:        4096
Default UBI LEB size:           126976 bytes, 124.0 KiB
Maximum UBI volumes count:      128

I can't figure out how to set sub-page size to 2048. Or basically - how 
to disable sub-page support?

I found only usage examples so I'm using the following command:
modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa 
third_id_byte=0x00 fourth_id_byte=0x15 overridesize=12 
cache_file=cashe_file.txt

the mtd device created is:
Name:                           NAND simulator partition 0
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4096 (536870912 bytes, 512.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Bad blocks are allowed:         true
Device is writable:             true
Default UBI VID header offset:  512
Default UBI data offset:        2048
Default UBI LEB size:           129024 bytes, 126.0 KiB
Maximum UBI volumes count:      128

How do I set sub-page size to 2048?

Thanks!
Tanya Brokhman
-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
