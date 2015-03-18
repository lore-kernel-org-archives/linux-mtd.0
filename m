Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYFNA-0001aY-UD
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 14:55:06 +0000
Date: Wed, 18 Mar 2015 09:54:25 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/1] UBIFS: fix incorrect unlocking handling
Message-ID: <20150318145425.GA20004@bshelton-desktop>
References: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
 <20150318031858.GO32500@ld-irv-0074>
MIME-Version: 1.0
In-Reply-To: <20150318031858.GO32500@ld-irv-0074>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: taesoo@gatech.edu, Subodh Nijsure <snijsure@grid-net.com>,
 dedekind1@gmail.com, sanidhya@gatech.edu, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, Terry Wilcox <terry.wilcox@ni.com>,
 linux-mtd@lists.infradead.org, blee@gatech.edu,
 Taesoo Kim <tsgatesv@gmail.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Gratian Crisan <gratian.crisan@ni.com>, csong84@gatech.edu,
 changwoo@gatech.edu, Brad Mouring <brad.mouring@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/17, Brian Norris wrote:
> On Tue, Mar 17, 2015 at 10:09:26PM -0400, Taesoo Kim wrote:
> > When ubifs_init_security() fails, 'ui_mutex' is incorrectly
> > unlocked and incorrectly restores 'i_size'. There are four
> > such places that were introduce by the last commit.
> 
> "The last commit" is not very descriptive. Are you speaking of this
> commit?
> 
> commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
> Author: Subodh Nijsure <snijsure@grid-net.com>
> Date:   Fri Oct 31 13:50:30 2014 -0500
> 
>     UBIFS: Add security.* XATTR support for the UBIFS
> 
> CC'ing authors/reviewers.
> 
> Brian

This is indeed a bug, and this patch looks like the right fix.  Good catch!

Reviewed-by: Ben Shelton <ben.shelton@ni.com>

Ben

> 
> > Signed-off-by: Taesoo Kim <tsgatesv@gmail.com>
> > ---
> >  fs/ubifs/dir.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> > index 0fa6c80..5b24bc4 100644
> > --- a/fs/ubifs/dir.c
> > +++ b/fs/ubifs/dir.c
> > @@ -272,7 +272,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
> > 
> >  	err = ubifs_init_security(dir, inode, &dentry->d_name);
> >  	if (err)
> > -		goto out_cancel;
> > +		goto out_inode;
> > 
> >  	mutex_lock(&dir_ui->ui_mutex);
> >  	dir->i_size += sz_change;
> > @@ -292,6 +292,7 @@ out_cancel:
> >  	dir->i_size -= sz_change;
> >  	dir_ui->ui_size = dir->i_size;
> >  	mutex_unlock(&dir_ui->ui_mutex);
> > +out_inode:
> >  	make_bad_inode(inode);
> >  	iput(inode);
> >  out_budg:
> > @@ -732,7 +733,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
> > 
> >  	err = ubifs_init_security(dir, inode, &dentry->d_name);
> >  	if (err)
> > -		goto out_cancel;
> > +		goto out_inode;
> > 
> >  	mutex_lock(&dir_ui->ui_mutex);
> >  	insert_inode_hash(inode);
> > @@ -757,6 +758,7 @@ out_cancel:
> >  	dir_ui->ui_size = dir->i_size;
> >  	drop_nlink(dir);
> >  	mutex_unlock(&dir_ui->ui_mutex);
> > +out_inode:
> >  	make_bad_inode(inode);
> >  	iput(inode);
> >  out_budg:
> > @@ -816,7 +818,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
> > 
> >  	err = ubifs_init_security(dir, inode, &dentry->d_name);
> >  	if (err)
> > -		goto out_cancel;
> > +		goto out_inode;
> > 
> >  	mutex_lock(&dir_ui->ui_mutex);
> >  	dir->i_size += sz_change;
> > @@ -836,6 +838,7 @@ out_cancel:
> >  	dir->i_size -= sz_change;
> >  	dir_ui->ui_size = dir->i_size;
> >  	mutex_unlock(&dir_ui->ui_mutex);
> > +out_inode:
> >  	make_bad_inode(inode);
> >  	iput(inode);
> >  out_budg:
> > @@ -896,7 +899,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
> > 
> >  	err = ubifs_init_security(dir, inode, &dentry->d_name);
> >  	if (err)
> > -		goto out_cancel;
> > +		goto out_inode;
> > 
> >  	mutex_lock(&dir_ui->ui_mutex);
> >  	dir->i_size += sz_change;
> > --
> > 2.3.3
> > 
