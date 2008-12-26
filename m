Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LGBwU-0003PT-VM
	for linux-mtd@lists.infradead.org; Fri, 26 Dec 2008 12:37:27 +0000
Subject: Re: [PATCH] mkfs.jffs2: fix dir creation in /
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1230029664-22328-1-git-send-email-vapier@gentoo.org>
References: <8bd0f97a0806200828u2aefc887n37cb48b4cf75528b@mail.gmail.com>
	<1230029664-22328-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Dec 2008 14:38:02 +0200
Message-Id: <1230295082.11802.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-23 at 05:54 -0500, Mike Frysinger wrote:
> diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
> index 7255536..a419bb8 100644
> --- a/mkfs.jffs2.c
> +++ b/mkfs.jffs2.c
> @@ -565,7 +565,10 @@ static int interpret_table_entry(struct filesystem_e=
ntry *root, char *line)
>  		 * try and find our parent now) */
>  		tmp =3D strdup(name);
>  		dir =3D dirname(tmp);
> -		parent =3D find_filesystem_entry(root, dir, S_IFDIR);
> +		if (!strcmp(dir, "/"))
> +			parent =3D root;
> +		else
> +			parent =3D find_filesystem_entry(root, dir, S_IFDIR);
>  		free(tmp);
>  		if (parent =3D=3D NULL) {
>  			error_msg ("skipping device_table entry '%s': no parent directory!", =
name);

I think that you should instead modify 'find_filesystem_entry()' and
make it return the root (of the tree you build the image for, AFAIU)
when you call it like 'find_filesystem_entry(root, "/", S_IFDIR)'. Looks
more logical to me.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
