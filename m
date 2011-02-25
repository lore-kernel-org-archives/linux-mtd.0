Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PslkJ-0008R1-Tt
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 00:41:24 +0000
Received: by wwb29 with SMTP id 29so1038921wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Feb 2011 16:41:20 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 24 Feb 2011 18:41:20 -0600
Message-ID: <AANLkTimN5eBifpcyfJYo9s51U+kEi1ZemFnOm7p2rcxQ@mail.gmail.com>
Subject: Slab memory leak in JFFS2 filesystems
From: Johns Daniel <johns.daniel@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have discovered a kernel memory leak associated with JFFS2
filesystems. I have verified the leak in kernels 2.6.28 and 2.6.36 on
a Freescale PowerPC board using this script:

while :; do FN=$(mktemp /jffs2fs/TMP.XXXXXXXX); \
   cat /proc/slabinfo |grep "dentry\|size-64 "; sleep 1; /bin/rm $FN; done

The "dentry" and "size-64" slabs grow continuously with this script --
and the memory is not reclaimed even after the script is stopped.

Basically, JFFS2 does not do a complete slab cleanup when a file is
deleted. If the old filename is reused, you don't notice the leak
because it is very small. However, if you use a new filename each
time, the memory leak is pretty obvious.

Is this a JFFS2 feature or is this a bug?
If it is a bug, does anybody have a fix for it?

-- Johns
