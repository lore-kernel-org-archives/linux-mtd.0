Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zylij-0005CE-RR
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 19:15:14 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 121EF24E0002
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 20:14:50 +0100 (CET)
Received: from dw-book (80-110-107-146.cgn.dynamic.surfer.at [80.110.107.146])
 by mail.sigma-star.at (Postfix) with ESMTPSA id AD95024E0001
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 20:14:48 +0100 (CET)
Date: Tue, 17 Nov 2015 20:14:48 +0100
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC] Trace-events for mtd
Message-ID: <20151117191448.GA5367@dw-nb.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I currently working on ways to find out
if any processes are producing heavy I/O
loads on a mtd device.
I've implemented traceevents for mtd_read and
mtd_write which allow us to at least get a
rough overview on the read/write load.
Although it kinda works, I could not find a
way to find out which processes actually produce
write load, since all writes are writebacks from
page_cache and therefor we mostly get a kworker thread
as the main origin of any write load.

I wanted to reach out to the broader community to find
out if I missed somethings and to get overall feedback
if more traceevents would be useful to help us
debugging mtd i/o a little bit better.

any comments are highly appreciated.

Cheers,

daniel
