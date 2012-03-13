Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7KYR-0002zm-OU
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 05:45:52 +0000
Received: from beldin.local (unknown
 [IPv6:2a01:e35:2f37:a360:ea11:32ff:fe70:ee3e])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 50CD99400B3
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2012 06:45:44 +0100 (CET)
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: MTD API locking and concurrency
Date: Tue, 13 Mar 2012 06:45:24 +0100
Message-ID: <87obs1rr4b.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I came across a concurrent usage of my MTD driver by UBIFS by doing
an IOC_UBI_UPVOL. As my chip doesn't support multiple requests at a time, I need
to protect the access to chip registers.

I wonder if mtd api function can be called in interrupt context. My wish would
be to use mutexes, but I have to be sure there is no interrupt path I have not
seen. The only thing I'm certain is that my MTD drivers doesn't handle
interrupts, so the interrupt won't come from him.

Is there a guarantee that mtd api functions are called with !in_interrupt() ?

Cheers.

-- 
Robert
