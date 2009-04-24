Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxNRE-0004tc-BY
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 15:35:47 +0000
Date: Fri, 24 Apr 2009 16:35:35 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Miles Nordin <carton@Ivy.NET>
Subject: Re: mtdblock caching and syncing
Message-ID: <20090424153535.GH9307@shareable.org>
References: <20090409141556.GG15952@nortel.com>
	<20090409145100.GB7538@yoda.jdub.homelinux.org>
	<20090409160247.GI15952@nortel.com>
	<oqws9bs022.fsf@castrovalva.Ivy.NET>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oqws9bs022.fsf@castrovalva.Ivy.NET>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Miles Nordin wrote:
> >>>>> "dg" == Doug Graham <dgraham@nortel.com> writes:
> 
>     dg> I would assume that [hard drives] don't leave dirty data in
>     dg> their cache for an unbounded period of time.
> 
> ZFS always, ext3 mounted with barrier=1 (or by default in SLES only)
> and only when not using LVM2, and HFS+ on Mac OS X when using their
> bullshit fcntl F_FULLSYNC API, all at least claim to issue SYNC CACHE
> commands to the drives and wait for the drive to write to platter.
> It's also possible for people who care to turn off the write cache in
> their drives.  For drives connected to RAID controllers that have a
> battery-backed write cache, I've hard of database-oriented sysadmins
> who actually do this as a best-practice not a freak experiment---in
> general, at least for SCSI drives, DBA's are likely to be aware of and
> control their drives' write cache settings.  There is some FUD about
> drives existing that ignore the SYNC CACHE command (but not SCSI
> drives), but so far the people I've seen spreading this FUD refuse to
> name the specific drives, so they are likely to be really old drives,
> or even just made-up excuses from developers of buggy filesystems and
> block layers.

Yes, that is all true.

> Anyway, the point is, mtdblock is behind the curve here, yes.

> and for hard drive-backed filesystems the situation will probably
> get even better soon.

There's a lot of discussion about fsync and barriers recently, so yes.
Same for SSDs.

> And finally, devices which use FLASH tend to get their cords yanked
> more often so IMHO it matters.

That is the single most important reason!

-- Jamie
