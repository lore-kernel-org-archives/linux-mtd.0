Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFQ0d-0001cI-Ry
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 14:49:12 +0000
Received: by mail-pa0-f49.google.com with SMTP id ld10so2400855pab.8
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 07:48:47 -0700 (PDT)
Date: Fri, 30 Aug 2013 22:53:46 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
Message-ID: <20130831025344.GA9971@gmail.com>
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5220AB35.9080409@digi.com>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 30, 2013 at 04:24:53PM +0200, Hector Palacios wrote:
> Dear Huang,
> 
> On 08/30/2013 11:55 AM, Huang Shijie wrote:
> >于 2013年08月30日 17:15, Hector Palacios 写道:
> >>Hello,
> >>
> >>Working on my custom platform based on i.MX28 (and also with the
> >>MX28EVK) I checked that I cannot mount JFFS2 nand partitions because
> >>I'm getting this error:
> >>
> >>jffs2: inconsistent device description
> >>
> >>which seems to have to do with the OOB area of the NAND.
> >>I saw patchset [1] from Huang Shijie which seems to be related to the
> >>issue. I just wanted to confirm if other people has the same problem
> >>and if the patchset really aims to solve this, or mine is a different
> >>issue.
> >>
> >yes, this patch set aims to solve this.
> >
> >You can try the SLC on the imx28.
> >
> >I only tested the SLC On the imx6q.
> 
> I applied the patchset but I still get the same error when trying to
> mount a JFFS2 filesystem. My nand is:
> 
> [    0.819654] ONFI param page 0 valid
> [    0.823179] ONFI flash detected
> [    0.826344] NAND device: Manufacturer ID: 0x2c,Chip ID: 0xaa (Micron MT29F2G08ABBEAH4)
> [    0.834455] NAND device: 256MiB, SLC, page size: 2048, OOB size: 64
> 

Could you print out the spare bytes of the oob area?

---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index cc0306b..5461189 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -217,6 +217,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 	if (geo->page_size < mtd->writesize + mtd->oobsize) {
 		of->offset = geo->page_size - mtd->writesize;
 		of->length = mtd->oobsize - of->offset;
+		printk("[ %s ] %d, %d\n", __func__, of->offset, of->length);
 	}
 
 	geo->payload_size = mtd->writesize;
-- 


> The same happens on the MX28EVK where I use nand:
> 
> [    0.894127] NAND device: Manufacturer ID: 0xec,Chip ID: 0xdc
> (Samsung NAND 512MiB 3,3V 8-bit)

the gpmi may fails with the Samsung nand, because it may does not have
spare bytes in the oob area.


thanks
Huang Shijie
