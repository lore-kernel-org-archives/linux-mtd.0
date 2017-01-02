Date: Mon, 2 Jan 2017 10:01:24 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alison Wang <b18965@freescale.com>
Cc: kbuild test robot <lkp@intel.com>, alison.wang@nxp.com,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, kbuild-all@01.org,
 cyrille.pitchen@atmel.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: Update dependency of IFC for LS1021A
Message-ID: <20170102100124.78ca7d7e@bbrezillon>
In-Reply-To: <201612291704.0tMw9Uis%fengguang.wu@intel.com>
References: <1482973102-47659-1-git-send-email-b18965@freescale.com>
 <201612291704.0tMw9Uis%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alison,

On Thu, 29 Dec 2016 17:52:37 +0800
kbuild test robot <lkp@intel.com> wrote:

> Hi Alison,
>=20
> [auto build test WARNING on mtd/master]
> [also build test WARNING on v4.10-rc1 next-20161224]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Alison-Wang/mtd-nand-Upd=
ate-dependency-of-IFC-for-LS1021A/20161229-125233
> base:   git://git.infradead.org/linux-mtd.git master
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.g=
it/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=3Darm=20
>=20
> All warnings (new ones prefixed by >>):
>=20
> warning: (MTD_NAND_FSL_IFC) selects FSL_IFC which has unmet direct depend=
encies (MEMORY && (FSL_SOC || ARCH_LAYERSCAPE))

Do you have another patch adding the '||=C2=A0SOC_LS1021A' dependency on
FSL_IFC? If so, please send both patches in the same series.

Thanks,

Boris
