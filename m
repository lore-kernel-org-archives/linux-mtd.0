Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hvgI-0000Yz-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2002 16:51:22 +0000
Message-Id: <200203041752.g24Hqk815453@skylab.outpostsentinel.com>
Date: Mon, 04 Mar 2002 12:01:22 -0500
To: americas-techsupport@m-sys.com
CC: linux-mtd@lists.infradead.org
From: Chris Fowler <cfowler@outpostsentinel.com>
Subject: msys process
Reply-To: cfowler@outpostsentinel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Under Linux I have a process running.   msys/fla.

This process seems to keep my load averages around 1.    When I do not have the driver loaded my laod averages are 0.06.  Since I mount my flash as ro to load software and only read  a raw partition
for configuration informatin, I have to wonder my my load averages are *so* high with this process.

1) What is it doing?

2) How can I stop it?

3) Why is is consuming so many resources for a little task?


Thanks,
Chris
