Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhZlR-0000eG-Mo
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 12:16:35 +0000
Received: by mail-qk0-x243.google.com with SMTP id 26-v6so221604qks.9
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2018 05:16:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <20180622121417.6762-5-clg@kaod.org>
References: <20180622121417.6762-1-clg@kaod.org>
 <20180622121417.6762-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Jul 2018 21:46:01 +0930
Message-ID: <CACPK8Xd0KeTpP+hbHXUDnu5-XzywX_ngCx_N-1Qcokavk5cw7w@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: spi-nor: aspeed: introduce optimized settings
 for fast reads
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 June 2018 at 21:44, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Better settings for fast reads are looked for by implementing a SPI
> timing calibration sequence described in the Aspeed SoC specification
> document. The code is based on the OpenPOWER pflash tool and a similar
> sequence using DMAs can be found in the SDK U-Boot.
>
> The SPI calibration performs a loop on different SPI clock rates
> (dividers of the AHB clock rates) and on different input delay cycles
> for each SPI clock rates. The successive read results are compared to
> a golden buffer, read at low speed, to select the safest and fastest
> read settings for the chip.
>
> The "spi-max-frequency" property is used to cap the optimize read
> algorithm on some devices or controllers for which we want a "really"
> safe setting, on the FMC controller chips for instance.
>
> It can also be deactivated at boot time with a kernel parameter
> 'optimize_read', but that was never used on the field.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I have also been running these applied to a 4.17 base on ast2400 and
ast2500 systems for the past few months. This week I gave them a spin
on top of linux-next too.

They have looked good so far, so I would encourage the series to me
merged for 4.19 so we can reduce the number of out of tree we use in
OpenBMC systems.

For the series:

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
