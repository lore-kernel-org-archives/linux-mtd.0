Received: from transedge-153-132.transedge.com ([216.171.153.132] helo=mercury.steinkuehler.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DXyo-000241-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2001 21:28:55 +0000
Received: from csteinathlon (transedge-153-131.transedge.com [216.171.153.131])
	by mercury.steinkuehler.net (8.9.3/8.9.3) with SMTP id TAA32361
	for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2001 19:20:37 -0600
Message-ID: <00c501c181c3$03639bf0$4101220a@csteinathlon>
From: "Charles Steinkuehler" <charles@steinkuehler.net>
To: <linux-mtd@lists.infradead.org>
Subject: Flash/DOC in NIC boot-rom socket
Date: Mon, 10 Dec 2001 15:38:31 -0600
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

I'm looking for a zero hardware/cable solution to hooking up some flash or a
M-Systems DiskOnChip to a "standard" PC (ie, not one of the nifty embedded
systems with a DOC socket already there).

The most straight-forward thing I've come up with so-far is to populate the
boot-rom socket of a NIC with some flash or a DOC, and write some glue
software (or customize the NIC driver) so the MTD software can talk to the
flash over the PCI bus.  Since most modern NIC's support flash boot-roms,
selecting the proper NIC (I'm starting with 3C905's) and flash/DOC part
makes the hardware end "plug and play".

So...am I insane?  Has anyone done something like this before, or have a
better idea for dropping some flash into a standard PC with no custom
hardware?

The goal is to replace a floppy disk holding configuration data in my
firewall/router systems, which currently boot off CD.  If I can get the DOC
working, and have enough time/patience to write some BIOS code, the entire
system could even boot off the DOC, instead of booting off the CD-ROM.

Charles Steinkuehler
http://lrp.steinkuehler.net
http://c0wz.steinkuehler.net (lrp.c0wz.com mirror)
