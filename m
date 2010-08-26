From: "Mark F. Brown" <mark.brown314@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	"Mark F. Brown" <mark.brown314@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: pxa3xx: fix build error when CONFIG_MTD_PARTITIONS is
	not defined
Date: Thu, 26 Aug 2010 04:56:50 -0400
Message-Id: <1282813011-6187-1-git-send-email-mark.brown314@gmail.com>
Cc: "Mark F. Brown" <mark.brown314@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If CONFIG_MTD_PARTITIONS is not defined for pxa3xx NAND driver it will display a build error:

drivers/built-in.o: In function `pxa3xx_nand_remove':
drivers/mtd/nand/pxa3xx_nand.c:1367: undefined reference to `del_mtd_partitions'
drivers/built-in.o: In function `pxa3xx_nand_probe':
drivers/mtd/nand/pxa3xx_nand.c:1334: undefined reference to `add_mtd_partitions'
make: *** [.tmp_vmlinux1] Error 1

Patched against Eric Miao's pxa tree

Mark F. Brown (1):
  ARM: pxa3xx: fix build error when CONFIG_MTD_PARTITIONS is not
    defined

 drivers/mtd/nand/pxa3xx_nand.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
