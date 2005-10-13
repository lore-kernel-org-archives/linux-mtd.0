Received: from bay14-f27.bay14.hotmail.com ([64.4.49.27] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPzYh-0004rU-PV
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2005 10:39:32 +0100
Message-ID: <BAY14-F27BE6C869E203D2FA57691DC7A0@phx.gbl>
From: "z xw" <zxwitsme@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 13 Oct 2005 17:38:59 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: About nand flash mtd block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

         I am a newbie for this list. I just encouterred a problem when add
a nand flash to my db-mx1 board, I have added the nand part to mtd. and 
when I use
"cat /proc/mtd" ,I can find:
mtd0: 00020000 00010000 "bootloader"
mtd1: 00100000 00020000 "kernel"
mtd2: 00500000 00020000 "file system1"
mtd3: 001e0000 00020000 "file system"
mtd4: 01000000 00000000 "mx1 NAND Flash"

The mtd4 is the nand flash I added. But I can't find the device file in 
/dev/mtdblock/
The device file only 0,1,2,3.there is no device file for nand flash.
Anybody have met such a problem? Any reply is welcome.
Great appreciation to you help.

Regards,
Vincent Zhou

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn/  
