Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drlhW-00053w-Hl
 for linux-mtd@lists.infradead.org; Tue, 12 Sep 2017 13:58:08 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 kernel@pengutronix.de, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 linux-ima-devel@lists.sourceforge.net
Subject: Re: [PATCH] fs: ubifs: Add i_version support
Date: Tue, 12 Sep 2017 15:57:57 +0200
Message-ID: <6751565.egDpcXuPTN@blindfold>
In-Reply-To: <20170912134616.fcy7wtsnthmw2aqs@pengutronix.de>
References: <20170912103900.8629-1-s.hauer@pengutronix.de>
 <2829618.duEmFAOaoQ@blindfold>
 <20170912134616.fcy7wtsnthmw2aqs@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha,

Am Dienstag, 12. September 2017, 15:46:16 CEST schrieb Sascha Hauer:
> On Tue, Sep 12, 2017 at 02:38:02PM +0200, Richard Weinberger wrote:
> > Sascha,
> > 
> > Am Dienstag, 12. September 2017, 12:39:00 CEST schrieb Sascha Hauer:
> > > This adds i_version support to UBIFS. The inodes i_version is used by
> > > IMA to detect changes to an inode and thus necessary to support IMA on
> > > UBIFS. The i_version is stored in the previously unused space in the
> > > UBIFS inode struct. Unlike in ext4 i_version support is unconditionally
> > > enabled in UBIFS as I saw no reason to make it optional.
> > 
> > But we need a new UBIFS feature flag to indicate that this filesystem has
> > valid i_version fields.
> 
> I assume you mean a new UBIFS_FLG_*, right?

Yes.
 
> Who should set this flag? The Kernel once the filesystem has been
> mounted with iversion support enabled? This would mean we indeed need a
> iversion mount flag to give the user a chance to continue without
> iversion support and keep the filesystem compatible with older kernels.

mkfs.ubifs or the kernel for a new default filesystem.
Isn't mounting a i_version enabled filesystem without i_version support
a bad idea since the version counters will be out of sync?

> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > > 
> > >  fs/ubifs/dir.c         | 30 +++++++++++++++++++-----------
> > >  fs/ubifs/file.c        |  5 +++++
> > >  fs/ubifs/journal.c     |  3 ++-
> > >  fs/ubifs/super.c       |  2 ++
> > >  fs/ubifs/ubifs-media.h |  3 ++-
> > >  5 files changed, 30 insertions(+), 13 deletions(-)
> > > 
> > > I did this patch exclusively to support IMA on UBIFS. IMA uses the
> > > inode's
> > > i_version field to detect changes on inodes. A proper i_version support
> > > needs to make the i_version persistent on disk, although IMA itself
> > > doesn't
> > > need a persistent i_version. Last time an earlier version of this patch
> > > 
> > > was sent by Oleksij Rempel Richard said:
> > > > What about making i_version persistent?
> > > > We still have some empty fields in UBIFS' inode data structure.
> > > > But first we have to be very sure that we need it.
> > > 
> > > This patch exactly implements this suggestion, leaving the question if
> > > we
> > > really need it. I added the IMA maintainers to Cc in the hope that Mimi
> > > or
> > > Dmitry can give a good reason why there's no alternative to i_version
> > > for
> > > IMA.
> > 
> > Yes, it would be good to know more about the user, IMA. Does IMA store the
> > version somewhere?
> 
> No. IMA solely uses i_version to detect if an inode has been changed since
> the last time it has seen this inode.
> IMA measures all files it hasn't seen before initially and stores the
> i_version in a struct integrity_iint_cache *. When an inode is written to
> next time IMA checks if the cached i_version still matches the inode's
> i_version and if it doesn't, it re-measures the inode. All this is purely
> runtime.
> 
> > Are there requirements on ordering? i.e. What if UBIFS faces a power-cut
> > and the UBIFS i_version is behind IMA's version.
> 
> Since IMA doesn't store the i_version anywhere this won't happen.
> 
> > Maybe we have to teach UBIFS to update an inode less lazy that it
> > currently
> > does...
> 
> No, I don't think so.

So, for the IMA use-case we don't even have to persist i_version.
That would be cool.

I need to read what other filesystems do, it is still not completely clear to 
me what the expected i_version semantics are. Satisfying IMA seems to be easy
but we need to be very sure to not break other futuer i_version users...

Thanks,
//richard
