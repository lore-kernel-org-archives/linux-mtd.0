Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YwZWc-0003TW-2M
 for linux-mtd@lists.infradead.org; Sun, 24 May 2015 17:17:26 +0000
Message-ID: <5562078A.6030909@hauke-m.de>
Date: Sun, 24 May 2015 19:16:58 +0200
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: Ray Jui <rjui@broadcom.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: iProc nand iproc-idm register
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ray,

in the iproc_nand driver your are using this register range:
reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
reg-names = "nand", "iproc-idm", "iproc-ext";

I think the iproc-idm register range is the wrap address part on bcma
bus. On the bcma bus it is 0x1000 in size and 0x0408 is the offset of
the IO control register in it. Are the new iProc devices different here
or is this register not always at this offset but varies?

Wouldn't it be better to specify the complete range like this:
reg = <0x18046000 0x600>, <0xf8105000 0x1000>, <0x18046f00 0x20>;
Then you can read the register at offset 0x408 in that range.

Hauke
