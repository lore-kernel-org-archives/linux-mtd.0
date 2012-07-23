Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1StNa5-0004gV-5E
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 18:42:10 +0000
Message-ID: <1343068929.19880.36.camel@hornet>
Subject: Re: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
From: Pawel Moll <pawel.moll@arm.com>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 23 Jul 2012 19:42:09 +0100
In-Reply-To: <20120723183230.GA12438@opensource.wolfsonmicro.com>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
 <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
 <20120723174605.GA23707@sirena.org.uk> <1343067861.19880.30.camel@hornet>
 <20120723183230.GA12438@opensource.wolfsonmicro.com>
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

On Mon, 2012-07-23 at 19:32 +0100, Mark Brown wrote:
> The thing that's particularly bad here is that your change will just
> silently ignore the error which is far from awesome, at the very least
> it ought to complain (though I don't think that's a good idea).

I know, I don't like that myself - that's probably why I don't mind
dropping that change. Particularly that non-DT boards can always pass
set_vpp via platform data. And that's what will probably have to happen
here.

> It shouldn't be that hard to find the in-tree users...

It was in case of SMSC ethernet drivers ;-)

> Well, in the DT case it'll probably start returning -ENODEV soon if
> there's no supply binding set up (which would get you back to your
> current case),=20

This would be perfect. Will it happen for 3.7? If so, I'll drop the
non-OF patch and make the OF one rely on -ENODEV.

> given that you're from ARM probably that's covering all
> the cases you're especially interested in.

Indeed physmap_of is what really interests me. I added the non-DT code
to keep symmetry, but after all nature is not symmetrical after
all... ;-)

Cheers!

Pawe=C5=82
