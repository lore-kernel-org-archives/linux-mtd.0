Received: from 2.mo53.mail-out.ovh.net ([178.33.254.39])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbkuW-0002mF-QH
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 09:21:10 +0000
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 4A8C82EB00
 for <linux-mtd@lists.infradead.org>; Thu,  9 Feb 2017 10:20:32 +0100 (CET)
Subject: Re: [PATCH v2 1/2] mtd: name the mtd device with an optional label
 property
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
 <1485368255-12038-2-git-send-email-clg@kaod.org>
 <20170208223859.GK94627@google.com> <20170209081155.48aba234@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5726ae7e-aa28-afea-e058-b762cf2df311@kaod.org>
Date: Thu, 9 Feb 2017 10:20:19 +0100
MIME-Version: 1.0
In-Reply-To: <20170209081155.48aba234@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/09/2017 08:11 AM, Boris Brezillon wrote:
> On Wed, 8 Feb 2017 14:38:59 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
>> On Wed, Jan 25, 2017 at 07:17:34PM +0100, Cédric Le Goater wrote:
>>> This can be used to easily identify a specific chip on a system with
>>> multiple chips.
>>>
>>> Drivers wanting to support this new label property will benefit from
>>> it without a change. They might want to check in the future that
>>> mtd->name is NULL before assigning a default name to the mtd device.
>>> Other drivers will keep the current behavior, which is to override
>>> mtd->name with their own value.
>>>
>>> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>
>>>  Changes since v1:
>>>
>>>  - moved the use of the "label" property from mtd_set_dev_defaults()
>>>    to mtd_set_of_node() to let drivers keep control on how mtd->name
>>>    is set and allocated.
>>>
>>>  include/linux/mtd/mtd.h | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>>> index 13f8052b9ff9..f4fe15517295 100644
>>> --- a/include/linux/mtd/mtd.h
>>> +++ b/include/linux/mtd/mtd.h
>>> @@ -24,6 +24,7 @@
>>>  #include <linux/uio.h>
>>>  #include <linux/notifier.h>
>>>  #include <linux/device.h>
>>> +#include <linux/of.h>
>>>  
>>>  #include <mtd/mtd-abi.h>
>>>  
>>> @@ -385,6 +386,7 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
>>>  				   struct device_node *np)
>>>  {
>>>  	mtd->dev.of_node = np;
>>> +	of_property_read_string(np, "label", &mtd->name);  
>>
>> Seems like this could be done only if '!mtd->name'?
>>
>> As it stands, you're still clobbering some names, e.g. ones from
>> physmap_of.c.
> 
> Indeed. I thought all users of
> mtd_set_of_node()/nand_set_flash_node()/spi_nor_set_flash_node() were
> calling this function before initializing mtd->name, which is
> apparently not true.
> 
>> Notably, this driver already supports a "linux,mtd-name"
>> (which your new property should probably supersede), but it seems like
>> you're breaking compatibility.
> 
> Well, we're not really breaking things until someone starts defining a
> 'label' property under the flash node ;-). Moreover, if we want to
> deprecate 'linux,mtd-name' in favor of 'label', we should definitely
> override the 'linux,mtd-name' value with the 'label' one if someone
> defined both (which is bad ;-)).
> 
> Anyway, I agree, we'd better check if !mtd->name before assigning the
> label name.
> Cedric, can you send a v3?


yes. will do in the morning.

Thanks,

C. 
