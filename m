Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiSHv-00080u-GE
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 22:29:45 +0000
From: Richard Weinberger <richard@nod.at>
To: artem.bityutskiy@linux.intel.com
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS question: Power-cuts after ubifs_leb_unmap()
Date: Thu, 26 Jul 2018 00:29:20 +0200
Message-ID: <2255423.z5H1mqHeVL@blindfold>
In-Reply-To: <1532419290.469.452.camel@linux.intel.com>
References: <1756392.9dNXh6ho7o@blindfold>
 <1532419290.469.452.camel@linux.intel.com>
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

Artem, Adrian,

Am Dienstag, 24. Juli 2018, 10:01:30 CEST schrieb Artem Bityutskiy:
> Hi, I looked at this quickly and talked to Adrian. I cannot solve this
> for you but here are some thoughts.

Both of your thoughts are much appreciated!

> On Mon, 2018-07-09 at 12:11 +0200, Richard Weinberger wrote:
> > Artem, Adrian,
> > 
> > While playing with a new UBI/UBIFS test framework I managed to hit
> > this error, 
> > with lprops self-checks enabled:
> > 
> > [ 2412.268964] UBIFS error (ubi0:0 pid 708): scan_check_cb: bad
> > accounting of 
> > LEB 11: free 0, dirty 118072 flags 0x1, should be free 126976, dirty
> > 0
> 
> So it has 126976 - 118072 = 8904 of used space.
> 

[...]

> 1. If you believe some specific place like the one you pointed contains
> a bug, then emulate a power cut in that place and try to reproduce the
> bug.
> 
> 2. Try to focus on recovery replay, this is the main suspect. Try to
> figure out what is that used space in that LEB?

After spending the third night in a row staring at hexdumps, I think I know
what is going on.

I see that LEB 11 recently got unmapped, but the LPT still accounts 8904 bytes
as used.
To double check that value I've analyzed the index tree. To my surprise it was 
referencing nodes at LEB 11!
Summing up the length of these nodes is exactly 8904. So, the LPT is correct.

All nodes on LEB 11 that are referenced by the index tree are of type 
UBIFS_INO_NODE and have UBIFS_XATTR_FL set.
So, our problem is xattr related. We forget xattr inodes and the free space 
accounting goes nuts sooner or later.

Inspecting the journal gave more details. Only buds of head type BASEHD and 
DATAHD are present. No GCHD. Therefore GC was not interrupted.
With the IO transaction log from before the power-cut I was able to figure 
where the orphaned xattr inodes belong to.
And indeed, the host inode of said xattr is in the journal for deletion.

In theory during replay, removal of the host inode should also remove all
xattr inodes and we are good.
So the question is, why fails UBIFS to remove the xattr inodes even if we have 
the host inode in the journal?

Another round of digging though the index uncovered the problem. The 
UBIFS_XENT_NODE nodes for all orphaned xattr inodes sat on LEB 11.
This means upon replay, when UBIFS tries to locate all xattr entries
of the host inode, it faces the dangling branch case and the loop in 
ubifs_tnc_remove_ino() terminates with -ENOENT. The host inode will be 
removed, but the xattr inodes stay.

Therefore the root of the problem is that UBIFS places only the host inode 
into the journal upon removal of a file with xattrs and assumes that upon 
replay we can discover all xattr inodes. That will fail if due to GC the LEB 
got already unmapped.

As intermediate solution I suggest adding also xattr inodes to the journal
upon unlink. This will make unlink more expensive but for now it is IMHO ok
until a more sophisticated solution is found.
Files usually have only a few xattr, so the cost is not that bad.

What do you guys think? Does my analysis make sense to you?

Thanks,
//richard
