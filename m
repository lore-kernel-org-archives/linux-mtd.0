Received: from port59.vestas.dk ([195.41.59.59] helo=cotas2.cotas.vestas.dom)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MSNs-000778-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 12:51:52 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Esben Nielsen <esn@cotas.dk>
Reply-To: esn@cotas.dk
To: linux-mtd@lists.infradead.org
Subject: Problems with Jffs2 on this board
Date: Mon, 24 Jun 2002 13:50:20 +0200
MIME-Version: 1.0
Message-Id: <02062413502007.08285@tux>
Content-Transfer-Encoding: 8bit
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

I am trying to board Linux to my company's StrongARM based board.
I am now using bootldr 2_18_45 from handhelds.org, mkfs.jffs2 revision 1.17 
and HardHat's Linux-2.4.2_hhl20.

I create a root filesystem image with mkfs.jffs2 which I transfer to the 
flash on the board with over serial. I can now boot the kernel from the 
bootloader but the kernel can't find other files that those in /devs (from 
the debug level of 2 in the jffs2 subsystem in the kernel) and thus
fails to call /sbin/init.
Now I see with "ls" in the bootldr that that can't see other subfiles that 
/devs/*, /boot/zImage and a few in /bin, either!
Thus I suspect very much that my mkfs.jffs2 is broken - I downloaded it
binary from www.redhat.com. Now, I try to compile a new one from the
latest from CVS on infradead.org. But I simply can't make it compile, as
I get:

compr_zlib.c:15:2: #error "The userspace support got too messy and was 
removed. Update your mkfs.jffs2"

What do I do about that? Do I have to go through my kernel on my host
machine to create a proper jffs2 image?

Esben Nielsen
Cotas Computer Technology A/S
