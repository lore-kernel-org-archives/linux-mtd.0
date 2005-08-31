Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAPSO-0001TV-KH
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 06:04:45 -0400
Date: Wed, 31 Aug 2005 12:04:24 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050831100424.GA19207@wohnheim.fh-wedel.de>
References: <20050830102739.GC9504@wohnheim.fh-wedel.de>
	<BAY17-F41BC3A8A470FB28B1AB03E8A10@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F41BC3A8A470FB28B1AB03E8A10@phx.gbl>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 August 2005 16:34:01 +0800, zhao forrest wrote:
> >
> Hmm...I think I don't have a very clear picture of implementation
> details. In particular I don't have a clear mind of following points:

There are two possible answers to both questions.  Let me reorder
things.

> 2 Will a new node type be introduced in order to implement 1:1 mapping?

A yes
B no

> 1 compatibility issue. Let's name the JFFS2 with 1:1 mapping support
> as "new", and the JFFS2 without 1:1 mapping as "old". So what's the
> expected behaviour of mounting "new" JFFS2 binary upon "old" JFFS2 fs
> image? What's the expected behaviour of mounting "old" JFFS2 binary 
> upon "new" JFFS2 fs image?

A Mounting a new binary with old code will always fail.
  Mounting an old binary with new code may cause data loss (see old
  mail), unless we add a compatibility mode.

B Mounting a new binary with old code will always succeed.
  Mounting an old binary with new code may cause data loss and there
  won't be a compatibility mode.

"may cause data loss" simply depends on whether people used virtual
blocks before or not.  If the fs was small enough, they had a 1:1
mapping anyway.  If they had the MTD_NO_VIRTBLOCKS set, they also had
a 1:1 mapping.  Remaining people are fscked.

Dwmw2 and myself are leaning towards answer B.  Rationale is that this
strategy will only fsck people that are already fscked.  I guess we
should still attach a BIG FAT WARNING in BOLD RED LETTERS to the
update, but at least this won't bother the majority of people.

And I don't claim to hold the ultimate truth in this matter.  A better
approach may exist.

Jörn

-- 
Rules of Optimization:
Rule 1: Don't do it.
Rule 2 (for experts only): Don't do it yet.
-- M.A. Jackson 
