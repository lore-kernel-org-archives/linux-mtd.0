Received: from 2.mo179.mail-out.ovh.net ([178.33.250.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuzLA-0000Zb-8F
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 12:12:53 +0000
Received: from player718.ha.ovh.net (unknown [10.109.146.76])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id EA4F7EE528
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2018 14:12:38 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
 <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
 <5678bf9c-6d9d-294d-3029-710988108bc3@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c8b2b68f-b5fe-00ce-df53-f1d32400460b@kaod.org>
Date: Wed, 29 Aug 2018 14:12:31 +0200
MIME-Version: 1.0
In-Reply-To: <5678bf9c-6d9d-294d-3029-710988108bc3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[ ... ] 

> Ah, so the whole problem is, the ASpeed 2400 SPI NOR controller does
> memory-mapped read from the flash and that has some limitations when the
> flash is over 16 MiB in size -- it sends 3 byte standard opcodes with 4
> byte address ?

yes.

[ ... ]

> To simplify the situation, if the ASpeed 2400 SPI NOR controller tried
> reading the SPI flash past 16 MiB, it would also require that the flash
> is in EN4B mode, yes ?

yes.

[ ... ]

>> I start thinking about maybe adding an option to "jedec,spi-nor" DTS
>> binding like "enable-4byte-mode", so that we could get rid of our
>> local patch and just specify that option in the devicetree. The
>> option would force EN4B on the chip if it supports that mode. What do
>> you think? How do I do it if you approve? Send patches separately in
>> here and in the devicetree mailing list or cross-post both patches to
>> both lists?
> 
> That's an option. But what I think this is really about is a fact that
> we completely lack any way to negotiate limitations between the SPI NOR
> and the controller.

what about the hwcaps in spi_nor_scan() ? 

Thanks,

C.
