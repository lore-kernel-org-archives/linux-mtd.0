Received: from antispam02.maximintegrated.com ([205.153.101.183])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjoVN-0006oK-CI
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2015 13:11:37 +0000
Received: from maxdalex01.maxim-ic.internal (maxdalex01.maxim-ic.internal
 [10.16.15.101]) by antispam02.maximintegrated.com with ESMTP id
 neIKPsVxrKeBq9Lq for <linux-mtd@lists.infradead.org>;
 Wed, 07 Oct 2015 08:11:12 -0500 (CDT)
From: Brian Foster <brian.foster@maximintegrated.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [Q] What is struct mtd_partition.ecclayout & who uses it?
Date: Wed, 7 Oct 2015 15:11:07 +0200
Message-ID: <1893578.doJlQXXNMH@laclwks004>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  In `struct mtd_partition' there is an undocumented field
  `.ecclayout' which (modulo a name/type change) has existed since
  Linus's original GIT commit 1da177e4c3f4 ("Linux-2.6.12-rc2").

  However, with one trivial exception, I can_NOT_ find any users
  of this field.  The exception is it is initialized to NULL in
  mtd_add_partition().

  Indeed, a trial build (of v3.10 for my system) with that field
  and its one known usage /*commented-out*/ succeeded, proving
  that *IF* it is used at all, it's probably by some specific
  NAND(-controller?) driver(s?).

  Any idea which one(s?)?

  Offhand, this looks like a long-dead something, with the only
  clew being the comment (in <linux/mtd/partitions.h>):

     /* out of band layout for this partition (NAND only) */

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
