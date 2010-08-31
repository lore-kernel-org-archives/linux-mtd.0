Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqPmo-0004CT-Qx
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 12:18:03 +0000
Received: by wyb38 with SMTP id 38so6867765wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 05:17:57 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/3 v3] NAND: add support for reading ONFI parameters from
	NAND device
Date: Tue, 31 Aug 2010 14:02:41 +0200
References: <201008301832.24672.florian@openwrt.org>
	<1283255219.2018.35.camel@brekeke>
In-Reply-To: <1283255219.2018.35.camel@brekeke>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008311402.42266.florian@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

On Tuesday 31 August 2010 13:46:59 Artem Bityutskiy wrote:
> Hi,
> 
> I've added these to my l2-mtd-2.6 / dunno tree, but I have a comment: is
> it possible/feasible to make the below block to be a separate function.
> It is quite large, and difficult to read when it is embedded into the
> function. Also, the indentation becomes more difficult because of too
> much nesting.

I will submit an incremental patch which addresses the issue you mentionned. 
Thanks for your review!

> 
> Also, some stylistic nit-picks below.
> 
> On Mon, 2010-08-30 at 18:32 +0200, Florian Fainelli wrote:
> > +		/* try ONFI for unknow chip or LP */
> > +		chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
> > +		if (chip->read_byte(mtd) == 'O' &&
> > +			chip->read_byte(mtd) == 'N' &&
> > +			chip->read_byte(mtd) == 'F' &&
> > +			chip->read_byte(mtd) == 'I') {
> > +
> > +			struct nand_onfi_params *p = &chip->onfi_params;
> > +			int i;
> > +
> > +			printk(KERN_INFO "ONFI flash detected\n");
> > +			chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> > +			for (i = 0; i < 3; i++) {
> > +				chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> > +				if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> > +								le16_to_cpu(p->crc))
> > +				{
> > +					 printk(KERN_INFO "ONFI param page %d 
valid\n", i);
> > +					 break;
> > +				}
> 
> I think { should me on the same line as if. Moving to a separate func
> will help. Also, check the patch with scripts/checkpatch.pl.

To be frank, nand_base.c already had quite some stylistic issues so I did not 
even give it a try.

> 
> > +			}
> > +
> > +			if (i < 3) {
> > +				/* check version */
> > +				int val = le16_to_cpu(p->revision);
> > +				if (val == 1 || val > (1 << 4))
> > +					printk(KERN_INFO "%s: unsupported ONFI 
version: %d\n",
> > +						__func__, val);
> > +				else {
> > +					if (val & (1 << 4))
> > +						chip->onfi_version = 22;
> > +					else if (val & (1 << 3))
> > +						chip->onfi_version = 21;
> > +					else if (val & (1 << 2))
> > +						chip->onfi_version = 20;
> > +					else
> > +						chip->onfi_version = 10;
> > +				}
> > +			}
> > +
> > +			if (chip->onfi_version) {
> > +				sanitize_string(p->manufacturer, sizeof(p-
>manufacturer));
> > +				sanitize_string(p->model, sizeof(p->model));
> > +				if (!mtd->name)
> > +					mtd->name = p->model;
> > +				mtd->writesize = le32_to_cpu(p->byte_per_page);
> > +				mtd->erasesize = le32_to_cpu(p-
>pages_per_block)*mtd->writesize;
> > +				mtd->oobsize = le16_to_cpu(p-
>spare_bytes_per_page);
> > +				chip->chipsize = le32_to_cpu(p->blocks_per_lun) * 
mtd->erasesize;
> 
> You have whitespaces around '*' here, but 2 lines before you did not
> have.
> 
> > +				busw = 0;
> > +				if (le16_to_cpu(p->features) & 1)
> > +					busw = NAND_BUSWIDTH_16;
> > +
> > +				chip->options &= ~NAND_CHIPOPTIONS_MSK;
> > +				chip->options |= (NAND_NO_READRDY |
> > +						NAND_NO_AUTOINCR) & 
NAND_CHIPOPTIONS_MSK;
> > +
> > +				goto ident_done;
> > +
> > +			}
> > +		}
