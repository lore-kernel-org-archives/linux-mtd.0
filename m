Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vei2u-0006Nv-W4
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 09:08:08 +0000
Received: by mail-la0-f44.google.com with SMTP id er20so1537947lab.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 01:07:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAQYJAv9FF2mmQp6fUWBkAsrWkz8dDgerpi8YrT2qaW9TiSUdA@mail.gmail.com>
References: <CAAQYJAtGEVUY98Z1gthPbYCMG_A8yWC-d+c-bJeGWUhTF0WbVw@mail.gmail.com>
 <CAAQYJAuq7X7vuKWJk3Uts0wfHGtHt3OQAtTh+7sZasq2XLA+EQ@mail.gmail.com>
 <CAAQYJAv9FF2mmQp6fUWBkAsrWkz8dDgerpi8YrT2qaW9TiSUdA@mail.gmail.com>
Date: Fri, 8 Nov 2013 10:07:39 +0100
Message-ID: <CAAQYJAufuPbjx4z3nQEX6wU=kwj14eXGVpi0pWF7WURD30Lbrw@mail.gmail.com>
Subject: Re: Issues unlocking LH28F640BF NOR flash
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 7, 2013 at 11:53 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Wed, Nov 6, 2013 at 10:32 AM, Andrea Adami <andrea.adami@gmail.com> wr=
ote:
>> On Mon, Oct 28, 2013 at 12:17 PM, Andrea Adami <andrea.adami@gmail.com> =
wrote:
>>> Hi all,
>>>
>>> I'm trying to fixup the flash on the Zaurus SL-5500 that is locked on b=
oot.
>>>
>>> The 2 chips are 4Mbix16 LH28F640BFHE-PTTL90 on a 32 bit wide bus
>>> (sa1100) and they appear interleaved: D0-D15 on one chip and D16-D31
>>> on the other.
>>> The specifics don't even mention an 8bit mode. See [1] and [2].
>>> Primary command set (16bit Vendor ID 0003H) so it is Sharp, detected
>>> as Intel P_ID_INTEL_STD even if it seems explicitely Extended...the
>>> Sharp-specific extended query is: major 1  minor  3
>>>
>>> With jedec_probe they are detected as expected with interleave of 2
>>> and buswidth of 32bit, see logs [3].
>>>
>>> I need to boot from flash so all the drivers are compiled in kernel.
>>> Now the issue is that from userspace flash_unlock /dev/mtd2 stalls and
>>> doesn't finish.
>>> From the kernel side, I've managed to add a fixup for this Sharp chip
>>> (standard fixup is only for CFI_MFR_INTEL /Strataflash) to
>>> jedec_fixup_table and to countertest I've even hacked
>>> uapi/mtd/mtd-abi.h and added MTD_POWERUP_LOCK to MTD_CAP_NORFLASH.
>>>
>>> Strangely all is fine when the cfi/jedec drivers and the sa1100 map
>>> are compiled as modules,  otherwise the kernel won't finish boot (as
>>> from userspace).
>>>
>>> How can that happen?
>>>
>>> Thanks in advance for your help
>>>
>>> Andrea
>>>
>>> P.S.
>>> Once done I'll try to see why CFI detection fails on gen_probe:
>>> gen_probe:genprobe_ident_chips: CFI: Found no sa1100-0 device at locati=
on zero
>>>
>>> [1] Datasheet v. 2.41
>>> http://www.datasheetarchive.com/dlmain/Datasheets-314/276727.pdf
>>>
>>> [2] Appendix v. 2.44
>>> http://www.datasheetarchive.com/dl/Datasheet-019/DSA00340384.pdf
>>>
>>> [3]
>>> root@collie:~# depmod -a
>>> root@collie:~# modprobe cfi_util dyndbg=3D=3Dpmf
>>> root@collie:~# modprobe cfi_cmdset_0001 dyndbg=3D=3Dpmf
>>> root@collie:~# modprobe gen_probe dyndbg=3D=3Dpmf
>>> root@collie:~# modprobe cfi_probe dyndbg=3D=3Dpmf
>>> root@collie:~# modprobe jedec_probe dyndbg=3D=3Dpmf
>>> root@collie:~# modprobe sa1100_flash dyndbg=3D=3Dpmf
>>> jedec_probe:jedec_reset: reset unlock called 555 2aa
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(=
1)
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_reset: reset unlock called 555 aaa
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(=
1)
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_reset: reset unlock called 5555 2aaa
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(=
1)
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_reset: reset unlock called aaa 554
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(=
1)
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_reset: reset unlock called aaa 555
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(=
1)
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_reset: reset unlock called aaaa 5555
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(=
1)
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type(=
1)
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(=
2)
>>> jedec_probe:jedec_reset: reset unlock called 2aa 555
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(=
2)
>>> jedec_probe:jedec_reset: reset unlock called 2aaa 1555
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(=
2)
>>> jedec_probe:jedec_reset: reset unlock called 555 2aa
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(=
2)
>>> jedec_probe:jedec_reset: reset unlock called 555 2aa
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(=
2)
>>> jedec_probe:jedec_reset: reset unlock called 5555 2aaa
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(=
2)
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type(=
2)
>>> jedec_probe:jedec_reset: reset unlock called 155 aa
>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) t=
ype(4)
>>> jedec_probe:jedec_reset: reset unlock called 155 2aa
>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) t=
ype(4)
>>> jedec_probe:jedec_reset: reset unlock called 1555 aaa
>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) t=
ype(4)
>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) t=
ype(4)
>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) t=
ype(4)
>>> jedec_probe:jedec_reset: reset unlock called 2aaa 1555
>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) t=
ype(4)
>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) t=
ype(4)
>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(2) type(=
2)
>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>> 0x00800000 =3D 0x00800000
>>> jedec_probe:jedec_match: MTD jedec_match(): check unlock addrs 0x02aa 0=
x0155
>>> jedec_probe:jedec_match: MTD jedec_match(): check ID's disappear when
>>> not in ID mode
>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>> jedec_probe:jedec_match: MTD jedec_match(): return to ID mode
>>> jedec_probe:jedec_probe_chip: MTD jedec_probe_chip(): matched device
>>> 0xb0,0xb0 unlock_addrs: 0x02aa 0x0155
>>> Found: LH28F640BF
>>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank
>>> sa1100-0: Found different chip or no chip at all (mfr 0x4, id 0x3001)
>>> at 0x1000000
>>> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
>>> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
>>> SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
>>> Creating 3 MTD partitions on "sa1100":
>>> 0x000000000000-0x0000000c0000 : "bootloader"
>>> 0x0000000c0000-0x0000001c0000 : "kernel"
>>> 0x0000001c0000-0x000000fe0000 : "rootfs"
>>> root@collie:~#
>>
>>
>> Some updates:
>>
>> 1) unlocking 'freeze' with mtd/cfi built in kernel disappears adding
>> full debug to the kernel. Some extra delay does the magic?
>>
>> 2) hacked CFI detection: the cfi_probe can't detect the chips. Fixup nee=
ded?
>>
>> I forced the detection in cfi_util and got:
>>
>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
>> 0x0000b0 Chip ID 0x0000b0
>> sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
>> Intel/Sharp Extended Query Table at 0x0039
>> Intel/Sharp Extended Query Table at 0x0039
>> Intel/Sharp Extended Query Table at 0x0039
>> Using buffer write method
>> cfi_cmdset_0001: Erase suspend on write enabled
>> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
>> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
>> erase region 2: offset=3D0x1000000,size=3D0x20000,blocks=3D127
>> erase region 3: offset=3D0x1fe0000,size=3D0x4000,blocks=3D8
>> sa1100-0: 2 set(s) of 2 interleaved chips --> 2 partitions of 16384 KiB
>> SA1100 flash: CFI device at 0x00000000, 32MiB, 32-bit
>> Creating 3 MTD partitions on "sa1100":
>> 0x000000000000-0x0000000c0000 : "bootloader"
>> 0x0000000c0000-0x0000001c0000 : "kernel"
>> 0x0000001c0000-0x000000fe0000 : "rootfs"
>>
>> And the NOR is even unlocked on boot (support instant individual block l=
ocking).
>>
>> If it is worth, I'll do some more tests with jedec debugging the
>> freezing I see during unlocking of monolithic kernel but I'd rather
>> prefer to move on CFI and debug the (mis)detection.
>>
>> Finally, what to do with the entry in jedec_probe? Remove it?
>> If we decide to keep it, one little fix is needed because in theory
>> this part is P_ID_INTEL_STD ( 3)
>> Well, that's even strange because it supports the Extended commandset...
>>
>>
>> Regards
>>
>> Andrea
>
> More questions...
> Ok, forcing detection and debug we get the CFI table:
>
> Number of erase regions: 2
> Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
> Primary Algorithm Table at 0039
> Alternative Vendor Command Set: 0000 (None)
> No Alternate Algorithm Table
> Vcc Minimum:  2.7 V
> Vcc Maximum:  3.6 V
> Vpp Minimum: 11.7 V
> Vpp Maximum: 12.3 V
> Typical byte/word write timeout: 16 =B5s
> Maximum byte/word write timeout: 256 =B5s
> Typical full buffer write timeout: 128 =B5s
> Maximum full buffer write timeout: 2048 =B5s
> Typical block erase timeout: 1024 ms
> Maximum block erase timeout: 8192 ms
> Typical chip erase timeout: 131072 ms
> Maximum chip erase timeout: 1048576 ms
> Device size: 0x800000 bytes (8 MiB)
> Flash Device Interface description: 0x0001
>   - x16-only asynchronous interface
> Max. bytes in buffer write: 0x20
> Number of Erase Block Regions: 2
>   Erase Region #0: BlockSize 0x10000 bytes, 127 blocks
>   Erase Region #1: BlockSize 0x2000 bytes, 8 blocks
> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
> 0x0000b0 Chip ID 0x0000b0
> sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
> Intel/Sharp Extended Query Table at 0x0039
> Intel/Sharp Extended Query Table at 0x0039
> Intel/Sharp Extended Query Table at 0x0039
> Using buffer write method
>   Extended Query version 1.3
>   Feature/Command Support:      02E7
>      - Chip Erase:              supported
>      - Suspend Erase:           supported
>      - Suspend Program:         supported
>      - Legacy Lock/Unlock:      unsupported
>      - Queued Erase:            unsupported
>      - Instant block lock:      supported
>      - Protection Bits:         supported
>      - Page-mode read:          supported
>      - Synchronous read:        unsupported
>      - Simultaneous operations: supported
>      - Extended Flash Array:    unsupported
>   Supported functions after Suspend: 01
>      - Program after Erase Suspend: supported
>   Block Status Register Mask: 0003
>      - Lock Bit Active:      yes
>      - Lock-Down Bit Active: yes
>      - EFA Lock Bit:         no
>      - EFA Lock-Down Bit:    no
>   Vcc Logic Supply Optimum Program/Erase Voltage: 3.0 V
>   Vpp Programming Supply Optimum Program/Erase Voltage: 12.0 V
> cfi_cmdset_0001: Erase suspend on write enabled
> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
> erase region 2: offset=3D0x1000000,size=3D0x20000,blocks=3D127
> erase region 3: offset=3D0x1fe0000,size=3D0x4000,blocks=3D8
> sa1100-0: 2 set(s) of 2 interleaved chips --> 2 partitions of 16384 KiB
> SA1100 flash: CFI device at 0x00000000, 32MiB, 32-bit
> Creating 3 MTD partitions on "sa1100":
> 0x000000000000-0x0000000c0000 : "bootloader"
> 0x0000000c0000-0x0000001c0000 : "kernel"
> 0x0000001c0000-0x000000fe0000 : "rootfs"
>
>
> Now about the detection, I've added some printk and see the following:
>
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: aa00aa
> cfi_send_gen_cmd->VAL: 550055
> cfi_send_gen_cmd->VAL: 900090
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
> 0x0000b0 Chip ID 0x0000b0
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: 1000452
> Answer R: e1a0e00f
> Answer Y: eb06713f
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: 1000452
> Answer R: e1a0e00f
> Answer Y: eb06713f
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: e5912010
> Answer R: e3a05004
> Answer Y: e0022005
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
> Intel/Sharp Extended Query Table at 0x0039
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> Intel/Sharp Extended Query Table at 0x0039
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> Intel/Sharp Extended Query Table at 0x0039
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> cfi_send_gen_cmd->VAL: 980098
> Query Q: 510051
> Query R: 520052
> Query Y: 590059
> Answer Q: ffff0051
> Answer R: ffff0052
> Answer Y: ffff0059
> cfi_send_gen_cmd->VAL: f000f0
> cfi_send_gen_cmd->VAL: ff00ff
> Using buffer write method
> cfi_cmdset_0001: Erase suspend on write enabled
> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
> erase region 2: offset=3D0x1000000,size=3D0x20000,blocks=3D127
> erase region 3: offset=3D0x1fe0000,size=3D0x4000,blocks=3D8
> sa1100-0: 2 set(s) of 2 interleaved chips --> 2 partitions of 16384 KiB
> SA1100 flash: CFI device at 0x00000000, 32MiB, 32-bit
> Creating 3 MTD partitions on "sa1100":
> 0x000000000000-0x0000000c0000 : "bootloader"
> 0x0000000c0000-0x0000001c0000 : "kernel"
> 0x0000001c0000-0x000000fe0000 : "rootfs"
>
> Is the upperword chip D-16-31 not responding ? Why this strange answer?
>
> Finally, the iomap of this device based on sa1100: seems originally
> intended for 32MB but there are only 16 onboard and that seems causing
> the alias at 0x1000000
>
> 372 static struct map_desc collie_io_desc[] __initdata =3D {
> 373         {       /* 32M main flash (cs0) */
> 374                 .virtual        =3D 0xe8000000,
> 375                 .pfn            =3D __phys_to_pfn(0x00000000),
> 376                 .length         =3D 0x02000000,
> 377                 .type           =3D MT_DEVICE
> 378         }, {    /* 32M boot flash (cs1) */
> 379                 .virtual        =3D 0xea000000,
> 380                 .pfn            =3D __phys_to_pfn(0x08000000),
> 381                 .length         =3D 0x02000000,
> 382                 .type           =3D MT_DEVICE
> 383         }
> 384 };
>
>
> Worth to resize it?
> Thanks in advance for your attention
>
> Cheers
>
> Andrea


