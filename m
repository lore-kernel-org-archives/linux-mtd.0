Received: from webmanixhosting.com ([216.40.225.16]
	helo=www.webmanixhosting.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj3lI-0007kz-KN
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 21:50:16 +0000
Received: from www.onemyth.net (localhost [127.0.0.1])
	by localhost (8.10.2/8.10.2) with ESMTP id i0KLoo909677
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2004 13:50:50 -0800
From: "Dan Post" <djp.mtd@onemyth.net>
To: linux-mtd@lists.infradead.org
Date: Tue, 20 Jan 2004 13:50:50 -0800
Message-Id: <20040120215050.M62159@onemyth.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: Intel flash and cfi_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was looking at the cfi_probe.c file, and noticed that there are numerous
'0xF0' commands to flash (theoretically to put the flash back into read array
mode).  This is incorrect in terms of Intel flash; according to the datasheets
for L18/30 and K3/18, the "read array" command is 0xFF.

Normally, it would work fine (by virtue of accident, the state machine is
coherent enough not to break after the probe), except in cases of XIP (based
on dwmw2's code, which I have been working on and will send out probably this
week).  It breaks the system then because 0xF0 doesn't really put an Intel
chip into read array, so when you enable intterupts, you schedule to a
function running out of flash, which happens to be in status mode.... == big
bad no-run, i.e. you freeze.

(Specifically, it blows up on L*...  though it seemed to "work" on K*, that
may just be an accident or compatibility mode that wasn't put into L*.  Or
maybe I munged my code somehow and something magically changed.  It's not in
the datasheets, so the behavior could change at any time.  When I changed the
0xF0's to 0xFF's, it worked on L*.)

I assume that the 0xF0 is for AMD flash (a datasheet I checked out confirms
this).  For the cfi_probe.c file to be "proper", it needs to issue 0xFF to
Intel flash, and 0xF0 for AMD.  (Any other chips using different commands??)

What would happen if we issued an 0xF0;0xFF to an AMD chip?  Or 0xFF;0xF0? 
Any AMD chip-heads care to answer?  It looks like it will "work" on Intel chips...

At any rate, either there needs to be a clever hack like that, or the
cfi_probe.c facilities need to be refactored so they know which command to
issue to flash.

Dan
