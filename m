Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GmFZZ-0000wb-EI
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 15:17:04 -0500
Message-ID: <45620D2D.1030209@valcom.com>
Date: Mon, 20 Nov 2006 15:16:45 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: New JFFS2 code needs upgrade to zlib.  Zlib where is it/does it go?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux-mtd,
I am trying to upgrade JFFS2 code for uClinux-dist so that I can use
it.  I have found it depends on the latest libz.a (version 1.2.3).  I
downloaded zlib and copied it into the uClinux-dist/lib/zlib directory. 
This upgrades libz.a in uClinux-dist/lib directory.  In addition to this
I compiled zlib-1.2.3 and installed on my developing host system.  So it
is also in /usr/local/lib/zlib.a, as recommended on-line.  The cross
compiler looks in /usr/local//m68k-uclinux/... for libz.a and zlib.h. 
When I try to compile it never sees my new zlib in the host
/usr/local/lib/zlib.a nor in the ./uClinux-dist/lib/zlib.a.
What else do I need to do?
Thanks,
Glen Johnson
