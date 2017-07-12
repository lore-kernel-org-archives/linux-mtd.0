Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dV9DA-0007Dy-LU
 for linux-mtd@lists.infradead.org; Wed, 12 Jul 2017 04:25:18 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6C4Nj4n111023
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:24:54 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bncj4r9w9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:24:54 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Wed, 12 Jul 2017 14:24:52 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6C4OgfZ23003240
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:24:50 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v6C4NrJG009161
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:23:54 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: benh@kernel.crashing.org, stewart@linux.vnet.ibm.com, dwmw2@infradead.org,
 rlippert@google.com, alistair@popple.id.au
Subject: [PATCH v3 00/10] Allow opal-async waiters to get interrupted
Date: Wed, 12 Jul 2017 14:22:54 +1000
Message-Id: <20170712042304.19745-1-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

V3: export opal_error_code() so that powernv_flash can be built=m

Hello,

Version one of this series ignored that OPAL may continue to use
buffers passed to it after Linux kfree()s the buffer. This version
addresses this, not in a particularly nice way - future work could
make this better. This version also includes a few cleanups and fixups
to powernv_flash driver one along the course of this work that I
thought I would just send.

The problem we're trying to solve here is that currently all users of
the opal-async calls must use wait_event(), this may be undesirable
when there is a userspace process behind the request for the opal
call, if OPAL takes too long to complete the call then hung task
warnings will appear.

In order to solve the problem callers should use
wait_event_interruptible(), due to the interruptible nature of this
call the opal-async infrastructure needs to track extra state
associated with each async token, this is prepared for in patch 6/10.

While I was working on the opal-async infrastructure improvements
Stewart fixed another problem and he relies on the corrected behaviour
of opal-async so I've sent it here.

Hello MTD folk, traditionally Michael Ellerman takes powernv_flash
driver patches through the powerpc tree, as always your feedback is
very welcome.

Thanks,

Cyril

Cyril Bur (9):
  mtd: powernv_flash: Use WARN_ON_ONCE() rather than BUG_ON()
  mtd: powernv_flash: Lock around concurrent access to OPAL
  mtd: powernv_flash: Don't treat OPAL_SUCCESS as an error
  mtd: powernv_flash: Remove pointless goto in driver init
  powerpc/opal: Make __opal_async_{get,release}_token() static
  powerpc/opal: Rework the opal-async interface
  powerpc/opal: Add opal_async_wait_response_interruptible() to
    opal-async
  powerpc/powernv: Add OPAL_BUSY to opal_error_code()
  mtd: powernv_flash: Use opal_async_wait_response_interruptible()

Stewart Smith (1):
  powernv/opal-sensor: remove not needed lock

 arch/powerpc/include/asm/opal.h              |   4 +-
 arch/powerpc/platforms/powernv/opal-async.c  | 188 +++++++++++++++++++--------
 arch/powerpc/platforms/powernv/opal-sensor.c |  17 +--
 arch/powerpc/platforms/powernv/opal.c        |   2 +
 drivers/mtd/devices/powernv_flash.c          |  66 +++++++---
 5 files changed, 191 insertions(+), 86 deletions(-)

-- 
2.13.2
