Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkcCV-0005F4-TX
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2018 21:29:05 +0000
From: Richard Weinberger <richard@nod.at>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org
Subject: Re: UBIFS question: Power-cuts after ubifs_leb_unmap()
Date: Tue, 31 Jul 2018 23:28:50 +0200
Message-ID: <4560343.Ej1RjlWijI@blindfold>
In-Reply-To: <086b1694-a182-5873-a4c2-c754d8bf3cda@intel.com>
References: <1756392.9dNXh6ho7o@blindfold> <3508570.fEnza5EDYF@blindfold>
 <086b1694-a182-5873-a4c2-c754d8bf3cda@intel.com>
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

Am Montag, 30. Juli 2018, 10:07:25 CEST schrieb Adrian Hunter:
> > With grouped nodes a power-cut is okay, the bigger problem is the number of xattrs.
> > We support up to 2^16. Do delete an inode via journal we need UBIFS_INO_NODE_SZ bytes
> > in the journal.
> > So, in worst case we need to write 2^16 times UBIFS_INO_NODE_SZ bytes to the journal.
> > I'm still looking into this option right now, just to be sure that this is really the
> > solution to the problem I see. Finding a stable reproducer is also not easy...
> > 
> > Another possibility is playing with ubifs_tnc_remove_ino(), upon unlink() it removes
> > all entries from the TNC and marks them as dirty.
> > The problem is that also all xattr inodes are marked as dirty.
> > If we manage to find a way that these get marked only as dirty when we are sure that
> > they are gone the GC will no longer unmap a "used" LEB.
> > But that all is very tricky.
> 
> What about: add the inode to be deleted to orphans, then delete the xattrs
> one at a time, then when they are all gone, delete the inode and remove it
> from orphans.

Hmm, deleting one at a time still means that UBIFS has to write up to 2^16 times
to the journal.
But I agree this approach is better than allocating space for 2^16 inodes at once
in the journal.
Using the orphan list we can make sure that deletion still is atomic.

Thanks,
//richard
