Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9ZnG-0003Df-I9
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 10:58:43 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [1/1] mxc_nand : allow swapping the Bad block Indicator for NFC
 v1.
Date: Thu, 6 Sep 2012 12:57:26 +0200
References: <CACKLOr0zCCZ0WNpGiOOvoUk4s_vR5Ls4aw6PhXDoYeNQFTESgQ@mail.gmail.com>
 <504871AF.7040809@gmail.com>
In-Reply-To: <504871AF.7040809@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201209061257.26566.jbe@pengutronix.de>
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

Ga=C3=ABtan Carlier wrote:
> [...]
> > Furthermore, what I can't guess is where that 0x7D0 comes from. I know
> > J=C3=BCrgen described something related to the spare area being mixed w=
ith
> > the data (main) area but, is there any documentation about it we can
> > check?

Maybe this image could help to understand:

http://imagebin.org/227389

jbe

=2D-=20
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | http://www.pengutronix.de/ =
 |
