Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1evOSm-0007gq-Ki
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 14:30:15 +0000
To: linux-mtd@lists.infradead.org
Cc: yamada.masahiro@socionext.com, boris.brezillon@free-electrons.com,
 Benedikt Spranger <b.spranger@linutronix.de>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Subject: DENALI: can't detect NAND chip
Message-ID: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
Date: Mon, 12 Mar 2018 15:29:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm currently porting Linux 4.14 to a Altera Cyclone V based board. The
Denali NAND Driver isn't able to detect the NAND chip Micron MT29F4G08) correctly.

[    0.862242] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c
[    0.868604] nand: Unknown denali-nand
[    0.872253] nand: bus width 8 instead of 16 bits
[    0.876899] nand: No NAND device found
[    0.880688] denali-nand-dt: probe of ff900000.nand failed with error -22

The correct ManufID is 0x2c and the DevID is 0xdc. Currently we are
running a 4.1 kernel with the "old" denali driver without this problem.
While researching the issue I found the following Mail in the
Rocketboards archive, which seems to be the same issue.

https://lists.rocketboards.org/pipermail/rfi/2017-September/003627.html


We also tested Linux 4.16-rc5 without any additional patches with the same behavior.

Best regards,
Philipp
