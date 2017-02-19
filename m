Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfOuX-0006Ex-75
 for linux-mtd@lists.infradead.org; Sun, 19 Feb 2017 10:40:11 +0000
Received: by mail-wr0-x241.google.com with SMTP id s27so69453wrb.0
 for <linux-mtd@lists.infradead.org>; Sun, 19 Feb 2017 02:39:48 -0800 (PST)
Subject: Re: mtd: spi-nor: hisi-sfc compatibility report
To: Marty Plummer <netz.kernel@gmail.com>
References: <20170215040646.hscl2kuc5nuvbel3@tha-monstah.mydomain>
 <e90185e2-db9e-0f1f-df44-1015f8950b36@gmail.com>
 <20170216162854.hagnxukontcgkykn@tha-monstah.mydomain>
 <77ad543d-3436-0151-c22c-23966cb6f34d@gmail.com>
 <20170219004841.qrqs3kbbtbflickw@tha-monstah.mydomain>
 <5e012080-8e31-61fa-ee59-3657c2eac5dc@gmail.com>
 <20170219025103.z26d3iydmzm2mrgh@tha-monstah.mydomain>
Cc: linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c5044142-a331-1dea-3750-999a496ac93c@gmail.com>
Date: Sun, 19 Feb 2017 11:39:28 +0100
MIME-Version: 1.0
In-Reply-To: <20170219025103.z26d3iydmzm2mrgh@tha-monstah.mydomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/19/2017 03:51 AM, Marty Plummer wrote:
> On Sun, Feb 19, 2017 at 03:31:13AM +0100, Marek Vasut wrote:
>> On 02/19/2017 01:48 AM, Marty Plummer wrote:
>>> On Fri, Feb 17, 2017 at 10:28:07PM +0100, Marek Vasut wrote:
>>>> Crap ... that's kinda surprising. I would've expected to see the two
>>>> hisilicon contributors I see in the git log to pop up there . Can you
>>>> add them and send a patch please ?
>>>>
>>>> -- 
>>>> Best regards,
>>>> Marek Vasut
>>>
>>> To Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt,
>>> then? Actual code needs no changes I can see, and works out of box.
>>
>> To MAINTAINERS , right ? Or maybe I don't quite get what your complaint
>> is all about.
>>
>>> In fact, as far as I can see, it doesn't even check for
>>> "hisilicon,hi3519-spi-nor" at all.
>>
>> It could be it's using DT compatible with some older SoC , but yes, if
>> this SoC is compatible and it is not listed in the binding document, it
>> should be added.
>>
>> -- 
>> Best regards,
>> Marek Vasut
> 
> Ok, got it. Will send a patch in the near future, and add whoever
> get_maintainer.pl shows for arch/arm/mach-hisi

I think it'd be more sane to add the maintainers based on the git commit
log of the HISI SPI NOR driver . I think if you send a version
of the patch and CC them, you'll get some feedback on who the maintainer
of that really is :)

-- 
Best regards,
Marek Vasut
