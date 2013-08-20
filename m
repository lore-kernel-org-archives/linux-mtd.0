Received: from antispam01.maxim-ic.com ([205.153.101.182]
 helo=antispam01.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBg4Q-0003iP-7A
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 07:09:41 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 4/6] mtd: set ONFI nand's default hooks in
 nand_set_defaults()
Date: Tue, 20 Aug 2013 09:09:07 +0200
Message-ID: <2807293.aRGNn81TaS@laclwks004>
In-Reply-To: <CAN8TOE-LC+p6Vt9GB7kiT-ytqnD2aMJ7sKMwZMEa3QHiKCwhhw@mail.gmail.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <5381361.fmCO4JOXvv@laclwks004>
 <CAN8TOE-LC+p6Vt9GB7kiT-ytqnD2aMJ7sKMwZMEa3QHiKCwhhw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "pekon@ti.com" <pekon@ti.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 19-August-2013 17:41:17 Brian Norris wrote:
> On Mon, Aug 19, 2013 at 1:06 AM, Brian Foster
> <brian.foster@maximintegrated.com> wrote:
> > On Saturday 17-August-2013 10:55:07 Brian Norris wrote:
> >> On Fri, Aug 16, 2013 at 10:10:07AM +0800, Huang Shijie wrote:
> >> > We may do some ONFI get/set features operations before we call t=
he
> >> > nand_scan_tail().
>[...]
> >  Apologies for not sending a =E2=80=9Cgood copy=E2=80=9D
> >  of the earlier one.  Sorry!
>=20
> No problem. Artem had replied about resending it inline (that is the
> typical way to review patches), but I was going to get around to
> applying it anyway.

 Yes, I saw Artem's reply, and I also know Patches are
 normally sent inline.  However, to do that without it
 being corrupted (and other silly problems) from $work
 is tedious and error-prone (I omit the gory details),
 plus I wasn't available (holidays, &tc).  In any case
 the improvement is now progressing, despite the route
 to get to this point being rather strange!

cheers,
=09-blf-

--=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
