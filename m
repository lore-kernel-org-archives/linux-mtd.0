Received: from uhh.alcaron.ee ([194.204.62.169] ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Ilvt-0003gR-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 08:55:45 +0100
Date: Fri, 14 Jun 2002 10:59:13 +0300
To: linux-mtd@lists.infradead.org
Subject: file copy to /dev/mtd0 hangs after write
Message-ID: <20020614075912.GA31096@alcaron.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Ivar Zarans <iff@alcaron.ee>
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

Hello!

I am using linux kernel 2.4.18 with included MTD drivers. I got working
Intel Strataflash on our experimental board with physmap driver.

When i write something directly to flash, using "cp" command
(cp ./image /dev/mtd0), then system hangs *after* data is written.
Command returns to shell prompt, but system does not respond any more.
Debug messages from mtd do not indicate any errors.

jffs seems to be working OK.

Any ideas why this happens? Any suggestions for debugging?

-- 
Ivar
