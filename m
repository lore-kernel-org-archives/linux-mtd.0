Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GAOVN-0000ar-UA
	for linux-mtd@lists.infradead.org; Tue, 08 Aug 2006 06:08:18 -0400
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J3O007D9C5EXW@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 08 Aug 2006 19:08:03 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0J3O00M5NC5E4K@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 08 Aug 2006 19:08:02 +0900 (KST)
Date: Tue, 08 Aug 2006 19:08:18 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: JFFS2 file address space  operation
To: linux-mtd@lists.infradead.org
Message-id: <001d01c6bad2$928c8920$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

I find mmap operation for file failed in JFFS2, I find Jffs2 does not
support writepage in JFFS2 file address operation .I would like to know
reason for not supporting writepage operation for file address operation.
,
struct address_space_operations jffs2_file_address_operations =
{
        .readpage =     jffs2_readpage,
        .prepare_write =jffs2_prepare_write,
        .commit_write = jffs2_commit_write
};


Thanks
Amit
