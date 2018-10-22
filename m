Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEVY6-0004sJ-Vm
 for linux-mtd@lists.infradead.org; Mon, 22 Oct 2018 08:26:58 +0000
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
Date: Mon, 22 Oct 2018 10:26:29 +0200
Message-ID: <3000620.g91H2S8sUk@blindfold>
In-Reply-To: <CACna6rx_jSTEEt6TAzQcBpAHZA_CJGhkjJhWWJKG3cQmr9c9ug@mail.gmail.com>
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
 <CACna6rx_jSTEEt6TAzQcBpAHZA_CJGhkjJhWWJKG3cQmr9c9ug@mail.gmail.com>
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

Am Montag, 22. Oktober 2018, 09:14:08 CEST schrieb Rafa=C5=82 Mi=C5=82ecki:
> On Fri, 19 Oct 2018 at 14:31, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
> > Since OpenWrt switch from kernel 4.9 to 4.14 users started randomly
> > reporting file system corruptions. OpenWrt uses overlay(fs) with
> > squashfs as lowerdir and ubifs as upperdir. Russell managed to isolate
> > & describe test case for reproducing corruption when doing a power cut
> > after first boot.
> >
> > (...)
> >
> > Can I ask you to check if there is something possibly wrong with the
> > above ovl commit? Or does it expose some problem with the ubifs? Or
> > maybe the whole UBI?
> >
> > FWIW testing above commit (and one before it) always results in single
> > error in the kernel log:
> > [   14.250184] UBIFS error (ubi0:1 pid 637): ubifs_add_orphan: orphaned=
 twice
> >
> > That UBIFS error doesn't occur with 4.12.14. Unfortunately it's
> > impossible to cleanly revert 3a1e819b4e80 from the top of 4.12.14.
>=20
> Let me provide a summary of all relevant commits & tests:
>=20
> By "Corruption" I mean file system corruption after power cut

Well, is the filesystem not consistent anymore?
=46rom what Russel explained to me, I thought the main problem is that no w=
rite back happens.
IOW the inode is present, has correct length, but no content is there (all =
zeros).

Just like the typical case where userspace does not fsync.
But in your case sooner or later write back should have happened because th=
e writeback timer
fires at some point.

Thanks,
//richard
