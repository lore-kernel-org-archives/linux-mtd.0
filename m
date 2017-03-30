Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctW6W-0000Sz-7Z
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 09:10:53 +0000
Received: by mail-lf0-x242.google.com with SMTP id v2so3974327lfi.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 02:10:32 -0700 (PDT)
Date: Thu, 30 Mar 2017 11:10:27 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, "stable
 [v4.9]" <stable@vger.kernel.org>
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
Message-ID: <20170330111027.2c807fe1@gmail.com>
In-Reply-To: <CAOQ4uxgd5OPg0YzX+PAoDAEiWDVTiScd9hkKvOPqOOGNNBO=+A@mail.gmail.com>
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <CAOQ4uxgd5OPg0YzX+PAoDAEiWDVTiScd9hkKvOPqOOGNNBO=+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Mar 2017 11:59:17 +0300
Amir Goldstein <amir73il@gmail.com> wrote:

> On Thu, Mar 30, 2017 at 11:56 AM, Richard Weinberger <richard@nod.at>
> wrote:
> > It is perfectly fine to link a tmpfile back using linkat().
> > Since tmpfiles are created with a link count of 0 they appear
> > on the orphan list, upon re-linking the inode has to be removed
> > from the orphan list again.
> >  
> 
> Looks good.

Nothing to add.

Thanks to both of you.
Ralph

> 
> > Cc: <stable@vger.kernel.org>
> > Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> > Cc: Amir Goldstein <amir73il@gmail.com  
> 
> typo: missing closing >
> 
> > Reported-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> > Tested-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> > Reported-by: Amir Goldstein <amir73il@gmail.com  
> 
> and here too
> 
> > Fixes: 474b93704f321 ("ubifs: Implement O_TMPFILE")
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> >  fs/ubifs/dir.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> > index 0858213a4e63..0139155045fe 100644
> > --- a/fs/ubifs/dir.c
> > +++ b/fs/ubifs/dir.c
> > @@ -748,6 +748,11 @@ static int ubifs_link(struct dentry
> > *old_dentry, struct inode *dir, goto out_fname;
> >
> >         lock_2_inodes(dir, inode);
> > +
> > +       /* Handle O_TMPFILE corner case, it is allowed to link a
> > O_TMPFILE. */
> > +       if (inode->i_nlink == 0)
> > +               ubifs_delete_orphan(c, inode->i_ino);
> > +
> >         inc_nlink(inode);
> >         ihold(inode);
> >         inode->i_ctime = ubifs_current_time(inode);
> > --
> > 2.7.3
> >  
