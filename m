Received: from [63.118.32.25] (helo=c2.ciena.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173kk2-0005qB-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 22:37:27 +0100
From: jm1@angert.net
Received: from tangert-2k.pc.atl.ciena.com (jawheeler-lt.pc.atl.ciena.com [10.88.2.63] (may be forged))
	by sylvester.ciena.com (8.8.8+Sun/8.8.8) with ESMTP id PAA20115
	for <linux-mtd@lists.infradead.org>; Fri, 3 May 2002 15:21:50 -0400 (EDT)
Date: Fri, 3 May 2002 15:21:49 -0400 (Eastern Daylight Time)
To: linux-mtd@lists.infradead.org
Subject: Eep. Child "ncp.cfg" (ino #344) of dir ino #88 doesn't exist!
Message-ID: <Pine.WNT.4.44.0205031453060.1528-100000@tangert-2k.pc.atl.ciena.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

JFFS2 on a powerPC embedded system. 64M Intel Strataflash. Latest CVS patched
into Hardhat Linux (2.4.3 based)

We are using the board for development and test. It had an uptime of about a
month and was working fine - it was running CVS code from 6 to 8 weeks ago.

Today we rebooted it with the latest MTD CVS code (as of 5/2/02) and got:

Eep. Child "ncp.cfg" (ino #344) of dir ino #88 doesn't exist!

in the syslog. I am unable to delete the bad entry from the dir inode:

# perl -e "unlink 'ncp.cfg';"
# ls -la
ls: ./ncp.cfg: Input/output error
drwxrwxr-x 2 root root 0 May 3 14:10 .
drwxr-xr-x 8 root root 0 May 3 14:57 ..

Rebooting doesn't seem to help - the error is reported each time.

Other than this error the JFFS2 filesystem is working fine.

Obviously I can clear this up by erasing the whole flash, but is there anything
I should look at first?

Thanks,

Tom Angert
