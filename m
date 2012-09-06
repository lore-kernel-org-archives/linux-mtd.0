Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9ZxL-000480-OA
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 11:09:08 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [1/1] mxc_nand : allow swapping the Bad block Indicator for NFC
 v1.
Date: Thu, 6 Sep 2012 13:07:52 +0200
References: <CACKLOr0zCCZ0WNpGiOOvoUk4s_vR5Ls4aw6PhXDoYeNQFTESgQ@mail.gmail.com>
 <504871AF.7040809@gmail.com> <201209061257.26566.jbe@pengutronix.de>
In-Reply-To: <201209061257.26566.jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201209061307.53014.jbe@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 javier Martin <javier.martin@vista-silicon.com>,
 =?utf-8?q?Ga=C3=ABtan_Carlier?= <gcembed@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Juergen Beisert wrote:
> Ga=C3=ABtan Carlier wrote:
> > [...]
> >
> > > Furthermore, what I can't guess is where that 0x7D0 comes from. I know
> > > J=C3=BCrgen described something related to the spare area being mixed=
 with
> > > the data (main) area but, is there any documentation about it we can
> > > check?
>
> Maybe this image could help to understand:
>
> http://imagebin.org/227389

Ups, just recognized the green line points to the wrong page offset. Sorry.=
=20
But the rest should show the real behaviour of these NFCs.

jbe

=2D-=20
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | http://www.pengutronix.de/ =
 |
