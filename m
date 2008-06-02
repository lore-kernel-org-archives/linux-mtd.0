Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K39D7-0001I1-8B
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 12:32:25 +0000
Date: Mon, 2 Jun 2008 13:32:18 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: big flash disks?
Message-ID: <20080602123217.GA2679@shareable.org>
References: <20080601184239.GA11135@shareable.org>
	<1212386359.31023.154.camel@sauron>
	<20080602082346.GB20259@logfs.org>
	<20080602104330.GD31032@shareable.org>
	<20080602115538.GC21359@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602115538.GC21359@logfs.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> Flash allows one to do partial writes to blocks.  SSDs generally don't.
> Logfs currently does partial writes for atomic transactions, to make
> creat(), unlink(), rename() and friends behave well.  Depending on your
> SSD a simple creat() can blow up to writing several megabytes on the
> actual medium.

It's a good argument for delaying writes, and committing only the
minimum necessary on fsync/fdatasync/sync_file_range.

According to the slashdot comment which started this thread :-) they
do 4k log writes to large SSDs - and then report a very high write IOP
rate for database applications.  It's the high write rate which is
their selling point: price per GB is ridiculous.  So I'm inclined to
believe they do actually get the claimed write rate under some
circumstances.

If they can do 4k writes, and you cannot, it sounds like the SSDs you
have used are very different to the SSDs they have used.  Is that
right?  If so, we need to keep an open mind about the different kinds
of SSD that are becoming available under that name.

-- Jamie
