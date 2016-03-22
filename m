Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiVxZ-0000nS-AT
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2016 23:43:38 +0000
Received: by mail-qk0-x22f.google.com with SMTP id s5so98918415qkd.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2016 16:43:17 -0700 (PDT)
Subject: Re: [RFCv2: PATCH 2/2] mtd: mediatek: driver for MTK Smart Device
 Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160322175850.2722c389@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56F1D891.8010603@linaro.org>
Date: Tue, 22 Mar 2016 19:43:13 -0400
MIME-Version: 1.0
In-Reply-To: <20160322175850.2722c389@bbrezillon>
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

On 03/22/2016 12:58 PM, Boris Brezillon wrote:
>> +typedef void (*release)(struct sdg1_ecc_if *);
>> > +typedef int (*decode)(struct sdg1_ecc_if *);
>> > +typedef void (*init) (struct sdg1_ecc_if *);
>> > +
>> > +struct sdg1_ecc_if {
>> > +	release	release;
>> > +	control control;
>> > +	config config;
>> > +	encode encode;
>> > +	decode decode;
>> > +	check check;
>> > +	init init;
>> > +};
>> > +
>> > +struct sdg1_ecc_if *of_sdg1_ecc_get(struct device_node *);
> I think you should directly return a pointer to the sdg1_ecc instance
> here.
> AFAICS, the "interface" appraoch is useless, all you need is a set of
> exported functions, which all takes the sdg1_ecc pointer as a first
> argument and a set of extra arguments depending on the function.
> See what's done in the jz4780_bch.c driver.
>

yes I am of the contrary opinion (why export a number of functions when you can
just export an interface and keep a clear encapsulation).
as a matter of fact the interface exposes the dependency with the engine while a
random number of function calls does not (with the interface approach eventually
we might be able to have a common ecc interface some day, maybe)

anyway, working on v3 now. thanks for the detailed review as always (and sorry
for the clear fuck ups like the size 0 array in the wrong place...argh!)
