Date: Sat, 24 Jun 2017 22:11:32 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <richard@nod.at>, <matthias.bgg@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <rogercc.lin@mediatek.com>, <bayi.cheng@mediatek.com>,
 <jie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: Re: [PATCH 0/5] Improve MTK NAND driver
Message-ID: <20170624221132.538ac58e@bbrezillon>
In-Reply-To: <1498201948-39088-1-git-send-email-xiaolei.li@mediatek.com>
References: <1498201948-39088-1-git-send-email-xiaolei.li@mediatek.com>
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

Le Fri, 23 Jun 2017 15:12:23 +0800,
Xiaolei Li <xiaolei.li@mediatek.com> a =C3=A9crit :

> The following patch set mainly contains:
> * optimize ecc irq setting
> * remove redundant code in nfi/ecc resume functions
> * support ->setup_data_interface() hook, to optimize driver performance

Applied the whole series.

Thanks,

Boris

>=20
> Changes relative to:
> --------------------
>=20
> tree    : https://github.com/bbrezillon/linux-0day
> branch  : nand/next
> commit  :
>         'commit c25030acf920 ("mtd: nand: denali: avoid magic numbers and
>          rename for clarification")'
>=20
> Tests:
> ------
>=20
> * suspend/resume function check through commands:
>   echo mem > /sys/power/state
>   cat /sys/kernel/debug/suspend_stats
> * ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
>   by 'dd' command and iozone.
> * all drivers/mtd/tests/* pass.
> * speed test:
>   eraseblock write speed is 10520 KiB/s
>   eraseblock read speed is 17714 KiB/s
>   page write speed is 10365 KiB/s
>   page read speed is 17506 KiB/s
>   2 page write speed is 10439 KiB/s
>   2 page read speed is 17626 KiB/s
>   erase speed is 64427 KiB/s
>   2x multi-block erase speed is 324435 KiB/s
>   4x multi-block erase speed is 331659 KiB/s
>   8x multi-block erase speed is 332332 KiB/s
>   16x multi-block erase speed is 333008 KiB/s
>   32x multi-block erase speed is 334367 KiB/s
>   64x multi-block erase speed is 333008 KiB/s
>=20
> Xiaolei Li (5):
>   mtd: nand: mtk: fix incorrect register setting order about ecc irq
>   mtd: nand: mtk: disable ecc irq when writing page with hwecc
>   mtd: nand: mtk: remove unneeded mtk_nfc_hw_init from mtk_nfc_resume
>   mtd: nand: mtk: remove unneeded mtk_ecc_hw_init from mtk_ecc_resume
>   mtd: nand: mtk: add ->setup_data_interface() hook
>=20
>  drivers/mtd/nand/mtk_ecc.c  | 26 ++++++-------
>  drivers/mtd/nand/mtk_nand.c | 92 ++++++++++++++++++++++++++++++++++++---=
------
>  2 files changed, 88 insertions(+), 30 deletions(-)
>=20
> --
> 1.9.1
