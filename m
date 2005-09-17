Received: from xproxy.gmail.com ([66.249.82.196])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EGe6W-0007Do-2s
	for linux-mtd@lists.infradead.org; Sat, 17 Sep 2005 10:56:01 -0400
Received: by xproxy.gmail.com with SMTP id i30so361940wxd
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Sep 2005 07:55:46 -0700 (PDT)
Message-ID: <432C2E6C.6050400@gmail.com>
Date: Sat, 17 Sep 2005 10:55:40 -0400
From: "David A. Braun" <braunster@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Command line parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there any particular reason parse_cmdline_partitions() in 
drivers/mtd/cmdlineparse.c doesn't completely setup the partition 
table(s) it builds? It fails to initialize the offsets and sizes of any 
partition tabled unless it is the one named by "master". This one has 
the offsets and lengths filled in but the others are left zero with the 
exception of partitions specified with "-" or SIZE_REMAINING. I would 
have expected all partitions described in the cmdline to be initialized 
if any are.

Dave Braun
