Received: from pop-a065d23.pas.sa.earthlink.net ([207.217.121.254])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D2Ece-0003Ft-Ut
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 15:21:09 -0500
Received: from bigbird.psp.pas.earthlink.net ([207.217.78.244])
	by pop-a065d23.pas.sa.earthlink.net with esmtp (Exim 3.33 #1)
	id 1D2EcY-0003Gw-00
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 12:21:02 -0800
Message-ID: <18307332.1108758040913.JavaMail.root@bigbird.psp.pas.earthlink.net>
Date: Fri, 18 Feb 2005 13:20:40 -0700 (GMT-07:00)
From: John Kelly <johnfkelly@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: DoC-2000: NAND_CMD_READID hangs on stock 2.6.10 kernel
Reply-To: John Kelly <johnfkelly@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working on getting a Technologics TS-5400 board runnig Linux-2.6 to see a 32MB DoC.

When inserting the diskonchip.ko driver from a vanilla 2.6.10 kernel, I get into an infinite loop in nand_command with command=0x90 (READID).  The loop is at the bottom of the function:

        /* Apply this short delay always to ensure that we do wait tWB in
         * any case on any machine. */
        ndelay (100);
        /* wait until command is processed */
        while (!this->dev_ready(mtd));

If I use a counter to break out of the loop after 40 tries, everything works--only READID seems to need this.

Is there some other way this should be handled?
