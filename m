Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxSO1-0006K1-LU
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 11:30:03 -0400
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-35.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1BxSNz-000LAK-0Z
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 15:29:59 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Simon Haynes <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 18 Aug 2004 16:17:51 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <1B7122EB7D4B@baydel.com>
Subject: Long LS times
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have many systems which use a JFFS2/SMC filesystem as root.
On a couple of systems running this I noticed that the system paused
on startup while trying to start syslogd. I thought initially that this what 
due to a large logfile. I decided to delete the logfile and try that. This 
had some effect but it still took 50 seconds. I changed the startup script to 
use strace on starting syslogd and the process stalled while trying to open
a fifo, made with, mkfifo. I later discovered that if I mounted the JFFS2 
filesystem. not as root and performed an 'ls' of the directory containing the 
fifo file, it took 50 seconds. This directory contains only 10 files and the 
only one that is written to is the fifo. 

I then copied this directory and contents to a new one, deleted the original
and renamed the new directory to that of the old, thus recreating the 
directory. I then umounted/mounted the filesystem and the ls took no time at 
all. 

Can anyone explain what is happening to this directory and how I may stop
it or clean it ?

Cheers


Simon. 