Further testings after resizing the flash map to SZ_16M give correct,
expected results:

sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
0x0000b0 Chip ID 0x0000b0
Intel/Sharp Extended Query Table at 0x0039
Intel/Sharp Extended Query Table at 0x0039
Intel/Sharp Extended Query Table at 0x0039
Using buffer write method
Using auto-unlock on power-up/resume
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
sa1100-0: 1 set(s) of 2 interleaved chips --> 1 partitions of 16384 KiB
SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
Creating 3 MTD partitions on "sa1100":
0x000000000000-0x0000000c0000 : "bootloader"
0x0000000c0000-0x0000001c0000 : "kernel"
0x0000001c0000-0x000000fe0000 : "rootfs"

This with the following patches and detection-hack...

+diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
+index 7751443..d9d6f0e 100644
+--- a/drivers/mtd/chips/cfi_cmdset_0001.c
++++ b/drivers/mtd/chips/cfi_cmdset_0001.c
+@@ -310,6 +310,7 @@ static struct cfi_fixup cfi_fixup_table[] =3D {
+       { CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
+       { CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
+       { CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
++      { CFI_MFR_SHARP, 0x00b0, fixup_unlock_powerup_lock },
+       { 0, 0, NULL }
+ };
+

+diff --git a/arch/arm/mach-sa1100/collie.
c b/arch/arm/mach-sa1100/collie.c
+index 7fb96eb..c1005ef 100644
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -298,7 +298,7 @@ static struct flash_platform_data collie_flash_data =
=3D {
+ };
+
+ static struct resource collie_flash_resources[] =3D {
+-      DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_32M),
++      DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_16M),
+ };
+
+ static struct sa1100fb_mach_info collie_lcd_info =3D {


+diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
+index f992418..bdee7b9 100644
+--- a/drivers/mtd/chips/cfi_util.c
++++ b/drivers/mtd/chips/cfi_util.c
+@@ -85,7 +85,10 @@ int __xipram cfi_qry_mode_on(uint32_t base, struct
map_info *map,
+       if (cfi_qry_present(map, base, cfi))
+               return 1;
+       /* QRY not found */
+-      return 0;
++/*    return 0; */
++
++/*    FIXME: UGLY HACK: FORCE DETECTION */
++      return 1;
+ }
+ EXPORT_SYMBOL_GPL(cfi_qry_
mode_on);
+
+--
+1.8.1.5
+

I'll try to debug the  Query Q: 510051  -> Answer Q: ffff0051  issue.

Open to any suggestion...

TIA

Andrea
