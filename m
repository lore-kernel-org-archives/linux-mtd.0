Received: from mailout03.sul.t-online.com ([194.25.134.81])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BXSP8-0002Ww-3C
	for linux-mtd@lists.infradead.org; Mon, 07 Jun 2004 18:15:45 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Andriy Korud" <a.korud@vector.com.pl>,
 <linux-mtd@lists.infradead.org>
Date: Tue, 8 Jun 2004 00:10:08 +0200
References: <80908CC5B2C9DB47AAF8C77892FCB44315F7AD@lion.vector.com.pl>
In-Reply-To: <80908CC5B2C9DB47AAF8C77892FCB44315F7AD@lion.vector.com.pl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406080010.08485.tglx@linutronix.de>
Cc: 
Subject: Re: Unmarking bad blocks?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 07 June 2004 20:54, Andriy Korud wrote:
> Hi,
> after playing with mkfs.jffs2 and nandwrite a lot of blocks on my flash
> chip (Samsung 128Mb) become marked as bad (and I'm sure they were not bad
> at the beginning). Is it possible to 'unmark' them or should this chip is
> unusble anymore? flash_eraseall gives:

What does playing mean ?

> nand_erase: attempt to erase a bad block at page 0x00000000
> nand_erase: attempt to erase a bad block at page 0x00000040
> nand_erase: attempt to erase a bad block at page 0x00000080
> nand_erase: attempt to erase a bad block at page 0x000000c0
> ...

Thats odd.

> Even I commented out bad block checking in nand_erase(), flash_eraseall
> comlete successfully however blocks remain marked as bad.

Hmm, the erase command runs if you remove the bad block check in nand_erase=
()
inside the nand driver. So the blocks including the bad block marker should=
 be=20
erased.

NAND chip type ?
Bus width ?
Kernel version ?
MTD version ?

=2D-=20
Thomas
________________________________________________________________________
Steve Ballmer quotes the statistic that IT pros spend 70 percent of their=20
time managing existing systems. That couldn=92t have anything to do with=20
the fact that 99 percent of these systems run Windows, could it?
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
