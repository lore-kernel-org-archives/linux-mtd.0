Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vakp4-0002D5-0r
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 11:17:28 +0000
Received: by mail-lb0-f176.google.com with SMTP id z5so2645558lbh.7
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2013 04:17:02 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 28 Oct 2013 12:17:02 +0100
Message-ID: <CAAQYJAtGEVUY98Z1gthPbYCMG_A8yWC-d+c-bJeGWUhTF0WbVw@mail.gmail.com>
Subject: Issues unlocking LH28F640BF NOR flash
From: Andrea Adami <andrea.adami@gmail.com>
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

Hi all,

I'm trying to fixup the flash on the Zaurus SL-5500 that is locked on boot.

The 2 chips are 4Mbix16 LH28F640BFHE-PTTL90 on a 32 bit wide bus
(sa1100) and they appear interleaved: D0-D15 on one chip and D16-D31
on the other.
The specifics don't even mention an 8bit mode. See [1] and [2].
Primary command set (16bit Vendor ID 0003H) so it is Sharp, detected
as Intel P_ID_INTEL_STD even if it seems explicitely Extended...the
Sharp-specific extended query is: major 1  minor  3

With jedec_probe they are detected as expected with interleave of 2
and buswidth of 32bit, see logs [3].

I need to boot from flash so all the drivers are compiled in kernel.
Now the issue is that from userspace flash_unlock /dev/mtd2 stalls and
doesn't finish.
>From the kernel side, I've managed to add a fixup for this Sharp chip
(standard fixup is only for CFI_MFR_INTEL /Strataflash) to
jedec_fixup_table and to countertest I've even hacked
uapi/mtd/mtd-abi.h and added MTD_POWERUP_LOCK to MTD_CAP_NORFLASH.

Strangely all is fine when the cfi/jedec drivers and the sa1100 map
are compiled as modules,  otherwise the kernel won't finish boot (as
from userspace).

How can that happen?

Thanks in advance for your help

Andrea

P.S.
Once done I'll try to see why CFI detection fails on gen_probe:
gen_probe:genprobe_ident_chips: CFI: Found no sa1100-0 device at location zero

[1] Datasheet v. 2.41
http://www.datasheetarchive.com/dlmain/Datasheets-314/276727.pdf

[2] Appendix v. 2.44
http://www.datasheetarchive.com/dl/Datasheet-019/DSA00340384.pdf

[3]
root@collie:~# depmod -a
root@collie:~# modprobe cfi_util dyndbg==pmf
root@collie:~# modprobe cfi_cmdset_0001 dyndbg==pmf
root@collie:~# modprobe gen_probe dyndbg==pmf
root@collie:~# modprobe cfi_probe dyndbg==pmf
root@collie:~# modprobe jedec_probe dyndbg==pmf
root@collie:~# modprobe sa1100_flash dyndbg==pmf
jedec_probe:jedec_reset: reset unlock called 555 2aa
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(1)
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_reset: reset unlock called 555 aaa
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(1)
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_reset: reset unlock called 5555 2aaa
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(1)
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_reset: reset unlock called aaa 554
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(1)
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_reset: reset unlock called aaa 555
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(1)
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_reset: reset unlock called aaaa 5555
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(1)
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(1)
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_match: jedec_match(): ID is not 8bit
jedec_probe:jedec_reset: reset unlock called 2aa 155
jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(2)
jedec_probe:jedec_reset: reset unlock called 2aa 555
jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(2)
jedec_probe:jedec_reset: reset unlock called 2aaa 1555
jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(2)
jedec_probe:jedec_reset: reset unlock called 555 2aa
jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(2)
jedec_probe:jedec_reset: reset unlock called 555 2aa
jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(2)
jedec_probe:jedec_reset: reset unlock called 5555 2aaa
jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(2)
jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(2)
jedec_probe:jedec_reset: reset unlock called 155 aa
jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) type(4)
jedec_probe:jedec_reset: reset unlock called 155 2aa
jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) type(4)
jedec_probe:jedec_reset: reset unlock called 1555 aaa
jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) type(4)
jedec_probe:jedec_reset: reset unlock called 2aa 155
jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) type(4)
jedec_probe:jedec_reset: reset unlock called 2aa 155
jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) type(4)
jedec_probe:jedec_reset: reset unlock called 2aaa 1555
jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) type(4)
jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) type(4)
jedec_probe:jedec_reset: reset unlock called 2aa 155
jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(2) type(2)
jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
0x00800000 = 0x00800000
jedec_probe:jedec_match: MTD jedec_match(): check unlock addrs 0x02aa 0x0155
jedec_probe:jedec_match: MTD jedec_match(): check ID's disappear when
not in ID mode
jedec_probe:jedec_reset: reset unlock called 2aa 155
jedec_probe:jedec_match: MTD jedec_match(): return to ID mode
jedec_probe:jedec_probe_chip: MTD jedec_probe_chip(): matched device
0xb0,0xb0 unlock_addrs: 0x02aa 0x0155
Found: LH28F640BF
sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank
sa1100-0: Found different chip or no chip at all (mfr 0x4, id 0x3001)
at 0x1000000
erase region 0: offset=0x0,size=0x20000,blocks=127
erase region 1: offset=0xfe0000,size=0x4000,blocks=8
SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
Creating 3 MTD partitions on "sa1100":
0x000000000000-0x0000000c0000 : "bootloader"
0x0000000c0000-0x0000001c0000 : "kernel"
0x0000001c0000-0x000000fe0000 : "rootfs"
root@collie:~#
