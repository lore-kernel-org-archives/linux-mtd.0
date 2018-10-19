Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDcLK-0001b8-NG
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 21:30:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id r17-v6so6454057wrt.9
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 14:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
 <1457198086.5374.1539960353710.JavaMail.zimbra@nod.at>
 <CACna6rw+dFq+V6QWakOs77P5_3f75M6x7n06hDCCXGBE=GKHxg@mail.gmail.com>
 <1744207.HrE3QU0f25@blindfold>
In-Reply-To: <1744207.HrE3QU0f25@blindfold>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 19 Oct 2018 23:29:39 +0200
Message-ID: <CACna6ryfCerquaRiBT3tiakJ149zcDgCG2-KQzWtsXE1sDrGKA@mail.gmail.com>
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

On Fri, 19 Oct 2018 at 19:18, Richard Weinberger <richard@nod.at> wrote:
> Am Freitag, 19. Oktober 2018, 18:18:05 CEST schrieb Rafa=C5=82 Mi=C5=82ec=
ki:
> > > Do you have something also I can test?
> > > A C reproducer? An xfstest case?
> >
> > I don't. I may try writing one with info provided my Amir, but I'm not
> > experienced with such things, won't be trivial for me.
>
> Next week I'm in Edinburgh at ELCE, you too?
> Maybe we find an hour or two to work together on the problem.

Sadly I'm not attending ELCE :( I chose to attend OpenWrt summit which
takes place a week later.

--=20
Rafa=C5=82
