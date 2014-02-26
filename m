Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIUBf-0007FO-H6
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 02:25:32 +0000
Received: by mail-ig0-f175.google.com with SMTP id hl1so9124027igb.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2014 18:25:10 -0800 (PST)
Date: Tue, 25 Feb 2014 18:25:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: akpm@linux-foundation.org
Subject: Re: [patch 1/4] jffs2: unlock f->sem on error in jffs2_new_inode()
Message-ID: <20140226022506.GE4194@ld-irv-0074>
References: <20140212204454.8FA415A40F6@corp2gmr1-2.hot.corp.google.com>
 <20140226020331.GB4194@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140226020331.GB4194@ld-irv-0074>
Cc: wangnan0@huawei.com, artem.bityutskiy@linux.intel.com,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 andy.wangguoli@huawei.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd (I realized MTD wasn't CC'd on these re-sends)

On Tue, Feb 25, 2014 at 06:03:31PM -0800, Brian Norris wrote:
> Hi Andrew,
> 
> I've run all 4 of these patches (for the second one, I'm using my latest
> version; I'll resend it formally) through a little bit of testing here.
> 
> Hi Wang,
> 
> Thanks for the patch.
> 
> On Wed, Feb 12, 2014 at 12:44:54PM -0800, Andrew Morton wrote:
> > From: Wang Guoli <andy.wangguoli@huawei.com>
> > Subject: jffs2: unlock f->sem on error in jffs2_new_inode()
> > 
> > If jffs2_new_inode() succeeds, it returns with f->sem held, and the caller
> > is responsible for releasing the lock.  If it fails, it still returns with
> > the lock held, but the caller won't release the lock, which will lead to
> > deadlock.
> 
> Have you actually seen a deadlock for this? AFAICT, the error cases for
> jffs2_new_inode() all occur before anyone else actually has a reference
> to the inode, so I don't expect that we should see the deadlock.
> 
> > Fix it by releasing the lock in jffs2_new_inode() on error.
> > 
> > Signed-off-by: Wang Guoli <andy.wangguoli@huawei.com>
> > Signed-off-by: Wang Nan <wangnan0@huawei.com>
> > Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Wang Guoli <andy.wangguoli@huawei.com>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: <stable@vger.kernel.org> # 2.6.34+

Is there anything specific to 2.6.34 for this patch, other than your
testing?

> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > ---
> > 
> >  fs/jffs2/fs.c |    9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff -puN fs/jffs2/fs.c~jffs2-unlock-f-sem-on-error-in-jffs2_new_inode fs/jffs2/fs.c
> > --- a/fs/jffs2/fs.c~jffs2-unlock-f-sem-on-error-in-jffs2_new_inode
> > +++ a/fs/jffs2/fs.c
> > @@ -457,12 +457,14 @@ struct inode *jffs2_new_inode (struct in
> >  	   The umask is only applied if there's no default ACL */
> >  	ret = jffs2_init_acl_pre(dir_i, inode, &mode);
> >  	if (ret) {
> > -	    make_bad_inode(inode);
> > -	    iput(inode);
> > -	    return ERR_PTR(ret);
> > +		mutex_unlock(&f->sem);
> > +		make_bad_inode(inode);
> > +		iput(inode);
> > +		return ERR_PTR(ret);
> >  	}
> >  	ret = jffs2_do_new_inode (c, f, mode, ri);
> >  	if (ret) {
> > +		mutex_unlock(&f->sem);
> >  		make_bad_inode(inode);
> >  		iput(inode);
> >  		return ERR_PTR(ret);
> > @@ -479,6 +481,7 @@ struct inode *jffs2_new_inode (struct in
> >  	inode->i_size = 0;
> >  
> >  	if (insert_inode_locked(inode) < 0) {
> > +		mutex_unlock(&f->sem);
> >  		make_bad_inode(inode);
> >  		iput(inode);
> >  		return ERR_PTR(-EINVAL);

Applied to l2-mtd.git, thanks.

Brian
