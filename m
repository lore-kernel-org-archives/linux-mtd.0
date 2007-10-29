Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1Imcec-0004SQ-RV
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 18:00:21 -0400
Date: Mon, 29 Oct 2007 22:54:58 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071029215457.GB1027@lazybastard.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
	<20071029143818.GA29885@lazybastard.org>
	<20071029205125.GA27773@mail.shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071029205125.GA27773@mail.shareable.org>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Josh Boyer <jwboyer@gmail.com>, Duke <ezbonites@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 October 2007 20:51:25 +0000, Jamie Lokier wrote:
> 
> When you say "sync", do fdatasync() / fsync() on open files and
> directories flush the necessary blocks from wbuf for those
> files/directories data and their inode metadata, for JFFS2?
> 
> I have been calling sync(), but I wonder if fdatasync/fsync do as they
> are supposed to?
> 
> (If you know about other fses like LogFS/Yaffs/UBIFS that would be
> handy, too).

fsync/fdatasync should work on logfs.  If you know a good way to test
this, I'd add it to my suite of regression tests.  Right now I have to
rely on reading the code.

> Probably all are unnecessary in my specific application, as I use a
> JFFS2 with cfi_cmdset_0002, which I get the impression doesn't buffer
> any writes anyway.  But I like to get the application code right, in
> case I change to another device.

Any filesystem should follow the standards here.  Anything else is a
bug.

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
