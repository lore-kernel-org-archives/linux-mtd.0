Received: from ip68-7-112-74.sd.sd.cox.net ([68.7.112.74] helo=clpanic.kennet.coplanar.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16svUI-0004sd-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 01:52:26 +0100
Message-ID: <00fd01c1db72$f225c200$7e0aa8c0@bridge>
From: "Jeremy Jackson" <jerj@coplanar.net>
To: <linuxbios@lanl.gov>, <linux-mtd@lists.infradead.org>
Subject: PIIX flashing woes with SST29EE010
Date: Wed, 3 Apr 2002 16:52:07 -0800
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

(crossposted)
FYI,

A problem I was having that *appeared* to be a problem with
getting writes to the flash chip, wasn't

It turns out that SST's datasheet for SST29EE010 is incorrect.
It turns out that the part I have *doesn't* respond to "new" style
ID mode entry sequence, as indicated in the manual.
It only responds to the "old" AA 55 80 AA 55 60 sequence.

I should have a generic PIIX map driver for MTD soon now.

Jeremy
