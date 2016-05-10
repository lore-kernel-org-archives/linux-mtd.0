Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b08zv-0002YF-G0
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 14:50:56 +0000
Received: by mail-qg0-x230.google.com with SMTP id w36so7588327qge.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 07:50:34 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 daniel.thompson@linaro.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5731F537.9040009@linaro.org>
Date: Tue, 10 May 2016 10:50:31 -0400
MIME-Version: 1.0
In-Reply-To: <20160510141335.442d3d7b@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/10/2016 08:13 AM, Boris Brezillon wrote:
>> +	if (config->codec == ECC_ENC) {
>> >+		/* configure ECC encoder (in bits) */
>> >+		enc_sz = config->enc_len << 3;
>> >+
>> >+		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
>> >+		reg |= (enc_sz << ECC_MS_SHIFT);
>> >+		writel(reg, ecc->regs + ECC_ENCCNFG);
>> >+
>> >+		if (config->ecc_mode != ECC_NFI_MODE)
>> >+			writel(lower_32_bits(config->addr),
>> >+				ecc->regs + ECC_ENCDIADDR);
>> >+
>> >+	} else {
>> >+		/* configure ECC decoder (in bits) */
>> >+		dec_sz = config->dec_len;
>> >+
>> >+		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
>> >+		reg |= (dec_sz << ECC_MS_SHIFT) | DEC_CNFG_CORRECT;
>> >+		reg |= DEC_EMPTY_EN;
>> >+		writel(reg, ecc->regs + ECC_DECCNFG);
>> >+
>> >+		if (config->sec_mask)
>> >+			ecc->sec_mask = 1 << (config->sec_mask - 1);
>> >+	}
> I see that some of the logic could be shared between the ENC and DEC
> cases.

I guess you are referring to
reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);

ok...

> BTW, why do you multiply enc_len by 8 (bits to byte conversion), but
> don't do that for dec_len?
>

just as needed by the hardware:
the config is in bits, the encoder register requires bytes, the decoder 
register requires bits.
