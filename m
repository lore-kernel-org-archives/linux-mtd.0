Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcX12-0004zQ-Pt
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 11:06:13 +0000
Date: Thu, 17 Sep 2015 13:05:47 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Jan Kara <jack@suse.cz>, viro@ZenIV.linux.org.uk, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 11/39] fs: quota: replace opened calling of ->sync_fs
 with sync_filesystem
Message-ID: <20150917110547.GB32280@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-12-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150916101402.GE13325@quack.suse.cz>
 <55FA5D8A.9030108@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55FA5D8A.9030108@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 17-09-15 14:28:26, Dongsheng Yang wrote:
> On 09/16/2015 06:14 PM, Jan Kara wrote:
> >On Tue 15-09-15 17:02:06, Dongsheng Yang wrote:
> >>There are only two places in whole kernel to call ->sync_fs directly. It
> >>will sync fs even in read-only mode. It's not a good idea and some filesystem
> >>would warn out if you are syncing in read-only mode. But sync_filesystem()
> >>does filter this case out. Let's call sync_filesystem() here instead.
> >>
> >>Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> >
> >So I'd prefer ubifs used hidden system inodes for quota files, set
> >DQUOT_QUOTA_SYS_FILE flag and so this code calling sync_fs() could be
> >completely avoided.
> 
> Hmmm, I think it's a good idea to make quota files SYS_FILEs. But how
> about quota-tools? E.g, if quotacheck do some modification
> on quota files, we would not read them without a sync_fs().
> 
> Could you help explain how quota works in this case?

So tools like quota(1) or setquota(1) work using quotactl so they don't
need access to quota files. When quota files are system files, quotacheck
functionality belongs into the fsck - so fsck.ubifs is responsible for
checking consistency of quota files. How e.g. e2fsck does it is that when
scanning inodes, it computes usage for each user / group, loads limits
information from old quota files and then just creates new quota files with
updated information if there's any difference to the old quota files.

Another advantage of the checking functionality being in fsck is that
fs-specific fsck can gather usage information much more efficiently (and
fsck has to do full fs scan anyway) and there's no need to propagate quota
usage information to userspace using FIQSIZE ioctl() and similar stuff...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
