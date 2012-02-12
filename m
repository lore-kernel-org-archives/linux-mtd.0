Received: from qmta09.emeryville.ca.mail.comcast.net ([76.96.30.96])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rwf23-0000r2-8x
 for linux-mtd@lists.infradead.org; Sun, 12 Feb 2012 19:24:20 +0000
Date: Sun, 12 Feb 2012 19:24:15 +0000 (UTC)
From: geraldwalden@comcast.net
To: linux-mtd@lists.infradead.org
Message-ID: <34947543.926600.1329074655188.JavaMail.root@sz0162a.emeryville.ca.mail.comcast.net>
Subject: JFFS2 : non-existent inode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello:

Environment : Arm7 custom SBC, linux-2.6.26 

On a select number of our units (in the field) we observe the message "requestied to read an nonexistent ino" after performing a write to the flash and then performing an "ls -al" of the file we just wrote.

I am trying to pick up on the below thread that looks promising - yet has no resolution to it:

http://lists.infradead.org/pipermail/linux-mtd/2009-March/024836.html

Because I am encountering what looks to be the same problem as the above I am assuming I may be encountering the same problem.

Does anyone have any advice for me on how to pick up where the thread leaves off?  It seems to indicate that there was a real bug, or patch that might be necessary, yet after all this time (since the thread was active), I see no further references to the same - or a similar issue.

Am I to assume that a patch was created for this problem?  Is there something more I can add with respect to debug information / tracebacks / dumps / instrumentation to provide more information so I can bring this issue to the forefront again?  

Thanks for providing me with any direction as to how I can bring this issue back up as an active issue.

Jerry
