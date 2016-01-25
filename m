Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNp18-0003FZ-1l
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 21:49:46 +0000
Received: by mail-vk0-x231.google.com with SMTP id e64so82431683vkg.0
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2016 13:49:25 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 25 Jan 2016 15:49:24 -0600
Message-ID: <CA+EcR21bhLHtHxn=bWk7wQ6XQ=-o2F=bN466LNUx8VGeEu3XDA@mail.gmail.com>
Subject: mtd: gpmi: issue with raw access support
From: Han Xu <xhnjupt@gmail.com>
To: boris.brezillon@free-electrons.co,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie.huang@arm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

There is an issue on Kernel 4.1 with your gpmi raw access support
patch. I can understand with your implementation all data are stored
in BCH layout, even without HW ECC. But for NAND boot function on i.MX
family, it requires to write BOOT CONFIGURATION DATA at the beginning
of NAND chip, so ROM code could understand how to configure BCH
register to read data with proper ECC handling.

All these BOOT CONFIURATION DATA must be written with proper ROM
defined format, including data layout, parity checking algorithm( NOT
BCH ECC for some platforms). A user-space tool, named kobs-ng was
provided to generate all necessary data, and it called the mtd raw
functions to write the UNFORMATTED data to NAND chip.

With the new patch, all NAND boot function on kernel 4.1 failed since
ROM couldn't read the proper configuration. To solve the issue, I am
planning to export a switch in debugfs to let the user applications to
choose raw access mode, unformatted mode or BCH layout one, while I
got stuck.

The problem is how could I dynamically change the raw functions from
the new ones you provided to the default ones in nand_base. It more or
less a hacking either getting the pointer of functions
nand_read_page_raw /nand_write_page_raw or copy-pasting the implement
of these two functions to gpmi layer. So I was wondering if you have
any better idea for this issue? Thanks.
