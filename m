Received: from 66.88.133.2.ptr.us.xo.net ([66.88.133.2]
	helo=xch001.azulsystems.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgF7U-0004tN-6O
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 03:21:32 +0000
Message-ID: <400363A8.6020302@azulsystems.com>
Date: Mon, 12 Jan 2004 19:19:04 -0800
From: a sun <asun@azulsystems.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: M-Sys Disk-on-Chip TSOP status with 2.6.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

what is the status of using the M-Systems' DoC TSOP with 2.6.0? i'm 
using the cvs version of docprobe.c and doc2000.c, but they still says 
that bad block table support is missing.

also, what is the status of the linux formatting utilities for the 
DoC? the m-sys website only has DOS utilities, and i didn't see any 
INFTL formatting utilities in cvs.

i'm trying to get developer documentation from the M-Systems' folks, 
but they don't quite seem to know what i want.

thanks,

-a
asun@azulsystems.com
