Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyyaI-0000On-C5
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 06:50:18 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: omap2: use nand_base defaults for polled I/O
Date: Fri, 3 Jan 2014 06:49:51 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA5DA09@DBDE04.ent.ti.com>
References: <1387272992-27948-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1387272992-27948-1-git-send-email-computersforpeace@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>
>The omap_{read,write}_buf{8,16}() functions are identical to the default
>nand_base versions. Just let nand_base assign them in the
>NAND_OMAP_POLLED case.
>
>Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>---
>Compile tested only
>
> drivers/mtd/nand/omap2.c | 8 +-------
> 1 file changed, 1 insertion(+), 7 deletions(-)
>
>diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>index e9e2c37c0a80..eadc76a57f45 100644
>--- a/drivers/mtd/nand/omap2.c
>+++ b/drivers/mtd/nand/omap2.c
>@@ -1730,13 +1730,7 @@ static int omap_nand_probe(struct platform_device *=
pdev)
> 		break;
>
> 	case NAND_OMAP_POLLED:
>-		if (nand_chip->options & NAND_BUSWIDTH_16) {
>-			nand_chip->read_buf   =3D omap_read_buf16;
>-			nand_chip->write_buf  =3D omap_write_buf16;
>-		} else {
>-			nand_chip->read_buf   =3D omap_read_buf8;
>-			nand_chip->write_buf  =3D omap_write_buf8;
>-		}
>+		/* Use nand_base defaults for {read,write}_buf */
> 		break;
>
> 	case NAND_OMAP_PREFETCH_DMA:
>--
>1.8.3.2

Tested-by: Pekon Gupta <pekon@ti.com>


with regards, pekon
