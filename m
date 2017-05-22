Received: from lgeamrelo13.lge.com ([156.147.23.53])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dCx6b-0006IK-4D
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 23:51:19 +0000
Date: Tue, 23 May 2017 08:50:49 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: david@sigma-star.at, bfields@redhat.com, dedekind1@gmail.com,
 rockdotlee@gmail.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 adilger.kernel@dilger.ca, akpm@linux-foundation.org,
 marcus.folkesson@gmail.com, leon.pollak@gmail.com
Subject: Re: [PATCH 4/6] ubifs: Maintain a parent pointer
Message-ID: <20170522235049.GA22083@sebu>
References: <1495398051-4604-1-git-send-email-richard@nod.at>
 <1495398051-4604-5-git-send-email-richard@nod.at>
 <20170522043023.GA13501@sebu>
 <71c6f44e-ad49-d8b0-8e1c-cada1769a3be@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c6f44e-ad49-d8b0-8e1c-cada1769a3be@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Mon, May 22, 2017 at 10:45:08AM +0200, Richard Weinberger wrote:
> Hyunchul,
> 
> Am 22.05.2017 um 06:30 schrieb Hyunchul Lee:
> >> +	if (move)
> >> +		old_inode_ui->parent_inum = new_dir->i_ino;
> >> +
> >>  	err = ubifs_jnl_rename(c, old_dir, old_inode, &old_nm, new_dir,
> >>  			       new_inode, &new_nm, whiteout, sync);
> > 
> > I think that old_inode_ui->parent_inum could point old_dir, even though old_inode
> > is a child of new_dir. this could happen that there is power-cut before
> > old_inode is synced. so I guess that old_inode is needed to be written with
> > rename's node group in ubifs_jnl_rename. is it right?
> 
> I assumed that the journal does this already because we change old_inode->i_ctime
> in this function too.
> But checking the code showed the opposite.
> So, if we face a power-cut the rename can succeed but we lose the ctime change.
> 
> This needs to be addressed before we can add the parent pointer.

Is writing old_inode->i_ctime required? I guess that it is needed only when 
IS_SYNC(old_inode) is true, otherwise we don't need to guarantee that ctime
is synced.

> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 

Thanks,
Hyunchul
