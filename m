Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYxe1-0002Lo-37
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 13:39:10 +0000
From: Marek Vasut <marex@denx.de>
To: "Bean Huo =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)"
 <beanhuo@micron.com>
Subject: Re: [PATCH 1/1 v3] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Tue, 30 Sep 2014 15:38:40 +0200
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315E3C79@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E3C79@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201409301538.40466.marex@denx.de>
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

On Tuesday, September 30, 2014 at 04:47:39 AM, Bean Huo =E9=9C=8D=E6=96=8C=
=E6=96=8C (beanhuo) wrote:
> For Micron spi norflash,enables or disables quad I/O
> protocol ,which controled by EVCR(Enhanced
> Volatile Configuration Register) Quad I/O
> protocol bit 7.When EVCR bit 7 is reset to 0,
> the spi norflash will operate in quad I/O following
> the next WRITE ENHANCED VOLATILE CONFIGURATION
> command.

You only do one WRITE ENHANCED VOLATILE CONFIGURATION command in the patch,=
 so
this text doesn't add up.

Try something like this:
=2D->8--
This patch adds code which enables Quad I/O mode on Micron SPI NOR
flashes.

=46or Micron SPI NOR flash, enabling or disabling quad I/O protocol
is controled by EVCR (Enhanced Volatile Configuration Register),
Quad I/O protocol bit 7. When EVCR bit 7 is reset to 0, the SPI
NOR flash will operate in quad I/O mode.
=2D-8<--

What do you think ?

Brian, am I bitching too much about pointless things ? Please stop me if yo=
u=20
think I do.

[...]

Best regards,
Marek Vasut
