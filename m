Received: from orwell.zhwin.ch ([160.85.104.31])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178f9A-0005Qe-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 11:39:40 +0100
Message-ID: <3CE4DE5F.294BA7E0@zhwin.ch>
Date: Fri, 17 May 2002 12:41:35 +0200
From: Thomas Preisig <preistho@zhwin.ch>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Kernelpanik while booting DOC2000
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

Hi
I installed mtd-lilo on my DOC2000 from the cvs and my kernel 2.4.18
loads fine but fails to mount the root partiton.
I see a message like this: Kernlel Panic: VFS: Unable to mount root fs
on 03:04

Why the the root fs refers on 03:04??? 03:04 is my Hardrive. I have run
mtd-lilo on the doc2000. Could rdev -R help ?



Content Security by MailMarshal
