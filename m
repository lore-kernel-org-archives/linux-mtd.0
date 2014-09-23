Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWYEe-0001wy-OO
 for linux-mtd@lists.infradead.org; Tue, 23 Sep 2014 22:07:01 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [RFC] UBI bitrot checking
Date: Wed, 24 Sep 2014 00:06:15 +0200
Message-Id: <1411509976-12636-1-git-send-email-richard@nod.at>
Cc: ricard.wanderlof@axis.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, aschmidt@dekaresearch.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a very initial draft for one possibility of bitrot checking in UBI.
The basic idea is to have a worker function which reads a complete PEB and
schedules scrubbing if bit flips are detected.
Currently this check is triggered by accessing any UBI debugfs file (yes, I'm lazy!).
We have to agree on an interface first.
Do we want a debugfs file? Another ioctl()?
Automatic in-kernel schedules?
Of course this interface has to return EBUSY if currently a check is running...

The current implementation has one limitation, it can only check PEBs which are used.
As of now ubi_wl_scrub_peb() works only for used PEBs but I think we could change that.

Thanks,
//richard
