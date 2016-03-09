Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adkIk-0001rf-Gz
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 20:01:47 +0000
Received: by mail-qg0-x22e.google.com with SMTP id w104so51684949qge.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 12:01:25 -0800 (PST)
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56E08112.7040201@linaro.org>
Date: Wed, 9 Mar 2016 15:01:22 -0500
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
>> +	switch (mtd->writesize) {
>> > +	case KB(2):
>> > +		fmt = PAGEFMT_512_2K;
>> > +		chip->ecc.layout = &nand_2k_64;
>> > +		break;
>> > +	case KB(4):
>> > +		fmt = PAGEFMT_2K_4K;
>> > +		chip->ecc.layout = &nand_4k_128;
>> > +		break;
>> > +	case KB(8):
>> > +		fmt = PAGEFMT_4K_8K;
>> > +		break;
>> > +	default:
>> > +		dev_err(dev, "invalid page size: %d\n", mtd->writesize);
>> > +		return -EINVAL;
>> > +	}
> ecclayout info should be exposed through mtd_ooblayout_ops now.
>

do you have an approximate date for when this interface will be merged in
git://git.infradead.org/l2-mtd.git?
