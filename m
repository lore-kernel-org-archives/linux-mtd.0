Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K2sVt-0003xg-PO
	for linux-mtd@lists.infradead.org; Sun, 01 Jun 2008 18:42:42 +0000
Received: from jamie by mail2.shareable.org with local (Exim 4.63)
	(envelope-from <jamie@shareable.org>) id 1K2sVr-0002wa-Dz
	for linux-mtd@lists.infradead.org; Sun, 01 Jun 2008 19:42:39 +0100
Date: Sun, 1 Jun 2008 19:42:39 +0100
From: Jamie Lokier <jamie@shareable.org>
To: linux-mtd@lists.infradead.org
Subject: big flash disks?
Message-ID: <20080601184239.GA11135@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some people developing newer flash filesystems (UBIFS, Logfs,
FAT-over-UBI :-) and interested in flash filesystem performance might
be interested in this slashdot comment:

    http://slashdot.org/comments.pl?sid=569439&cid=23618215

They're implying that UBIFS and Logfs aren't suitable for high
performance writes and/or large flash, and don't work well with up and
coming flash disks either.

Also that patents may get in the way.

I've never heard of MFT before.

-- Jamie
