From: "Mohammed, Afzal" <afzal@ti.com>
To: "Mohammed, Afzal" <afzal@ti.com>, "tony@atomide.com" <tony@atomide.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "Hilman, Kevin"
 <khilman@ti.com>, "Balbi, Felipe" <balbi@ti.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "kyungmin.park@samsung.com"
 <kyungmin.park@samsung.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Menon, Nishanth" <nm@ti.com>,
 "grinberg@compulab.co.il" <grinberg@compulab.co.il>, "notasas@gmail.com"
 <notasas@gmail.com>, "artem.bityutskiy@linux.intel.com"
 <artem.bityutskiy@linux.intel.com>, "vimal.newwork@gmail.com"
 <vimal.newwork@gmail.com>, "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v4 00/39] OMAP GPMC driver conversion
Date: Tue, 8 May 2012 11:27:58 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E987D39@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
In-Reply-To: <cover.1335874494.git.afzal@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tony,

On Tue, May 01, 2012 at 17:49:03, Mohammed, Afzal wrote:
> GPMC driver conversion patch series. Some peripherals has GPMC helper
> functions, these has been modified to cater to the needs of GPMC
> driver. All the boards using GPMC has been adapted to use the new
> GPMC driver.
>=20
> GPMC HWMOD entry for OMAP2/3 has been added. On OMAP3, kernel does
> spit "omap_hwmod: gpmc: cannot be enabled for reset (3)", but
> peripherals connected via GPMC are working. Really shaky about OMAP2
> GPMC HWMOD entry. Would be helpful if someone can help me in resolving
> warning on OMAP3 & verify whether OMAP2 entry is proper. The series
> adapts to HWMOD.
>=20
> Drivers, NAND & OneNAND of OMAP has been modified to make use of GPMC
> changes & cleaned up the now unnecessary exported symbol usages.
>=20
> This series has been made on top of,
> 5e136da Linux-omap rebuilt: Updated to -rc5,
> A patch by Javier Martinez Canillas <javier@dowhile0.org>,
> OMAP3: igep0020: Add support for Micron NAND Flash storage memory,
> has also been incorporated into the series as this was necessary for
> igep0020 board.
>=20
> This has been tested on omap3 evm (SMSC911x) & beagle board (NAND)


Please let me know your comments on this series.

Regards
Afzal
