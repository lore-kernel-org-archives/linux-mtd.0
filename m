Received: from yw-out-1718.google.com ([74.125.46.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MGYAV-0006r3-3h
	for linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 12:53:50 +0000
Received: by yw-out-1718.google.com with SMTP id 4so2280005ywq.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Jun 2009 05:53:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090616091801.GC21321@pengutronix.de>
References: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1245087807.3185.0@antares> <20090616091801.GC21321@pengutronix.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 16 Jun 2009 06:53:17 -0600
Message-ID: <fa686aa40906160553m2f0e7cc4n644c3893573845f@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: devicetree-discuss@ozlabs.org,
	=?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ben Dooks <ben-linux@fluff.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 16, 2009 at 3:18 AM, Wolfram Sang<w.sang@pengutronix.de> wrote:
> On Mon, Jun 15, 2009 at 07:43:20PM +0200, Albrecht Dre=DF wrote:
>> Am 05.06.09 14:05 schrieb(en) Wolfram Sang:
>>> Create an of-aware driver using the now exported generic functions
>>> from plat-ram.c. Also add the documentation for the binding.
>>> Partitions are not yet supported. Tested on a phyCORE-MPC5200B-IO.
>>
>> Dumb question: what is the current status of this patch? =A0I ask becaus=
e
>
> I don't know.
>
> David wondered if 'of_physmap' could be used, so I wrote what I experienc=
ed
> during development. I can't tell if this helped the case.
>
> Grant wondered if we need a bankwidth. IMHO it is needed for now, but I d=
on't
> know if this is a common agreement.

I'm not happy about the use case though.  It probably shouldn't appear
in this binding, or if it does it should be tagged as an optional
property.  It is only in the 5200 localplus case that bank-width is
needed to figure out how to apply the workaround.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
