Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEGWT-0005wl-AL
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 13:42:54 +0000
Date: Sat, 18 Jun 2016 15:42:28 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: silence error output if MS_SILENT is set
Message-ID: <20160618134228.GA3253@makrotopia.org>
References: <20160618095218.GA2214@makrotopia.org>
 <CAFLxGvziwPhuX9Uh_L52_bb8Q2_mwQbC=NP1fk9=jLxGrNAOnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvziwPhuX9Uh_L52_bb8Q2_mwQbC=NP1fk9=jLxGrNAOnA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

first of all, thanks for reviewing my patch!

On Sat, Jun 18, 2016 at 02:57:22PM +0200, Richard Weinberger wrote:
> On Sat, Jun 18, 2016 at 11:52 AM, Daniel Golle <daniel@makrotopia.org> wrote:
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  fs/ubifs/super.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> > index 7034995..ae32b3c 100644
> > --- a/fs/ubifs/super.c
> > +++ b/fs/ubifs/super.c
> > @@ -2108,8 +2108,9 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
> >          */
> >         ubi = open_ubi(name, UBI_READONLY);
> >         if (IS_ERR(ubi)) {
> > -               pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
> > -                      current->pid, name, (int)PTR_ERR(ubi));
> > +               if (flags & MS_SILENT)
> > +                       pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
> > +                              current->pid, name, (int)PTR_ERR(ubi));
> 
> This needs a more detailed explanation.

Basically this should be seen in context of
commit 90bea5a3f0bf680b87b90516f3c231997f4b8f3b
which already implements support for MS_SILENT except for that one
error message which is still being displayed despite MS_SILENT being
set.

> Why does UBIFS need this? Only very few filesystems care about MS_SILENT.

Afaik all filesystems potentially used as rootfs on Linux do support
MS_SILENT.

> What problem are you trying to address?

On OpenWrt / LEDE we are probing whether the UBI volume set to be
rootfs contains a squashfs and thus a ubiblock device is being
created and ROOT_DEV is set accordingly. Similarly, we are also
probing whether the rootfs volume contains a ubifs (which is supported
so people can use our kernel and e.g. Debian's userspace or to
waste less space compared to overlay(lower=squashfs,upper=ubifs) when
frequently updating or heavily modifying the rootfs during runtime).
Thus, users get to see that error message in their kernel logs
[    3.060000] UBIFS error (pid: 1): cannot open "ubi0:rootfs", error -19
even though every thing is fine (rootfs just happends to not be ubifs)
and that's misleading as people often blame the first error message
they see to be the cause for anything not working.


Cheers


Daniel
