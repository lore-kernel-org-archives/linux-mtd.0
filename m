Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURp-00063g-UG
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:50 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmLv009480
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:48 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/35] fs-tests: integck: handle write errors
Date: Wed, 20 Apr 2011 13:18:33 +0300
Message-Id: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this is the continuation of my effort to improve integck. This series
of patches teaches integck to not die immediately when a write error
happens.

Currently integck exits if any unexpected error occurs. However, I am
going to make it usable for power-cut emulation testing, so when UBI
decides to emulate a power-cut and all write operation will return with
EROFS error, the test will also exit. So this patch-set teaches all
functions which do FS modifications to return an error up to the caller
if the operation fails. Then the error propagated to the main() function,
which currently just exits. But the plan is:

1. Make 'main()' unmount UBIFS, detach UBI, attach UBI back, mount UBIFS back.
2. Go through all files which were synchronized before the emulated power
   cut and check that the contents of these file is correct.
3. Restart the test.

And then the plan is to implement unstable bits emulation in UBI and run
this test, and catch bugs, and fix this.

So, this is just a preparation. The integck code is a bit dirty and was
written using "quick programming" approach. This patch-set tries to also
clean up the code a little bit.

Additionally, this patch-set fixes the huge amount of memory leaks the
test has had, and also lessens the memory consumption.

And finally, I tried to split the patches nicely, but I do not have much
time so the split is far far not ideal. I think it is good enough, though,
taking into account that there are only 2 users of this test I know.

Artem.
