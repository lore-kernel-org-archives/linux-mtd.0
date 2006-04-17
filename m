Received: from uproxy.gmail.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FVSVM-0003Q2-Mj
	for linux-mtd@lists.infradead.org; Mon, 17 Apr 2006 08:07:06 -0400
Received: by uproxy.gmail.com with SMTP id j3so456309ugf
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Apr 2006 05:06:54 -0700 (PDT)
Message-ID: <625fc13d0604170506n53147772vec944cdd7f2daef7@mail.gmail.com>
Date: Mon, 17 Apr 2006 07:06:54 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Thiago Galesi" <thiagogalesi@gmail.com>
In-Reply-To: <82ecf08e0604141938w4b29259av797e3115b79042a0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <82ecf08e0604141938w4b29259av797e3115b79042a0@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Remove unnecessary kmalloc/kfree calls in mtdchar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/14/06, Thiago Galesi <thiagogalesi@gmail.com> wrote:
> This patch removes the use of repeated calls to kmalloc / kfree when
> writing / reading from a MTD char device. Not the ideal solution
> mentioned in the driver, but nonetheless better.

NAK.  This patch introduces a bug.  See below.

>
> Index: linux-2.6.16.2/drivers/mtd/mtdchar.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.16.2.orig/drivers/mtd/mtdchar.c
> +++ linux-2.6.16.2/drivers/mtd/mtdchar.c
> @@ -170,15 +170,18 @@ static ssize_t mtd_read(struct file *fil
>
>         /* FIXME: Use kiovec in 2.5 to lock down the user's buffers
>            and pass them directly to the MTD functions */
> -       while (count) {
> -               if (count > MAX_KMALLOC_SIZE)
> -                       len =3D MAX_KMALLOC_SIZE;
> -               else
> -                       len =3D count;
>
> -               kbuf=3Dkmalloc(len,GFP_KERNEL);
> -               if (!kbuf)
> -                       return -ENOMEM;
> +       if (count > MAX_KMALLOC_SIZE)
> +               len =3D MAX_KMALLOC_SIZE;
> +       else
> +               len =3D count;

Now that len is set outside of the loop, it is always the same size.=20
If count is large enough to require more than a single read, the the
original size will still be used and it could overflow the user's
buffer.

I agree that doing the kmallocs in a loop looks nasty.  But we need to
make sure moving out of the loop doesn't break things.

josh
