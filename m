Received: from mercury.sun.com ([192.9.25.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15A1Lj-0002GO-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 04:29:43 +0100
Received: from hsmtv32a.SFBay.Sun.COM ([129.145.120.36])
	by mercury.Sun.COM (8.9.3+Sun/8.9.3) with ESMTP id UAA24116
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 20:35:05 -0700 (PDT)
Received: from sun.com (natbox [129.145.120.47])
	by hsmtv32a.SFBay.Sun.COM (8.9.3+Sun/8.9.3/ENSMAIL,v2.1p1) with ESMTP id UAA16660
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 20:35:05 -0700 (PDT)
Message-ID: <3B26DF7F.F9EE6185@sun.com>
Date: Tue, 12 Jun 2001 20:35:27 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: how to get MTD support - need expert input
Content-Type: text/plain; charset=us-ascii
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

Hello, All.

I am trying to get the general MTD layer in linux to support our systems'
flashroms.  The problem is that our system setup is a bit unique.

We have 1 or 2 chips (so far all have been JEDEC).  These may be of
intermixable sizes from 512K to 4MB.  They are mapped in the top 64k of
address space (x86 compatible).  To swap pages and banks, there is a custom
flash page register, which has a few bits that determine teh actively
mapped page.

So my question is this:

What is the best way for me get full support?  Apparently all the JEDEC
support in 2.4.5 is broken.

This is my thought:

have a map driver (like the other chipset map drivers) that builds it's own
struct mtd_info.  We can then flip pages at will, probe however we like,
etc.  I wish I could say that we will always have both flash chips
identical, but I can't.

feedback?

-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
