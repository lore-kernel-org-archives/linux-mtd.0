Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiiAs-0001zt-4q
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 12:46:12 +0000
Received: by mail-qg0-x22a.google.com with SMTP id j35so10392857qge.0
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 05:45:48 -0700 (PDT)
Subject: Re: [RFCv2: PATCH 2/2] mtd: mediatek: driver for MTK Smart Device
 Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160322175850.2722c389@bbrezillon> <56F1D891.8010603@linaro.org>
 <20160323094119.13c5ae19@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56F28FB5.5010204@linaro.org>
Date: Wed, 23 Mar 2016 08:44:37 -0400
MIME-Version: 1.0
In-Reply-To: <20160323094119.13c5ae19@bbrezillon>
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

On 03/23/2016 04:41 AM, Boris Brezillon wrote:
> Hi Jorge,
>
> On Tue, 22 Mar 2016 19:43:13 -0400
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
>
>> On 03/22/2016 12:58 PM, Boris Brezillon wrote:
>>>> +typedef void (*release)(struct sdg1_ecc_if *);
>>>>> +typedef int (*decode)(struct sdg1_ecc_if *);
>>>>> +typedef void (*init) (struct sdg1_ecc_if *);
>>>>> +
>>>>> +struct sdg1_ecc_if {
>>>>> +	release	release;
>>>>> +	control control;
>>>>> +	config config;
>>>>> +	encode encode;
>>>>> +	decode decode;
>>>>> +	check check;
>>>>> +	init init;
>>>>> +};
>>>>> +
>>>>> +struct sdg1_ecc_if *of_sdg1_ecc_get(struct device_node *);
>>> I think you should directly return a pointer to the sdg1_ecc instance
>>> here.
>>> AFAICS, the "interface" appraoch is useless, all you need is a set of
>>> exported functions, which all takes the sdg1_ecc pointer as a first
>>> argument and a set of extra arguments depending on the function.
>>> See what's done in the jz4780_bch.c driver.
>>>
>> yes I am of the contrary opinion (why export a number of functions when you can
>> just export an interface and keep a clear encapsulation).
>> as a matter of fact the interface exposes the dependency with the engine while a
>> random number of function calls does not (with the interface approach eventually
>> we might be able to have a common ecc interface some day, maybe)
> Actually, an interface is supposed to be generic and is meant to be
> implemented by different drivers. None of this is met here: your
> interface is completely specific to the sdg1_ecc driver, and you only
> have a single implementation (which, AFAICT, is not likely to change,
> unless you know you'll have slightly different version of the engine,
> requiring different implementations).

sure I understand (I did write the interface to my specifications thinking that
once enough interfaces are in place we could extract some commonalities).
but it can be done the other way around (once we have enough nand/ecc pairs then
define the interface and reorganize). It is probably a better choice.

>
> In any case, even if you were about to use this 'interface approach',
> you should definitely pass the ECC engine instance (and not the iface
> object) as the first argument of all functions (this is how we emulate
> OOP in C).


> And the last thing is that the interface implementation should be
> referenced with a pointer and not directly embedded in your ECC engine
> object (so that it can be reused by all instances of the same object
> type).

isnt inheritance vs composition a design decision when there is only one
instance of the object anyway?
but sure, composition is often favored for the reason you stated below. I just
didnt think it matter in this case.

>
> Something like:
>
> struct sdg1_ecc {
> 	/* ... */
> 	const struct sdg1_ecc_if *iface;
> };
>
> And then
>
> static const struct sdg1_ecc_if my_iface = {
> 	.xxx = yyyy,
> 	/* */
> }
>
> static int xxx_probe()
> {
> 	struct sdg1_ecc *ecc;
>
> 	/* ... */
>
> 	ecc->iface = &my_iface;
> }
>
> This being said, I agree with one of your statement: we should create a
> generic ECC layer at some point, and make the jz4780, mtk and probably
> also the atmel driver implement this interface.

ok.

> The thing is, I'm not sure yet what the interface should look like.
> Some ECC engine are leaving a lot of control to the software (this is
> the case for the jz4780 engine), others are directly placed in the NAND
> controller pipeline, thus only allowing one to enable/disable the
> engine. And, correct me if I'm wrong, but yours seems to be in the
> middle.

true. this ecc engine is not completely decoupled from the operation which is a
pain.


>
> Anyway, any proposal for such a generic ECC engine layer is welcome.

I think once we have enough ecc drivers we should be able to extract those
commonalities (I wish I had the clarity to think this ahead but I dont :))
Ok so for simplicity and to make it more readable to future driver developers I
will just remove the interface and use the symbols so it aligns with what the
other driver (jz4780bch) does.

I suppose this could be revisited if there is enough momentum.


>> anyway, working on v3 now. thanks for the detailed review as always (and sorry
>> for the clear fuck ups like the size 0 array in the wrong place...argh!)
>>
> No problem.

thanks a lot

>
> Thanks,
>
> Boris
>
>
