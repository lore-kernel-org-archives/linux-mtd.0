Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eo3gM-0002NY-NV
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 08:53:52 +0000
Date: Tue, 20 Feb 2018 09:53:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Cc: Han Xu <han.xu@nxp.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpmi: fix edo mode for non fully ONFI
 compliant flashes
Message-ID: <20180220095338.13f04062@xps13>
In-Reply-To: <2e12a84b-b4cb-f0ff-f3c9-173def6b5bd2@ginzinger.com>
References: <2e12a84b-b4cb-f0ff-f3c9-173def6b5bd2@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Manfred,

On Tue, 20 Feb 2018 09:15:33 +0100, Manfred Schlaegl
<manfred.schlaegl@ginzinger.com> wrote:

> In enable_edo_mode the timing mode feature is set according to previously
> read capabilities of the parameter page ("Timing mode support"). After
> the value was set, it is read back to provide a "double-check".
> If the "double check" fails, the whole function returns with an error,
> which leads to a very slow (non-edo) fallback timing.
>=20
> The problem here is, that there seem to be some NAND flashes, which are
> not fully ONFI 1.0 compliant.
> One of these is Winbond W29N04GV. According to datasheet and parameter
> page, the flash supports timing mode 4 (edo), but the timing mode feature
> is simply missing.
>=20
> It seems that setting a non-existing feature is simply ignored. The real
> problem occurs, when the feature is read back: W29N04GV always delivers
> zero, which causes the "double-check" to fail. This leads to very slow
> timing and therefore to poor performance.
>=20
> To solve this, we simply remove the double-check, which is a paranoia
> check anyways.

I have been in troubles about this already and sent a first patch
to dot the exact same thing, which was (rightly) nacked by Han.

So I moved to another solution which is:
1/ Move the GPMI driver to use the standardized
->setup_data_interface() hook. This way, use the logic already laying
in the core (controller drivers should not care about that anyway).
2/ Handle differently the ONFI/JEDEC parameter page so that we only
keep the parameters we actually use (instead of the whole page)
3/ Add the possibility in vendor code to nack a feature which is
declared supported (I guess it is your case too) by editing the new
structure replacing the parameter page. This way the check won't be
trustable and thus ignored.

You can find the first versions here [1] [2] and I am currently working
on a next version right now. Look at the last patch in Macronix NAND
code, I guess you could do a similar patch for your NAND (you may wait
for the next version for that, it is subject to slightly change).

Cheers,
Miqu=C3=A8l

[1]
http://lists.infradead.org/pipermail/linux-mtd/2018-January/078920.html
[2]
http://lists.infradead.org/pipermail/linux-mtd/2018-February/079048.html

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
