Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adLGE-0006uE-4I
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 17:17:31 +0000
Received: by mail-qg0-x22c.google.com with SMTP id w104so17939897qge.1
 for <linux-mtd@lists.infradead.org>; Tue, 08 Mar 2016 09:17:09 -0800 (PST)
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56DF0912.6060305@linaro.org>
Date: Tue, 8 Mar 2016 12:17:06 -0500
MIME-Version: 1.0
In-Reply-To: <20160308172437.6eccce05@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 03/08/2016 11:24 AM, Boris Brezillon wrote:

Hi Boris,

>> +
>> > +static int mtk_nfc_subpage_done(struct mtk_nfc_host *host, int sectors)
>> > +{
>> > +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
>> > +	u32 val;
>> > +
>> > +	timeout += jiffies;
>> > +	do {
>> > +		val = mtk_nfi_readl(host, MTKSDG1_NFI_BYTELEN);
>> > +		val &= CNTR_MASK;
>> > +		if (val >= sectors)
>> > +			return 0;
>> > +		cpu_relax();
>> > +
>> > +	} while (time_before(jiffies, timeout));
>> > +
>> > +	return -EIO;
>> > +}
>> > +
>> > +static inline int mtk_nfc_data_ready(struct mtk_nfc_host *host)
>> > +{
>> > +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
>> > +	u8 val;
>> > +
>> > +	timeout += jiffies;
>> > +	do {
>> > +		val = mtk_nfi_readw(host, MTKSDG1_NFI_PIO_DIRDY);
>> > +		val &= PIO_DI_RDY;
>> > +		if (val)
>> > +			return 0;
>> > +		cpu_relax();
>> > +
>> > +	} while (time_before(jiffies, timeout));
>> > +
>> > +	/* data _MUST_ not be accessed */
>> > +	return -EIO;
>> > +}
> Nitpick: you seem to have a lot of xxx_ready() functions, which are
> pretty much all doing the same thing. Maybe it's worth creating a
> single which would take a register offset and status flags, instead of
> adding one function per event.
>
> Something like:
>
> static inline int mtk_nfc_ready(struct mtk_nfc_host *host, int reg,
> 				u32 flags)
> {
> 	/* implem */
> }
>


yes I did notice that as well (and I hate the ugliness) but the issue is that
each of them not only will access different registers but also in different
lengths (readl/readw) and apply different masks and expect a different exit
condition. anyway I'll put some more thought in.

ah thanks for all the other comments in the RFC (both device tree and driver). I
will start working on v2 now.

cheers
