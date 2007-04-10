Received: from mga09.intel.com ([134.134.136.24])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HbJbV-0004si-Tf
	for linux-mtd@lists.infradead.org; Tue, 10 Apr 2007 12:54:03 -0400
Message-ID: <461BC120.2080507@intel.com>
Date: Tue, 10 Apr 2007 20:53:52 +0400
From: akorolev <alexey.korolev@intel.com>
MIME-Version: 1.0
To: havasi@inf.u-szeged.hu
Subject: Centralized summary as a way to speed up "ls" time
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ferenc,

While using JFFS2 on NAND devices with large size and many files I faced 
the problem of very slow "ls" performance.
On folder which contains ~40 files and ~80MB ls could take ~25sec!

I'm thinking of the way to resolve somehow this issue.
Reasons of the very slow performance are more or less clean - JFFS2 
scans NAND to fill jffs2_node_frag and jffs2_full_dnode structures.
After first call of ls on some dir this data will be filled and next 
call will work fast.
If we have few RAM cache may be released and next ls will take long.

The question I have will it be possible to extend a little bit 
functionality of Centralized Summary to story these nodes as well.
Do you see any technical issues here?

IMHO if it is possible it make sense, because it will load node info 
into RAM for the most used data. So for most used data we will have 
preloaded node info fast  "ls" just after mount.

Do you have any updates of CS? Is the last version of CS placed here 
www.inf.u-szeged.hu/jffs2/mount.php?

Thanks,
Alexey
