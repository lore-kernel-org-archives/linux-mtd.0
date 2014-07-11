From: "Gupta, Pekon" <pekon@ti.com>
To: "Quadros, Roger" <rogerq@ti.com>, "tony@atomide.com" <tony@atomide.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: RE: [RFC PATCH 07/10] OMAP: GPMC: Introduce APIs for Configuring
 ECC Engine
Date: Fri, 11 Jul 2014 07:54:04 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EB01E0E@DBDE04.ent.ti.com>
References: <1404909450-11970-1-git-send-email-rogerq@ti.com>
 <1404909450-11970-8-git-send-email-rogerq@ti.com>
In-Reply-To: <1404909450-11970-8-git-send-email-rogerq@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "jg1.han@samsung.com" <jg1.han@samsung.com>, "Nori,
 Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "javier@dowhile0.org" <javier@dowhile0.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roger,

>From: Quadros, Roger
>
>Even though the ECC/BCH engine is meant for exclusive use by
>the OMAP NAND controller, the ECC/BCH registers belong
>to the GPMC controller's register space
>
>Add omap_gpmc_ecc_configure_enable() and omap_gpmc_ecc_disable()
>to manage the ECC engine. OMAP NAND driver must use these APIs
>instead of directly accessing the ECC Engine registers.
>
>Signed-off-by: Roger Quadros <rogerq@ti.com>
>---
As suggested in=20
http://lists.infradead.org/pipermail/linux-mtd/2014-July/054595.html

Please try to move chip->ecc.calculate() implementations like
- omap_calculate_ecc_bch()
- omap_calculate_ecc()

>From NAND driver To GPMC driver, as that should be easy, And solve
most of your work (no need to export GPMC registers).
- You may rename them appropriately and change the argument list
   if needed.
- And NAND driver can just have some wrapper functions to match
  the MTD interface arguments.


with regards, pekon
