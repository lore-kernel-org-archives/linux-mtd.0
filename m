Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlhLW-0005QX-OI
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 12:02:19 +0000
Received: by wyb34 with SMTP id 34so752698wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Aug 2010 05:02:16 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Wed, 18 Aug 2010 14:01:03 +0200
Subject: [PATCH 0/4 v2] NAND: add support for reading ONFI parameters
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008181401.03741.florian@openwrt.org>
Cc: Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is the second version of the patch series adding support for ONFI 
parameters to NAND device.

Florian Fainelli (4):
  NAND: add NAND_CMD_PARAM (0xec) definition
  NAND: denali should also handle NAND_CMD_PARAM
  lib: add crc16_le helper
  NAND: add support for reading ONFI parameters from NAND device
