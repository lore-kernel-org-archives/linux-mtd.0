Received: from gate.crashing.org ([63.228.1.57])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkhLn-0001BT-3l
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 19:59:32 +0000
Subject: Re: [PATCH v3] powerpc/85xx: Enable MTD/NOR/NAND options by default
 in defconfig
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1335495660-14898-1-git-send-email-Shengzhou.Liu@freescale.com>
Date: Fri, 29 Jun 2012 14:59:19 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <47DD81FB-948D-496C-AFDA-42227DC64A3D@kernel.crashing.org>
References: <1335495660-14898-1-git-send-email-Shengzhou.Liu@freescale.com>
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Cc: dwmw2@infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Apr 26, 2012, at 10:01 PM, Shengzhou Liu wrote:

> Enable MTD/NOR/NAND options by default in mpc85xx_defconfig and
> mpc85xx_smp_defconfig to support NOR, NAND flash.
>=20
> Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> ---
> based on master branch of =
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git =
tree.
> v3: remove "CONFIG_MTD_NAND_VERIFY_WRITE=3Dy"
> v2: remove typo "CONFIG_MPC8xxx_GPIO=3Dy"
>=20
> arch/powerpc/configs/mpc85xx_defconfig     |   24 =
++++++++++++++++++++++++
> arch/powerpc/configs/mpc85xx_smp_defconfig |   24 =
++++++++++++++++++++++++
> 2 files changed, 48 insertions(+), 0 deletions(-)

[ what about the corenet defconfigs?? ]

applied

- k=
