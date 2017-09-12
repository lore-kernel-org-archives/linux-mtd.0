Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drlWR-0001Nw-Kh
 for linux-mtd@lists.infradead.org; Tue, 12 Sep 2017 13:46:41 +0000
Date: Tue, 12 Sep 2017 15:46:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 kernel@pengutronix.de, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 linux-ima-devel@lists.sourceforge.net
Subject: Re: [PATCH] fs: ubifs: Add i_version support
Message-ID: <20170912134616.fcy7wtsnthmw2aqs@pengutronix.de>
References: <20170912103900.8629-1-s.hauer@pengutronix.de>
 <2829618.duEmFAOaoQ@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2829618.duEmFAOaoQ@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 12, 2017 at 02:38:02PM +0200, Richard Weinberger wrote:
> Sascha,
> 
> Am Dienstag, 12. September 2017, 12:39:00 CEST schrieb Sascha Hauer:
> > This adds i_version support to UBIFS. The inodes i_version is used by
> > IMA to detect changes to an inode and thus necessary to support IMA on
> > UBIFS. The i_version is stored in the previously unused space in the
> > UBIFS inode struct. Unlike in ext4 i_version support is unconditionally
> > enabled in UBIFS as I saw no reason to make it optional.
> 
> But we need a new UBIFS feature flag to indicate that this filesystem has 
> valid i_version fields.

I assume you mean a new UBIFS_FLG_*, right?

Who should set this flag? The Kernel once the filesystem has been
mounted with iversion support enabled? This would mean we indeed need a
iversion mount flag to give the user a chance to continue without
iversion support and keep the filesystem compatible with older kernels.

> 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  fs/ubifs/dir.c         | 30 +++++++++++++++++++-----------
> >  fs/ubifs/file.c        |  5 +++++
> >  fs/ubifs/journal.c     |  3 ++-
> >  fs/ubifs/super.c       |  2 ++
> >  fs/ubifs/ubifs-media.h |  3 ++-
> >  5 files changed, 30 insertions(+), 13 deletions(-)
> > 
> > I did this patch exclusively to support IMA on UBIFS. IMA uses the inode's
> > i_version field to detect changes on inodes. A proper i_version support
> > needs to make the i_version persistent on disk, although IMA itself doesn't
> > need a persistent i_version. Last time an earlier version of this patch
> > 
> > was sent by Oleksij Rempel Richard said:
> > > What about making i_version persistent?
> > > We still have some empty fields in UBIFS' inode data structure.
> > > But first we have to be very sure that we need it.
> > 
> > This patch exactly implements this suggestion, leaving the question if we
> > really need it. I added the IMA maintainers to Cc in the hope that Mimi or
> > Dmitry can give a good reason why there's no alternative to i_version for
> > IMA.
> 
> Yes, it would be good to know more about the user, IMA. Does IMA store the 
> version somewhere?

No. IMA solely uses i_version to detect if an inode has been changed since
the last time it has seen this inode.
IMA measures all files it hasn't seen before initially and stores the i_version
in a struct integrity_iint_cache *. When an inode is written to next time IMA
checks if the cached i_version still matches the inode's i_version and if it
doesn't, it re-measures the inode. All this is purely runtime.

> Are there requirements on ordering? i.e. What if UBIFS faces a power-cut
> and the UBIFS i_version is behind IMA's version.

Since IMA doesn't store the i_version anywhere this won't happen.

> Maybe we have to teach UBIFS to update an inode less lazy that it currently 
> does...

No, I don't think so.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
