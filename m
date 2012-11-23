Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tby4z-0000o1-QU
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 18:34:26 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so1784326iea.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2012 10:34:18 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 23 Nov 2012 19:34:18 +0100
Message-ID: <CAAXf6LU86rF1tkx-SRLup8rpvVG9cgD_nryn8UZG45-c7+FpRg@mail.gmail.com>
Subject: Handling bus locking of CFI Flash devices
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have an embedded PowerPC system with a CFI Flash located on the local bus.
Additionally, there is a control device with a 'flash-write-protect'
feature. By default, no writes can happen to the flash device on the
local bus, unless the flash-write-protect bit is cleared.

This also means that detection of the flash chip using CFI commands
will fail by default, as this incurs write operations to the bus.

Note that this flash-write-protect is different from the standard
flash 'lock/unlock' feature. The former is implemented on a specific
control logic chip of the board, while the latter is part of the flash
chip/controller itself.

My question is: what is the best way to handle this flash-write-protect bit?
Right now, I am simply clearing the bit before booting the kernel,
which means that all write access to the flash is allowed. While this
works, it completely bypasses the protection feature.
Is there already a place in the MTD subsystem to handle such a
flash-write-protect bit, for example a hook that can be implemented
for a particular board?
If not, how do you suggest I proceed?

Thanks,
Thomas
