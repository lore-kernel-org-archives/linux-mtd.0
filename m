MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170914110709.3591691-1-arnd@arndb.de>
References: <20170914110709.3591691-1-arnd@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2017 15:38:41 +0200
Message-ID: <CAMuHMdU3AqGkvwDQ+hE2=3PhgCKUh1HvBx8Hkvba6XsLHAuBbg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: stm32-quadspi: avoid unintialized return
 code
To: Arnd Bergmann <arnd@arndb.de>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Ludovic Barre <ludovic.barre@st.com>
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

Hi Arnd,

On Thu, Sep 14, 2017 at 1:06 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> If we send zero-length data to stm32_qspi_tx_poll() on older
> compiler versions such as gcc-4.6, we get warned that the
> return code is uninitialized:
>
> drivers/mtd/spi-nor/stm32-quadspi.c:248:2: error: =E2=80=98ret=E2=80=99 m=
ay be used uninitialized in this function [-Werror=3Duninitialized]
>
> On newer compiler versions, the return code is always zero
> in this case, as the local variable gets optimized away and
> is assumed to be zero after the loop completes without error.
>
> This changes the function to instead return -EINVAL if it
> ever gets called with a zero length buffer.
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D82203
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/spi-nor/stm32-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/st=
m32-quadspi.c
> index 86c0931543c5..711cfe7aa4bf 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -227,7 +227,7 @@ static int stm32_qspi_tx_poll(struct stm32_qspi *qspi=
,
>         void (*tx_fifo)(u8 *, void __iomem *);
>         u32 len =3D cmd->len, sr;
>         u8 *buf =3D cmd->buf;
> -       int ret;
> +       int ret =3D -EINVAL;
>
>         if (cmd->qspimode =3D=3D CCR_FMODE_INDW)
>                 tx_fifo =3D stm32_qspi_write_fifo;

See also "[PATCH] mtd: spi-nor: stm32-quadspi: Fix uninitialized error
return code"
(https://patchwork.kernel.org/patch/9842173/)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
