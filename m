Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CFrQQ-0007VW-3e
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 05:52:35 -0400
Date: Fri, 8 Oct 2004 11:52:23 +0200
From: Lorenzo PARISI <lorenzo.parisi@st.com>
To: YAFFS mailing list <yaffs@stoneboat.aleph1.co.uk>,
	MTD mailing list <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Message-Id: <83197f15.8bfe70e2.81c1800@mail1.agr.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Benchmark errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

when I benchmark the NAND with Bonnie++, I receive many 
errors:

nand_write_oob: Failed write verify, page 0x0....
     :                  :                :
     :                  :                :

and Bonnie++ end with this messages:

Bonnie: drastic I/O error (rmdir): Directory not empty
Cleaning up test directory after error
Bonnie: drastic I/O error (rmdir): No such file or directory

Initially, I thinked that a problem of Bonnie++, but if I 
run Bonnie++ on a NAND with JFFS2, I don't receive any 
errors.

Why?

Thanks.
