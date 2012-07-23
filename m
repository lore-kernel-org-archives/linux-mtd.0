Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1StNw9-0005zD-Ck
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 19:04:58 +0000
Message-ID: <1343070299.19880.41.camel@hornet>
Subject: Re: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
From: Pawel Moll <pawel.moll@arm.com>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 23 Jul 2012 20:04:59 +0100
In-Reply-To: <20120723184550.GB12438@opensource.wolfsonmicro.com>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
 <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
 <20120723174605.GA23707@sirena.org.uk> <1343067861.19880.30.camel@hornet>
 <20120723183230.GA12438@opensource.wolfsonmicro.com>
 <1343068929.19880.36.camel@hornet>
 <20120723184550.GB12438@opensource.wolfsonmicro.com>
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

On Mon, 2012-07-23 at 19:45 +0100, Mark Brown wrote:
> The MMC subsystem went down that path initially but has recently
> converted to using regulators more normally.  It provides an explict
> callback but uses regulators otherwise IIRC which seems sensible.

Yeesss...

#ifdef CONFIG_REGULATOR
        /* If we're using the regulator framework, try to fetch a regulator=
 */
        host->vcc =3D regulator_get(&dev->dev, "vmmc");
        if (IS_ERR(host->vcc))
                host->vcc =3D NULL;
        else {
                int mask =3D mmc_regulator_get_ocrmask(host->vcc);

> > This would be perfect. Will it happen for 3.7? If so, I'll drop the
> > non-OF patch and make the OF one rely on -ENODEV.
>=20
> It'll happen if anyone does the work; I've not currently got any useful
> systems that run DT and don't have a particularly large amount of spare
> time.  People were muttering about it, though, for much the reasons you
> mentioned.

Ok, I take the hint, will look into it.

Pawe=C5=82
