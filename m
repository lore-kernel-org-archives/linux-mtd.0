Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEUDc-0005E3-Tn
 for linux-mtd@lists.infradead.org; Mon, 22 Oct 2018 07:01:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id 143-v6so8983299wmf.1
 for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2018 00:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
 <11759557.52cTf2r1oB@blindfold>
 <CACna6rzvf3+rL9x1uY2NrSd-OD_p08mhzY9hT6dpTOYseja_-g@mail.gmail.com>
 <1818049.3sKzV5Nla8@blindfold>
In-Reply-To: <1818049.3sKzV5Nla8@blindfold>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 22 Oct 2018 09:01:16 +0200
Message-ID: <CACna6rwxgA5tPFhZS_w6hW+HvOh4AwzC4kxZP-KRMZHbNmZ3YA@mail.gmail.com>
Subject: Re: Regression in handling power cuts since 3a1e819b4e80 ("ovl: store
 file handle of lower inode on copy up")
To: Richard Weinberger <richard@nod.at>
Cc: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Russell Senior <russell@personaltelco.net>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
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

On Sat, 20 Oct 2018 at 08:58, Richard Weinberger <richard@nod.at> wrote:
> Am Freitag, 19. Oktober 2018, 23:28:33 CEST schrieb Rafa=C5=82 Mi=C5=82ec=
ki:
> > On Fri, 19 Oct 2018 at 16:59, Richard Weinberger <richard@nod.at> wrote=
:
> > > Am Freitag, 19. Oktober 2018, 16:45:53 CEST schrieb Richard Weinberge=
r:
> > > > Well, I fear it uncovers a problem in UBIFS. We had already problem=
s with overlayfs.
> > > > Did you bisect the problem and you are sure that the said commit is=
 the first bad commit?
> > >
> > > Another thing, UBIFS has no export operations, so overlayfs will fall=
 back to xattrs,
> > > if I read the commit correctly.
> > > Maybe this is the root of the problem.
> > >
> > > I'm currently traveling, so I cannot test much. Please make sure whet=
her
> > > 3a1e819b4e80 is really the first bad commit.
> > > Then I can go for a bug hunt. :-)
> >
> > I did another test and everything keeps pointing to the 3a1e819b4e80.
> >
> > 1) I switched to the 4.12.14
> > 2) I confirmed problem exists there
> > 3) I added "return 0;" at the beginning of ovl_set_origin()
> > 4) I confirmed problem disappeared
>
> Okay. But I still think we're facing some UBIFS problem.
>
> To double check, on Linux 4.12.14 the problem exists and by reverting 3a1=
e819b4e80 (or making it a nop)
> it goes away?

Yes. This is exactly what I described above (4 steps test). Making
ovl_set_origin() a NOP in 4.12.14 makes problem disappear.

> Do you see the warning regarding the double orphan only in the bad case?

No. Let me quote myself: "Please note I wrote this error appears
*with* ovl commit and also with one commit earlier.". If I checkout
3a1e819b4e80~1 (one commit before) I don't see power cut corruption
BUT I still see orphan error.


It seems despite me explaining some things twice still not everything
is clear. Let me work on a complete summary for all commits &
behaviors.

--=20
Rafa=C5=82
