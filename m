Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140uNs-0005zf-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 23:42:00 +0000
Received: from hybrid-024-221-181-223.ca.sprintbbd.net ([24.221.181.223] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140uNq-0005zZ-00
	for mtd@infradead.org; Tue, 28 Nov 2000 23:41:58 +0000
Message-ID: <3A244346.12F3235B@mvista.com>
Date: Tue, 28 Nov 2000 15:44:06 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: mtd@infradead.org, ahennessy@mvista.com
Subject: Big Endian issues
References: <0FA1031B65A9D111960900805F9FA8E103B9F1C0@txexmta8.amd.com> <3A14638F.8EBE29DA@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello all,

I need some advice regarding my big endian arch (ppc). I am using
cfi_cmdset_0002.c  and there is
a built-in assumption that  words will be swapped when reading and writing to
a little endian device.
This assumption is present in cfi_build_cmd and in cfi_probe_new_chip.  Both
of these (in my configuration)
use map->write32 and map->read32 when dealing with commands and status
words.   This seems reasonable.

In dealing with data, however, map->write32 is used in writes but
map->copy_from is used in reads.
So, the assumption I assume is that map->copy_from will also swap bytes.
But in my environment,
map->copy_from (memcpy_fromio) doesn't swap bytes.  I don't think it needs to
if we make use of
map->copy_to (memcpy_toio)  when writing data (in amd_write_val and in the
immediate data check). In this case, copy_from and copy_to functions just
need to be consistent.

Any opinions?   Anyone else get this to work with big endian?
Is a change needed in my memcpy_fromio?

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
