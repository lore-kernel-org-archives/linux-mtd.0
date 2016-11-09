Received: from ip2.televic.com ([81.82.194.222] helo=exchange.televic.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4S6b-0001Hv-0p
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 12:35:54 +0000
From: <w.cappelle@televic.com>
To: <linux-mtd@lists.infradead.org>
CC: <w.cappelle@televic.com>
Subject: gpmi detection of erased pages
Date: Wed, 9 Nov 2016 13:35:19 +0100
Message-ID: <1478694920-6453-1-git-send-email-w.cappelle@televic.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using BCH8 on a 2k nand page and created a testpage with 6 bitflips
at following locations:
0x02D:FB
0x057:FE
0xA5:FB
0x16A:FB
0x18A:DF
0x4EE:FE

When reading the page through the driver, the page is uncorrectable (as 
expected), then it will verify if the page is erased (gpmi_erased_check).
There i can see that the first count of the first subpage, is returning me
it detected 7 bitflips (should be 5 in that subpage). The second count of 
bitflips on the full raw page returns me the correct amount of bitflips 
(being 6 for the complete page).

I Don't really see the need of the first subpage check, except of speed 
improvement. But as it is failing due to the gpmi block trying to repair the 
page and alternating the wrong bits, I would propose to either increase the
threshold of the first check with the max number of repairable bitflips the 
gpmi block is set to, or just skip the first check since on empty pages it will
however not make a difference in speed. For real uncorrectable pages, this will
not have a huge speed penalty due to the unlikely event that this will happen.

I propose following patch to be be applied to detect the correct number of 
bitflips based on the raw nand read data.
