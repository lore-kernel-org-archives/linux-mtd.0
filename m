Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCqg7-0006AH-CF
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 16:27:16 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 10C9F203EC
 for <linux-mtd@lists.infradead.org>; Fri,  2 Dec 2016 16:26:54 +0000 (UTC)
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D629F203B1
 for <linux-mtd@lists.infradead.org>; Fri,  2 Dec 2016 16:26:51 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id t125so219958304ywc.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2016 08:26:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASJLbizHEh8mUUVDvTKiRMCSvyYtdrQzwN5tHmCV8iYOA@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
 <20161201160511.ahlibszokg547wxk@rob-hp-laptop>
 <CAK7LNASJLbizHEh8mUUVDvTKiRMCSvyYtdrQzwN5tHmCV8iYOA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Dec 2016 10:26:30 -0600
Message-ID: <CAL_Jsq+H-JcAtDV3NCfptCWrmTgkQkmZFTj=Do8HhX4b=At9RA@mail.gmail.com>
Subject: Re: [PATCH 39/39] mtd: nand: denali_dt: add compatible strings for
 UniPhier SoC variants
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>, Dinh Nguyen <dinguyen@altera.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 1, 2016 at 8:54 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Rob,
> (+CC Dinh)
>
> 2016-12-02 1:05 GMT+09:00 Rob Herring <robh@kernel.org>:
>> On Sun, Nov 27, 2016 at 03:06:25AM +0900, Masahiro Yamada wrote:
>>> Add two compatible strings for UniPhier SoCs.  The revision register
>>> on both shows revision 5.0, but they are different hardware.
>>>
>>> Features:
>>>  - DMA engine with 64 bit physical address support
>>>  - 1024 byte ECC step size
>>>  - 8 / 16 / 24 bit ECC strength
>>>  - The n_banks format depends on SoC
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>>
>>>  .../devicetree/bindings/mtd/denali-nand.txt        | 10 +++++--
>>>  drivers/mtd/nand/denali_dt.c                       | 33 ++++++++++++++++++++--
>>>  2 files changed, 38 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> index 51fe195..cea46e2 100644
>>> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> @@ -1,13 +1,19 @@
>>>  * Denali NAND controller
>>>
>>>  Required properties:
>>> -  - compatible : should be "denali,denali-nand-dt"
>>> +  - compatible : should be one of the following:
>>> +      "denali,denali-nand-dt"
>>
>> There are multiple things wrong with this string. denali,denali is
>> redundant is one.
>
> One more redundancy; "-dt" is weird because
> DT compatible should be a name of hardware.
>
>
>> It's also fairly useless as this IP has several
>> versions and numerous configuration options IIRC. This should be
>> deprecated IMO.
>
> Right.  There are several customizable parameters for this IP,
> so a generic compatible string like this is probably useless.
>
> This DT binding was added by commit 30f9f2f for Altera SOCFPGA,
> A funny thing is that they upstreamed DT binding, but they did not upstream
> needed changes for the Denali driver core.
> So, the mainline driver has never worked on SOCFPGA
> (or any of DT-based SoCs).
>
>
>
>>> +      "denali,denali-nand-uniphier-v5a"
>>> +      "denali,denali-nand-uniphier-v5b"
>>
>> Use your vendor prefix, not denali. The 2nd denali can probably be
>> dropped because it is not likely you have another kind of nand
>> controller in the SoC.
>
> Hmm, your statement implies that a vendor prefix
> belongs to an SoC vendor, not an IP vendor.
> (I was not quite sure about this.)

Right. We do have some IP vendor strings, but they are usually
fallbacks. Sometimes, I guess they are useful, but IMO over time they
prove to not be useful.

> It is unlikely to happen to have two different NAND controllers on one SoC.
> But, we used a different NAND controller for our SoC family before
> introducing the Denali IP.
> It also implies that Socionext may use a different NAND IP in the future.
> I'd like to include "denali" somewhere because it is clearly associated with
> the driver name.
> Also, this will give an idea what kind of _basic_ hardware is used,
> even though we know various parameters are customizable.
>
>
>
> (Plan A)
>   "denali,socfpga-nand"           (for Altera SOCFPGA variant)
>   "denali,uniphier-nand-v1"       (for old Socionext UniPhier family variant)
>   "denali,uniphier-nand-v2"       (for new Socionext UniPhier family variant)
>
> (Plan B)
>   "altera,denali-nand"            (for Altera SOCFPGA variant)
>   "socionext,denali-nand-v5a"     (for old Socionext UniPhier family variant)
>   "socionext,denali-nand-v5b"     (for new Socionext UniPhier family variant)

Let the Altera folks worry about their stuff. At least for soft IP in
FPGA, it's a bit of a special case. The old string can remain as bad
as it is. I simply would do "socionext,uniphier-v5b-nand" (and v5a).
The fact that it is denali is part of the documentation.

Rob
