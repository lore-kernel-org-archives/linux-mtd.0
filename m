Received: from postfix3-1.free.fr ([213.228.0.44])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17k3nG-0004IS-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 15:27:38 +0100
To: linux-mtd@lists.infradead.org
Subject: Cannot remove child on JFFS2 FS with latest CVS
Message-ID: <1030544853.3d6cddd5501b2@imp.free.fr>
Date: Wed, 28 Aug 2002 16:27:33 +0200 (MEST)
From: olivier.eribon@free.fr
Cc: tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hello,

Now with latest CVS Aug 28 2002, and 2.4.17 linux kernel on a specific 
board (ppc405gp with a nand flash : Toshiba TC58256FT/DC), 
I have always the same message :

Cannot remove child "fileXXX", ino #0, because it doesn't exist

How can I solve this problem ? (because this message induce long time to
mount partition.)

Thanks in advance for your time and your help !

Best regards,

Olivier
