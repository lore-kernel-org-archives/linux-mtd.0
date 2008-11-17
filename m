Received: from host2.marvell.com ([65.219.4.2] helo=maili.marvell.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L20SN-0003qK-J5
	for linux-mtd@lists.infradead.org; Mon, 17 Nov 2008 09:31:43 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: OOPS accessing flash operations over STM flash on PXA
Date: Mon, 17 Nov 2008 01:31:40 -0800
Message-ID: <E913911567467945BBEB9277E27868B001494AE7@msiexch01.marvell.com>
In-Reply-To: <1226913735-9469-1-git-send-email-den@openvz.org>
References: <1226913735-9469-1-git-send-email-den@openvz.org>
From: "Eric Miao" <ymiao3@marvell.com>
To: "Denis V. Lunev" <den@openvz.org>, <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Eric Miao <eric.miao@marvell.com>

David, please consider merge, thanks.

-----Original Message-----
From: den@sw.ru [mailto:den@sw.ru] On Behalf Of Denis V. Lunev
Sent: Monday, November 17, 2008 5:22 PM
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org; Eric Miao; Denis V. Lunev
Subject: [PATCH] mtd: OOPS accessing flash operations over STM flash on
PXA

STM 2Gb flash is a large-page NAND flash. Set operations accordingly.
This field is dereferrenced without a check in several places resulting
in OOPS (seen in reality).

Signed-off-by: Denis V. Lunev <den@openvz.org>
---
 drivers/mtd/nand/pxa3xx_nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c
b/drivers/mtd/nand/pxa3xx_nand.c
index c0fa9c9..15f0a26 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -269,6 +269,7 @@ static struct pxa3xx_nand_timing stm2GbX16_timing =
=3D
{
=20
 static struct pxa3xx_nand_flash stm2GbX16 =3D {
 	.timing =3D &stm2GbX16_timing,
+	.cmdset	=3D &largepage_cmdset,
 	.page_per_block =3D 64,
 	.page_size =3D 2048,
 	.flash_width =3D 16,
--=20
1.5.6.4
