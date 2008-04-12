Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkcVd-0005NJ-Ey
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 09:58:57 +0000
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 12 Apr 2008 12:57:13 +0300
Message-Id: <1207994233.5965.124.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2008-04-11 at 14:48 +0800, Nancy wrote:
>     Is there possible to integrate mtd ubi ubifs latest version in one gi=
t tree?
Well, the mainline is where MTD tree and UBI trees are integrated. UBIFS
git tree is not in main line, so it is separate.

But no, we cannot integrate 3 development trees, it just does not make
sense. Better describe your problem and I'll try to help.

>     If the answer is no, will ubifs give patches for porting it to old
> linux kernel? The patches only contain the ubifs needed file.
We maintain 2.6.21, 2.6.22, 2.6.23, and 2.6.24 ports. They contain UBIFS
patches and all the other patches which are needed to make UBIFS work.
For example, 2.6.21 port has tons of UBI patches back-ported from the
ubi-2.6.git tree, it has LZO compressor ported from older versions of
the kernel as well.

>     I know little about kernel, just git clone the whole
> ubifs-v2.6.24, I found there is a lot of differences between the
> original linux-2.6.24.3 and ubifs-v2.6.24.
Sure. But it is easy to make linux-2.6.24.3 + UBIFS. Really. Suppose you
have linux-2.6.24.3 tree at /home/nancy/linux-2.6.24.3 and ubifs-v2.6.24
at /home/nanxy/ubifs-v2.6.24. Do the following:

# cd /home/nanxy/ubifs-v2.6.24
# git diff v2.6.24 > all_ubifs.diff
# cd /home/nancy/linux-2.6.24.3
# patch -p1 < all_ubifs.diff

And that's it.

If you do not want to loose UBIFS history, you could do like this
# cd /home/nanxy/ubifs-v2.6.24
# git format-patch v2.6.24
This will give you huge amount of patches, basically all patches which
we applied to vanilla linux-2.6.24. Now you may apply them to your
linux-2.6.24.3. The easiest way is to use git-am. But first you have to
make sure your linux-2.6.24.3 is a git repository. If it is not (you
downloaded it as a tar.gz file, create a git repository using git
init-db and then git commit).

# cd /home/nancy/linux-2.6.24.3
# git init-db
# git add .
# git-commit -a

Now you have git repository. Then

# mv /home/nanxy/ubifs-v2.6.24/0* .
# git am 0*

And this will apply all the patches in right order (because they have
prefix with number and will be sorted by name). But it you may have some
conflicts, which you will have to fix manually. And after all patches
were applied, you may look what you have with git log.

HTH.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
