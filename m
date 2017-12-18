Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQuc0-00027X-De
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 12:33:42 +0000
Received: by mail-pf0-x22c.google.com with SMTP id u25so9614393pfg.5
 for <linux-mtd@lists.infradead.org>; Mon, 18 Dec 2017 04:33:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171218103245.22516-1-boris.brezillon@free-electrons.com>
References: <20171218103245.22516-1-boris.brezillon@free-electrons.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 18 Dec 2017 09:33:18 -0300
Message-ID: <CAAEAJfBXbWPTU3s=oyiRrxegvq7g0+HquUdehbd8pRi3hEJQ8Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Fix READOOB implementation
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 Greg Cook <greg@morpheus.ws>, Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 stable@kernel.vger.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 December 2017 at 07:32, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> In the current driver, OOB bytes are accessed in raw mode, and when a
> page access is done with NDCR_SPARE_EN set and NDCR_ECC_EN cleared, the
> driver must read the whole spare area (64 bytes in case of a 2k page,
> 16 bytes for a 512 page). The driver was only reading the free OOB
> bytes, which was leaving some unread data in the FIFO and was somehow
> leading to a timeout.
>
> We could patch the driver to read ->spare_size + ->ecc_size instead of
> just ->spare_size when READOOB is requested, but we'd better make
> in-band and OOB accesses consistent.
> Since the driver is always accessing in-band data in non-raw mode (with
> the ECC engine enabled), we should also access OOB data in this mode.
> That's particularly useful when using the BCH engine because in this
> mode the free OOB bytes are also ECC protected.
>
> Fixes: 43bcfd2bb24a ("mtd: nand: pxa3xx: Add driver-specific ECC BCH supp=
ort")
> Cc: <stable@kernel.vger.org>
> Reported-by: Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk>
> Tested-by: Willy Tarreau <w@1wt.eu>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 021374fe59dc..d1979c7dbe7e 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -961,6 +961,7 @@ static void prepare_start_command(struct pxa3xx_nand_=
info *info, int command)
>
>         switch (command) {
>         case NAND_CMD_READ0:
> +       case NAND_CMD_READOOB:
>         case NAND_CMD_PAGEPROG:
>                 info->use_ecc =3D 1;
>                 break;
> --
> 2.11.0
>

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks a lot Boris!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
