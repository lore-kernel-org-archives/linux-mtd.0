Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vpMr-0003Ri-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 00:52:13 +0100
Message-ID: <3AF3414F.967F95DF@mvista.com>
Date: Fri, 04 May 2001 16:54:55 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: "Fry, Dan" <dfry@bb.directv.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: Improper Command Sequence
References: <617933180D08D311AB500090273F1F96016767DE@storm.corp.directvbroadband.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

"Fry, Dan" wrote:

> Hi List,
>
> I'm still trying to get JFFS2 up and running on an atlas demo board.
>
> I have four 64Mbit Intel Strata Flash chips which are seemly being detected.
>
> physmap flash device: 2000000 at 1c000000
> Physically mapped flash: Found 2 x16 devices at 0x0 in 32-bit mode
>
> Physically mapped flash: Found 2 x16 devices at 0x1000000 in 32-bit mode
>
> JEDEC ID: 89 15
>
> 0: offset=0x0,size=0x40000,blocks=64
>
> 1: offset=0x1000000,size=0x40000,blocks=64
>
> However when I attempt to mount /dev/mtdblock0/ as JFFS2 I get the
> following:
>
> JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x00100000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x00140000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x00180000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x001c0000 is not formatted. It will be erased
>
> JFFS2: Erase block at 0x00200000 is not formatted. It will be erased
>
> Chip reports improper command sequence: status 0xa800a8

>
>
> Erase at 0x01fc0000 failed immediately: -5
>
> Chip reports improper command sequence: status 0xa800a8
>
> Erase at 0x01f80000 failed immediately: -5
>
> Chip reports improper command sequence: status 0xa800a8
>
> Erase at 0x01f40000 failed immediately: -5
>
> Chip reports improper command sequence: status 0xa800a8
>
> Erase at 0x01f00000 failed immediately: -5
>
> Chip reports improper command sequence: status 0xa800a8
>
> Erase at 0x01ec0000 failed immediately: -5
>
> Chip reports improper command sequence: status 0xa800a8
>
> Erase at 0x01e80000 failed immediately: -5
>
> Questions :
> 1) Does MTD support Intel Strata Flash??

Yes, it does.
a800a8 looks like the error status for low programming voltage detected -
you need to add some code to handle set_vpp (and unset_vpp) for your board.
The Intel Strata
allows the board designer to add an extra layer of data protection by making
the Vpen signal switchable or hardwired to Vpenh.   When Vpen < Vpenh, memory
cannot be written or erased.  Looks like your board is switchable, ie. you need
to set
and unset Vpen via software.

Alice

>
> 2) Could there be a locking problem?
> -- I looked through the code and it seems that locking is handled.
>
> Cheers,
>
>         - Dan
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
