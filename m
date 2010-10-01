Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1koG-0005ZW-Dx
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 18:58:21 +0000
Received: by gxk27 with SMTP id 27so1580264gxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Oct 2010 11:57:29 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285953246-19729-1-git-send-email-vapier@gentoo.org>
References: <1285953246-19729-1-git-send-email-vapier@gentoo.org>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 1 Oct 2010 14:57:07 -0400
Message-ID: <AANLkTik7_vDDReL8Zk5m0WFL+ptMWG_-Cyt_svAYQKCC@mail.gmail.com>
Subject: Re: [PATCH] jffs2reader: convert to common.h helpers
To: linux-mtd@lists.infradead.org
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

On Fri, Oct 1, 2010 at 13:14, Mike Frysinger wrote:
> --- a/jffs2reader.c
> +++ b/jffs2reader.c
> @@ -136,10 +136,8 @@ void putblock(char *b, size_t bsize, size_t * rsize,
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uLongf dlen =3D n->dsize;
>
> - =C2=A0 =C2=A0 =C2=A0 if (n->isize > bsize || (n->offset + dlen) > bsize=
) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "File =
does not fit into buffer!\n");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);
> - =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 if (n->isize > bsize || (n->offset + dlen) > bsize=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errmsg("File does not =
fit into buffer!");

ugh, dont merge this one.  on a second review, i see that i used
"errmsg" when i should have used "errmsg_die".
-mike
