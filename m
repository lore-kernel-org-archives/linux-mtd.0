Received: from mail.oco.net ([216.171.163.254] helo=oco.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEvoO-0006qC-7Z
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 19:16:56 +0000
Message-ID: <3FA0119A.9020003@celerity.net>
Date: Wed, 29 Oct 2003 11:14:34 -0800
From: Chris Ellec <cellec@celerity.net>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 vs NFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


A couple years ago I developped a system wih DOC using [N]FTL and an 
ext2 file system which was working fine.

Now I have a new project where we'll use JFFS2 for reliability instead 
of ext2, but I am confused as to the relationship between JFFS2 and NFTL.

For example the help provided in the Configuration steps says that 
CONFIG_MTD_PARTITIONS is not needed for Diskonchip, however
http://www.linux-mtd.infradead.org/tech/nand.html
says that the same flag is needed for JFFS2

Does that mean that the JFFS2 driver does not use the NFTL driver ? What 
about the new chips that need the INFTL driver ?

Chris.
