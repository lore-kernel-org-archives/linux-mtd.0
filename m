Received: from bosmailout20.eigbox.net ([66.96.187.20])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEruM-0006jP-Qe
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 23:43:07 +0000
Received: from bosmailscan03.eigbox.net ([10.20.15.3])
	by bosmailout20.eigbox.net with esmtp (Exim) id 1QEruL-0007Kh-6a
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 19:43:05 -0400
Received: from bosimpout02.eigbox.net ([10.20.55.2])
	by bosmailscan03.eigbox.net with esmtp (Exim) id 1QEruK-0002jg-UN
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 19:43:04 -0400
Received: from wsip-98-189-25-196.oc.oc.cox.net ([98.189.25.196] helo=UmarPC)
	by bosauthsmtp07.eigbox.net with esmtpa (Exim) id 1QEruK-0000nG-D8
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 19:43:04 -0400
From: "Umar Qureshey" <umar@janteq.com>
To: <linux-mtd@lists.infradead.org>
Subject: Discovering current MTD partition
Date: Tue, 26 Apr 2011 16:43:03 -0700
Message-ID: <000201cc046b$b03a6310$10af2930$@janteq.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Sender: "Umar Qureshey" <umar@janteq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I searched this list's archive but did not see anything pertinent.

I was wondering if there is a way to find out what the currently active mtd
partition is.  In my system, I have a few flash partitions for my file
system and the kernel boots with the partition that is specified on the
kernel command line.  Aside from scanning /proc/cmdline, is there a way to
programmatically ascertain which mtd partition is active *now*.  
I need to find this information within a Python script but really if it can
be done in C (perhaps a syscall?), it's all I need.

Regards,
Umar
