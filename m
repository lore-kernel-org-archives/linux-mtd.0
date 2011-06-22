Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZFcb-00037t-AC
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 05:05:03 +0000
Received: by fxm14 with SMTP id 14so520486fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 22:03:13 -0700 (PDT)
MIME-Version: 1.0
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 22 Jun 2011 01:02:52 -0400
Message-ID: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
Subject: mkfs.jffs2 min erase block size: 4 vs 8 KiB
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

the current mkfs.jffs2 util has in its --eraseblock handling:
/* If it's less than 8KiB, they're not allowed */
if (erase_block_size < 0x2000) {
    fprintf(stderr, "Erase size 0x%x too small. Increasing to 8KiB minimum\n",
        erase_block_size);
    erase_block_size = 0x2000;
}

but i cant seem to find documentation on where this comes from.  it's
not uncommon to have SPI flashes with 4KiB erase sectors, and removing
this sanity check and allowing 4 KiB seems to produce an image that
works OK.

am i missing something ?  or should i send a patch to drop this check ?
-mike
