Received: from web9605.mail.yahoo.com ([216.136.129.184])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BLmp-0007Yu-U3
	for <linux-mtd@lists.infradead.org>; Thu, 01 May 2003 22:40:16 +0100
Message-ID: <20030501214026.14925.qmail@web9605.mail.yahoo.com>
Date: Thu, 1 May 2003 14:40:26 -0700 (PDT)
From: Mike Kelly <mgkelly59@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Need help understanding jffs2 mount activity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I need some help understanding what occurs during
mount/bootup of a jffs2 file system. I have a target
based on the SH-3, using MontaVista Linux 2.1 with a
jffs2 root file system of 7MB. The initial bootup time
is about 75 seconds (about half of the 7MB is not
initialize, but only erased). Subsequent boots take
about 35 seconds.

I ran some tests where I copied files to fill the
filesytem, then deleted them. I rebooted and it took
about 55 seconds to boot up. Subsequent boots took
about 35 seconds. So, it appears that the blocks used
for the deleted files have been garbage collected and
erased. Is this correct?

Next we ran an operation, where a file has 65 bytes
appended to it until it reaches a size of about 700
kB. When this was completed, the bootup time increased
to 75 seconds and has not gone back down upon
subsequent reboots. So, does the garbage collection
upon mount/bootup differ between deleted files and
appended files? When a file is opened, appended, then
closed, does the jffs2 filesystem essentially copy the
file to a new location along with the new data, then
marks the old file as obsolete?

As you can tell I am a newbie at this. I apologize for
asking such simple questions, but I am trying to
understand how this works. Thank you for any help you
can give me.

(David, I apologize for the legal tagline my company
added on my previous email.)


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
