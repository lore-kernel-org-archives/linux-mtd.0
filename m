Received: from ip68-7-112-74.sd.sd.cox.net ([68.7.112.74] helo=clpanic.kennet.coplanar.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16swsI-0004zL-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 03:21:18 +0100
Message-ID: <015501c1db7f$5ea5ac90$7e0aa8c0@bridge>
From: "Jeremy Jackson" <jerj@coplanar.net>
To: <linux-mtd@lists.infradead.org>, <linuxbios@lanl.gov>
Subject: jedec_probe_chip error?
Date: Wed, 3 Apr 2002 18:21:02 -0800
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

in Linux-MTD:

I'm looking at mtd/drivers/chips/jedec_probe.c:jedec_probe_chip
line 794 from current CVS.

for CFI_DEVICETYPE_X8, the unlock1 and unlock2 values
seem wrong.   They're currently 0x555 and 0x2aa, resp.
Does it work like this?  All of the small (512KiB -
128KiB) devices I've read the datasheets for, require
0x5555 and 0x2aaa here.  Are there any devices which
use the current code's values?

Also, I have discovered (see prev. post) at least one device that doesn't
respond to the aa 55 90 sequence, requiring an alternate
"old" sequence instead.  Any guidance on the best way to
implement this generically would be appreciated.

Jeremy
