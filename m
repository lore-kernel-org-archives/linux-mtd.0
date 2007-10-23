Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IkMbL-0002j5-Kc
	for linux-mtd@lists.infradead.org; Tue, 23 Oct 2007 17:27:33 +0100
Received: from ben by kira.home.fluff.org with local (Exim 4.67)
	(envelope-from <ben@fluff.org.uk>) id 1IkMYA-00074Z-QH
	for linux-mtd@lists.infradead.org; Tue, 23 Oct 2007 17:24:14 +0100
Date: Tue, 23 Oct 2007 17:24:14 +0100
From: Ben Dooks <ben@fluff.org>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: NAND suspending
Message-ID: <20071023162414.GB12390@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i have been working on an issue with suspend/resume with
the current NAND layer, and am interested on people's thoughts
on the issue. The problem stems from the s3c2410 driver leaving
nFCE set active (ie, low) when going into suspend, causing a
failure to resume properly (another story)

The immediate fix is just to add a call to deselect the
chip in s3c24xx_nand_suspend() by calling the internal
functions s3c2410_nand_select_chip(mtd, -1) to force nFCE
to go inactive.

I had a look through the other NAND drivers, and it seems no
other driver does anything on suspend, and having added some
debug to nand_suspend in nand_base.c, it seems that is not
being called by anything in my setup.

My question is, should my driver ensure that the MTDs it is
looking after are called from the device suspend method, and
if so, what is the appropriate call to make?2~

The next question is that once NAND suspend is called, it
should really call the nand->select_chip method to deselect
the chip when going into suspend, as the datasheet for the
K9F1208 chip quotes suspend currents when nCE is high.

A further interest is whether all possible chips attached
to the controller structure should be marked as being in
suspend, as the s3c2410 can support >1 chip connected to
it (and several of our boards have support for 2-4 chips).
Does the suspend needs to suspend all chips? At the
momemnt the nand_suspend() function uses nand_get_device
which means only one chip can be suspended (and calling
nand_release_device() will mark the chip ready again).

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
