Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZKzO-0006W3-7G
 for linux-mtd@lists.infradead.org; Wed, 01 Oct 2014 14:34:47 +0000
From: Marek Vasut <marex@denx.de>
To: "Bean Huo =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)"
 <beanhuo@micron.com>
Subject: Re: [PATCH 1/1 v3] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Wed, 1 Oct 2014 16:32:02 +0200
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409301538.40466.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315E3D3F@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E3D3F@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201410011632.02321.marex@denx.de>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, October 01, 2014 at 04:24:41 PM, Bean Huo =E9=9C=8D=E6=96=8C=
=E6=96=8C (beanhuo) wrote:
> >> For Micron spi norflash,enables or disables quad I/O protocol ,which
> >> controled by EVCR(Enhanced Volatile Configuration Register) Quad I/O
> >> protocol bit 7.When EVCR bit 7 is reset to 0, the spi norflash will
> >> operate in quad I/O following the next WRITE ENHANCED VOLATILE
> >> CONFIGURATION command.
> >
> >You only do one WRITE ENHANCED VOLATILE CONFIGURATION command in the
> >patch, so this text doesn't add up.
> >
> >Try something like this:
> >-->8--
> >This patch adds code which enables Quad I/O mode on Micron SPI NOR
> >flashes.
> >
> >For Micron SPI NOR flash, enabling or disabling quad I/O protocol is
> >controled by EVCR (Enhanced Volatile Configuration Register), Quad I/O
> >protocol bit 7. When EVCR bit 7 is reset to 0, the SPI NOR flash will
> >operate in quad I/O mode. --8<--
> >
> >What do you think ?
>=20
> Perfect,I will modify my commit message and sumbit it again.thanks.

Thank you. I didn't mean to grind you unnecessarily or be outright bitch, s=
orry=20
if it did sound like so.

Best regards,
Marek Vasut
