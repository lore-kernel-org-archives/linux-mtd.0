Received: from co203.xi-lite.net ([149.6.83.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfxS7-0005oA-36
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 14:56:55 +0000
Message-ID: <4A93FBAC.6010701@parrot.com>
Date: Tue, 25 Aug 2009 16:56:44 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Ivan Li <lijinlei1@163.com>
Subject: Re: Error creating FAT32 over Nand flash
References: <6CF41D77BA9F4BC5856D0031BA902A85@ivan>
	<D6830EA55F9F4A9FBCD742B09BE98D9F@ivan>
In-Reply-To: <D6830EA55F9F4A9FBCD742B09BE98D9F@ivan>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ivan Li a écrit :
> Some progress for it: I found the sector number mentioned in error message resides in BAD block.
> Is there any fix for that?
Use an FTL or mount FAT in loop mode over a file in a fs understanding
NAND (ubifs, jffs2, ...).


Matthieu
