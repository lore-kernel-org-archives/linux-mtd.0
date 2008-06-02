Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K38dm-0007YQ-1Q
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 11:55:54 +0000
Date: Mon, 2 Jun 2008 13:55:38 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080602115538.GC21359@logfs.org>
References: <20080601184239.GA11135@shareable.org>
	<1212386359.31023.154.camel@sauron>
	<20080602082346.GB20259@logfs.org>
	<20080602104330.GD31032@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602104330.GD31032@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2008 11:43:30 +0100, Jamie Lokier wrote:
> 
> I'm surprised.
> What sort of format change does SSD require, relative to NOR/NAND flash?

Flash allows one to do partial writes to blocks.  SSDs generally don't.
Logfs currently does partial writes for atomic transactions, to make
creat(), unlink(), rename() and friends behave well.  Depending on your
SSD a simple creat() can blow up to writing several megabytes on the
actual medium.

I never claimed to actually like those suckers. ;)

> For SSD I would like to see a filesystem that combines the best
> characteristics of btrfs and logfs - the are enough similarities
> between them.

True.  Right now I think it is a better idea to keep the two seperate.
But in the future a combination would be rather useful.

Jörn

-- 
Fantasy is more important than knowledge. Knowledge is limited,
while fantasy embraces the whole world.
-- Albert Einstein
