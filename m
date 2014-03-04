Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKmr2-0007Wk-W9
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 10:45:46 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v3 0/2] Add NAND ECC devicetree binding
Date: Tue, 4 Mar 2014 10:45:12 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAAF7BC@DBDE04.ent.ti.com>
References: <1393280689-24267-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393280689-24267-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Grant Likely <grant.likely@secretlab.ca>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Ezequiel Garcia
>
>Third round, fixing a stupid semi-colon miss.
>
>NAND controllers have special ECC modes, raising per-driver ECC mode devic=
etree
>binding. See for instance the binding for OMAP:
>
> - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
>	"sw"		<deprecated> use "ham1" instead
>	"hw"		<deprecated> use "ham1" instead
>	"hw-romcode"	<deprecated> use "ham1" instead
>	"ham1"		1-bit Hamming ecc code
>	"bch4"		4-bit BCH ecc code
>	"bch8"		8-bit BCH ecc code
>
>Other drivers (such as pxa3xx-nand) have similar requirements, with specia=
l
>(controller-specific) ECC modes. Instead of adding a possibly different
>binding per compatible-string, let's add generic ECC strength and ECC step=
 size.
>
>This properties aim at providing a complete description of the required EC=
C
>correction to let drivers choose the appropriate ECC mode.
>
>Changes from v2:
>
>  * Added a missing semi-colon.
>
>Changes from v1:
>
>  * Improve the binding documentation, as per Brian Norris' suggestions.
>
>  * Added the helper functions.
>
>Ezequiel Garcia (2):
>  of_mtd: Add helpers to get ECC strength and ECC step size
>  mtd: nand: Add a devicetree binding for ECC strength and ECC step size
>
> Documentation/devicetree/bindings/mtd/nand.txt | 14 +++++++++++
> drivers/of/of_mtd.c                            | 34 +++++++++++++++++++++=
+++++
> include/linux/of_mtd.h                         | 12 +++++++++
> 3 files changed, 60 insertions(+)
>
>--
>1.8.1.5
>
Thanks Ezequiel. This would help TI's OMAP NAND driver to move from
vendor specific bindings to generic bindings. So for both patches.
Acked-by: Pekon Gupta <pekon@ti.com>

with regards, pekon
