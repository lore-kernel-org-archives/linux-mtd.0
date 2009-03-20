Received: from mail-qy0-f109.google.com ([209.85.221.109])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lkmql-0000pk-2u
	for linux-mtd@lists.infradead.org; Fri, 20 Mar 2009 22:06:09 +0000
Received: by qyk7 with SMTP id 7so1826458qyk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Mar 2009 15:05:58 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 20 Mar 2009 15:05:58 -0700
Message-ID: <a95a62fe0903201505u3993022we6bfe3014abc1a99@mail.gmail.com>
Subject: [PATCH 0/2] [MTD]: Extend ABI/utilities for >4GiB device support
	(take 3)
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: linux-mtd@lists.infradead.org
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

Here is a new set of patches incorporating the following changes from
the "take 2" postings:

Kernel:

Move new compat_ioctl code into fs/compat_ioctl.c
Undo mtdchar.c ioctl refactoring
Remove ioctl versioning

mtd-utils:

Change ABI version autodetection
Add explicit casts to avoid format string warnings on 64-bit platforms
