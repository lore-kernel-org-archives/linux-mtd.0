Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fk2bv-0002Te-31
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2018 07:28:57 +0000
From: Richard Weinberger <richard@nod.at>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org
Subject: Re: UBIFS question: Power-cuts after ubifs_leb_unmap()
Date: Mon, 30 Jul 2018 09:28:27 +0200
Message-ID: <3508570.fEnza5EDYF@blindfold>
In-Reply-To: <0c744441-3ebc-9d7b-7c74-70d65a85c6fd@intel.com>
References: <1756392.9dNXh6ho7o@blindfold> <2255423.z5H1mqHeVL@blindfold>
 <0c744441-3ebc-9d7b-7c74-70d65a85c6fd@intel.com>
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

Am Montag, 30. Juli 2018, 08:55:24 CEST schrieb Adrian Hunter:
> On 26/07/18 01:29, Richard Weinberger wrote:
> > Artem, Adrian,
> > 
> > Am Dienstag, 24. Juli 2018, 10:01:30 CEST schrieb Artem Bityutskiy:
> >> Hi, I looked at this quickly and talked to Adrian. I cannot solve this
> >> for you but here are some thoughts.
> > 
> > Both of your thoughts are much appreciated!
> > 
> >> On Mon, 2018-07-09 at 12:11 +0200, Richard Weinberger wrote:
> >>> Artem, Adrian,
> >>>
> >>> While playing with a new UBI/UBIFS test framework I managed to hit
> >>> this error, 
> >>> with lprops self-checks enabled:
> >>>
> >>> [ 2412.268964] UBIFS error (ubi0:0 pid 708): scan_check_cb: bad
> >>> accounting of 
> >>> LEB 11: free 0, dirty 118072 flags 0x1, should be free 126976, dirty
> >>> 0
> >>
> >> So it has 126976 - 118072 = 8904 of used space.
> >>
> > 
> > [...]
> > 
> >> 1. If you believe some specific place like the one you pointed contains
> >> a bug, then emulate a power cut in that place and try to reproduce the
> >> bug.
> >>
> >> 2. Try to focus on recovery replay, this is the main suspect. Try to
> >> figure out what is that used space in that LEB?
> > 
> > After spending the third night in a row staring at hexdumps, I think I know
> > what is going on.
> > 
> > I see that LEB 11 recently got unmapped, but the LPT still accounts 8904 bytes
> > as used.
> > To double check that value I've analyzed the index tree. To my surprise it was 
> > referencing nodes at LEB 11!
> > Summing up the length of these nodes is exactly 8904. So, the LPT is correct.
> > 
> > All nodes on LEB 11 that are referenced by the index tree are of type 
> > UBIFS_INO_NODE and have UBIFS_XATTR_FL set.
> > So, our problem is xattr related. We forget xattr inodes and the free space 
> > accounting goes nuts sooner or later.
> > 
> > Inspecting the journal gave more details. Only buds of head type BASEHD and 
> > DATAHD are present. No GCHD. Therefore GC was not interrupted.
> > With the IO transaction log from before the power-cut I was able to figure 
> > where the orphaned xattr inodes belong to.
> > And indeed, the host inode of said xattr is in the journal for deletion.
> > 
> > In theory during replay, removal of the host inode should also remove all
> > xattr inodes and we are good.
> > So the question is, why fails UBIFS to remove the xattr inodes even if we have 
> > the host inode in the journal?
> > 
> > Another round of digging though the index uncovered the problem. The 
> > UBIFS_XENT_NODE nodes for all orphaned xattr inodes sat on LEB 11.
> > This means upon replay, when UBIFS tries to locate all xattr entries
> > of the host inode, it faces the dangling branch case and the loop in 
> > ubifs_tnc_remove_ino() terminates with -ENOENT. The host inode will be 
> > removed, but the xattr inodes stay.
> > 
> > Therefore the root of the problem is that UBIFS places only the host inode 
> > into the journal upon removal of a file with xattrs and assumes that upon 
> > replay we can discover all xattr inodes. That will fail if due to GC the LEB 
> > got already unmapped.
> > 
> > As intermediate solution I suggest adding also xattr inodes to the journal
> > upon unlink. This will make unlink more expensive but for now it is IMHO ok
> > until a more sophisticated solution is found.
> > Files usually have only a few xattr, so the cost is not that bad.
> > 
> > What do you guys think? Does my analysis make sense to you?
> 
> It doesn't seem like there is a way to avoid adding more information to the
> journal upon deletion, but you probably need to cater for the possibility
> that there is a power cut while writing that information e.g. it wouldn't be
> good to remove half the xattrs but leave the rest

With grouped nodes a power-cut is okay, the bigger problem is the number of xattrs.
We support up to 2^16. Do delete an inode via journal we need UBIFS_INO_NODE_SZ bytes
in the journal.
So, in worst case we need to write 2^16 times UBIFS_INO_NODE_SZ bytes to the journal.
I'm still looking into this option right now, just to be sure that this is really the
solution to the problem I see. Finding a stable reproducer is also not easy...

Another possibility is playing with ubifs_tnc_remove_ino(), upon unlink() it removes
all entries from the TNC and marks them as dirty.
The problem is that also all xattr inodes are marked as dirty.
If we manage to find a way that these get marked only as dirty when we are sure that
they are gone the GC will no longer unmap a "used" LEB.
But that all is very tricky.

Thanks,
//richard
