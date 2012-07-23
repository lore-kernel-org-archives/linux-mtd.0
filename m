Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1StNJ4-0003dq-TL
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 18:24:36 +0000
Message-ID: <1343067861.19880.30.camel@hornet>
Subject: Re: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
From: Pawel Moll <pawel.moll@arm.com>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 23 Jul 2012 19:24:21 +0100
In-Reply-To: <20120723174605.GA23707@sirena.org.uk>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
 <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
 <20120723174605.GA23707@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2012-07-23 at 18:46 +0100, Mark Brown wrote:
> > +=09info->vpp_regulator =3D devm_regulator_get(&dev->dev, "vpp");
> > +=09if (IS_ERR(info->vpp_regulator))
> > +=09=09info->vpp_regulator =3D NULL;
> > +
>=20
> No, this is very bad karma.  You shouldn't just silently ignore the
> error here, if we didn't get the supply it's probably important and
> otherwise why bother checking the error at all? =20

The reason is simple - to make the regulator completely optional. That's
also why I check the existence of "vpp-supply" property in the OF
version.

> Systems should use
> a fixed voltage regulator to stub out the supply if there's not any
> runtime contol.

I know this discussion and I appreciate your point of view. The fact
that I disagree doesn't matter here. Simply speaking - I'd rather drop
this patch completely than break current (as in: no regulator necessary)
behaviour of the physmap driver. I'm not ready to take all the flak from
dozens of hmm...unhappy users :-)

> At a bare minimum you should be passing back -EPROBE_DEFER if you get
> that.

Which is, if I'm not mistaken, exactly what is returned when no supply
is defined by the board. Which gets us to the starting point. As I said
- if this is deemed unacceptable, I'll simply forget about this patch.

Regards

Pawe=C5=82
