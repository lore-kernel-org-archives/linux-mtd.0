Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPc8C-0005yb-JK
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 16:10:21 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SPc7v-0006Zz-Kl
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 18:10:03 +0200
Received: from dsl.comtrol.com ([64.122.56.22])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 18:10:03 +0200
Received: from grant.b.edwards by dsl.comtrol.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 18:10:03 +0200
To: linux-mtd@lists.infradead.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Question about mkfs.jffs2 "-s" option
Date: Wed, 2 May 2012 16:08:38 +0000 (UTC)
Message-ID: <jnrm65$im4$1@dough.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[apologies if this isn't the right forum for mkfs.jffs2 questions]

According the the mkfs.jffs2 man page (from mtd-utils 1.4.8):

  -s, --pagesize=SIZE
  
     Use page size SIZE.  The default is 4 KiB.  This size is the
     maximum size of a data node.

I'm using NAND flash with an erase size of 128K.

I've got a directory tree with 68 files. A few are largish (100KB),
but most of them small (a few hundred bytes or less).  They contain a
total of 680K bytes of data and take up 900K of space on an ext2
filesystem.

When I do a "mkfs.jffs2 -e128 -l -n" I get a jffs2 image with a size
of 300K.  That seems reasonable.

If I specify a page size of 4K (which according to the man page is the
default) by doing "mkfs.jffs2 -e128 -s4KiB -n -l", I get a jffs2 image
with a size of 12MB.

According to the man page the default page size is 4K, so specifying a
page size of 4K shouldn't change anything, right?

Why does specifying a page size of 4K make the jffs2 image 40X larger?

The NAND flash I'm using has to be written in 4K blocks -- isn't that
the "page size"?

-- 
Grant Edwards               grant.b.edwards        Yow! Either CONFESS now or
                                  at               we go to "PEOPLE'S COURT"!!
                              gmail.com            
