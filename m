Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZA12-0002kl-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 12:20:32 +0000
Received: from GATEKEEPER ([192.168.2.103])
	by skylab.outpostsentinel.com (8.11.2/8.11.2) with SMTP id g18DMQY32394
	for <linux-mtd@lists.infradead.org>; Fri, 8 Feb 2002 08:22:26 -0500
Message-Id: <200202081322.g18DMQY32394@skylab.outpostsentinel.com>
Date: Fri, 08 Feb 2002 07:30:11 -0500
To: linux-mtd@lists.infradead.org
From: Chris Fowler <cfowler@outpostsentinel.com>
Subject: msys/fla and load tims
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

It appears that the device I'm building has hight load averages.  Around 1.  I notice that the
msys/fla process is running with a priority of -10.  What I can not understand is what this process is doing.
I mount my flash temporarily in r/o mode to load software. I also read about 30k of data from a raw partition.  The only time the
flash is mounted r/w is during a flash.   Top shows all my processes idle.    This would be normal oreration for my system.
Could the msys process be looping or doing something not needed?


Chris
