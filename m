Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3mRj-0006TO-2v
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 06:26:07 +0000
Date: Wed, 4 Jun 2008 08:25:57 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080604062557.GB6492@logfs.org>
References: <20080601184239.GA11135@shareable.org>
	<1212386359.31023.154.camel@sauron>
	<20080602082346.GB20259@logfs.org>
	<20080602104330.GD31032@shareable.org>
	<20080602115538.GC21359@logfs.org>
	<20080602123217.GA2679@shareable.org>
	<20080603180944.GE1224@logfs.org>
	<20080603184428.GA6899@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080603184428.GA6899@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 June 2008 19:44:29 +0100, Jamie Lokier wrote:
> 
> But he quites a high write IOP rate, which is sometimes taken to mean
> a high rate of database commits (e.g. fsync).  That can't be done with
> eraseblock-sized writes.

I don't remember reading the words 'commit' or 'sync' in any of his
posts. ;)

> If it's not high commit rate, then the quoted IOP rate is misleading
> because you can do the same reordering thing with hard disks to get a
> high write rate.  (Albeit hard disks suffer from random reads more if
> ordering writes disorders reads).
> 
> If you think it's just reordering, not committing each 4k write one
> after the other quickly, I'll ask him about it.

At least on some of the cheaper SSDs I believe the only way to commit a
write is by writing the whole eraseblock.  And if you don't explicitly
request that, the SSD will do it for you.  Either way you take the
performance hit.

Alternatively he could walk up the tree for commits and store all higher
layers in the same eraseblock.  16k would be enough for a commit on
disks up to 512G in size, 20k up to 256T.  On real flash that simply
won't fly, as GC will cause a deadlock sooner or later.  With an SSD you
can still get away with it, as 4k writes without erases are slow, but at
least possible.

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
