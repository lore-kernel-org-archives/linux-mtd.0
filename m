Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEUQ4-0000xH-6v
 for linux-mtd@lists.infradead.org; Mon, 22 Oct 2018 07:14:33 +0000
Received: by mail-wm1-x343.google.com with SMTP id z204-v6so9140904wmc.5
 for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2018 00:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
In-Reply-To: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 22 Oct 2018 09:14:08 +0200
Message-ID: <CACna6rx_jSTEEt6TAzQcBpAHZA_CJGhkjJhWWJKG3cQmr9c9ug@mail.gmail.com>
Subject: Re: Regression in handling power cuts since 3a1e819b4e80 ("ovl: store
 file handle of lower inode on copy up")
To: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Russell Senior <russell@personaltelco.net>,
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

On Fri, 19 Oct 2018 at 14:31, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wr=
ote:
> Since OpenWrt switch from kernel 4.9 to 4.14 users started randomly
> reporting file system corruptions. OpenWrt uses overlay(fs) with
> squashfs as lowerdir and ubifs as upperdir. Russell managed to isolate
> & describe test case for reproducing corruption when doing a power cut
> after first boot.
>
> (...)
>
> Can I ask you to check if there is something possibly wrong with the
> above ovl commit? Or does it expose some problem with the ubifs? Or
> maybe the whole UBI?
>
> FWIW testing above commit (and one before it) always results in single
> error in the kernel log:
> [   14.250184] UBIFS error (ubi0:1 pid 637): ubifs_add_orphan: orphaned t=
wice
>
> That UBIFS error doesn't occur with 4.12.14. Unfortunately it's
> impossible to cleanly revert 3a1e819b4e80 from the top of 4.12.14.

Let me provide a summary of all relevant commits & tests:

By "Corruption" I mean file system corruption after power cut
By "UBIFS error" I mean:
[   14.308125] UBIFS error (ubi0:1 pid 628): ubifs_add_orphan: orphaned twi=
ce


1) 3a1e819b4e80~1
(one commit before regression)
Corruption: NO
UBIFS error: YES

2) 3a1e819b4e80~1 + cherry-pick of 32fe905c17f0
(one commit before regression + ubifs fix)
Corruption: NO
UBIFS error: NO

3) 3a1e819b4e80
(regressing commit)
Corruption: YES
UBIFS error: YES

4) 3a1e819b4e80 + cherry-pick of 32fe905c17f0
(regressing commit + ubifs fix)
Corruption: YES
UBIFS error: NO

5) 4.12.14
Corruption: YES
UBIFS error: NO

6) 4.12.14 + ovl_set_origin() made nop
Corruption: NO
UBIFS error: NO


It proves that:
1) UBIFS error is not related to this file system corruption and can be ign=
ored
2) 3a1e819b4e80 and ovl_set_origin() are definitely responsible for
the regression and file system corruption

--=20
Rafa=C5=82
