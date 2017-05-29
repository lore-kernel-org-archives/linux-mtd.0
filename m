Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFAMq-0001mp-Im
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 02:25:14 +0000
Date: Mon, 29 May 2017 11:24:44 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] ubifs: Add freeze support
Message-ID: <20170529022444.GA11814@sebu>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <20170527082338.GC32125@infradead.org>
 <20170529004346.GA10215@sebu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170529004346.GA10215@sebu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Richard.

On Mon, May 29, 2017 at 09:43:46AM +0900, Hyunchul Lee wrote:
> On Sat, May 27, 2017 at 01:23:38AM -0700, Christoph Hellwig wrote:
> > > +static int ubifs_freeze_super(struct super_block *sb)
> > > +{
> > > +	struct ubifs_info *c = sb->s_fs_info;
> > > +	int err;
> > > +
> > > +	dbg_gen("starting");
> > > +	/* freeze_super always succeeds if file system is in read-only.
> > > +	 * however if there are errors, UBIFS is switched to read-only mode.
> > > +	 * so @ro_error should be checked.
> > > +	 */
> > > +	err = freeze_super(sb);
> > > +	if (!err && c->ro_error) {
> > > +		thaw_super(sb);
> > > +		return -EIO;
> > > +	}
> > > +	return err;
> > 
> > This is just broken.  First ubifs should still properly propagate
> > the errors, and second freezing/unfreezing read only file systems is
> > perfectly valid, 
> 
> it is right.

if updating TNC is failed, ubifs might become inconsistant and be switched to 
read-only mode. for example, when ubifs_jnl_update is called to create a file, 
if inserting a znode for new inode is failed, TNC has only a znode for 
new dentry. and this can be only recoverd by replay.

is it required to fix this?

> 
> > and third the freeze_super method is a special
> > hack for gfs2 that should not gain additional users.
> 
> I thought that it was ok. because commit 48b6bca says "every filesystem
> that implements this hooks must call the vfs freeze_super ..."
> 
> Thank you for comment.
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> -- 
> 
> Thanks,
> Hyunchul

-- 

Thanks,
Hyunchul
