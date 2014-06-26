Received: from mail.karo-electronics.de ([81.173.242.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X07Cr-0006SX-T4
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 10:47:06 +0000
Date: Thu, 26 Jun 2014 12:44:51 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv4 0/5] mtd: gpmi: make blockmark swapping optional
Message-ID: <20140626124451.6014fde3@ipc1.ka-ro>
In-Reply-To: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-doc@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Rob Landley <rob@landley.net>,
 Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Lothar Wa=C3=9Fmann wrote:
> With a flash-based BBT there is no reason to move the Factory Bad
> Block Marker from the data area buffer (to where it is mapped by the
> GPMI NAND controller) to the OOB buffer. Thus, make this feature
> configurable via DT. This is required for the Ka-Ro electronics
> i.MX6 platforms.
>=20
> Changes wrt. v2:
> - added a warning for i.MX28 to the binding documentation
> - fixed the gpmi_ecc_read_subpage() routine which turned on blockmark
>   swapping unconditionally
> - use !GPMI_IS_MX23() in place of this->swap_block_mark (which were
>   synonymous the original code) in gpmi_ecc_read_oob() and
>   gpmi_block_markbad()
> - make nand-on-flash-bbt a prerequisite for this feature
>=20
> patch added:
> - add an additional option to turn of BB mark writing
>=20
> Changes wrt. v3:
> - added two code cleanup patches
> - added a patch to turn of NAND_BBT_CREATE, if blockmark swapping is disa=
bled
>=20
>=20
any comments on this patchset?


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
