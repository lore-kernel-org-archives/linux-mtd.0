From: "Mohammed, Afzal" <afzal@ti.com>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: RE: [PATCH v4 06/39] ARM: OMAP2+: onenand: return value in init
 function
Date: Thu, 3 May 2012 08:54:08 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E982A0E@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
 <91c09cb6a6cb5e87acdcc3f6100a87b4c2a3dd41.1335874494.git.afzal@ti.com>
 <4FA01421.9080808@mvista.com>
In-Reply-To: <4FA01421.9080808@mvista.com>
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
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
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

Hi Sergei,

On Tue, May 01, 2012 at 22:19:37, Sergei Shtylyov wrote:
> > +
> > +#if defined(CONFIG_MTD_ONENAND_OMAP2) || \
> > +		defined(CONFIG_MTD_ONENAND_OMAP2_MODULE)
>=20
>     You can use IS_ENABLED(CONFIG_MTD_ONENAND_OMAP2) instead these two.

Thanks for educating me.

Regards
Afzal
