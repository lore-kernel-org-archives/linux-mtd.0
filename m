Received: from serv0.rtunet.com ([67.107.78.234])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EC6vB-0005Zn-Qa
	for linux-mtd@lists.infradead.org; Sun, 04 Sep 2005 22:41:30 -0400
From: Benny Chen <bennyc@rtunet.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1125888149.24477.32.camel@Vigor4>
Mime-Version: 1.0
Date: 05 Sep 2005 12:42:29 +1000
Content-Transfer-Encoding: 7bit
Cc: leoncamel@gmail.com
Subject: Mounting large JFFS2 causes other process to stop running!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,
I have this problem, where when I mount a large JFFS2 partition (5M),
nothing else seems to be running.  The jffs2 routines seems to have the
processor all for itself.

I did a test by running 'top' and changed it's priority to -18 and then
mount the jffs2 partition.  Even with -18 priority 'top' stops reporting
for the duration of the mount.

I am aware that JFFS2 takes a long time to mount large partitions. But
to have no process running during the mount duration is a little funny.

Hope someone can help.

Regards,
Benny Chen
