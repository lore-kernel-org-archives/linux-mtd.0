Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eF6p-00017f-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 13:52:03 +0000
Date: Thu, 30 Jan 2003 15:23:00 +0100 (CET)
From: Marius Groeger <mag@sysgo.de>
To: Stephane List <stephane.list@lilotux.net>
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: crc32.h
In-Reply-To: <20030130132133.GA13604@lilotux.net>
Message-ID: <Pine.LNX.4.52.0301301521120.24922@mag.devdep.sysgo.de>
References: <20030130132133.GA13604@lilotux.net>
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

On Thu, 30 Jan 2003, Stephane List wrote:

> I'm using the CVS source code.
> All files in "fs/jffs2" use #include <linux/crc32.h>
> But this file is not part of 2.4.x kernel it's only in 2.5

It is part in new versions of 2.4, in which case MTD's version will be
inserted. Kernels without crc32.h should symlink to
mtd/fs/jffs2/crc32.h. See patches/patchin.sh for all the gory details.
Then use this script to marry your kernel and MTD.

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions AG       mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
