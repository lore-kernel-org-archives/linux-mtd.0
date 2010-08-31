Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqPIt-0001W8-KV
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 11:47:04 +0000
Received: by ywi4 with SMTP id 4so2859873ywi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 04:47:02 -0700 (PDT)
Subject: Re: [PATCH 3/3 v3] NAND: add support for reading ONFI parameters
	from NAND device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201008301832.24672.florian@openwrt.org>
References: <201008301832.24672.florian@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 31 Aug 2010 14:46:59 +0300
Message-ID: <1283255219.2018.35.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've added these to my l2-mtd-2.6 / dunno tree, but I have a comment: is
it possible/feasible to make the below block to be a separate function.
It is quite large, and difficult to read when it is embedded into the
function. Also, the indentation becomes more difficult because of too
much nesting.

Also, some stylistic nit-picks below.
 
On Mon, 2010-08-30 at 18:32 +0200, Florian Fainelli wrote:
> +		/* try ONFI for unknow chip or LP */
> +		chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
> +		if (chip->read_byte(mtd) == 'O' &&
> +			chip->read_byte(mtd) == 'N' &&
> +			chip->read_byte(mtd) == 'F' &&
> +			chip->read_byte(mtd) == 'I') {
> +
> +			struct nand_onfi_params *p = &chip->onfi_params;
> +			int i;
> +
> +			printk(KERN_INFO "ONFI flash detected\n");
> +			chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> +			for (i = 0; i < 3; i++) {
> +				chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> +				if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> +								le16_to_cpu(p->crc))
> +				{
> +					 printk(KERN_INFO "ONFI param page %d valid\n", i);
> +					 break;
> +				}

I think { should me on the same line as if. Moving to a separate func
will help. Also, check the patch with scripts/checkpatch.pl.

> +			}
> +
> +			if (i < 3) {
> +				/* check version */
> +				int val = le16_to_cpu(p->revision);
> +				if (val == 1 || val > (1 << 4))
> +					printk(KERN_INFO "%s: unsupported ONFI version: %d\n",
> +						__func__, val);
> +				else {
> +					if (val & (1 << 4))
> +						chip->onfi_version = 22;
> +					else if (val & (1 << 3))
> +						chip->onfi_version = 21;
> +					else if (val & (1 << 2))
> +						chip->onfi_version = 20;
> +					else
> +						chip->onfi_version = 10;
> +				}
> +			}
> +
> +			if (chip->onfi_version) {
> +				sanitize_string(p->manufacturer, sizeof(p->manufacturer));
> +				sanitize_string(p->model, sizeof(p->model));
> +				if (!mtd->name)
> +					mtd->name = p->model;
> +				mtd->writesize = le32_to_cpu(p->byte_per_page);
> +				mtd->erasesize = le32_to_cpu(p->pages_per_block)*mtd->writesize;
> +				mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> +				chip->chipsize = le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;

You have whitespaces around '*' here, but 2 lines before you did not
have.

> +				busw = 0;
> +				if (le16_to_cpu(p->features) & 1)
> +					busw = NAND_BUSWIDTH_16;
> +
> +				chip->options &= ~NAND_CHIPOPTIONS_MSK;
> +				chip->options |= (NAND_NO_READRDY |
> +						NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
> +
> +				goto ident_done;
> +
> +			}
> +		}

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
