Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTDbc-0000qP-De
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 16:24:25 +0000
From: Marek Vasut <marex@denx.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: N25Q256A 13E40
Date: Mon, 7 Oct 2013 18:24:00 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310071824.01028.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys!

Let's talk about our favourite chip :) I just got my hands on N25Q256A . Since 
there was quite a flurry of patches for this and similar chips and I got it 
working on a different chip with exactly the same IDs and type, I'd would expect 
linux to work with this one too. Guess what ... ;-)

This particular incarnation of N25Q256A completely ignores the 4-byte ERASE 
(0xdc) command. Apparently, if I look closely, it's N25Q256A 13E40 variant and 
seeing the Note #14 (datasheet page 30 / below Table 18. Command set), quoting:

14.This command is only for part numbers N25Q256A83ESF40x and N25Q256A83E1240x.

they are not supported on this part. Someone surely did some hard thinking 
inventing such a crappy part. I can surely cook a patch, but I wonder what 
direction we should take here. We can switch this chip into 4-byte mode by 
0xb7/0xe9 opcodes, which would in turn break BootROMs which depend on the SPI 
NOR to be in 3-byte mode upon reboot. We can program the BAR register before 
erase, which will do the same.

Sigh, if you have any idea, that'd be nice to hear.

Thanks!
