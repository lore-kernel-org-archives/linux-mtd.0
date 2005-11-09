Received: from web51005.mail.yahoo.com ([206.190.38.136])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZw1A-0002Tc-Ix
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 14:54:08 -0500
Message-ID: <20051109195358.91202.qmail@web51005.mail.yahoo.com>
Date: Wed, 9 Nov 2005 11:53:57 -0800 (PST)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: How to read the data from an offset on NAND falsh
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
 I know that by using the nanddump and jffs2dump I can
find the location of the Inode, and Dirent on the NAND
flash. Is there any utility available that could be
used to read the content of the Inode from an offset
on the NAND flash(I know that the mtd_debug could be
used to fetch the data, but the data is compressed)?

Regards,
--vahid


		
__________________________________ 
Yahoo! FareChase: Search multiple travel sites in one click.
http://farechase.yahoo.com
