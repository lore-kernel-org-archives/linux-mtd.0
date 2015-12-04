Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4xGG-0004D1-LA
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 20:47:25 +0000
Received: by iouu10 with SMTP id u10so131165825iou.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 12:47:04 -0800 (PST)
Date: Fri, 4 Dec 2015 14:45:32 -0600
From: Seth Forshee <seth.forshee@canonical.com>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Theodore Ts'o <tytso@mit.edu>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov
Subject: Re: [PATCH 14/19] fs: Permit FIBMAP for users with CAP_SYS_RAWIO in
 s_user_ns
Message-ID: <20151204204532.GG147214@ubuntu-hedt>
References: <1449070821-73820-1-git-send-email-seth.forshee@canonical.com>
 <1449070821-73820-15-git-send-email-seth.forshee@canonical.com>
 <20151204191143.GE3624@mail.hallyn.com>
 <20151204200528.GC18359@thunk.org>
 <20151204200736.GJ3624@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151204200736.GJ3624@mail.hallyn.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 04, 2015 at 02:07:36PM -0600, Serge E. Hallyn wrote:
> Heh, I was looking over http://www.gossamer-threads.com/lists/linux/kernel/103611
> a little while ago :)  The same question was asked 16 years ago.  Apparently
> the answer then was that it was easier than fixing the code.

So it seems then that either it still isn't safe and so unprivileged
users shouldn't be allowed to do it at all, or else it's safe and we
should drop the requirement completely. I can't say which is right,
unfortunately.

> 
> Quoting Theodore Ts'o (tytso@mit.edu):
> > The fact that we need CAP_SYS_RAIO for FIBMAP is pretty silly, given
> > that FIEMAP does not require privileges --- and in fact the preferred
> > interface.  Why not just simply drop the requirement for privileges
> > for FIBMAP?
> > 
> > (Seth, Serge, this isn't a real objection to your patch; but the fact
> > that FIBMAP requires root has always been a bit silly, and this would
> > be a great opportunity to simplify things a bit.)
> > 
> > 						- Ted
> > 						
> > 
> > On Fri, Dec 04, 2015 at 01:11:43PM -0600, Serge E. Hallyn wrote:
> > > Quoting Seth Forshee (seth.forshee@canonical.com):
> > > > Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> > > 
> > > Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
> > > 
> > > > ---
> > > >  fs/ioctl.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > > index 5d01d2638ca5..45c371bed7ee 100644
> > > > --- a/fs/ioctl.c
> > > > +++ b/fs/ioctl.c
> > > > @@ -55,7 +55,7 @@ static int ioctl_fibmap(struct file *filp, int __user *p)
> > > >  	/* do we support this mess? */
> > > >  	if (!mapping->a_ops->bmap)
> > > >  		return -EINVAL;
> > > > -	if (!capable(CAP_SYS_RAWIO))
> > > > +	if (!ns_capable(filp->f_inode->i_sb->s_user_ns, CAP_SYS_RAWIO))
> > > >  		return -EPERM;
> > > >  	res = get_user(block, p);
> > > >  	if (res)
> > > > -- 
> > > > 1.9.1
> > > > 
> > > > --
> > > > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > > > the body of a message to majordomo@vger.kernel.org
> > > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > > > Please read the FAQ at  http://www.tux.org/lkml/
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
