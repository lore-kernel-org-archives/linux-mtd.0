Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hhm7I-0008GD-Pz
	for linux-mtd@lists.infradead.org; Sat, 28 Apr 2007 08:34:15 -0400
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
From: Thomas Gleixner <tglx@linutronix.de>
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
In-Reply-To: <463332F9.9040105@ru.mvista.com>
References: <463332F9.9040105@ru.mvista.com>
Content-Type: text/plain
Date: Sat, 28 Apr 2007 14:35:36 +0200
Message-Id: <1177763736.7646.149.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-04-28 at 15:41 +0400, Ruslan V. Sushko wrote:
> +static void ixp_write_buf(struct mtd_info *mtd, const u_char * buf, int 
> len)
> +{
> +       int i;
> +       struct nand_chip *this = mtd->priv;
> +
> +       for (i = 0; i < len; i++)
> +               writeb(buf[i], this->IO_ADDR_W);
> +}

How excatly is this functionally different from the generic write_buf
function in nand_base.c ?

static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
{
        int i;
        struct nand_chip *chip = mtd->priv;

        for (i = 0; i < len; i++)
                writeb(buf[i], chip->IO_ADDR_W);
}

> +static void ixp4xx_hwcontrol(struct mtd_info *mtd, int cmd, unsigned 
> int ctrl)
> +{
> +       struct nand_chip *this = mtd->priv;
> +       struct ixp4xx_faddr_info_t *addr_info = this->priv;

Newline between variables and code !

> +       if (ctrl & NAND_CTRL_CHANGE) {
> +               addr_info->offset = (ctrl & NAND_CLE) ? IXP4XX_NAND_CLE : 0;
> +               addr_info->offset |= (ctrl & NAND_ALE) ? IXP4XX_NAND_ALE 
> : 0;

Your patch is word wrapped !

> +               if (addr_info->chip_select)
> +                       addr_info->chip_select(ctrl);
> +       }
> +
> +       if (cmd != NAND_CMD_NONE)
> +               writeb(cmd, this->IO_ADDR_W + addr_info->offset);
> +}

Aside of that I agree with Lennert, that we really need to get around
and make this real platform code.

	tglx
