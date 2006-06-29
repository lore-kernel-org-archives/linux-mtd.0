Received: from hu-out-0102.google.com ([72.14.214.206])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvxtD-0007C8-3g
	for linux-mtd@lists.infradead.org; Thu, 29 Jun 2006 10:53:16 -0400
Received: by hu-out-0102.google.com with SMTP id 20so123232huc
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jun 2006 07:53:05 -0700 (PDT)
Message-ID: <625fc13d0606290746x1c8bff28j96769da31e5bc3f3@mail.gmail.com>
Date: Thu, 29 Jun 2006 09:46:10 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Alexander Belyakov" <abelyako@googlemail.com>
Subject: Re: JFFS2 wbuf non-contiguous write bug
In-Reply-To: <fe810cf0606290741r2b1de379mc0ba49c2aa336757@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <fe810cf0606290500h54295e34jbb018a5346dceb6a@mail.gmail.com>
	<20060629124433.GA19237@wohnheim.fh-wedel.de>
	<fe810cf0606290741r2b1de379mc0ba49c2aa336757@mail.gmail.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/29/06, Alexander Belyakov <abelyako@googlemail.com> wrote:
> On 6/29/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
>
> Anyway I was speaking _not_ about reverting part of your patch but
> about getting back following code for Sibley, since it indeed shows if
> we moved to a new eraseblock.
>
>                 if (((c->wbuf_ofs % c->sector_size) =3D=3D 0) && !c->wbuf=
_len) {
>                         c->wbuf_ofs =3D PAGE_DIV(to);
>                         c->wbuf_len =3D PAGE_MOD(to);
>                         memset(c->wbuf,0xff,c->wbuf_pagesize);
>                 }
>
> > You must be missing something, but I don't know what.  Maybe Josh has
> > some insight into this problem - he did a thorough review and asked
> > many probing questions about this particular part of the patch.
>
> It would be really nice, since current code seems to be broken somehow.

I remember going over this with J=F6rn a while back and being convinced
NOR ECC didn't need that check any longer.  I don't recall looking if
Sibley does though.  I'll try to look at it again, but obviously if it
fixes a bug then it should probably go back in.  I don't think it can
hurt anything at the moment.

josh
