Received: from [207.158.103.130] (helo=linux.local)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uMUz-00045u-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 23:50:33 +0100
Received: from vhbtech.com ([127.0.0.1])
	by linux.local (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id f3UM39E05844
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 17:03:09 -0500
Message-ID: <3AEDE11C.94AC9A22@vhbtech.com>
Date: Mon, 30 Apr 2001 17:03:08 -0500
From: Jeff Smith <jsmith@vhbtech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 Problem
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Thanks to anyone who might offer some help for my problem.

I'm running jffs2 on a PPC/855T board. I mount the jffs2 and have
two (2) test scripts that "dd" various sized files to the jffs2 flash.
I seem to be running into a race condition or something.

My 2 scripts just "dd" a bunch of files to the jffs2/flash, "ls -l "
them,
"rm *" them and then "ls -l" the dir/mnt point again in a loop. I'm
running
2 of these and they always reach contention fairly quickly, ie.
they lock up after 5 to 10 iterations. ps shows the processes sleeping.
If I remove the "ls"portion of the scripts. That is I just "dd" and "rm"
-
everything "seems" ok.Anybody seen this?


Thanks Jeff
