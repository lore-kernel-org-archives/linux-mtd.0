Received: from hall.mail.mindspring.net ([207.69.200.60])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JDKv-00020y-3O
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 15:15:57 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 23 May 2003 10:17:23 -0400
Message-ID: <IIEEICKJLNEPBBDJICNGEEEFDFAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: A solution for a particular "Magic bitmask 0x1985 not found" error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Regarding this error message sequence at boot time:

...
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004: 0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008: 0xdc6d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000: 0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004: 0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008: 0xdc6d instead
...

I had this happen for a long time each time I booted Linux.
I finally found a solution which stopped it, and maybe this
will help anyone else out there who is getting it.  I have
seen it mentioned in the archives, so I know I am not the 
first to get this error "triplet".

The solution was to simply make the jffs2 filesystem with a
newer version of mkfs.jffs2.  I had been using version 1.9
(see output of your "mkfs.jffs2 --version") when I got the
errors, and it stopped when I began using version 1.35.  So
it looks like this message is due to compatibility issues
between the jffs2 support in your kernel and the version of
mkfs.jffs2 that you use.

One thing of note is that the filesystem did work OK after
spewing all these msgs, they were just a nuisance -- I guess
that's why I lived with them for a while before seeking the
answer. :)

Chuck Meade
