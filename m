Received: from mailhost.cs.tamu.edu
	([128.194.130.106] helo=cs.tamu.edu ident=0)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19r10i-0001rO-57
	for <linux-mtd@lists.infradead.org>; Sun, 24 Aug 2003 20:58:48 +0100
Date: Sun, 24 Aug 2003 14:58:21 -0500 (CDT)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: John Praveen <ijpraveen1@yahoo.com>
In-Reply-To: <20030824094921.98467.qmail@web41706.mail.yahoo.com>
Message-ID: <Pine.GSO.4.44.0308241449440.7389-100000@unix.cs.tamu.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS-help!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 	What confuses me is, is the command mkfs.jffs is to
> be executed with the target flash in the host system?
> or is this to be executed without the
> target solely on the host system and later the image
> file can be put in the target when the target is
> ready?
mkfs.jffs is to create a jffs image file (on the host). Typically, you
would then transfer the file (say jffs.image) onto your target machine and
do a `cp jffs.image > /dev/mtd0,1,2...` The steps are explained in
mtd-jffs-Howto.

Basically, mkfs.jffs is just a utility to create a jffs file image. Think
of it as a variant of mkfs command.

-siddharth
