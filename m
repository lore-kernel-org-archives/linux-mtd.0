Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EL7Fr-0007l0-8D
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 18:52:02 -0400
Received: by zproxy.gmail.com with SMTP id i11so817833nzh
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Sep 2005 15:51:50 -0700 (PDT)
Message-ID: <6934efce05092915519ffe76c@mail.gmail.com>
Date: Thu, 29 Sep 2005 15:51:50 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.63.0509221318180.18381@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
	<Pine.LNX.4.63.0509221318180.18381@localhost.localdomain>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: XIP fails on kernels 2.6.12 and higher
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If you can find the exact intermediate release between 2.6.11 and 2.6.12
> that broke it that would be extrelely helpful.

2.6.11.12 works and 2.6.12 does not.  I'll see if I can't find an
intermediate release.

> This is generic code so probably on all platforms.

In mm/bootmem.c free_all_bootmem_core() does not return.   It seems
after i hits 288 if I step I get a imprecise data abort.  It seems to
occur at the __ClearPageReserved() which is an inlined __clear_bit()
from include/asm/bitops.h.  It does this at somewhere around
page=3D0xC0042400 which seems perfectly normal and is readable/writeable
with the JTAG debugger.  Its really hard to replicate but it seems
like a LDR op code is always at fault.  I've tried 2 different
toolchains and compiling with -O0, while the LDR command was always a
little different it was basically a read to the same address range. =20
It is really baffling me.  Nothing seems wrong with what it is doing.=20
I almost suspect hardware.  I'm also testing on a Mainstone2 like
Alexey.  My OSK got destroyed.  Can somebody confirm xipImage of
2.6.12 fails to boot where 2.6.11 runs on a different hardware
platform?
