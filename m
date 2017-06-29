Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQTN3-0008C8-Lh
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 06:56:10 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5T6s4gP142798
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 02:55:43 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bcvba0v9p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 02:55:43 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Thu, 29 Jun 2017 16:55:37 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5T6tQ3639518428
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 16:55:34 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v5T6t1im026221
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 16:55:01 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, stewart@linux.vnet.ibm.com
Subject: [PATCH 0/5] Allow opal-async waiters to get interrupted
Date: Thu, 29 Jun 2017 16:54:08 +1000
Message-Id: <20170629065413.19845-1-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patchset aims to solve the problem that currently all users of
the opal-async calls must use wait_event(), this may be undesirable
when there is a userspace process behind the request for the opal
call, if OPAL takes too long to complete the call then hung task
warnings will appear.

In order to solve the problem callers should use
wait_event_interruptible(), due to the interruptible nature of this
call the opal-async infrastructure needs to track extra state
associated with each async token, this is prepared for in patch 2/5.

Patch 3/5 attempts to provide a solution to the problem that the
powernv_flash MTD driver can use in patch 5/5.

Hello MTD folk, traditionally Michael Ellerman takes powernv_flash
driver patches through the powerpc tree, as always your feedback is
very welcome.

Thanks,

Cyril

Cyril Bur (5):
  powerpc/opal: Make __opal_async_{get,release}_token() static
  powerpc/opal: Rework the opal-async interface
  powerpc/opal: Add opal_async_wait_response_interruptible() to
    opal-async
  powerpc/powernv: Add OPAL_BUSY to opal_error_code()
  mtd: powernv_flash: Use opal_async_wait_response_interruptible()

 arch/powerpc/include/asm/opal.h             |   3 +-
 arch/powerpc/platforms/powernv/opal-async.c | 190 ++++++++++++++++++++--------
 arch/powerpc/platforms/powernv/opal.c       |   1 +
 drivers/mtd/devices/powernv_flash.c         |  18 ++-
 4 files changed, 151 insertions(+), 61 deletions(-)

-- 
2.13.2
