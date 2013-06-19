Received: from antispam01.maxim-ic.com ([205.153.101.182]
 helo=antispam01.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UpJAU-0004Rw-Ac
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2013 14:15:27 +0000
Received: from maxdalex01.maxim-ic.internal (maxdalex01.maxim-ic.internal
 [10.16.15.101]) by antispam01.maximintegrated.com with ESMTP id
 n42GFq897qyimFTb for <linux-mtd@lists.infradead.org>;
 Wed, 19 Jun 2013 09:14:56 -0500 (CDT)
From: Brian Foster <brian.foster@maximintegrated.com>
To: <linux-mtd@lists.infradead.org>
Subject: [Q] Using Micron 4-bit on-die ECC with v2.6.36 kernel?
Date: Wed, 19 Jun 2013 16:14:53 +0200
Message-ID: <17588192.75Agdljyqk@laclwks004>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 Our current reference Linux kernel for the MAX32590 (JIBE)
 is based on v2.6.36.  (Unfortunately, upgrading to a more
 recent version is not within the timeframe for solving the
 current problem.)  Our recent reference boards use one of
 those Micron NAND chips with an on-die 4-bit ECC, which we
 have basically ignored:  To-date, we have simply used the
 usual 1-bit ECC (i.e., living dangerously!).

 This must change, and indeed we now have a case on my desk
 where, had we been using the on-die ECC, it would have saved
 us a ton of grief.  The problem is our kernel version is far
 too old to take advantage of any of the recent-ish work for
 on-die ECC.

 Hence, I am looking into the possibility of adding on-die ECC
 support to our JIBE controller driver specifically for such
 NAND chips (or at least the specific Micron NAND chip on the
 reference boards).  Broadly, pretending JIBE's H/W directly
 supports on-die ECC, but actually doing the work in the driver.
 A similar trick we played in the past (bitwise-inverted ECC
 (now obsoleted and long-removed from the driver)) suggests
 this is not too difficult.

 I am looking for hints (suggestions), gotchas (warnings),
 and/or any examples of similar (or other plausible) approaches.
 Or for something I am overlooking in (or available for) kernels
 of approximately the vintage we are using.

Thanks & cheers!
	-blf-

p.s.  At the present time, I am not too interested in the
     problem of converting existing boards.  This MAY change
     as the scope and details of the solution become more
     apparent.

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
