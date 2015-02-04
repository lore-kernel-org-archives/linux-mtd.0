Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJ2xY-0004OC-Ro
 for linux-mtd@lists.infradead.org; Wed, 04 Feb 2015 16:37:50 +0000
From: Marek Vasut <marex@denx.de>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH] m25p80, spi-nor: add SFDP detect method
Date: Wed, 4 Feb 2015 17:37:21 +0100
References: <CAHgCKdX=KbWcZDuHK2pH_P5kfvstH6AYCO3Ox43TbcdbEGyGhw@mail.gmail.com>
 <CACna6ryGUQmkxYEa_T-5AVT15xQBwFi2qoy_yd1+LEXX0ZpG+w@mail.gmail.com>
In-Reply-To: <CACna6ryGUQmkxYEa_T-5AVT15xQBwFi2qoy_yd1+LEXX0ZpG+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201502041737.21712.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, February 04, 2015 at 05:06:55 PM, Rafa=C5=82 Mi=C5=82ecki wro=
te:
> On 4 February 2015 at 16:50, Jim-Ting Kuo <jimtingkuo@gmail.com> wrote:
> > The serial flash discoverable parameters (SFDP) is needed to
> > spi nor devices for some specific features. I added some sfdp
> > structure and detect method. And I hope the method will be
> > useful in the future.
> >=20
> > The code have been tested on lower version Linux and can
> > successfully work with Macronix chips. So I also modified the
> > chip support list of Macronix.
>=20
> Please resend without broken white spaces, so we can review/apply it.

btw. after a brief skim over the code, I'd suggest to send the new
functionality and new chip IDs in separate patches.

Best regards,
Marek Vasut
