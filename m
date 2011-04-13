Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nM-0003P1-2d
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:15:55 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFn4Y018683
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:49 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/27] mtd-utils: make integck test independent
Date: Wed, 13 Apr 2011 18:18:40 +0300
Message-Id: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, here is a patch-set which makes the integck test independent on the
common code which tests in tests/fs-tests/ directory share. You may be
wondering why the hack you need this :-) The explanation is rather long.

Q: Why you need to have integck independent?
A: Well, first of all I think integck is the only cool and useful test
   in the whole fs-tests directory. To other ones are not really useful.
   And I do not want to touch them at all.

   I plan to improve integck later, and this is preparation work. My
   improvements require nice error handling - not just dying in CHECK()
   macro. Do do this, I'll need to touch a lot of that common code. But
   since it is shared, I may brake some of the other tests if I touch it.
   Thus, I want to have integck independent on the other tests as the
   first step. And this patch-set is actually the preparation to the
   further planned work.

Q: So what are you going to do next?
A: Next I want to make all functions return error nicely (and free resources)
   if a write or any other FS modification operation fails. Currently the
   integck test just exits.

Q: Why you need that?
A: To test UBIFS with the power-cut emulation feature on. UBIFS can emulate
   power cuts, which means that integck may get an error at any time. In this
   case the test should be able to re-mount the tested file-system, check that
   fsync()'ed files are correct, and continue the testing. So nice error handling
   is just a preparation work.

   And longer term this is needed for unstable bits testing. I have UBI patches
   which emulates power cuts and unstable bits, and UBIFS is supposed to handle
   them nicely. But it does not currently. And to fix UBI/UBIFS i need a good
   test which is able to recover when a power cut is emulated and which is able
   to check integrity of those files which were fsync()'ed before the emulated
   power cut. But this is long-term plan. Hopefully I'll be able to finish
   this, but any help will be appreciated.

So, for now just these small preparations.

Artem.
