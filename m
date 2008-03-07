Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXgn1-0001Ej-7h
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 17:55:27 +0000
Date: Fri, 07 Mar 2008 09:55:13 -0800
Subject: Creating an Empty JFFS2 File System
From: Grant Erickson <gerickson@nuovations.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <C3F6C181.DD74%gerickson@nuovations.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is creating an empty JFFS2 file system supported or is this a deprecated
capability? The following steps seem to be incorrect or failing:

    # flash_eraseall -q -j /dev/mtd9
    # mount -t jffs2 /dev/mtdblock9 /mnt
    Cowardly refusing to erase blocks on filesystem with no valid JFFS2
    nodes
    empty_blocks 0, bad_blocks 0, c->nr_blocks 3840

Or, is the only way to accomplish this to create a NULL JFFS2 image with
mkfs.jffs2 and then nandwrite it?

Regards,

Grant
