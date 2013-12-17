Received: from mail-db9lp0250.outbound.messaging.microsoft.com
 ([213.199.154.250] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VskmA-0006ET-2X
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 02:52:50 +0000
Date: Tue, 17 Dec 2013 10:23:10 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131217022308.GA12575@shlinux2.ap.freescale.net>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
 <20131216043040.GB27109@shlinux2.ap.freescale.net>
 <CAGWqfij_FQrXoBkhsL-noMxHyJV1yOyj8BO+ABCZFMP8Hv5upA@mail.gmail.com>
 <20131216130048.GA1155@gmail.com>
 <CAGWqfii2XjauNFMRu=OMTRTsgDeH9-dLhOsr0MeVhX2f-iAmkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGWqfii2XjauNFMRu=OMTRTsgDeH9-dLhOsr0MeVhX2f-iAmkw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 16, 2013 at 02:14:03PM +0100, Elie De Brauwer wrote:
> 
> Well the stress test is simply dd if=/dev/mtdX of=/dev/null bs=1M (or nanddump).

Does the mtdX is a new erased partition ? or a used partition?


The 0 of the HW_BCH_STATUS0 means the page has _no_ error found.

I did not apply your patch, i just read out the register, My test patch is :

-------------------------------------------------------------------
@@ -1002,12 +1002,29 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	/* Loop over status bytes, accumulating ECC status. */
 	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
+	{
+		struct resources *r = &this->resources;
+
+		u32 reg;
+
+		reg = readl(r->bch_regs +  0x10);
+		printk("[ %s ] stat : %x\n", __func__, reg);
+	}
+
 	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
 		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
 			continue;
 
 		if (*status == STATUS_UNCORRECTABLE) {
 			mtd->ecc_stats.failed++;
+			{
+				struct resources *r = &this->resources;
+
+				u32 reg;
+
+				reg = readl(r->bch_regs +  0x10);
+				printk("[ %s ] fail stat : %x\n", __func__, reg);
+			}
 			continue;
-------------------------------------------------------------------

In my imx6q-sabreauto board, when i use ubiattach, the log show likes:

-------------------------------------------------------
[   52.615042] UBI: attaching mtd4 to ubi0
[   52.616747] [ gpmi_ecc_read_page ] stat : 0
[   52.618224] [ gpmi_ecc_read_page ] stat : ff10
[   52.619802] [ gpmi_ecc_read_page ] stat : 0
[   52.621192] [ gpmi_ecc_read_page ] stat : ff10
[   52.622434] [ gpmi_ecc_read_page ] stat : 0
[   52.623637] [ gpmi_ecc_read_page ] stat : ff10
[   52.625113] [ gpmi_ecc_read_page ] stat : 0
[   52.626336] [ gpmi_ecc_read_page ] stat : ff10
[   52.627542] [ gpmi_ecc_read_page ] stat : 0
[   52.628741] [ gpmi_ecc_read_page ] stat : ff10
[   52.629940] [ gpmi_ecc_read_page ] stat : 0
[   52.631136] [ gpmi_ecc_read_page ] stat : ff10
[   52.632333] [ gpmi_ecc_read_page ] stat : 0
[   52.633527] [ gpmi_ecc_read_page ] stat : ff10
[   52.634741] [ gpmi_ecc_read_page ] stat : 0
[   52.635953] [ gpmi_ecc_read_page ] stat : ff10
[   52.637155] [ gpmi_ecc_read_page ] stat : 0
[   52.638354] [ gpmi_ecc_read_page ] stat : ff10
[   52.639551] [ gpmi_ecc_read_page ] stat : 0

   ...........................................................// Skip many lines

[   57.610635] [ gpmi_ecc_read_page ] fail stat : ff04
[   57.610671] UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 1997:4096, read only 4096 bytes, retry
[   57.611850] [ gpmi_ecc_read_page ] stat : ff04
[   57.611864] [ gpmi_ecc_read_page ] fail stat : ff04
[   57.611899] UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 1997:4096, read only 4096 bytes, retry
[   57.613075] [ gpmi_ecc_read_page ] stat : ff04
[   57.613087] [ gpmi_ecc_read_page ] fail stat : ff04
[   57.613122] UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 1997:4096, read only 4096 bytes, retry
[   57.615096] [ gpmi_ecc_read_page ] stat : ff04
[   57.615110] [ gpmi_ecc_read_page ] fail stat : ff04
[   57.615152] UBI error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 1997:4096, read 4096 bytes
[   57.615176] CPU: 0 PID: 831 Comm: ubiattach Not tainted 3.10.17-16984-g01eb085 #1378
[   57.615240] [<80013aec>] (unwind_backtrace+0x0/0xf8) from [<8001156c>] (show_stack+0x10/0x14)
[   57.615281] [<8001156c>] (show_stack+0x10/0x14) from [<80376420>] (ubi_io_read+0x130/0x2fc)
[   57.615309] [<80376420>] (ubi_io_read+0x130/0x2fc) from [<80376a1c>] (ubi_io_read_vid_hdr+0x48/0x21c)
[   57.615338] [<80376a1c>] (ubi_io_read_vid_hdr+0x48/0x21c) from [<8037b434>] (ubi_attach+0x264/0x14ac)
[   57.615364] [<8037b434>] (ubi_attach+0x264/0x14ac) from [<80370800>] (ubi_attach_mtd_dev+0x51c/0xbd8)
[   57.615387] [<80370800>] (ubi_attach_mtd_dev+0x51c/0xbd8) from [<80371134>] (ctrl_cdev_ioctl+0xd8/0x18c)
[   57.615414] [<80371134>] (ctrl_cdev_ioctl+0xd8/0x18c) from [<800cd55c>] (do_vfs_ioctl+0x80/0x5e4)
[   57.615437] [<800cd55c>] (do_vfs_ioctl+0x80/0x5e4) from [<800cdafc>] (SyS_ioctl+0x3c/0x5c)
[   57.615461] [<800cdafc>] (SyS_ioctl+0x3c/0x5c) from [<8000e040>] (ret_fast_syscall+0x0/0x30)
[   57.616800] [ gpmi_ecc_read_page ] stat : ff10
-----------------------------------------------------------------


thanks
Huang Shijie
