Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztbnt-0002sp-Mx
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 13:39:14 +0000
Date: Tue, 3 Nov 2015 14:38:50 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Richard Weinberger <richard@nod.at>, Elie De Brauwer
 <eliedebrauwer@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian
 Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org, Huang
 Shijie <shijie.huang@arm.com>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
Message-ID: <20151103143850.45c4ded9@bbrezillon>
In-Reply-To: <CAJ+vNU3Y_SnLSAojp3-hXxR02dtfX5n78GkS6Zt-izDZMh2msQ@mail.gmail.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
 <562E9E0B.5030204@nod.at>
 <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
 <562FD60E.9020807@nod.at>
 <CAJ+vNU28eboKDTei09-rjWOTJ_17CPQ0+UxpOOuc0cr_kj0qhw@mail.gmail.com>
 <CAJ+vNU3Y_SnLSAojp3-hXxR02dtfX5n78GkS6Zt-izDZMh2msQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tim,

On Mon, 2 Nov 2015 12:31:11 -0800
Tim Harvey <tharvey@gateworks.com> wrote:

> On Mon, Nov 2, 2015 at 12:27 PM, Tim Harvey <tharvey@gateworks.com> wrote:
> > [    8.635364] UBIFS (ubi0:0): recovery needed
> > [    8.676203] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> > reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
> > [    8.692460] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> > reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
> > [    8.708741] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> > reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
> > ^^^^ non correctable ecc error on PEB 2254  - I verified that this was
> > not the first time this PEB has been used

I suspect one of the bit in PEB 2254 to be stuck at 0 (even after
erasing the block the bit stays at 0). Have you tried to erase this
block (flash_erase /dev/mtd2 0x23380000 1) and dump it in raw mode
(nanddump -n -l 0x40000 -s 0x23380000 -f /tmp/dump /dev/mtd2)?

> >
> > I've cc'd Huang, Elie, and Brian who were involved in the patch to
> > detect bit-flips in gpmi-nand.c reads - perhaps they have some more
> > ideas. I find it interesting that in one case that patch resolves the
> > issue and in the other it does not.

I posted a slightly reworked version of Huang's patch [1] a while ago
addressing the "account for bitflips in OOB area" problem, but maybe we
could do better (avoid this extra "read in raw mode" step, or use the
generic nand_check_erased_ecc_chunk() function when ECC bytes are
aligned).

Best Regards,

Boris

[1]https://patchwork.ozlabs.org/patch/416543/

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
