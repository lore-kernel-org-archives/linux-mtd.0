Received: from law14-oe31.law14.hotmail.com ([64.4.20.88] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Mhru-0001rm-38
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 06:28:26 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 2 Jun 2003 10:54:50 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE31sjvyJYwDs0002dc52@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: uclinux-dev@uclinux.org
Subject: mtd-utils/Makefile question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi folks ,
I am a newbie. One question

in mtd-utils/Makefile, y do we need BUILD_CC as gcc. Y not the target gcc
like m68k-elf-gcc.

I am asking this because in ntfl_format.c i get undefined _pread and
_pwrite. Now I know they are in libc so when I add -lc , it says libc is
incompatible. This is because libc.a was made with m68k-elf tools.


Kindly reply urgently.
I am extremly short of time
