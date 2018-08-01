Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fklo0-0004BN-Cx
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 07:44:26 +0000
Received: from player774.ha.ovh.net (unknown [10.109.146.82])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 409C01D41B9
 for <linux-mtd@lists.infradead.org>; Wed,  1 Aug 2018 09:44:00 +0200 (CEST)
Subject: Re: [PATCH 4/4] mtd: spi-nor: aspeed: introduce optimized settings
 for fast reads
To: Joel Stanley <joel@jms.id.au>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20180622121417.6762-1-clg@kaod.org>
 <20180622121417.6762-5-clg@kaod.org>
 <CACPK8Xd0KeTpP+hbHXUDnu5-XzywX_ngCx_N-1Qcokavk5cw7w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0fe14cf3-b499-b20c-398d-01b5fad04646@kaod.org>
Date: Wed, 1 Aug 2018 09:43:49 +0200
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd0KeTpP+hbHXUDnu5-XzywX_ngCx_N-1Qcokavk5cw7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/23/2018 02:16 PM, Joel Stanley wrote:
> On 22 June 2018 at 21:44, Cédric Le Goater <clg@kaod.org> wrote:
>> Better settings for fast reads are looked for by implementing a SPI
>> timing calibration sequence described in the Aspeed SoC specification
>> document. The code is based on the OpenPOWER pflash tool and a similar
>> sequence using DMAs can be found in the SDK U-Boot.
>>
>> The SPI calibration performs a loop on different SPI clock rates
>> (dividers of the AHB clock rates) and on different input delay cycles
>> for each SPI clock rates. The successive read results are compared to
>> a golden buffer, read at low speed, to select the safest and fastest
>> read settings for the chip.
>>
>> The "spi-max-frequency" property is used to cap the optimize read
>> algorithm on some devices or controllers for which we want a "really"
>> safe setting, on the FMC controller chips for instance.
>>
>> It can also be deactivated at boot time with a kernel parameter
>> 'optimize_read', but that was never used on the field.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I have also been running these applied to a 4.17 base on ast2400 and
> ast2500 systems for the past few months. This week I gave them a spin
> on top of linux-next too.
> 
> They have looked good so far, so I would encourage the series to me
> merged for 4.19 so we can reduce the number of out of tree we use in
> OpenBMC systems.
> 
> For the series:
> 
> Tested-by: Joel Stanley <joel@jms.id.au>

The first 3 patches should not be too much of a problem. What about 
patch 4/4 ? It is not the usual way of setting the freq but the Aspeed
controller has its own mean for tuning it. 

Thanks,

C.
