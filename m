Received: from transedge-153-132.transedge.com ([216.171.153.132] helo=mercury.steinkuehler.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DwQ9-0003OI-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2001 23:34:46 +0000
Received: from csteinathlon (transedge-153-131.transedge.com [216.171.153.131])
	by mercury.steinkuehler.net (8.9.3/8.9.3) with SMTP id VAA04441
	for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2001 21:26:34 -0600
Message-ID: <062d01c1829d$c20e54c0$4101220a@csteinathlon>
From: "Charles Steinkuehler" <charles@steinkuehler.net>
To: <linux-mtd@lists.infradead.org>
Subject: Slightly confuzed...
Date: Tue, 11 Dec 2001 17:44:21 -0600
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

I'm working on building a kernel with the latest patches from the FTP site,
and digging through the code from CVS, but I've got a (hopefully simple)
question:

Which driver should I use for "conventional" (at least to me :) Atmel parts,
like the 29C010, 29C040, etc?  Everything I've looked at so far in the code
seems to want to talk to a DiskOnChip or the "wacky" CIS type flash (and
predecessors) you have to send commands to.

Or is using the 29Cxxx series flash so simple the code is left as an
exercise for the reader?  ;-)

Charles Steinkuehler
charles@steinkuehler.net
