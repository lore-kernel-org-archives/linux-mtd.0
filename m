Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O8sgh-0003XY-1o
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 10:15:43 +0000
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: [PATCH 0/4] UBI: improve empty flash handling
Date: Mon,  3 May 2010 13:12:58 +0300
Message-Id: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sebastian,

I've removed your 'UBI: recognize empty flash with errors as empty'
patch from the ubi-2.6.git tree, because it solves one problem, but
introduces another, and needs more work, as you yourself pointed.

This is a series of patches which is intended to fix your problem.
Basically, the idea is that during scanning, we just remember the
information about which eraseblocks we found. Then at the end, we
look at them and decide what to do.

We do the following:

1. If there are more than 8 corrupted eraseblocks, we print a warning.
   This functionality was there before. This is just a warning, nothing
   else.
2. If more than 5% or eraseblocks are corrupted, we refuse. This logic
   was not there, I've just added it.
3. If now UBI-formatted eraseblocks were found, then we start checking
   whether this is empty device and we should format it. Otherwise, we
   go forward and try to attach the device.

   3.1 If there are not corrupted eraseblocks -> empty, format
   3.2 If there are few corrupted eraseblocks, all of them had read error
       -> empty, format. This is the place where we handle the "empty
       flash with few bad eraseblocks not marked yet as such"
   3.3 If there is a corrupted eraseblock, and there was not read error,
       or if there are many corrupted eraseblocks (>= 8), then we refuse.

Please, review and test the following series.

P.S. I gave it only a very quick try

Artem.
