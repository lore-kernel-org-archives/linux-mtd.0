Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KB6XQ-0004Y0-6l
	for linux-mtd@lists.infradead.org; Tue, 24 Jun 2008 11:18:16 +0000
Content-Type: text/plain; charset="us-ascii"
Date: Tue, 24 Jun 2008 13:18:12 +0200
From: "Rossen Georgiev" <rz70@gmx.at>
Message-ID: <20080624111812.189860@gmx.net>
MIME-Version: 1.0
Subject: How to use REAL "Anonymous Memory"? 
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I am trying to use an "Anonymous Memory" with PCMCIA - kernel
version 2.6.23.16 and pcmciautils-014.

The HW configuration is as follow:

Yenta: CardBus bridge found at 0000:00:0a.0 [3412:7856]
Yenta: ISA IRQ mask 0x02a0, PCI irq 12
Socket status: 30000059
Yenta: CardBus bridge found at 0000:00:0a.1 [3412:7856]
Yenta: ISA IRQ mask 0x02a0, PCI irq 15
Socket status: 30000059


On Socket 0 a CF is pluged in.
On Socket 1 a "REAL" "Anonymous Memory is pluged in.
There is NO CIS for the anonymous memory.

When the pcmcia-socket-startup is done for Socket 0,
the CF is properly found and mapped to ide-cs driver.

The kernel is started with following parameters:

 pcmcia_core.pc_debug=5 pcmcia.pc_debug=5 yenta_socket.pc_debug=5


When the pcmcia-socket-startup is done for Socket 1,
the kernel report following problem:


Mar 10 12:24:37 platf106 kernel: cs: IO port probe 0xa00-0xaff: clean.
Mar 10 12:24:39 platf106 kernel: cs: IO port probe 0x1000-0x17ff: clean.
Mar 10 12:24:46 platf106 kernel: ds: re-scanning socket 1
Mar 10 12:24:46 platf106 kernel: cs: memory probe 0xa0000000-0xa0ffffff:<7>cs: pcmcia_socket1: pcmcia_read_cis_mem(1, 0x0, 2)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x00 0xe0 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(0, 0x0, 5)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x33 0x33 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(1, 0x0, 2)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x00 0xc0 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(0, 0x0, 5)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x33 0x33 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(1, 0x0, 2)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x00 0x00 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(0, 0x0, 5)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x33 0x33 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(1, 0x0, 2)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x00 0xe0 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(0, 0x0, 5)
....
....
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x33 0x33 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(1, 0x0, 2)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x00 0x00 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(0, 0x0, 5)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x33 0x33 ...
Mar 10 12:24:46 platf106 kernel:  excluding 0xa0000000-0xa01fffff
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(1, 0x0, 2)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0xc5 0x80 ...
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1: pcmcia_read_cis_mem(0, 0x0, 5)
Mar 10 12:24:46 platf106 kernel: cs: pcmcia_socket1:   0xff 0xff 0x33 0x33 ...
Mar 10 12:24:46 platf106 kernel: ds: invalid CIS or invalid resources
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   

Having a look into drivers/pcmcia/

static int pcmcia_card_add(struct pcmcia_socket *s)
{
	......

	ret = pccard_validate_cis(s, BIND_FN_ALL, &cisinfo);
	if (ret || !cisinfo.Chains) {
		ds_dbg(0, "invalid CIS or invalid resources\n");
		return -ENODEV;
	}
        .......
}

and from drivers/pcmcia/cistpl.c

/*======================================================================

    This tries to determine if a card has a sensible CIS.  It returns
    the number of tuples in the CIS, or 0 if the CIS looks bad.  The
    checks include making sure several critical tuples are present and
    valid; seeing if the total number of tuples is reasonable; and
    looking for tuples that use reserved codes.
    
======================================================================*/

int pccard_validate_cis(struct pcmcia_socket *s, unsigned int function, cisinfo_t *info)



So, acordind to the code when a PCMCIA card does have bad CIS or NO CIS at all,
it will be not added and mapped to corresponding driver.

So my question is if there is a way to handle an Anonymous Memory 
with the the 2.6.x kernels and pcmciautils? I did search in pcmcia mailing list, but did not find anything about. Does somebody use such "Anonymous Memory"?

As experiment I did comment out the "return -ENODEV" in ds.c.
( which is not very correct from programming style ) and
the nulled cisinfo_t cisinfo reports "Anonymous memory" CIS.
Then the "Anonymous memory" was mapped successfully to pcmciamtd and map_mem
drivers. But this is not a solution coming from main stream kernel.


Thank you for your time!
Rossen


-- 
GMX startet ShortView.de. Hier findest Du Leute mit Deinen Interessen!
Jetzt dabei sein: http://www.shortview.de/?mc=sv_ext_mf@gmx
