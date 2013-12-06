From: Arnaud Ebalard <arno@natisbad.org>
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCHv0 0/3] ARM: mvebu: Enable NAND controller in NETGEAR ReadyNAS
 .dts files
Message-Id: <cover.1386370808.git.arno@natisbad.org>
Date: Sat, 07 Dec 2013 00:12:53 +0100
MIME-Version: 1.0
Content-Type: text/plain
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <rob.herring@calxeda.com>, Lior Amsalem <alior@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Olof Johansson <olof@lixom.net>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Now that NAND controller support is available for Armada 370/XP
(cb28e2537a6f: ARM: mvebu: Add support for NAND controller in
Armada 370/XP), let's enable support for ReadyNAS boards.

The three commits in this series all include the partitions
definitions specific to each ReadyNAS variant as delivered
by NETGEAR with standard images.

As described in similar commits 2be2bc39c6f0 (ARM: mvebu: Enable
NAND controller in Armada XP GP board) and d8c552dddfbf (ARM: 
mvebu: Enable NAND controller in Armada 370 Mirabox),
"marvell,keep-config" parameter is used as current support does
not allow for setting of timing parameters yet.

Each patch has been tested on each specific device using Ezequiel's
tree; last known bug having being fixed today.

Jason, Ezequiel, this is a v0. I do not mind at all waiting for a
heads up to repost it later when every bit of nand support is where
it should be.

Ezequiel, I have left a comment in the .dts file to indicate a lost
reader that the last MB of last partition is in practice not
writable.

Cheers,

a+

Arnaud Ebalard (3):
  ARM: mvebu: Enable NAND controller in NETGEAR ReadyNAS 102 .dts file
  ARM: mvebu: Enable NAND controller in NETGEAR ReadyNAS 104 .dts file
  ARM: mvebu: Enable NAND controller in NETGEAR ReadyNAS 2120 .dts file

 arch/arm/boot/dts/armada-370-netgear-rn102.dts | 36 ++++++++++++++++++++++++++
 arch/arm/boot/dts/armada-370-netgear-rn104.dts | 36 ++++++++++++++++++++++++++
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 36 ++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)

-- 
1.8.4.4
