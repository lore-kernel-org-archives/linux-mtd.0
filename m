Received: from hs-out-0708.google.com ([64.233.178.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K2uNV-0007WF-D3
	for linux-mtd@lists.infradead.org; Sun, 01 Jun 2008 20:42:09 +0000
Received: by hs-out-0708.google.com with SMTP id k27so817320hsc.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Jun 2008 13:42:08 -0700 (PDT)
Date: Sun, 1 Jun 2008 15:41:52 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080601154152.349f5717@vader.jdub.homelinux.org>
In-Reply-To: <20080601184239.GA11135@shareable.org>
References: <20080601184239.GA11135@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 1 Jun 2008 19:42:39 +0100
Jamie Lokier <jamie@shareable.org> wrote:

> Some people developing newer flash filesystems (UBIFS, Logfs,
> FAT-over-UBI :-) and interested in flash filesystem performance might
> be interested in this slashdot comment:
> 
>     http://slashdot.org/comments.pl?sid=569439&cid=23618215

Relying on information from slashdot comments is generally considered
dumb.  Though this one surprisingly has a grain of truth :).

> They're implying that UBIFS and Logfs aren't suitable for high
> performance writes and/or large flash, and don't work well with up and
> coming flash disks either.

UBIFS, Logfs, JFFS2, and Yaffs1/2 all rely directly on the MTD layer
(ok, Logfs doesn't _require_ it per se).   That layer can't handle more
than 4GiB, so some of the newer flash _chip_ are even out of the
question.

As for the SSDs, well those aren't raw flash devices so with the
exception of perhaps Logfs none of the filesystems are really going to
be comparable.  These are really no different than the CompactFlash
cards are, in regards to the Linux flash filesystem options.  They
simply don't apply.

As for running them in embedded devices to manage raw flash, they are
likely quite good.  JFFS2 has been around forever, and tends to be
fairly stable.  UBIFS and Logfs are quite new, but I've heard good
things about both.  I have no personal experience with Yaffs.

> Also that patents may get in the way.

They tend to do that.  It's really about all they are good for.

> I've never heard of MFT before.

Nor I.

josh
