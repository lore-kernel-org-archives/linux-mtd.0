Received: from web60809.mail.yahoo.com ([216.155.196.72])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BcYz7-0000wj-B1
	for linux-mtd@lists.infradead.org; Mon, 21 Jun 2004 20:17:58 -0400
Message-ID: <20040622001755.89563.qmail@web60809.mail.yahoo.com>
Date: Mon, 21 Jun 2004 17:17:55 -0700 (PDT)
From: Arnold Liu <asliu23@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: LPD7A400 Argh. Special inode #118 mode 0xa1ff had more than one node
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings all,

I've been using the LDP7A400 with a 
2.6.7-rc2-lh7a40x-ms1 kernel.

Using Kegel's "crosstool", I rebuilt a 
"gcc-3.3-glibc-2.3.2" toolchain for arm9tdmi

I also am using busybox-1.00-pre10.

The kernel looks like it loads fine, but I 
get the following messages after mounting
the root filesystem :

-----
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 72K
Argh. Special inode #118   mode 0xa1ff had more than
one node
Returned error for crccheck of ino #118. Expect
badness...
Argh. Special inode #119   mode 0xa1ff had more than
one node
Returned error for crccheck of ino #119. Expect
badness...
Argh. Special inode #120   mode 0xa1ff had more than
one node
Returned error for crccheck of ino #120. Expect
badness...
Argh. Special inode #121   mode 0xa1ff had more than
one node
Returned error for crccheck of ino #121. Expect
badness...
Argh. Special inode #122   mode 0xa1ff had more than
one node
Returned error for crccheck of ino #122. Expect
badness...
Argh. Special inode #123   mode 0xa1ff had more than
one node
Returned error for crccheck of ino #123. Expect
badness...

Please press enter to activate this console.

BusyBox v1.00-pre10 (2004.06.21-21:54+0000) Built-in
shell (ash)
-----

Does anyone know what might be causing these messages?

Thanks,
Arnold
