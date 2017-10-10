Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1lIh-0002jr-CT
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 03:33:49 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9A3TFYM112171
 for <linux-mtd@lists.infradead.org>; Mon, 9 Oct 2017 23:33:25 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dgcac3tfp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2017 23:33:25 -0400
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Tue, 10 Oct 2017 04:33:24 +0100
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9A3XJnW17957102
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 03:33:21 GMT
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v9A3XCnP003725
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 14:33:12 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, sjitindarsingh@gmail.com
Subject: [PATCH v4 00/10] Allow opal-async waiters to get interrupted
Date: Tue, 10 Oct 2017 14:32:52 +1100
Message-Id: <20171010033302.20854-1-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

V4: Rework and rethink.

To recap:
Userspace MTD read()s/write()s and erases to powernv_flash become
calls into the OPAL firmware which subsequently handles flash access.
Because the read()s, write()s or erases can be large (bounded of
course my the size of flash) OPAL may take some time to service the
request, this causes the powernv_flash driver to sit in a wait_event()
for potentially minutes. This causes two problems, firstly, tools
appear to hang for the entire time as they cannot be interrupted by
signals and secondly, this can trigger hung task warnings. The correct
solution is to use wait_event_interruptible() which my rework (as part
of this series) of the opal-async infrastructure provides.

The final patch in this series achieves this. It should eliminate both
hung tasks and threads locking up.

Included in this series are other simpler fixes for powernv_flash:

Don't always return EIO on error. OPAL does mutual exclusion on the
flash and also knows when the service processor takes control of the
flash, in both of these cases it will return OPAL_BUSY, translating
this to EIO is misleading to userspace.

Handle receiving OPAL_SUCCESS when it expects OPAL_ASYNC_COMPLETION
and don't treat it as an error. Unfortunately there are too many drivers
out there with the incorrect behaviour so this means OPAL can never
return anything but OPAL_ASYNC_COMPLETION, this shouldn't prevent the
code from being correct.

Don't return ERESTARTSYS if token acquisition is interrupted as
powernv_flash can't be sure it hasn't already performed some work, let
userspace deal with the problem.

Change the incorrect use of BUG_ON() to WARN_ON() in powernv_flash.

Not for powernv_flash, a fix from Stewart Smith which fits into this
series as it relies on my improvements to the opal-async
infrastructure.

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
  mtd: powernv_flash: Don't treat OPAL_SUCCESS as an error
  mtd: powernv_flash: Remove pointless goto in driver init
  mtd: powernv_flash: Don't return -ERESTARTSYS on interrupted token
    acquisition
  powerpc/opal: Make __opal_async_{get,release}_token() static
  powerpc/opal: Rework the opal-async interface
  powerpc/opal: Add opal_async_wait_response_interruptible() to
    opal-async
  powerpc/powernv: Add OPAL_BUSY to opal_error_code()
  mtd: powernv_flash: Use opal_async_wait_response_interruptible()

Stewart Smith (1):
  powernv/opal-sensor: remove not needed lock

 arch/powerpc/include/asm/opal.h              |   4 +-
 arch/powerpc/platforms/powernv/opal-async.c  | 183 +++++++++++++++++++--------
 arch/powerpc/platforms/powernv/opal-sensor.c |  17 +--
 arch/powerpc/platforms/powernv/opal.c        |   2 +
 drivers/mtd/devices/powernv_flash.c          |  83 +++++++-----
 5 files changed, 194 insertions(+), 95 deletions(-)

-- 
2.14.2
