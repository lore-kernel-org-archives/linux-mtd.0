Received: from antispam01.maxim-ic.com ([205.153.101.182]
 helo=antispam01.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBKTx-0006uO-BK
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 08:06:38 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 4/6] mtd: set ONFI nand's default hooks in
 nand_set_defaults()
Date: Mon, 19 Aug 2013 10:06:01 +0200
Message-ID: <5381361.fmCO4JOXvv@laclwks004>
In-Reply-To: <20130817175507.GA5034@norris.computersforpeace.net>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-5-git-send-email-b32955@freescale.com>
 <20130817175507.GA5034@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "pekon@ti.com" <pekon@ti.com>, Florian Fainelli <ffainelli@freebox.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 17-August-2013 10:55:07 Brian Norris wrote:
> On Fri, Aug 16, 2013 at 10:10:07AM +0800, Huang Shijie wrote:
> > We may do some ONFI get/set features operations before we call the
> > nand_scan_tail().
> >=20
> > So move the default ONFI nand hooks into nand_set_defaults().
> >=20
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
>=20
> This patch looks similar to a one forwarded by Brian Foster/Florian
> Fainelli a while back. But since I don't have a good copy of the othe=
r
> one, I'll take this.

 This looks Ok to me.
 Apologies for not sending a =E2=80=9Cgood copy=E2=80=9D
 of the earlier one.  Sorry!

cheers!
=09-blf-

--=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
