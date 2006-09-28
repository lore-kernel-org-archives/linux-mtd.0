Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GSpkx-0007da-Mn
	for linux-mtd@lists.infradead.org; Thu, 28 Sep 2006 07:52:28 +0100
From: Neil Brown <neilb@suse.de>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 28 Sep 2006 16:50:57 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17691.28881.23347.92421@cse.unsw.edu.au>
Subject: Re: Exporting jffs2 by nfs with kernel 2.6
In-Reply-To: message from David Woodhouse on Thursday September 28
References: <305035a40609270731n150513b4obe4249b461a3d1bc@mail.gmail.com>
	<1159425799.3309.168.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, Gregory CLEMENT <gclement00@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday September 28, dwmw2@infradead.org wrote:
> On Wed, 2006-09-27 at 16:31 +0200, Gregory CLEMENT wrote:
> > Hi all,
> > 
> > On 2.4.18 we managed to export a jffs2 filesystem by nfs.
> > Now on 2.6.16 we can't.
> > I found 2 problems for it:
> > First, changed was made in nfs, and now they test if
> > s_export_op is not a void pointer. By dding a pointer on
> > this structure (even this structure is void) makes nfs happy.
> 
> > If the structure is void nfs use generic function, so for this part
> > I think it's ok
> 
> Hm, OK. What are the implications of providing _none_ of our own
> functions and just using the defaults? Shouldn't we provide at least a
> get_parent() function?

Yes.  You need a get_parent function.
Minimally it can just return -ESTALE, but that can propagate out to
the client if your dcache gets flushed or you reboot.  It is best to
do it properly, and shouldn't be too hard (providing your directories
actually have a ".." or equivalent).

> 
> By do we need that anyway? I thought we used to just have disconnected
> dentries until we happen to find their place in the tree, at which point
> we connect them.

Disconnected dentries are fine for files, but not for directories.
For directories, the VFS invariants really require a full path down
from the root to be in the dcache.

> 
> > Second, nfs need to identify the filesystem to export. It is done
> > either by the device of the filesystem or by a "fsid". I didfn't see any
> > filesystem use a "fsid" and I don't know how to use it. So identification
> > is made if FS_REQUIRES_DEV is set. The problem was in kernel 2.5.7,
> > this flag was removed because "We never really used the block device anyway".
> > Do you mind setting this flag again? Or have you a better idea?
> 
> I suspect that we should add another export_ops function for get_fsid().

Possibly.  but the normal approach with none-FS_REQUIRES_DEV
filesystems is to specify an fsid= in /etc/exports.

NeilBrown
