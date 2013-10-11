Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUWsV-0006s8-9L
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 07:11:15 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Jagan Teki <jagannadh.teki@gmail.com>
Subject: RE: [PATCHv3 2/3] drivers: mtd: devices: Add quad read support.
Date: Fri, 11 Oct 2013 07:10:41 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA21134@DBDE04.ent.ti.com>
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-3-git-send-email-sourav.poddar@ti.com>
 <CAD6G_RShZMkSpVzvXWEE0+sDX=pcnf7ndChndgDG5_T4EVL2vQ@mail.gmail.com>
In-Reply-To: <CAD6G_RShZMkSpVzvXWEE0+sDX=pcnf7ndChndgDG5_T4EVL2vQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Balbi, Felipe" <balbi@ti.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> From: Jagan Teki
> > Sourav Poddar <sourav.poddar@ti.com>
> > Some flash also support quad read mode.
> > Adding support for adding quad mode in m25p80
> > for spansion and macronix flash.
>=20
> I am some how not happy with this approach, adding a flags on flash
> param table for supporting
> quad operation in specific flash is may be a better idea.
>=20
> But reading SFDP, is a good idea to get the details of flash - quad
> support is one of them.
> and we can assign quad read or fast read based on that.
>=20
> Any comments.
>=20
Currently SFDP is mostly supported only on Micron devices, that
too the newer ones. So we don't know whether SFDP would be
accepted by other major SPI NOR manufactures like:
Spansion, Nymonix, Micronix, Toshiba, Samsung..

Thus, it might end-up like CFI (common flash interface) where some
vendors support it while others did not. So unless there are more
devices on SFDP from different vendors, I would prefer defer its
implementation in generic driver.

with regards, pekon
