Received: from gate.crashing.org ([63.228.1.57])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8ZPJ-0000bb-Ky
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 15:49:35 +0000
Subject: Re: [PATCH][v4] NAND Machine support for Integrated Flash Controller
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1331789663-27930-1-git-send-email-prabhakar@freescale.com>
Date: Fri, 16 Mar 2012 10:49:22 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C06CCFF-2D44-40CA-9016-DBD09319FC53@kernel.crashing.org>
References: <1331789663-27930-1-git-send-email-prabhakar@freescale.com>
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Cc: Poonam Aggrwal <poonam.aggrwal@freescale.com>,
 Liu Shuo <b35362@freescale.com>, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, Dipen Dudhat <Dipen.Dudhat@freescale.com>,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mar 15, 2012, at 12:34 AM, Prabhakar Kushwaha wrote:

> Integrated Flash Controller(IFC) can be used to hook NAND Flash
> chips using NAND Flash Machine available on it.
>=20
> Signed-off-by: Dipen Dudhat <Dipen.Dudhat@freescale.com>
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>
> Signed-off-by: Liu Shuo <b35362@freescale.com>
> Signed-off-by: Poonam Aggrwal <poonam.aggrwal@freescale.com>
> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
> ---
> Beased on =
http://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git
> 	    branch master
>=20
> Tested on P1010RDB
>=20
> Changes for v2: Ported IFC driver for linux-3.2.0-rc3=20
> 	- Use chip->bbt_options for BBT
> 	- Use mtd_device_parse_register instead of old =
parse_mtd_partitions
>=20
>  Changes for v3: Squashed following patch to make singe NAND driver =
patch
> 	- mtd/nand:Fix wrong usage of is_blank() in fsl_ifc_run_command
> 		http://patchwork.ozlabs.org/patch/136547/
> 	- mtd/nand: Fix IFC driver to support 2K NAND page
> 		http://patchwork.ozlabs.org/patch/135010/
>=20
>  Changes for v4:
> 	- fsl_ifc_run_command: handled wait_event_timeout timeout-return =
case
> 	- Removed unused full_page variable
> 	- fsl_ifc_read_page: Updated Error message
> 	- fsl_ifc_nand_probe: removed possible memory leak for priv =
variable=20
>=20
>=20
> drivers/mtd/nand/Kconfig        |   10 +
> drivers/mtd/nand/Makefile       |    1 +
> drivers/mtd/nand/fsl_ifc_nand.c | 1072 =
+++++++++++++++++++++++++++++++++++++++
> 3 files changed, 1083 insertions(+), 0 deletions(-)
> create mode 100644 drivers/mtd/nand/fsl_ifc_nand.c

applied

- k=
