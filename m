Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVBzr-00056E-NQ
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:00:33 +0000
Date: Fri, 7 Dec 2018 10:00:09 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <Cyrille.Pitchen@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: parse SFDP 4-byte Address Instruction
 Table
Message-ID: <20181207100009.5e2bb49a@bbrezillon>
In-Reply-To: <20181206144330.30860-1-tudor.ambarus@microchip.com>
References: <20181206144330.30860-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tudor,

On Thu, 6 Dec 2018 14:43:39 +0000
<Tudor.Ambarus@microchip.com> wrote:

>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -3276,6 +3462,10 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  			err = spi_nor_parse_smpt(nor, param_header);
>  			break;
>  
> +		case SFDP_4BAIT_ID:
> +			err = spi_nor_parse_4bait(nor, param_header, params);
> +			break;
> +
>  		default:
>  			break;
>  		}
> @@ -3857,7 +4047,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	    (JEDEC_MFR(info) == SNOR_MFR_SPANSION && mtd->size > SZ_16M))
>  		nor->flags |= SNOR_F_4B_OPCODES;
>  
> -	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES)
> +	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
> +	    !(nor->flags & SNOR_F_HAS_4BAIT))
>  		spi_nor_set_4byte_opcodes(nor);

The list of checks is growing. Maybe we could move those checks
at the beginning of spi_nor_set_4byte_opcodes() so we can
unconditionally call spi_nor_set_4byte_opcodes() here.
Not something I ask you to fix in this patch, just thinking out loud.

The rest of the patch looks good, but I'm pretty sure we'll run into
trouble as soon as we start parsing this 4BAIT section (as has been the
case for all other SFPD sections so far), just because vendors tend to
get this sort of things wrong. I don't have a solution for that other
than the proposed SFDP fixup hooks infrastructure [1] or the more
conservative "don't parse/trust SFDP" approach. Note that, even if we
go for the SFDP fixups approach, we might still break setups where the
4BAIT section of the SFDP table is broken until someone comes with a
fixup for those broken chips.

Since I don't like to block inclusion of new features for purely
theoretical issues, I'm in favor of applying this patch, but be
prepared to receive bug reports during the 4.21-rc cycle ;-).

Regards,

Boris

[1]http://patchwork.ozlabs.org/patch/1008687/
