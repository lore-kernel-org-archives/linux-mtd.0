Received: from mail.imc-berlin.de ([217.110.46.186] helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1816eC-0005PN-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 15:56:44 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de [10.0.0.13])
	by mail.berlin.imc-berlin.de (8.12.3/8.12.3) with ESMTP id g9ECwoLT018780
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 14:58:50 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id QAA19766
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 16:56:40 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3DAADB27.F0DD5A70@imc-berlin.de>
Date: Mon, 14 Oct 2002 16:56:39 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: What means "Inode #10 was a directory with children" ?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi there,

I am using MTD/JFFS2 as root fs for my embedded system for some time now.
It was working fine.
But as my image grows bigger and bigger I get strange errors:

While booting Linux I get
...
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Inode #10 was a directory with children - removing those too...
Inode #11 was a directory with children - removing those too...
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 52k init
...

What does that mean?

Sometimes he's complaining about hardlinks.
Then for instance some links are not working correctly, i.e. power should be a
link to busybox but has size zero.

/etc/pcmcia should be a directory, but is a file containing garbage (i.e. some
text that should be in a file in this directory).

And what means:

~ # cat /etc/hosts 
Argh. Special inode #43 with mode 020600 had more than one node
cat: Input/output error

???

cat should be a link to busybox. But "ls /bin" does not show cat !

I am using linux-2.4.19 on a ppc platform.

Thanks very much!

Steven
