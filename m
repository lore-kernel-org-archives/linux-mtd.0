Received: from scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MUBy1-00027f-6F
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 04:01:16 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: UBIFS robustness questions
Date: Fri, 24 Jul 2009 16:00:54 +1200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907241600.54640.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is probably documented somewhere but I could not find it...

What operations in UBIFS are robust to power failure and which are not?

I know for example that writing a file into flash does not mean it has been 
completely written to flash until after a sync, but what about other 
operations such as mv?

The reasonn I'm asking this is that I want to be able to "hot-swap" a 
directory of files without losing any file state.

What I'm considerings doing is something like:

Start with ~/runtime having a sane set of files

untar etc into ~/updated
sync
mv ~/updated ~/run-time
sync

What is unacceptable is that, at any time, a power failure/reboot results in 
~/runtime having a non-sane set of files.

* Does the above sequence look safe?
* Is the second sync required?


TIA

-- Charles
