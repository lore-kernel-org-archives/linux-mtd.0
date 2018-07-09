Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcctF-00082x-N3
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 20:36:11 +0000
Received: by mail-lj1-x241.google.com with SMTP id 203-v6so4037143ljj.13
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2018 13:35:59 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180709200945.30116-12-boris.brezillon@bootlin.com>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
 <20180709200945.30116-12-boris.brezillon@bootlin.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 Jul 2018 22:35:56 +0200
Message-ID: <CAK8P3a1Ndys3MMxLqL-hTFVDSZGm5ASEnQ7K+8dScvFrp=RTdA@mail.gmail.com>
Subject: Re: [PATCH v2 11/24] mtd: rawnand: sunxi: Make sure ret is
 initialized in sunxi_nfc_read_byte()
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 9, 2018 at 10:09 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> Fixes the following smatch warning:
>
> drivers/mtd/nand/raw/sunxi_nand.c:551 sunxi_nfc_read_byte() error: uninitialized symbol 'ret'.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 99043c3a4fa7..4b11cd4a79be 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -544,7 +544,7 @@ static void sunxi_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
>
>  static uint8_t sunxi_nfc_read_byte(struct mtd_info *mtd)
>  {
> -       uint8_t ret;
> +       uint8_t ret = 0;
>
>         sunxi_nfc_read_buf(mtd, &ret, 1);
>

Should there perhaps be a warning when no data was returned after a timeout?

      Arnd
