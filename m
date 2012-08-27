Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T5tZU-0006Qx-0C
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 07:17:17 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: dedekind1@gmail.com
Subject: Re: UBIFS is not remounted read-only from within do_emergency_remount
Date: Mon, 27 Aug 2012 09:16:59 +0200
Message-ID: <2393671.lU8BGBJXHq@ws-stein>
In-Reply-To: <1345792970.2848.256.camel@sauron.fi.intel.com>
References: <16202485.ui8ZXcNIqe@ws-stein>
 <1345792970.2848.256.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Friday 24 August 2012 10:22:50, Artem Bityutskiy wrote:
> On Tue, 2012-07-31 at 13:24 +0200, Alexander Stein wrote:
> > upon testing do_emergency_remount from a power fail interrupt (using the 
> > workqueue of course), we noticed UBIFS is not remounted read-only afterwards.
> > The current code in do_emergency_remount checks if the kernel actually needs 
> > to remount a filesystem using the following code:
> > > if (sb->s_root && sb->s_bdev && (sb->s_flags & MS_BORN) &&
> > >     !(sb->s_flags & MS_RDONLY)) {
> > >         /*
> > >          * What lock protects sb->s_flags??
> > >          */
> > >         do_remount_sb(sb, MS_RDONLY, NULL, 1);
> > > }
> > 
> > I'm not in the details of this part of the kernel, but I suspect that sb-
> > >s_bdev is NULL for UBIFS as it has no block device, but the character device 
> > /dev/ubiX_Y instead. I have the information from a collegue that removing the 
> > check for testing purposes for sb->s_bdev mounts UBIFS read-only.
> > Any comments/ideas how to remount UBIFS as read-only from 
> > do_emergency_remount?
> 
> I think this check is there to prevent file-systems like sysfs, tmpfs,
> procfs, cgroup and debugfs from re-mounting R/O. If we just remove the
> 'sb->s_bdev' check - they all become R/O as well. For me it sounds OK,
> but I've never used this functionality, so not sure.

I agree this check filters out file system without a backing storage (block device), which is fine. It just doesn't make a difference if those are remounted R/O.
I'm just wondering how to make the emergeny_remount usable with ubifs which has a backing storage, obviously, but no block device.

Regards,
Alexander
