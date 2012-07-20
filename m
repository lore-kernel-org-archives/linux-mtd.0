Received: from smtp-vbr16.xs4all.nl ([194.109.24.36])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SsLVY-0000id-Ab
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2012 22:17:13 +0000
Received: from [192.168.178.39] (de-wolff.demon.nl [212.238.145.132])
 by smtp-vbr16.xs4all.nl (8.13.8/8.13.8) with ESMTP id q6KMGYol046051
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Sat, 21 Jul 2012 00:16:34 +0200 (CEST)
 (envelope-from jaap@de-wolff.org)
Message-ID: <1342822594.29635.37.camel@woonkamer.fritz.box>
Subject: Problem using orion_nand.
From: Jaap de Wolff <jaap@de-wolff.org>
To: linux-mtd@lists.infradead.org
Date: Sat, 21 Jul 2012 00:16:34 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am trying to create a working kernel for a LS-WXL Buffalo NAS.
This contains a Kirkwood Feroceon (Kirkwood: MV88F6281-A1) processor,
with buildin support for a NAND device. The board actually contains a
512 Mb Nand.
In the kirkwood sources is already support for this nand chip, and it is
working on several hw boards.
However, whenever I load the driver, my system stops.
I did try it with linux 2.6.32.1, 2.6.32.59, 3.0.36, 3.2.23. 3.4.4, and
with debian kernels 2.6.32-31 and 2.6.32-45. Nice detail is that even
with the latest kernel supplied  by the manufacturer it is not able to
access the nand from linux. However the system is booting from nand.

I am creating the kernel using crosscompilation on a debian wheezy
machine, using gcc version 4.4.5-8 (g++-4.4-arm-linux-gnueabi)

I did build it with both 
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- 
and 
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- CFLAGS="-march=armv5te
-mfloat-abi=soft -marm" 

options.
I also tried with and  without dma enabled.

Anyhow, with almost the latest kernel, I decided to dig into the code to
find out what was really the problem. I did use netconsole, and put the
nand modules apart from the modules.
I wait until fully booted, and then load the module using insmod.

In the NAND modules I put some print statements, to look what was
happening. The result is unbelievable. It looks like there is a
recursive function call. 
My logging when I do an 
insmod orion_nand.ko is:

orion_nand_probe: starting ***
orion_nand_probe: Resource allocated ***
orion_nand_probe: chip_delay 25 ***
orion_nand_probe: starting platform_set_drvdata. ***
orion_nand_probe: starting nand_scan. ***
nand_scan : starting . ***
nand_scan_ident: starting  ***
nand_scan_ident: starting nand_set_defaults ***
nand_scan_ident: starting nand_get_flash_type ***
nand_get_flash_type: starting ***
nand_get_flash_type: starting  cmdfunc(NAND_CMD_RESET) ***
orion_nand_cmd_ctrl: starting ***
orion_nand_cmd_ctrl: writeb to c8a0c001 ***
orion_nand_cmd_ctrl: starting ***
orion_nand_cmd_ctrl: starting ***
orion_nand_cmd_ctrl: writeb to c8a0c001 ***
orion_nand_cmd_ctrl: starting ***
---- And then the system is frozen ----
As you can see in code below, after the line:
nand_get_flash_type: starting  cmdfunc(NAND_CMD_RESET) ***
I only expect one time orion_nand_cmd_ctrl: starting ***, before I
expect the next log line from nand_get_flash_type.
And I see it four times.

Anyone with a hint/ clue?

Relevant parts of code are:
>From orion_nand.c:
static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned
int ctrl)
{
	struct nand_chip *nc = mtd->priv;
	struct orion_nand_data *board = nc->priv;
	u32 offs;
	pr_info("%s: starting ***", __func__);

	if (cmd == NAND_CMD_NONE)
		return;

	if (ctrl & NAND_CLE)
		offs = (1 << board->cle);
	else if (ctrl & NAND_ALE)
		offs = (1 << board->ale);
	else
		return;

	if (nc->options & NAND_BUSWIDTH_16)
		offs <<= 1;
	pr_info("%s: writeb to %lx ***", __func__, (long)(nc->IO_ADDR_W +
offs));

	writeb(cmd, nc->IO_ADDR_W + offs);
}

from nand_base.c:
/*
 * Get the flash and manufacturer id and lookup if the type is
supported.
 */
static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
						  struct nand_chip *chip,
						  int busw,
						  int *maf_id, int *dev_id,
						  struct nand_flash_dev *type)
{
	int i, maf_idx;
	u8 id_data[8];
	int ret;

	pr_info("%s: starting ***", __func__);

	/* Select the device */
	chip->select_chip(mtd, 0);

	/*
	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
	 * after power-up.
	 */
	pr_info("%s: starting  cmdfunc(NAND_CMD_RESET) ***", __func__);
	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);

	/* Send the command for reading device ID */
	pr_info("%s: starting  cmdfunc(NAND_CMD_READID) ***", __func__);
	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
