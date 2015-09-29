Received: from m12-14.163.com ([220.181.12.14])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgvC9-0003oZ-Av
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 13:43:50 +0000
Date: Tue, 29 Sep 2015 21:43:19 +0800
From: Yaowei Bai <bywxiaobai@163.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 17/17] fs/ubifs: remove unnecessary new_valid_dev check
Message-ID: <20150929134319.GA4307@bbox>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
 <1443452004-5831-1-git-send-email-bywxiaobai@163.com>
 <CAFLxGvx=BTm4z2e5C=Fy6Hj7mF4Lqhvxe7j6EzsZhkPQqeHXrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvx=BTm4z2e5C=Fy6Hj7mF4Lqhvxe7j6EzsZhkPQqeHXrA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 28, 2015 at 09:20:32PM +0200, Richard Weinberger wrote:
> On Mon, Sep 28, 2015 at 4:53 PM, Yaowei Bai <bywxiaobai@163.com> wrote:
> > As new_valid_dev always returns 1, so new_valid_dev check is not
> > needed, remove it.
> >
> > Signed-off-by: Yaowei Bai <bywxiaobai@163.com>
> > ---
> >  fs/ubifs/dir.c  | 3 ---
> >  fs/ubifs/misc.h | 9 ++-------
> >  2 files changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> > index 5c27c66..1dd9267 100644
> > --- a/fs/ubifs/dir.c
> > +++ b/fs/ubifs/dir.c
> > @@ -787,9 +787,6 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
> >
> >         dbg_gen("dent '%pd' in dir ino %lu", dentry, dir->i_ino);
> >
> > -       if (!new_valid_dev(rdev))
> > -               return -EINVAL;
> > -
> >         if (S_ISBLK(mode) || S_ISCHR(mode)) {
> >                 dev = kmalloc(sizeof(union ubifs_dev_desc), GFP_NOFS);
> >                 if (!dev)
> > diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
> > index ee7cb5e..0197ed6 100644
> > --- a/fs/ubifs/misc.h
> > +++ b/fs/ubifs/misc.h
> > @@ -155,13 +155,8 @@ static inline int ubifs_wbuf_sync(struct ubifs_wbuf *wbuf)
> >   */
> >  static inline int ubifs_encode_dev(union ubifs_dev_desc *dev, dev_t rdev)
> >  {
> > -       if (new_valid_dev(rdev)) {
> > -               dev->new = cpu_to_le32(new_encode_dev(rdev));
> > -               return sizeof(dev->new);
> > -       } else {
> > -               dev->huge = cpu_to_le64(huge_encode_dev(rdev));
> > -               return sizeof(dev->huge);
> > -       }
> > +       dev->huge = cpu_to_le64(huge_encode_dev(rdev));
> > +       return sizeof(dev->huge);
> 
> Please be careful.
> 
> dev->new = cpu_to_le32(new_encode_dev(rdev));
> return sizeof(dev->huge);
> 
> ...is the correct branch. You enabled the dead one.

Sorry about that, will resend fixing it. Thanks.

> 
> -- 
> Thanks,
> //richard
