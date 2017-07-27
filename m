Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1daoRT-0001o4-26
 for linux-mtd@lists.infradead.org; Thu, 27 Jul 2017 19:27:29 +0000
Date: Thu, 27 Jul 2017 21:27:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Dahl <post@lespocky.de>
Cc: Alexander Dahl <ada@thorsis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Message-ID: <20170727212703.724d41fd@bbrezillon>
In-Reply-To: <20170726204054.oejtb73jsxxlmovm@falbala.home.lespocky.de>
References: <5326598.QgYTQxcFMR@ada> <20170725205406.5a946c08@bbrezillon>
 <9879279.x3T2Y4a6KK@ada> <20170726203326.2159f0cc@bbrezillon>
 <20170726204054.oejtb73jsxxlmovm@falbala.home.lespocky.de>
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

Le Wed, 26 Jul 2017 22:40:56 +0200,
Alexander Dahl <post@lespocky.de> a =C3=A9crit :

> Hei Boris,
>=20
> On Wed, Jul 26, 2017 at 08:33:26PM +0200, Boris Brezillon wrote:
> > If it works, I'd like you to drop SMC timings in both situations (with
> > and without this commit). =20
>=20
> What do you mean with drop? For other CS? How?

Sorry, I meant dump not drop.

>=20
> > I'd also like to to dump NAND timings (those passed to =20
> > ->setup_data_interface()). =20
>=20
> I'll see hat I can do tomorrow.

Did you have time to test with f9ce2eddf176 ("mtd: nand: atmel: Add
->setup_data_interface() hooks") reverted? BTW, it's probably simpler
to just comment out this line [1]

>=20
> Greets
> Alex
>=20

[1]http://elixir.free-electrons.com/linux/v4.13-rc2/source/drivers/mtd/nand=
/atmel/nand-controller.c#L1493
