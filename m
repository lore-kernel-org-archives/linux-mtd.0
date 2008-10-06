Received: from web81802.mail.mud.yahoo.com ([68.142.207.167])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kmv0x-0004MF-JC
	for linux-mtd@lists.infradead.org; Mon, 06 Oct 2008 18:41:03 +0000
Date: Mon, 6 Oct 2008 11:41:02 -0700 (PDT)
From: Curt Scott <curt_scott@yahoo.com>
Subject: OOB questions
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <747772.64619.qm@web81802.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am writing a MTD NAND (2K page) driver module for Linux 2.6.23. 
My NAND hardware controller performs all the ECC control
under-the-hood.  Although is has OOB bytes available there are some
limitaitions...

L1.) Page data and OOB data must be written at the same time.
L2.) OOB data is limited to 16 bytes / page (of a 2k page).

I have some questions about the OOB requirements for MTD/JFFS2 combo.

Q1.) Does MTD/JFFS2 require the ability to read/write OOB bytes?  
     Or can the system be set up operate with no OOB available?
Q2.) Is it a requirement for OOB and non-OOB writes to happen independently?

thank you for you help,
Curt
