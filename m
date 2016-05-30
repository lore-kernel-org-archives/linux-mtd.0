Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7VWt-0004sg-6c
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 22:19:23 +0000
Received: by mail-wm0-x233.google.com with SMTP id n129so85318019wmn.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 May 2016 15:19:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160528164117.GA31101@amitoj-Inspiron-3542>
References: <20160528164117.GA31101@amitoj-Inspiron-3542>
Date: Mon, 30 May 2016 19:19:00 -0300
Message-ID: <CAAEAJfBgR61_UqFBW4JinkE4wSRzCqNg95PxBcaXrhEZS=2grg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Replace if and BUG with BUG_ON
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 julia.lawall@lip6.fr
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

Hi Amitoj,

Thanks for your patch.

On 28 May 2016 at 13:41, Amitoj Kaur Chawla <amitoj1606@gmail.com> wrote:
> Replace if condition and BUG() with a BUG_ON having the conditional
> expression of the if statement as argument.
>

We usually want commit messages that tell us *why* you are doing the
change: what are you fixing, or what are you improving, and what
possible side-effects it may have.

This commit log explains what the code does, but we can clearly see
that, so it's not useful.

> The Coccinelle semantic patch used to make this change is as follows:
> @@ expression E,f; @@
>
> (
>   if (<+... f(...) ...+>) { BUG(); }
> |
> - if (E) { BUG(); }
> + BUG_ON(E);
> )
>
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> ---
>  drivers/mtd/ssfdc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
> index daf82ba..41b13d1 100644
> --- a/drivers/mtd/ssfdc.c
> +++ b/drivers/mtd/ssfdc.c
> @@ -380,8 +380,7 @@ static int ssfdcr_readsect(struct mtd_blktrans_dev *d=
ev,
>                 " block_addr=3D%d\n", logic_sect_no, sectors_per_block, o=
ffset,
>                 block_address);
>
> -       if (block_address >=3D ssfdc->map_len)
> -               BUG();
> +       BUG_ON(block_address >=3D ssfdc->map_len);
>

I don't want to be rude, but I wonder if there's any value at all in
such a patch. It barely improves readability, it barely reduces the
LoC, yet it consumes developer time, maintainer time, and changes git
per-line authorship (used in git blame).

I'm not complaining about *this* particular patch, but rather about
these kind of supposedly clean-up patches.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
