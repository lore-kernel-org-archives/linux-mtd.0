Received: from [194.250.150.132] (helo=melelios.dmz.elios-informatique.fr)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACbAW-0000zU-C9
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 09:50:08 +0100
From: "Armelle Potier" <armelle.potier@elios-informatique.fr>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 23 Oct 2003 10:52:08 +0100
Message-ID: <NFBBKFLAIMMPNKJONACNKEAECEAA.armelle.potier@elios-informatique.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: jffs2  on Ecos: multi task access and defragmentation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2 questions:
1 - How must be used jffs2 with many task calling it for read-write-erase
operations on different or same files or directory
Is it managed correctly by jffs2 and how (tasks blocked if necessary for
example) or have the task to care for multi access and then how?
2 - does jffs2 need defragmentation functionnality ? If yes how to use this
service if it's exist.

Thanks for your response.
Armelle POTIER
