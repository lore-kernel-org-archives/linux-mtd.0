Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3W-0002nd-OD
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8RY025930
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:08 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/13] More integck improvements
Date: Fri, 22 Apr 2011 20:25:11 +0300
Message-Id: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now integck power cut mode works, mostly. It fails sometimes, though.
I know the reason of some of the failures and this needs work in UBIFS.

The test still does not verify integrity of clean files after an emulated
power cut - it only makes sure the file-system is mountable and usable
after power cuts. But this is already a lot and I see several issues.
Once I've fixed them - I'll implement better integrity checking.

Remind - the long term goal is to solve the unstable bits problem, but
to even start doing this we need:
1. Rock solid user-space test which can stress-test the FS well, and
   be aware of the power cut emulation.
2. UBIFS and integck should survive the current UBIFS power cut emulation
   which does not emulate unstable bits.

Only after this we can move further. I do not know when I reach that
point, but I'm trying.

Anyway, these tests fix several integck problems I encountered, make
it nicer, and improve it.

Artem.
