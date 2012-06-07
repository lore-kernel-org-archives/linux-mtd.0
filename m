Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScePd-0003la-1i
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 15:14:13 +0000
From: "Mohammed, Afzal" <afzal@ti.com>
To: "tony@atomide.com" <tony@atomide.com>, "artem.bityutskiy@linux.intel.com"
 <artem.bityutskiy@linux.intel.com>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
Date: Thu, 7 Jun 2012 15:14:03 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E9962E7@DBDE01.ent.ti.com>
References: <cover.1338790117.git.afzal@ti.com>
In-Reply-To: <cover.1338790117.git.afzal@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Jun 04, 2012 at 12:15:01, Mohammed, Afzal wrote:
> Hi,
>=20
> This series cleans up gpmc mtd interactions so that GPMC driver
> conversion which is going to happen shortly would happen smoothly
> by not creating much disturbance outside of arch/arm/*omap*/
>=20
> This series,
> 1. provides the ability for OMAP NAND driver to configure GPMC-NAND
>    registers by NAND driver itself instead of using exported GPMC
>    symbols
> 2. modifies GPMC to provide OMAP ONENAND & NAND drivers with GPMC
>    allocated address space as resource
> 3. creates a fictitious GPMC interrupt chip and provide the clients
>    with interrupts that could be handled using standard APIs (helps
>    in removing the requirement for driver of peripheral connected to
>    GPMC having the knowledge about GPMC interrupt handling). The
>    only user is OMAP NAND driver, it has also been modified to take
>    advantage of this
>=20
> This series has been made over 3.5-rc1

Ping

Regards
Afzal
