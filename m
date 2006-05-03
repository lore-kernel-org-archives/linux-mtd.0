Received: from emc.emcraft.com ([80.240.96.158])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbFy3-0005yD-NY
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 07:56:36 -0400
Received: from emc.emcraft.com ([127.0.0.1] helo=[::1])
	by emc.emcraft.com with esmtp (Exim 4.10) id 1FbFvV-0001kT-00
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 15:53:53 +0400
From: Dmitry Bazhenov <atrey@emcraft.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 3 May 2006 15:56:37 +0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605031556.37660.atrey@emcraft.com>
Subject: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everybody!

I was just thinking about hypothetical situation with JFFS2 wich possibly 
could be met in the reality. What happens when the highest node version of a 
certain inode exceeds the maximum value?

I think this can be a point where the inode can be broken. If there are two 
data nodes which have overlapped regions and more recent node has a lesser 
value then the other node has, then, when the partition is dismounted and 
mounted again the more recent inode is treated as an older one and could be 
obsoleted. Even if it is not obsoleted, its data become superseeded by data 
from the least recent node as the last one has a higher version number.

--
Regards,
Dmitry
