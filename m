Received: from mail.nic.cz ([2001:1488:800:400::400])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbV0v-0006pR-9Q
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 14:13:34 +0000
Message-ID: <55156575.8080704@nic.cz>
Date: Fri, 27 Mar 2015 15:13:09 +0100
From: =?UTF-8?B?TWFydGluIFN0cmJhxI1rYQ==?= <martin.strbacka@nic.cz>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Missing support for ECC_SOFT_BCH in fsl-elbc-nand
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Tomas Hlavacek <tomas.hlavacek@nic.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

in our product we have Freescale P2020 SoC together with Micron
MT29F2G08ABAEAWP NAND. Lately we discovered that the internal driver
(fsl-elbc-nand) supports only 1-bit HW ECC. So we would like to switch
to ECC_SOFT_BCH (or on-die ECC as I saw some patches in this list
recently). Do you know if anybody works on this or are there any patches
already?

I tried some hacks already because I found that ECC_SOFT is a fallback
option if HW ECC is not available. But it seems that there are few bits
missing. At least an implemetation of NAND_CMD_RNDOUT. Or am I missing
something?

Best Regards,
Martin Strbacka
