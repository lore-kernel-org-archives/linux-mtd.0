Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O6kIF-0002u4-1p
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 12:53:39 +0000
Received: by wyg36 with SMTP id 36so2726369wyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Apr 2010 05:53:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100427114816.GE13859@logfs.org>
References: <20100426094810.GE27497@kernel.dk>
	<20100426143803.GM27497@kernel.dk> <20100426144532.GN27497@kernel.dk>
	<20100426163050.GC4364@logfs.org> <20100426163126.GD4364@logfs.org>
	<x2v4aa525de1004270201t9f57f49fv1e9cfbb2d886e4ad@mail.gmail.com>
	<20100427111759.GA13859@logfs.org>
	<h2h4aa525de1004270431hd98c271ag61462bdb778f7769@mail.gmail.com>
	<20100427114004.GD13859@logfs.org> <20100427114816.GE13859@logfs.org>
Date: Tue, 27 Apr 2010 14:53:37 +0200
Message-ID: <r2h4aa525de1004270553t202fef74u3f4564f4187624c6@mail.gmail.com>
Subject: Re: [PATCH] [LogFS] Return -EINVAL if filesystem image doesn't match
From: Paolo Minazzi <paolo.minazzi@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, Jens Axboe <jens.axboe@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Does the patch below solve the problem for you (without the explicit
> "rootfstype=3Dromfs")?
>
> J=F6rn
>
> --
> One of my most productive days was throwing away 1000 lines of code.
> -- Ken Thompson.
>
>
> Signed-off-by: Joern Engel <joern@logfs.org>
> ---
> =A0fs/logfs/super.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/logfs/super.c b/fs/logfs/super.c
> index 5866ee6..f649038 100644
> --- a/fs/logfs/super.c
> +++ b/fs/logfs/super.c
> @@ -413,7 +413,7 @@ static int __logfs_read_sb(struct super_block *sb)
>
> =A0 =A0 =A0 =A0page =3D find_super_block(sb);
> =A0 =A0 =A0 =A0if (!page)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>
> =A0 =A0 =A0 =A0ds =3D page_address(page);
> =A0 =A0 =A0 =A0super->s_size =3D be64_to_cpu(ds->ds_filesystem_size);

The above patch solve the problem for me.
Now I can mount root without rootfstype=3Dromfs

Bye,
Paolo
