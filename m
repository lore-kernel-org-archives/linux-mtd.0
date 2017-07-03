Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dRzhS-0002zw-6z
 for linux-mtd@lists.infradead.org; Mon, 03 Jul 2017 11:39:31 +0000
Date: Mon, 3 Jul 2017 13:38:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: nand: Changes for 4.13
Message-ID: <20170703133858.33f697b6@bbrezillon>
In-Reply-To: <20170625210459.6d360960@bbrezillon>
References: <20170625210459.6d360960@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Sun, 25 Jun 2017 21:04:59 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:


> 
> Xiaolei Li (9):
>       mtd: nand: mediatek: update DT bindings
>       mtd: nand: mediatek: refine register NFI_PAGEFMT setting
>       mtd: nand: mediatek: add support for different MTK NAND FLASH Controller IP

Please ignore this PR. I'll send a new one containing Dan's fix ("mtd:
nand: mtk: release lock on error path").

Regards,

Boris

>       mtd: nand: mediatek: add support for MT2712 NAND FLASH Controller
>       mtd: nand: mtk: fix incorrect register setting order about ecc irq
>       mtd: nand: mtk: disable ecc irq when writing page with hwecc
>       mtd: nand: mtk: remove unneeded mtk_nfc_hw_init from mtk_nfc_resume
>       mtd: nand: mtk: remove unneeded mtk_ecc_hw_init from mtk_ecc_resume
>       mtd: nand: mtk: add ->setup_data_interface() hook
> 
