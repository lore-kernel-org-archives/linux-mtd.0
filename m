Received: from sc-smtp1.homechoice.co.uk ([212.187.157.195] helo=sc-outsmtp2.homechoice.co.uk)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17o4sK-0005zm-00
	for <linux-mtd@lists.infradead.org>; Sun, 08 Sep 2002 17:25:28 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: adr <mtd@mcmen.demon.co.uk>
To: Mtd <linux-mtd@lists.infradead.org>
Subject: Writing an mtd user module
Date: Sun, 8 Sep 2002 17:26:50 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209081726.50430.mtd@mcmen.demon.co.uk>
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

Having written a driver module for the Dreamcast flash cartridge/vmu, I am now 
attempting to write a user module that works with the default fs on the 
Dreamcast flash (see http://mc.pp.se/dc/vms/flashmem.html if you are 
interested in knowing more about that).

Anyway, I am struggling with the documentaion (which, as I found with the 
driver was way out of date) and the code.

Looking at the mtdblock driver, register_mtd_user(&notifier); only seems to 
get called when devfs is being used, yet the documentation implies it should 
be called every time.

What have I missed here?
