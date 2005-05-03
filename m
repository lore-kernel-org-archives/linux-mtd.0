Received: from xena.bway.net ([216.220.96.26] helo=mail.bway.net)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DT7AB-0007IQ-N6
	for linux-mtd@lists.infradead.org; Tue, 03 May 2005 19:50:52 -0400
Message-ID: <42780E0E.9090005@bway.net>
Date: Tue, 03 May 2005 23:49:34 +0000
From: "Ryan B. Lynch" <rlynch@bway.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Speed of JFFS2 on compact flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm testing a JFFS2 filesystem on a compact flash card.  The filesystem 
is almost 1GB in size, nearly the entire flash card.

'mount' works normally, but it takes a while to finish mounting the 
device.  Some write operations, especially right after mounting, also 
take a long time.

Is this behavior normal?  I've read in the archives that larger JFFS2 
filesystems can be slow.  Has anyone else played around with a JFFS2 
filesystem this big, and if so, could you give me your impressions of 
using it?

-Ryan
