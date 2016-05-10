Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b092h-0003nU-BM
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 14:53:50 +0000
Received: by mail-qk0-x231.google.com with SMTP id r184so8079488qkc.1
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 07:53:26 -0700 (PDT)
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
Message-ID: <5731F5E3.3020607@linaro.org>
Date: Tue, 10 May 2016 10:53:23 -0400
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
>> +
>> >+void mtk_ecc_disable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
> If you save the mode somewhere in mtk_ecc (or just write in both ENC
> and DEC registers), you won't need this extra config arg here.

ok.

>
>> >+{
>> >+	enum mtk_ecc_codec codec = config->codec;
>> >+
>> >+	mtk_ecc_codec_wait_idle(ecc, codec);
>> >+	writew(0, ecc->regs + ECC_IRQ_REG(codec));
>> >+	writew(ECC_CODEC_DISABLE(codec), ecc->regs + ECC_CTL_REG(codec));
>> >+	up(&ecc->sem);
>> >+}
>> >+EXPORT_SYMBOL(mtk_ecc_disable);
