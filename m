Received: from mail-ve1eur01on060d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::60d]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eeXt9-00024M-5E
 for linux-mtd@lists.infradead.org; Thu, 25 Jan 2018 03:07:45 +0000
From: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 "Brian Norris" <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: gpmi: Fix subpage reads
Date: Thu, 25 Jan 2018 03:07:26 +0000
Message-ID: <VI1PR0401MB2221C5231ACDAB30A15E680497E10@VI1PR0401MB2221.eurprd04.prod.outlook.com>
References: <20180123101317.15925-1-boris.brezillon@free-electrons.com>,
 <20180124135106.2a145a11@xps13>
In-Reply-To: <20180124135106.2a145a11@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


________________________________________
From: Miquel Raynal <miquel.raynal@free-electrons.com>
Sent: Wednesday, January 24, 2018 6:51 AM
To: Boris Brezillon
Cc: Richard Weinberger; linux-mtd@lists.infradead.org; David Woodhouse; Bri=
an Norris; Marek Vasut; Cyrille Pitchen; Han Xu
Subject: Re: [PATCH] mtd: nand: gpmi: Fix subpage reads

Hello Boris,

On Tue, 23 Jan 2018 11:13:17 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Commit 25f815f66a14 ("mtd: nand: force drivers to explicitly send
> READ/PROG commands") added a call to nand_read_page_op() in
> gpmi_ecc_read_page(), which means this function now sends a READ0
> command and place the data pointer at the beginning of the page. This
> logic is breaking gpmi_ecc_read_subpage() which was calling
> gpmi_ecc_read_page() and expected it to only retrieve the data without
> sending the READ0 command.
>
> Create a gpmi_ecc_read_page_data() helper which only does the data
> retrieval and ECC correction steps and implement gpmi_ecc_read_page()
> as a wrapper that calls nand_read_page_op()+gpmi_ecc_read_page_data().
>
> This way, gpmi_ecc_read_subpage() can call gpmi_ecc_read_page_data()
> which restores the logic we had before commit 25f815f66a14 ("mtd: nand:
> force drivers to explicitly send READ/PROG commands").
>
> Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PR=
OG commands")
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@free-electrons.com>
Acked-by: Han Xu <han.xu@nxp.com>

Thanks for fixing it,
Miqu=E8l
