Received: from [64.120.26.98] (helo=phonos.telos-systems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15hxkX-0004SF-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2001 19:31:37 +0100
Message-id: <fc.000f680100283f75000f680100283f75.283ff2@telos-systems.com>
Date: Fri, 14 Sep 2001 14:20:02 -0400
Subject: trouble compiling mkfs.jffs2
To: linux-mtd@lists.infradead.org
From: "James Schettine" <james@telos-systems.com>
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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

JFFS2 is working great on my embedded arm processor.
(Great work everybody!)

I have started out with a pre-built root image I grabbed 
from others working on handhelds, and they have set
the erase block size to 0x40000 and mine needs to be
0x20000.  Question #1...  does this only affect the
overhead/optimal use or will I actually run into problems
if I run this over a long period.

In order to re-flash my embedded root filesystem with 
the correct erase block size, I have transferred all files 
to my desktop system (an older Debian 2.2) and read up 
on using mkfs.jffs2.  I couldn't find a pre-compiled binary 
in a quick and lazy search so I grabbed the cvs tree, 
cd util, and make mkfs.jffs2.  (did the configure thing too,
but that didn't fix this problem.)

I'm getting problems with size_t undefined in linux/string.h
(I can't believe it doesn't include what it needs !), and 
patching around that I get conflicts between linux/string.h 
and asm/string.h

Then it struck me that as a user-land utility application,
we shouldn't need to get TOO intimate with the kernel.
After all, I am cross-building my filesystem.  The more
you ask about the host kernel, the more wrong you'll
be when you get to the target kernel.

Has anyone else had these troubles/got a work-around.
It's not a good time to be upgrading this particular 
system right now.
