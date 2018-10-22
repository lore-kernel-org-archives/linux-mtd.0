Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEhjP-0005dJ-I3
 for linux-mtd@lists.infradead.org; Mon, 22 Oct 2018 21:27:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id s18-v6so4744820wrw.6
 for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2018 14:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
 <CACna6rx_jSTEEt6TAzQcBpAHZA_CJGhkjJhWWJKG3cQmr9c9ug@mail.gmail.com>
 <3000620.g91H2S8sUk@blindfold>
In-Reply-To: <3000620.g91H2S8sUk@blindfold>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 22 Oct 2018 23:27:00 +0200
Message-ID: <CACna6rzOuC8vf12qRPOCJwdMPH7-R=eUGaofNYjD7f0_1a23oA@mail.gmail.com>
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

[resending without HTML attachment]
[see http://files.zajec.net/openwrt/ubifs-dbg.html instead]

On Mon, 22 Oct 2018 at 10:26, Richard Weinberger <richard@nod.at> wrote:
> Am Montag, 22. Oktober 2018, 09:14:08 CEST schrieb Rafa=C5=82 Mi=C5=82eck=
i:
> > On Fri, 19 Oct 2018 at 14:31, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:
> > > Since OpenWrt switch from kernel 4.9 to 4.14 users started randomly
> > > reporting file system corruptions. OpenWrt uses overlay(fs) with
> > > squashfs as lowerdir and ubifs as upperdir. Russell managed to isolat=
e
> > > & describe test case for reproducing corruption when doing a power cu=
t
> > > after first boot.
> > >
> > > (...)
> > >
> > > Can I ask you to check if there is something possibly wrong with the
> > > above ovl commit? Or does it expose some problem with the ubifs? Or
> > > maybe the whole UBI?
> > >
> > > FWIW testing above commit (and one before it) always results in singl=
e
> > > error in the kernel log:
> > > [   14.250184] UBIFS error (ubi0:1 pid 637): ubifs_add_orphan: orphan=
ed twice
> > >
> > > That UBIFS error doesn't occur with 4.12.14. Unfortunately it's
> > > impossible to cleanly revert 3a1e819b4e80 from the top of 4.12.14.
> >
> > Let me provide a summary of all relevant commits & tests:
> >
> > By "Corruption" I mean file system corruption after power cut
>
> Well, is the filesystem not consistent anymore?
> From what Russel explained to me, I thought the main problem is that no w=
rite back happens.
> IOW the inode is present, has correct length, but no content is there (al=
l zeros).

I probably misused "corruption" word. What I meant by "corruption" was
file having all "00"es instead of expected data.


> Just like the typical case where userspace does not fsync.
> But in your case sooner or later write back should have happened because =
the writeback timer
> fires at some point.

As you probably noticed I wrote tmptest.c - could you test it, please?
See if you can reproduce the problem? Please call it with 3 arguments:
1) Path on ubifs mount point
2) Some xattr name
3) Some xattr value

Please note I wait 5 seconds (this matches
vm.dirty_writeback_centisecs being 500) before doing a power cut. That
lets ubifs write to flash. For some reason files that got fsetxattr
called for them still are all "00"es after a power cut.

I did some extra testing after enabling ubifs debugging for io.c,
file.c and journal.c. Debugging output looks like expected. I can
clearly see wbuf_timer_callback_nolock() being called.
I attached my debugging summary as ubifs-dbg.html please take a look
at it in case I missed something.

--=20
Rafa=C5=82
