Received: from spinnone.spinn.net
	([216.223.224.6] helo=newone.spinn.net ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15xMxv-0000nv-00
	for <linux-mtd@lists.infradead.org>; Sat, 27 Oct 2001 07:29:07 +0100
Received: from spinn.net (qdslip27.spinn.net [216.223.233.27])
	by newone.spinn.net (8.9.3/8.9.3) with ESMTP id AAA25024
	for <linux-mtd@lists.infradead.org>; Sat, 27 Oct 2001 00:33:14 -0600
Received: (from sfr@localhost)
	by spinn.net (8.9.3/8.9.3) id AAA16791
	for linux-mtd@lists.infradead.org; Sat, 27 Oct 2001 00:37:52 -0600
Date: Sat, 27 Oct 2001 00:37:52 -0600
From: "W . Suika Roberts" <ssfr@unm.edu>
To: linux-mtd@lists.infradead.org
Subject: blkmtd command line specification?
Message-ID: <20011027003752.E16430@misa.genom.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I'm working on getting a jffs2 root file system running on my new Ipaq IA-1.

I can use blkmtd when it is built as a module, but I can't seem to figure out
the coomand-line syntax for using it built into the kernel.

So, how do I specify what to do on the command line? 
I tried
blkmtd=device:/dev/hda2
and
blkmtd=device=/dev/hda2
but neither worked.

As a module:
insmod blkmtd.o device=/dev/hda2
works just fine.

2.4.13, no patches, i386.

Thanks,
	Suika
-- 
		ssfr@unm.edu
If the code and the comments disagree, then both are probably wrong.
            						    -- Norm Schryer
   <a href="http://www.unm.edu/~ssfr/">Suika no homepage</a>
