Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OPAgB-00014H-Ph
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2010 08:42:32 +0000
Received: by fxm11 with SMTP id 11so1473805fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jun 2010 01:42:29 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 17 Jun 2010 10:42:29 +0200
Message-ID: <AANLkTikVqjmLiBDq6bdtTcHKwZxlxAVCBg3-WGXMzbmF@mail.gmail.com>
Subject: UBIFS performance measurements
From: Leo Barnes <barnes.leo@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I have a few questions regarding sequential write speeds in UBIFS and
how to measure them.

1. If I want to measure sequential (and later on, random) write speed
in UBIFS, should I do the writes using the O_SYNC flag or just do a
fsync after writing? I worry that using the O_SYNC flag will reduce
the write performance since the file system is meant to be used
asynchronously and I want my measurements to be as close as possible
to how the file system is meant to be used.

2. If I do not use O_SYNC, will using fflush and fsync guarantee that
all written data has been written to flash when they return?

3. If I do not use fflush before fsync, I assume, after reading the
FAQ, that I am not guaranteed that all data has been written. Is this
correct?

4. Does the commandline sync command do the same thing as fflush/fsync?

5. Does sync/fsync force garbage collection? In other words, if I have
deleted lots of files from an UBIFS volume, will I be ensured that
their corresponding eraseblocks will actually be freed if I do a sync?

Any other tips regarding how to perform valid write performance
measurements on UBIFS would be welcome.

Best regards,
//Leo
