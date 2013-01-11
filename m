Received: from mail-da0-f44.google.com ([209.85.210.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtXUX-0006Ik-5F
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 05:49:22 +0000
Received: by mail-da0-f44.google.com with SMTP id z20so606249dae.31
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2013 21:49:18 -0800 (PST)
From: Daniel Tang <dt.tangr@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: Implementing NAND driver on a PrimeCell SMC PL350 series
Message-Id: <D9B11571-8012-4206-B903-A4C59B85F318@gmail.com>
Date: Fri, 11 Jan 2013 16:49:12 +1100
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to write a NAND driver for the PL350 memory controller.=20

The problem is that the memory controller abstracts quite a lot of the =
processes needed to access the NAND. For example, the controller handles =
all the hardware controlling (like dealing with the CLE and ALE lines). =
This makes it difficult to write a driver that integrates cleanly with =
the current NAND subsystem of the kernel.

The issue specifically is the cmd_ctrl function that my driver needs to =
provide. When the kernel needs to write a command and address, it calls =
the function multiple times to write all the information. E.g. set CLE, =
write command, set ALE, then write one byte of the page address at a =
time. The controller, on the other hand, needs all that information to =
be in a single write to the controller. It does this by embedding the =
command into the address and have the data value be the page address.

There is a flow chart on page 51 of the reference manual if this seems =
unclear =
(http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/DDI0380G_smc_pl=
350_series_r2p1_trm.pdf).

Can anyone advise what would be the best way to implement the driver?

Thanks,
Daniel=
