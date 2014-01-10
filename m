Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1bFs-00088B-Kh
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2014 12:32:05 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Michel Benoit <michel@nube.nu>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: Emergency synch/umount/shutdown of UBIFS on NAND
Date: Fri, 10 Jan 2014 12:31:30 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FDD31DC@post.tritech.se>
References: <CAGw2PGGZ6eLWPjZgv-Qf0=3fjjitNz0XNzS-8dbDGUbKXPN2bQ@mail.gmail.com>
In-Reply-To: <CAGw2PGGZ6eLWPjZgv-Qf0=3fjjitNz0XNzS-8dbDGUbKXPN2bQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michel,=0A=
=0A=
UBIFS has a debugfs knob to switch it into read-only mode, see=0A=
"dfs_ro_error" in fs/ubifs/debug.h. Maybe you could let your interrupt=0A=
handler trigger this?=0A=
=0A=
Thinking about it, the ubi layer also has a background thread that may be=
=0A=
writing on it's own but the ubi_device struct (drivers/mtd/ubi/ubi.h) has a=
=0A=
ro_mode property...=0A=
=0A=
I don't say it will work but maybe it's something worth checking out?=0A=
=0A=
BR // Mats=0A=
=0A=
________________________________________=0A=
From: linux-mtd [linux-mtd-bounces@lists.infradead.org] on behalf of Michel=
 Benoit [michel@nube.nu]=0A=
Sent: Friday, January 10, 2014 9:44 AM=0A=
To: linux-mtd@lists.infradead.org=0A=
Subject: Emergency synch/umount/shutdown of UBIFS on NAND=0A=
=0A=
Hello mtd-list,=0A=
=0A=
We've got linux 3.10.x running on a custom board with Atmel=0A=
AT91SAM9X25 SoC and a 4Gb NAND from Micron (MT29F4G08ABADA).=0A=
=0A=
The NAND is formatted with UBIFS partitions for rootfs and a user=0A=
disk. The rootfs disk is RO and the user disk partition is R/W.=0A=
=0A=
The board is designed so that if the power supply suddenly drops the=0A=
CPU, RAM and NAND have ~50ms to perform an emergency shutdown.=0A=
=0A=
What can the kernel do in 50ms that minimizes the risk for problems=0A=
with UBI, UBIFS and the NAND?=0A=
=0A=
An interrupt input signal is activated when the voltage drops below=0A=
the critical level. Some options I have been considering are:=0A=
=0A=
- kernelspace notifies userspace which umounts the ubifs partitions=0A=
- call sync() from kernelspace=0A=
- call emergency_sync() from kernelspace=0A=
=0A=
The risk with these options is that there is no way to know if they=0A=
will complete i 50ms and they initiate activity on the NAND disk which=0A=
increases the risk that the NAND will be performing a program or erase=0A=
operation at the moment the power to CPU and NAND drop off after 50=0A=
ms.=0A=
=0A=
What I really want to do is tell the system to complete any ongoing=0A=
program or erase operations that affect the NAND and then block all=0A=
other operations.=0A=
=0A=
Is there support for this kind of emergency shutdown in UBIFS? Or does=0A=
that kind of shutdown belong at the MTD or NAND driver levels?=0A=
=0A=
Any other tips for how to handle emergency shutdown are appreciated.=0A=
=0A=
/Michel=0A=
=0A=
______________________________________________________=0A=
Linux MTD discussion mailing list=0A=
http://lists.infradead.org/mailman/listinfo/linux-mtd/=0A=
