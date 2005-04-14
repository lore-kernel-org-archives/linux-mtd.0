Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DM0fS-0003KR-MV
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 05:29:48 -0400
Received: from mikobook.office.rac.de ([10.0.0.84])
	by mail2.racnet.net with asmtp (Exim (Debian)) id 1DM0fI-0002FO-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2005 11:29:36 +0200
Message-ID: <425E37FF.5040703@rac.de>
Date: Thu, 14 Apr 2005 11:29:35 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Subject: Nand Flash not found.
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear list users,

I've adapted a hardware driver for our board, and compiled the new
kernel successfully. But it doesn't find the NAND Flash. When loading
the module I get:
insmod ./btutc1130.o
./btutc1130.o: init_module: No such device or address
Hint: insmod errors can be caused by incorrect module parameters,
including invalid IO or IRQ parameters

in /var/log/messages:
Jan  1 19:25:15 10 daemon.warn klogd: No NAND device found!!!

Is there any possibility to test the 'connection' to the NAND or how can
I check/debug the problem. I think that the HW functions are not
properly configured, any idea how this can be checked.

Thanks in advance

Marcus
