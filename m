Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUBNm-0002nK-HD
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 06:37:19 +0000
From: "Mohammed, Afzal" <afzal@ti.com>
To: Thomas Weber <thomas.weber.linux@googlemail.com>
Subject: RE: [PATCH v4 04/39] ARM: OMAP2+: gpmc: Acquire NAND CS value
Date: Tue, 15 May 2012 06:37:08 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E98C2CD@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
 <10220de398d22fad5de783d8f58fc55ebac85338.1335874494.git.afzal@ti.com>
 <4FA05292.7030902@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9829B0@DBDE01.ent.ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E98BD5A@DBDE01.ent.ti.com>
 <4FB1F808.9080500@gmail.com>
In-Reply-To: <4FB1F808.9080500@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

On Tue, May 15, 2012 at 12:00:32, Thomas Weber wrote:

> > I need a help.
> >
> > Can someone familiar with boards - devkit8000, omap3touchbook, overo bo=
ards,
> > let me know GPMC CS on which NAND is connected.
> On Devkit8000 the NAND is connected to CS0.

Thanks for the information

> I thought that all NAND devices for booting are connected to CS0,=20
> because of ROM code?
>=20
> According to spruf98w.pdf:
>=20
> 25.4.7.4 NAND
> ...
>   * The device is connected to CS0.

Yes, expecting they should be, looking for confirmation.

Regards
Afzal
