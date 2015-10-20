Received: from mail-lb0-f171.google.com ([209.85.217.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoXx2-0003gc-4C
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 14:31:48 +0000
Received: by lbbwb3 with SMTP id wb3so16734203lbb.1
 for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2015 07:31:21 -0700 (PDT)
From: Simon Falsig <simon@newtec.dk>
MIME-Version: 1.0
Date: Tue, 20 Oct 2015 16:31:20 +0200
Message-ID: <9d83b70759c3d2507200432b4ff162be@mail.gmail.com>
Subject: mmap support for m25p80 device
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm currently working on a new custom board (with a TI AM3356 ARM-Cortex
A8
CPU), with a 32 kB Everspin MR25H256 MRAM chip, attached over SPI. It
works
fine using the m25p80 driver, but I was wondering how complex it would be
to
add the possibility of memory-mapping the device in userspace? - mainly to
make the interface consistent with the board that it is replacing, which
uses
a different, mmap-able, RAM chip.

I'm not very experienced in the deeper aspects of the kernel, but I've
been
poking around a bit in the mtd subsystem, and it seems as if the main
thing
that is missing, is a valid get_unmapped_area() function for the m25p80
driver, and then to change the mtdchar_mmap() function (in mtdchar.c) to
actually allow mmap'ing on MMU systems.

But - does it even make sense to create such a function for m25p80? - and
how would I start?

Any pointers and/or comments are appreciated!
Thanks and best regards,
Simon Falsig
simon@newtec.dk
