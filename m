Date: Tue, 10 May 2016 17:13:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, linux-mediatek@lists.infradead.org,
 erin.lo@mediatek.com, daniel.thompson@linaro.org, blogic@openwrt.org
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160510171353.1697cb8a@bbrezillon>
In-Reply-To: <5731F537.9040009@linaro.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon> <5731F537.9040009@linaro.org>
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

On Tue, 10 May 2016 10:50:31 -0400
Jorge Ramirez <jorge.ramirez-ortiz@linaro.org> wrote:

> On 05/10/2016 08:13 AM, Boris Brezillon wrote:
> >> +	if (config->codec == ECC_ENC) {  
> >> >+		/* configure ECC encoder (in bits) */
> >> >+		enc_sz = config->enc_len << 3;
> >> >+
> >> >+		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
> >> >+		reg |= (enc_sz << ECC_MS_SHIFT);
> >> >+		writel(reg, ecc->regs + ECC_ENCCNFG);
> >> >+
> >> >+		if (config->ecc_mode != ECC_NFI_MODE)
> >> >+			writel(lower_32_bits(config->addr),
> >> >+				ecc->regs + ECC_ENCDIADDR);
> >> >+
> >> >+	} else {
> >> >+		/* configure ECC decoder (in bits) */
> >> >+		dec_sz = config->dec_len;
> >> >+
> >> >+		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
> >> >+		reg |= (dec_sz << ECC_MS_SHIFT) | DEC_CNFG_CORRECT;
> >> >+		reg |= DEC_EMPTY_EN;
> >> >+		writel(reg, ecc->regs + ECC_DECCNFG);
> >> >+
> >> >+		if (config->sec_mask)
> >> >+			ecc->sec_mask = 1 << (config->sec_mask - 1);
> >> >+	}  
> > I see that some of the logic could be shared between the ENC and DEC
> > cases.  
> 
> I guess you are referring to
> reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
> 
> ok...

and

reg |= (sz << ECC_MS_SHIFT);

Ok, maybe it's not so important.

> 
> > BTW, why do you multiply enc_len by 8 (bits to byte conversion), but
> > don't do that for dec_len?
> >  
> 
> just as needed by the hardware:
> the config is in bits, the encoder register requires bytes, the decoder 
> register requires bits.
> 

Are you sure about that? Cause it seems to me that the NAND controller
drivers put a length in bits in ->dec_len and a length in bytes in
->enc_len, and then you have an extra conversion in the ECC engine
driver code for enc_len to convert it into a value in bits.

I don't care if you decide to store this value in bytes or bits, but it
should be the same unit for both fields (and I even think we should
have a single field for both encoding and decoding mode).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
