Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDYQY-0000ln-Q5
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 17:19:12 +0000
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Russell Senior <russell@personaltelco.net>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Subject: Re: Regression in handling power cuts since 3a1e819b4e80 ("ovl: store
 file handle of lower inode on copy up")
Date: Fri, 19 Oct 2018 19:18:56 +0200
Message-ID: <1744207.HrE3QU0f25@blindfold>
In-Reply-To: <CACna6rw+dFq+V6QWakOs77P5_3f75M6x7n06hDCCXGBE=GKHxg@mail.gmail.com>
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
 <1457198086.5374.1539960353710.JavaMail.zimbra@nod.at>
 <CACna6rw+dFq+V6QWakOs77P5_3f75M6x7n06hDCCXGBE=GKHxg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 19. Oktober 2018, 18:18:05 CEST schrieb Rafa=C5=82 Mi=C5=82ecki:
> > Do you have something also I can test?
> > A C reproducer? An xfstest case?
>=20
> I don't. I may try writing one with info provided my Amir, but I'm not
> experienced with such things, won't be trivial for me.

Next week I'm in Edinburgh at ELCE, you too?
Maybe we find an hour or two to work together on the problem.

Thanks,
//richard=20
