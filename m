Received: from mail.nanometrics.ca ([206.191.47.130])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKfTR-0000nO-Ot
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 12:07:38 -0400
To: linux-mtd@lists.infradead.org
Message-ID: <OFD4E06ABE.3DA35253-ON85256F34.0055D12A-85256F34.0058A7DB@nanometrics.ca>
From: David Ho <DavidHo@nanometrics.ca>
Date: Thu, 21 Oct 2004 12:08:21 -0400
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: Difference between old and new MTD char drivers.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>





Hi all,

Anyone knows off-hand any changes to the MTD char driver that might prevent
a linux utility from unlocking/erase/program a sector in an MTD partition.
The u-boot fw_setenv utility is failing to program sectors in a partition.

Regards,
David Ho
