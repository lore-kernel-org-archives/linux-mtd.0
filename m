Received: from [62.98.205.21] (helo=lisa.rhpk.springfield.inwind.it ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15o5Kh-0000DB-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2001 16:50:16 +0100
Received: from localhost (paris@localhost)
	by lisa.rhpk.springfield.inwind.it (8.11.4/8.11.4) with ESMTP id f91FqTg00260
	for <linux-mtd@lists.infradead.org>; Mon, 1 Oct 2001 17:52:34 +0200
Date: Mon, 1 Oct 2001 17:52:28 +0200 (CEST)
From: Cristiano Paris <c.paris@libero.it>
To: <linux-mtd@lists.infradead.org>
Subject: Re: MTD newbie
In-Reply-To: <Pine.LNX.4.33.0110011550130.888-100000@hex.linuxgrrls.org>
Message-ID: <Pine.LNX.4.33.0110011743030.223-100000@lisa.rhpk.springfield.inwind.it>
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

Many thanks to all.

At the moment the jffs2 is unusable for me. I'm using linux-2.4.9-ac10 on
a Pentium166MMX notebook. I've tried to mount the task-familiar
distribution on /dev/mtdblock0. The mount works fine but when I try to
touch a file in the filesystem (say "touch /mnt/silly") the system just
hangs and a kernel oops appears.

touch seems to stop after perfoming a utime system call (open and close
worked fine) and the kernel provides the following backtrace :

- system_call
- sys_close
- filp_close
- sys_utime
- notify_change (setattr)
- jffs2_setattr
- jffs2_complete_reservation
- jffs2_garbage_collect_trigger
- <UNKNOWN>

The error is "Invald parameter 00000"; I'm trying to get the full OOPS
from a serial-line-attached console, so be patient. In addition I'm trying
to debug the error myself.

Maybe I'm using the wrong version of Linux or a more recent snapshot would
sove the problem.

Please, let me know. Thanks in advance, as usual.

Cristiano
