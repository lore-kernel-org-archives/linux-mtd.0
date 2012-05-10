From: "Mohammed, Afzal" <afzal@ti.com>
To: "Hunter, Jon" <jon-hunter@ti.com>
Subject: RE: [PATCH v4 01/39] ARM: OMAP2+: gpmc: driver conversion
Date: Thu, 10 May 2012 05:10:22 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E98A285@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
 <363273a9ef82d6836197929157aa9a8eb8f5171a.1335874494.git.afzal@ti.com>
 <4FA4035E.6020308@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E987147@DBDE01.ent.ti.com>
 <4FA7F232.7050802@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9878EC@DBDE01.ent.ti.com>
 <4FA936E8.1080801@ti.com>
In-Reply-To: <4FA936E8.1080801@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Hilman, Kevin" <khilman@ti.com>, "Menon, Nishanth" <nm@ti.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "Balbi,
 Felipe" <balbi@ti.com>, "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "Hiremath,
 Vaibhav" <hvaibhav@ti.com>,
 "vimal.newwork@gmail.com" <vimal.newwork@gmail.com>,
 "grinberg@compulab.co.il" <grinberg@compulab.co.il>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "notasas@gmail.com" <notasas@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jon,

On Tue, May 08, 2012 at 20:38:24, Hunter, Jon wrote:

> > Different ways of doing things, this looks cleaner to me as already it =
is
> > checked, and time of execution in both cases would not differ much.
>=20
> Sure. However, I think that this could be simplified so that it is
> easier to read. At a minimum you may wish to add some comments to
> explain the purposes of the multi-level if-statements as it is not
> intuitive for the reader.

Ok

> >> What happens if a device uses more than one wait-pin? In other words a
> >> device with two chip-selects that uses two wait-pins?
> >=20
> > Please re-read http://www.mail-archive.com/linux-omap@vger.kernel.org/m=
sg67702.html
> > and your reply
>=20
> Ok thats fine. Sorry for my repeated questions, but I think that this
> just highlights that this code is not clear in it purpose. So again may
> be some comments would make this all clearer.

Ok

Regards
Afzal
