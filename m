Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1XiH-0003HF-EV
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2014 08:45:10 +0000
Received: by mail-ob0-f182.google.com with SMTP id wn1so2500820obc.13
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2014 00:44:48 -0800 (PST)
MIME-Version: 1.0
Sender: murpme@gmail.com
Date: Fri, 10 Jan 2014 09:44:47 +0100
Message-ID: <CAGw2PGGZ6eLWPjZgv-Qf0=3fjjitNz0XNzS-8dbDGUbKXPN2bQ@mail.gmail.com>
Subject: Emergency synch/umount/shutdown of UBIFS on NAND
From: Michel Benoit <michel@nube.nu>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello mtd-list,

We've got linux 3.10.x running on a custom board with Atmel
AT91SAM9X25 SoC and a 4Gb NAND from Micron (MT29F4G08ABADA).

The NAND is formatted with UBIFS partitions for rootfs and a user
disk. The rootfs disk is RO and the user disk partition is R/W.

The board is designed so that if the power supply suddenly drops the
CPU, RAM and NAND have ~50ms to perform an emergency shutdown.

What can the kernel do in 50ms that minimizes the risk for problems
with UBI, UBIFS and the NAND?

An interrupt input signal is activated when the voltage drops below
the critical level. Some options I have been considering are:

- kernelspace notifies userspace which umounts the ubifs partitions
- call sync() from kernelspace
- call emergency_sync() from kernelspace

The risk with these options is that there is no way to know if they
will complete i 50ms and they initiate activity on the NAND disk which
increases the risk that the NAND will be performing a program or erase
operation at the moment the power to CPU and NAND drop off after 50
ms.

What I really want to do is tell the system to complete any ongoing
program or erase operations that affect the NAND and then block all
other operations.

Is there support for this kind of emergency shutdown in UBIFS? Or does
that kind of shutdown belong at the MTD or NAND driver levels?

Any other tips for how to handle emergency shutdown are appreciated.

/Michel
