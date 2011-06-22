Received: from gate.crashing.org ([63.228.1.57])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZLIt-0005yH-Ha
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 11:09:04 +0000
Subject: Re: [PATCH] powerpc/85xx: fix NAND_CMD_READID read bytes number
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1307931792-30386-1-git-send-email-Shaohui.Xie@freescale.com>
Date: Wed, 22 Jun 2011 06:08:49 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <A930A3E6-3999-4240-A40B-03F3A9A5B481@kernel.crashing.org>
References: <1307931792-30386-1-git-send-email-Shaohui.Xie@freescale.com>
To: Shaohui Xie <Shaohui.Xie@freescale.com>
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Jun 12, 2011, at 9:23 PM, Shaohui Xie wrote:

> when nand_get_flash_type() is called, it will read 8 bytes of ID =
instead of 5,
> but the driver only read 5 bytes, so kernel will dump error messages =
like:
>=20
> fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
> fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
> fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
>=20
> Signed-off-by: Shaohui Xie <Shaohui.Xie@freescale.com>
> Acked-by: Scott Wood <scottwood@freescale.com>
> ---
> drivers/mtd/nand/fsl_elbc_nand.c |    6 +++---
> 1 files changed, 3 insertions(+), 3 deletions(-)

applied to merge

- k=
