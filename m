Received: from mail-bw0-f221.google.com ([209.85.218.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdXRQ-00040u-CN
	for linux-mtd@lists.infradead.org; Fri, 05 Feb 2010 23:18:29 +0000
Received: by bwz21 with SMTP id 21so3708825bwz.4
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Feb 2010 15:18:21 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: NAND: fixes
Date: Sat,  6 Feb 2010 01:18:03 +0200
Message-Id: <1265411890-9156-1-git-send-email-maximlevitsky@gmail.com>
Cc: "stanley.miao" <stanley.miao@windriver.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is part of my patcheset that touches the nand subsystem

Stanley, patch #2 should now cover attempts to write outside the oob.

Also I did another (don't know if less or more evil) approach to bad block testing.
Now check_bad always takes the controller locks and selects the chip. Thus it is
possible to use read_oob/write_oob.
This however changes behavier of the nand_erase_nand to deny erases if any block within
the range is bad. Also it selects/releases the chip once per erase block.
This is done in patch #5. Patch #6 is ported to that change.

Patches 1-3 are pure fixes.

Best regards,
	Maxim Levitsky
