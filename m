Received: from h139-142-224-7.gtcust.grouptelecom.net ([139.142.224.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16s4zM-0001ff-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 17:49:01 +0100
Received: from athlon (24-66-30-3.gatewest-shaw.ca [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g31G3k99004134
        for <linux-mtd@lists.infradead.org>; Mon, 1 Apr 2002 10:03:55 -0600
Message-ID: <000501c1d996$da814030$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: Can JFFS be placed in middle of flash?
Date: Mon, 1 Apr 2002 09:41:21 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello,

Can a JFFS file system be placed in the middle
area of flash? (We will be using the beginning and
end areas for other things).

What I'm concerned about is that many flash
chips have a group of 8 small blocks at the
beginning of the flash space in the chip.
If a JFFS is placed in the middle, is there
a danger that the software will still expect
those small blocks?

Derek Ross.
