Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CRzJc-0003YL-0I
	for linux-mtd@lists.infradead.org; Wed, 10 Nov 2004 15:43:41 -0500
Received: from flint.arm.linux.org.uk ([2002:d412:e8ba:1:201:2ff:fe14:8fad])
	by caramon.arm.linux.org.uk with asmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.41) id 1CRzJU-0002dX-GK
	for linux-mtd@lists.infradead.org; Wed, 10 Nov 2004 20:43:32 +0000
Received: from rmk by flint.arm.linux.org.uk with local (Exim 4.41)
	id 1CRzJT-0002Ev-9W
	for linux-mtd@lists.infradead.org; Wed, 10 Nov 2004 20:43:31 +0000
Date: Wed, 10 Nov 2004 20:43:31 +0000
From: Russell King <rmk@arm.linux.org.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20041110204331.A26346@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King <rmk@arm.linux.org.uk>
Subject: MTD suspend/resume bug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

People,

There appears to be  a bug in the Intel CFI suspend/resume code in
2.6.10-rc1.

Looking at cfi_intelext_suspend() and cfi_intelext_resume(), consider
what happens if we suspend a MTD device, resume it, and then suspend
it again, with an intermediate switch to FL_STATUS mode.

Initial state:

	cfi->oldstate = FL_READY;
	cfi->state = FL_STATUS; (eg)

First suspend:

	cfi->oldstate = FL_STATUS;
	cfi->state = FL_PM_SUSPENDED;

Resume:

	cfi->state = FL_READY;

	Note: we do not touch cfi->oldstate here.

<something here sets cfi->state to FL_STATUS>

Second suspend:

	At this point, cfi->state == FL_STATUS, cfi->oldstate == FL_STATUS.
	Since cfi->oldstate != FL_READY, we do not set cfi->oldstate nor
	cfi->state.

Resume occurs.  Flash chip was powered off so is now in READY mode,
but MTD thinks its in FL_STATUS and complains about bad chip status:

Waiting for chip to be ready timed out. Status 41927a42
Write of 83 bytes at 0x00cf34e4 failed. returned -5, retlen 0
Not marking the space at 0x00cf34e4 as dirty because the flash driver returned retlen zero
Waiting for chip to be ready timed out. Status e0021985
Error reading node from 0x00917d88: -5

Shouldn't the resume function set both cfi->oldstate and cfi->state
to FL_READY ?

-- 
Russell King
