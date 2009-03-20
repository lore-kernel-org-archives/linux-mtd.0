Received: from mail-qy0-f109.google.com ([209.85.221.109])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LkXPC-0000oV-Rv
	for linux-mtd@lists.infradead.org; Fri, 20 Mar 2009 05:36:37 +0000
Received: by qyk7 with SMTP id 7so1392629qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Mar 2009 22:36:29 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 19 Mar 2009 22:36:29 -0700
Message-ID: <a95a62fe0903192236x3e8ea891rb59e8758d5d20456@mail.gmail.com>
Subject: [PATCH 0/2] [MTD]: Extend ABI/utilities for >4GiB device support
	(take 2)
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	dwmw2@infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Based on feedback from this list, here is a new patch incorporating the
following changes from last time (kernel side):

Added compat_ioctls for all MTD ABI calls
Fixed erroneous uses of 32-bit masks on 64-bit flash offsets
Fixed incorrect user structure reference
Changed MEMREADOOB64 to store returned length in "length" element
Removed __user hack
Added padding to the end of each new struct
Added padding for 32-bit fields that may need to be widened someday
Added major/minor/patchlevel versions to mtd-abi.h
Added an ioctl to read the kernel's ABI version information

Here are the mtd-utils changes from last time:

Added ioctl wrappers to provide compatibility with the current ABI
Added memset() operations to clear the new reserved fields (W/WR)
Remove libmtd changes.  Not ready to integrate/test this yet.

Outstanding issues:

dwmw2, could you please comment on my sysfs/ioctl proposal here and let
me know if the patch is OK as it stands:

http://lists.infradead.org/pipermail/linux-mtd/2009-March/024901.html

Thanks.
