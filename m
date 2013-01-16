From: "Philip, Avinash" <avinashphilip@ti.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "tony@atomide.com" <tony@atomide.com>, "rmk+kernel@arm.linux.org.uk"
 <rmk+kernel@arm.linux.org.uk>, "grant.likely@secretlab.ca"
 <grant.likely@secretlab.ca>, "rob.herring@calxeda.com"
 <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>,
 "zonque@gmail.com" <zonque@gmail.com>
Subject: RE: [PATCH v4 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Wed, 16 Jan 2013 12:22:01 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA5DFA9@DBDE01.ent.ti.com>
References: <1357286211-5012-1-git-send-email-avinashphilip@ti.com>
In-Reply-To: <1357286211-5012-1-git-send-email-avinashphilip@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hebbar,
 Gururaja" <gururaja.hebbar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, Jan 04, 2013 at 13:26:48, Philip, Avinash wrote:
> Support to use ELM as BCH 4 & 8 bit error correction module. Also perform=
ance
> enhancement by adding single shot read_page and write_page functions for =
the
> nand flashes with page size less than 4 KB.
>=20
> ELM module can be used to correct errors reported by BCH 4, 8 & 16 bit
> ECC scheme. For now only 4 & 8 bit support is added.
>=20
> BCH 4 & 8 bit error detection support is already available in mainline
> kernel and works with software error correction.
>=20
> This series is based on linux 3.8-rc2 and tested with [1].
> Also this patch series depend on [1] for NAND flash device
> tree data and gpmc nand device tree binding documentation updates.
>=20
> 1. [PATCH v7 0/5] OMAP GPMC DT bindings
> http://www.spinics.net/lists/linux-omap/msg83505.html
>=20
> Tested on am335x-evm for BCH 4 and 8 bit error correction.

Can you apply this patch series on l2-mtd tree as it will help RBL compatib=
ility
ecc layout for NAND flash in am335x-platforms and hardware based BCH error
correction.

Thanks
Avinash

>=20
> Changes since v1:
> 	- Erased page is identified by checking byte [13/7] in read
> 	  ecc. To filter out bit flips in OOB area, check 0 bits in
> 	  the byte greater than 4.
> 	- GPMC ecc engine configuration moves to omap2.c NAND driver.
>=20
> Changes since v2:
> 	- Added runtime detection of elm module, instead of depending
> 	  on platform data.
> 	- Added bit flip correction in OOB ecc data if bit flip happen
> 	  OOB data.
>=20
> Changes since v3:
> 	- Availability and usability of ELM module is detected from device
> 	  tree nodes by checking availability of ELM node in device tree.
>=20
> Philip Avinash (3):
>   mtd: nand: omap2: Update nerrors using ecc.strength
>   mtd: devices: elm: Add support for ELM error correction
>   mtd: nand: omap2: Support for hardware BCH error correction.
>=20
>  Documentation/devicetree/bindings/mtd/elm.txt      |   16 +
>  .../devicetree/bindings/mtd/gpmc-nand.txt          |    4 +
>  drivers/mtd/devices/Makefile                       |    4 +-
>  drivers/mtd/devices/elm.c                          |  405 ++++++++++++++
>  drivers/mtd/nand/omap2.c                           |  583 ++++++++++++++=
++++--
>  include/linux/platform_data/elm.h                  |   54 ++
>  6 files changed, 1023 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
>  create mode 100644 drivers/mtd/devices/elm.c
>  create mode 100644 include/linux/platform_data/elm.h
>=20
> --=20
> 1.7.9.5
>=20
>=20
