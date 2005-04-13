Received: from kecgate03.infosys.com ([220.227.179.21])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DLZD0-0003MQ-RS
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 00:10:37 -0400
From: Bharat Joshi <bharat_joshi@infosys.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Apr 2005 09:39:06 +0530
Message-Id: <1113365346.25515.11.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: Triggering Garbage Collection
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

   With JFFS2, to avoid a deadlock, we must have at least
2 or more erase blocks available when garbage collection
thread is triggered.

   Just wanted to know if there is any algorithm which can
be used to trigger Garbage Collection and do it with only
one erase block kept for garbage collection.

   This was mentioned as one of the improvements in JFFS2
pdf document. So are we looking at it in JFFS3?

Thanks & Regards,
Bharat
-- 
Bharat Joshi <bharat_joshi@infosys.com>
Infosys Technologies Ltd
www.infosys.com
