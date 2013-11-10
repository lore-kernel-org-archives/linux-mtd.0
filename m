Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VfZo1-00076I-Cw
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2013 18:32:22 +0000
Received: by mail-lb0-f181.google.com with SMTP id x18so2812801lbi.12
 for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2013 10:31:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAQYJAufuPbjx4z3nQEX6wU=kwj14eXGVpi0pWF7WURD30Lbrw@mail.gmail.com>
References: <CAAQYJAtGEVUY98Z1gthPbYCMG_A8yWC-d+c-bJeGWUhTF0WbVw@mail.gmail.com>
 <CAAQYJAuq7X7vuKWJk3Uts0wfHGtHt3OQAtTh+7sZasq2XLA+EQ@mail.gmail.com>
 <CAAQYJAv9FF2mmQp6fUWBkAsrWkz8dDgerpi8YrT2qaW9TiSUdA@mail.gmail.com>
 <CAAQYJAufuPbjx4z3nQEX6wU=kwj14eXGVpi0pWF7WURD30Lbrw@mail.gmail.com>
Date: Sun, 10 Nov 2013 19:31:54 +0100
Message-ID: <CAAQYJAt=TmnXSMDmiDe-97-xpZkohd+jco0RvwzExh3a=cJ2+Q@mail.gmail.com>
Subject: Re: Issues unlocking LH28F640BF NOR flash
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 8, 2013 at 10:07 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Thu, Nov 7, 2013 at 11:53 AM, Andrea Adami <andrea.adami@gmail.com> wr=
ote:
>> On Wed, Nov 6, 2013 at 10:32 AM, Andrea Adami <andrea.adami@gmail.com> w=
rote:
>>> On Mon, Oct 28, 2013 at 12:17 PM, Andrea Adami <andrea.adami@gmail.com>=
 wrote:
>>>> Hi all,
>>>>
>>>> I'm trying to fixup the flash on the Zaurus SL-5500 that is locked on =
boot.
>>>>
>>>> The 2 chips are 4Mbix16 LH28F640BFHE-PTTL90 on a 32 bit wide bus
>>>> (sa1100) and they appear interleaved: D0-D15 on one chip and D16-D31
>>>> on the other.
>>>> The specifics don't even mention an 8bit mode. See [1] and [2].
>>>> Primary command set (16bit Vendor ID 0003H) so it is Sharp, detected
>>>> as Intel P_ID_INTEL_STD even if it seems explicitely Extended...the
>>>> Sharp-specific extended query is: major 1  minor  3
>>>>
>>>> With jedec_probe they are detected as expected with interleave of 2
>>>> and buswidth of 32bit, see logs [3].
>>>>
>>>> I need to boot from flash so all the drivers are compiled in kernel.
>>>> Now the issue is that from userspace flash_unlock /dev/mtd2 stalls and
>>>> doesn't finish.
>>>> From the kernel side, I've managed to add a fixup for this Sharp chip
>>>> (standard fixup is only for CFI_MFR_INTEL /Strataflash) to
>>>> jedec_fixup_table and to countertest I've even hacked
>>>> uapi/mtd/mtd-abi.h and added MTD_POWERUP_LOCK to MTD_CAP_NORFLASH.
>>>>
>>>> Strangely all is fine when the cfi/jedec drivers and the sa1100 map
>>>> are compiled as modules,  otherwise the kernel won't finish boot (as
>>>> from userspace).
>>>>
>>>> How can that happen?
>>>>
>>>> Thanks in advance for your help
>>>>
>>>> Andrea
>>>>
>>>> P.S.
>>>> Once done I'll try to see why CFI detection fails on gen_probe:
>>>> gen_probe:genprobe_ident_chips: CFI: Found no sa1100-0 device at locat=
ion zero
>>>>
>>>> [1] Datasheet v. 2.41
>>>> http://www.datasheetarchive.com/dlmain/Datasheets-314/276727.pdf
>>>>
>>>> [2] Appendix v. 2.44
>>>> http://www.datasheetarchive.com/dl/Datasheet-019/DSA00340384.pdf
>>>>
>>>> [3]
>>>> root@collie:~# depmod -a
>>>> root@collie:~# modprobe cfi_util dyndbg=3D=3Dpmf
>>>> root@collie:~# modprobe cfi_cmdset_0001 dyndbg=3D=3Dpmf
>>>> root@collie:~# modprobe gen_probe dyndbg=3D=3Dpmf
>>>> root@collie:~# modprobe cfi_probe dyndbg=3D=3Dpmf
>>>> root@collie:~# modprobe jedec_probe dyndbg=3D=3Dpmf
>>>> root@collie:~# modprobe sa1100_flash dyndbg=3D=3Dpmf
>>>> jedec_probe:jedec_reset: reset unlock called 555 2aa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type=
(1)
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_reset: reset unlock called 555 aaa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type=
(1)
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_reset: reset unlock called 5555 2aaa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type=
(1)
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_reset: reset unlock called aaa 554
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type=
(1)
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_reset: reset unlock called aaa 555
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type=
(1)
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_reset: reset unlock called aaaa 5555
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type=
(1)
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(4) type=
(1)
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_match: jedec_match(): ID is not 8bit
>>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type=
(2)
>>>> jedec_probe:jedec_reset: reset unlock called 2aa 555
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type=
(2)
>>>> jedec_probe:jedec_reset: reset unlock called 2aaa 1555
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type=
(2)
>>>> jedec_probe:jedec_reset: reset unlock called 555 2aa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type=
(2)
>>>> jedec_probe:jedec_reset: reset unlock called 555 2aa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type=
(2)
>>>> jedec_probe:jedec_reset: reset unlock called 5555 2aaa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type=
(2)
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 01) interleave(4) type=
(2)
>>>> jedec_probe:jedec_reset: reset unlock called 155 aa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) =
type(4)
>>>> jedec_probe:jedec_reset: reset unlock called 155 2aa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) =
type(4)
>>>> jedec_probe:jedec_reset: reset unlock called 1555 aaa
>>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) =
type(4)
>>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) =
type(4)
>>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) =
type(4)
>>>> jedec_probe:jedec_reset: reset unlock called 2aaa 1555
>>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) =
type(4)
>>>> jedec_probe:jedec_probe_chip: Search for id:(b000b0 00) interleave(4) =
type(4)
>>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>>> jedec_probe:jedec_probe_chip: Search for id:(b0 b0) interleave(2) type=
(2)
>>>> jedec_probe:jedec_match: MTD jedec_match(): Check fit 0x00000000 +
>>>> 0x00800000 =3D 0x00800000
>>>> jedec_probe:jedec_match: MTD jedec_match(): check unlock addrs 0x02aa =
0x0155
>>>> jedec_probe:jedec_match: MTD jedec_match(): check ID's disappear when
>>>> not in ID mode
>>>> jedec_probe:jedec_reset: reset unlock called 2aa 155
>>>> jedec_probe:jedec_match: MTD jedec_match(): return to ID mode
>>>> jedec_probe:jedec_probe_chip: MTD jedec_probe_chip(): matched device
>>>> 0xb0,0xb0 unlock_addrs: 0x02aa 0x0155
>>>> Found: LH28F640BF
>>>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank
>>>> sa1100-0: Found different chip or no chip at all (mfr 0x4, id 0x3001)
>>>> at 0x1000000
>>>> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
>>>> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
>>>> SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
>>>> Creating 3 MTD partitions on "sa1100":
>>>> 0x000000000000-0x0000000c0000 : "bootloader"
>>>> 0x0000000c0000-0x0000001c0000 : "kernel"
>>>> 0x0000001c0000-0x000000fe0000 : "rootfs"
>>>> root@collie:~#
>>>
>>>
>>> Some updates:
>>>
>>> 1) unlocking 'freeze' with mtd/cfi built in kernel disappears adding
>>> full debug to the kernel. Some extra delay does the magic?
>>>
>>> 2) hacked CFI detection: the cfi_probe can't detect the chips. Fixup ne=
eded?
>>>
>>> I forced the detection in cfi_util and got:
>>>
>>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
>>> 0x0000b0 Chip ID 0x0000b0
>>> sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
>>> Intel/Sharp Extended Query Table at 0x0039
>>> Intel/Sharp Extended Query Table at 0x0039
>>> Intel/Sharp Extended Query Table at 0x0039
>>> Using buffer write method
>>> cfi_cmdset_0001: Erase suspend on write enabled
>>> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
>>> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
>>> erase region 2: offset=3D0x1000000,size=3D0x20000,blocks=3D127
>>> erase region 3: offset=3D0x1fe0000,size=3D0x4000,blocks=3D8
>>> sa1100-0: 2 set(s) of 2 interleaved chips --> 2 partitions of 16384 KiB
>>> SA1100 flash: CFI device at 0x00000000, 32MiB, 32-bit
>>> Creating 3 MTD partitions on "sa1100":
>>> 0x000000000000-0x0000000c0000 : "bootloader"
>>> 0x0000000c0000-0x0000001c0000 : "kernel"
>>> 0x0000001c0000-0x000000fe0000 : "rootfs"
>>>
>>> And the NOR is even unlocked on boot (support instant individual block =
locking).
>>>
>>> If it is worth, I'll do some more tests with jedec debugging the
>>> freezing I see during unlocking of monolithic kernel but I'd rather
>>> prefer to move on CFI and debug the (mis)detection.
>>>
>>> Finally, what to do with the entry in jedec_probe? Remove it?
>>> If we decide to keep it, one little fix is needed because in theory
>>> this part is P_ID_INTEL_STD ( 3)
>>> Well, that's even strange because it supports the Extended commandset..=
.
>>>
>>>
>>> Regards
>>>
>>> Andrea
>>
>> More questions...
>> Ok, forcing detection and debug we get the CFI table:
>>
>> Number of erase regions: 2
>> Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
>> Primary Algorithm Table at 0039
>> Alternative Vendor Command Set: 0000 (None)
>> No Alternate Algorithm Table
>> Vcc Minimum:  2.7 V
>> Vcc Maximum:  3.6 V
>> Vpp Minimum: 11.7 V
>> Vpp Maximum: 12.3 V
>> Typical byte/word write timeout: 16 =C2=B5s
>> Maximum byte/word write timeout: 256 =C2=B5s
>> Typical full buffer write timeout: 128 =C2=B5s
>> Maximum full buffer write timeout: 2048 =C2=B5s
>> Typical block erase timeout: 1024 ms
>> Maximum block erase timeout: 8192 ms
>> Typical chip erase timeout: 131072 ms
>> Maximum chip erase timeout: 1048576 ms
>> Device size: 0x800000 bytes (8 MiB)
>> Flash Device Interface description: 0x0001
>>   - x16-only asynchronous interface
>> Max. bytes in buffer write: 0x20
>> Number of Erase Block Regions: 2
>>   Erase Region #0: BlockSize 0x10000 bytes, 127 blocks
>>   Erase Region #1: BlockSize 0x2000 bytes, 8 blocks
>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
>> 0x0000b0 Chip ID 0x0000b0
>> sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
>> Intel/Sharp Extended Query Table at 0x0039
>> Intel/Sharp Extended Query Table at 0x0039
>> Intel/Sharp Extended Query Table at 0x0039
>> Using buffer write method
>>   Extended Query version 1.3
>>   Feature/Command Support:      02E7
>>      - Chip Erase:              supported
>>      - Suspend Erase:           supported
>>      - Suspend Program:         supported
>>      - Legacy Lock/Unlock:      unsupported
>>      - Queued Erase:            unsupported
>>      - Instant block lock:      supported
>>      - Protection Bits:         supported
>>      - Page-mode read:          supported
>>      - Synchronous read:        unsupported
>>      - Simultaneous operations: supported
>>      - Extended Flash Array:    unsupported
>>   Supported functions after Suspend: 01
>>      - Program after Erase Suspend: supported
>>   Block Status Register Mask: 0003
>>      - Lock Bit Active:      yes
>>      - Lock-Down Bit Active: yes
>>      - EFA Lock Bit:         no
>>      - EFA Lock-Down Bit:    no
>>   Vcc Logic Supply Optimum Program/Erase Voltage: 3.0 V
>>   Vpp Programming Supply Optimum Program/Erase Voltage: 12.0 V
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
>>
>> Now about the detection, I've added some printk and see the following:
>>
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: aa00aa
>> cfi_send_gen_cmd->VAL: 550055
>> cfi_send_gen_cmd->VAL: 900090
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
>> 0x0000b0 Chip ID 0x0000b0
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: 1000452
>> Answer R: e1a0e00f
>> Answer Y: eb06713f
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: 1000452
>> Answer R: e1a0e00f
>> Answer Y: eb06713f
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: e5912010
>> Answer R: e3a05004
>> Answer Y: e0022005
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
>> Intel/Sharp Extended Query Table at 0x0039
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> Intel/Sharp Extended Query Table at 0x0039
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> Intel/Sharp Extended Query Table at 0x0039
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
>> cfi_send_gen_cmd->VAL: 980098
>> Query Q: 510051
>> Query R: 520052
>> Query Y: 590059
>> Answer Q: ffff0051
>> Answer R: ffff0052
>> Answer Y: ffff0059
>> cfi_send_gen_cmd->VAL: f000f0
>> cfi_send_gen_cmd->VAL: ff00ff
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
>> Is the upperword chip D-16-31 not responding ? Why this strange answer?
>>
>> Finally, the iomap of this device based on sa1100: seems originally
>> intended for 32MB but there are only 16 onboard and that seems causing
>> the alias at 0x1000000
>>
>> 372 static struct map_desc collie_io_desc[] __initdata =3D {
>> 373         {       /* 32M main flash (cs0) */
>> 374                 .virtual        =3D 0xe8000000,
>> 375                 .pfn            =3D __phys_to_pfn(0x00000000),
>> 376                 .length         =3D 0x02000000,
>> 377                 .type           =3D MT_DEVICE
>> 378         }, {    /* 32M boot flash (cs1) */
>> 379                 .virtual        =3D 0xea000000,
>> 380                 .pfn            =3D __phys_to_pfn(0x08000000),
>> 381                 .length         =3D 0x02000000,
>> 382                 .type           =3D MT_DEVICE
>> 383         }
>> 384 };
>>
>>
>> Worth to resize it?
>> Thanks in advance for your attention
>>
>> Cheers
>>
>> Andrea
>
>
> Further testings after resizing the flash map to SZ_16M give correct,
> expected results:
>
> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
> 0x0000b0 Chip ID 0x0000b0
> Intel/Sharp Extended Query Table at 0x0039
> Intel/Sharp Extended Query Table at 0x0039
> Intel/Sharp Extended Query Table at 0x0039
> Using buffer write method
> Using auto-unlock on power-up/resume
> cfi_cmdset_0001: Erase suspend on write enabled
> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
> sa1100-0: 1 set(s) of 2 interleaved chips --> 1 partitions of 16384 KiB
> SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
> Creating 3 MTD partitions on "sa1100":
> 0x000000000000-0x0000000c0000 : "bootloader"
> 0x0000000c0000-0x0000001c0000 : "kernel"
> 0x0000001c0000-0x000000fe0000 : "rootfs"
>
> This with the following patches and detection-hack...
>
> +diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
> b/drivers/mtd/chips/cfi_cmdset_0001.c
> +index 7751443..d9d6f0e 100644
> +--- a/drivers/mtd/chips/cfi_cmdset_0001.c
> ++++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> +@@ -310,6 +310,7 @@ static struct cfi_fixup cfi_fixup_table[] =3D {
> +       { CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
> +       { CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
> +       { CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
> ++      { CFI_MFR_SHARP, 0x00b0, fixup_unlock_powerup_lock },
> +       { 0, 0, NULL }
> + };
> +
>
> +diff --git a/arch/arm/mach-sa1100/collie.
> c b/arch/arm/mach-sa1100/collie.c
> +index 7fb96eb..c1005ef 100644
> +--- a/arch/arm/mach-sa1100/collie.c
> ++++ b/arch/arm/mach-sa1100/collie.c
> +@@ -298,7 +298,7 @@ static struct flash_platform_data collie_flash_data =
=3D {
> + };
> +
> + static struct resource collie_flash_resources[] =3D {
> +-      DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_32M),
> ++      DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_16M),
> + };
> +
> + static struct sa1100fb_mach_info collie_lcd_info =3D {
>
>
> +diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> +index f992418..bdee7b9 100644
> +--- a/drivers/mtd/chips/cfi_util.c
> ++++ b/drivers/mtd/chips/cfi_util.c
> +@@ -85,7 +85,10 @@ int __xipram cfi_qry_mode_on(uint32_t base, struct
> map_info *map,
> +       if (cfi_qry_present(map, base, cfi))
> +               return 1;
> +       /* QRY not found */
> +-      return 0;
> ++/*    return 0; */
> ++
> ++/*    FIXME: UGLY HACK: FORCE DETECTION */
> ++      return 1;
> + }
> + EXPORT_SYMBOL_GPL(cfi_qry_
> mode_on);
> +
> +--
> +1.8.1.5
> +
>
> I'll try to debug the  Query Q: 510051  -> Answer Q: ffff0051  issue.
>
> Open to any suggestion...
>
> TIA
>
> Andrea

Things are not yet perfect...flashcpy failed on verify and so I run some te=
sts.

root@collie:~# modprobe mtd_readtest dev=3D2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_readtest: MTD device: 2
mtd_readtest: not NAND flash, assume page size is 512 bytes.
mtd_readtest: MTD device size 14811136, eraseblock size 131072, page
size 512, count of eraseblocks 113, pages per eraseblock 256, OOB size
0
mtd_readtest: testing page read
mtd_readtest: finished
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@collie:~# rmmod mtd_readtest
root@collie:~# modprobe mtd_speedtest dev=3D2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_speedtest: MTD device: 2
mtd_speedtest: not NAND flash, assume page size is 512 bytes.
mtd_speedtest: MTD device size 14811136, eraseblock size 131072, page
size 512, count of eraseblocks 113, pages per eraseblock 256, OOB size
0
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 534 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 3065 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 530 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 2964 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 531 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 3006 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 241 KiB/s
mtd_speedtest: Testing 2x multi-block erase speed
mtd_speedtest: 2x multi-block erase speed is 241 KiB/s
mtd_speedtest: Testing 4x multi-block erase speed
mtd_speedtest: 4x multi-block erase speed is 241 KiB/s
mtd_speedtest: Testing 8x multi-block erase speed
mtd_speedtest: 8x multi-block erase speed is 241 KiB/s
mtd_speedtest: Testing 16x multi-block erase speed
mtd_speedtest: 16x multi-block erase speed is 239 KiB/s
mtd_speedtest: Testing 32x multi-block erase speed
mtd_speedtest: 32x multi-block erase speed is 241 KiB/s
mtd_speedtest: Testing 64x multi-block erase speed
mtd_speedtest: 64x multi-block erase speed is 241 KiB/s
mtd_speedtest: finished
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@collie:~# rmmod mtd_speedtest
root@collie:~# modprobe mtd_stresstest dev=3D2 count=3D10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_stresstest: MTD device: 2
mtd_stresstest: not NAND flash, assume page size is 512 bytes.
mtd_stresstest: MTD device size 14811136, eraseblock size 131072, page
size 512, count of eraseblocks 113, pages per eraseblock 256, OOB size
0
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done
mtd_stresstest: finished, 10 operations done
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@collie:~# rmmod mtd_stresstest


####################


collie login: root
root@collie:~# modprobe mtd_stresstest dev=3D2 count=3D16

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_stresstest: MTD device: 2
mtd_stresstest: not NAND flash, assume page size is 512 bytes.
mtd_stresstest: MTD device size 14811136, eraseblock size 131072, page
size 512, count of eraseblocks 113, pages per eraseblock 256, OOB size
0
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done
mtd_stresstest: finished, 16 operations done
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@collie:~# rmmod mtd_stresstest
root@collie:~# modprobe mtd_stresstest dev=3D2 count=3D10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_stresstest: MTD device: 2
mtd_stresstest: not NAND flash, assume page size is 512 bytes.
mtd_stresstest: MTD device size 14811136, eraseblock size 131072, page
size 512, count of eraseblocks 113, pages per eraseblock 256, OOB size
0
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done
mtd_stresstest: finished, 10 operations done
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@collie:~# rmmod mtd_stresstest
root@collie:~# modprobe mtd_stresstest dev=3D2 count=3D17

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_stresstest: MTD device: 2
mtd_stresstest: not NAND flash, assume page size is 512 bytes.
mtd_stresstest: MTD device size 14811136, eraseblock size 131072, page
size 512, count of eraseblocks 113, pages per eraseblock 256, OOB size
0
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done

stalls...


Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x0
Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Initializing cgroup subsys cpuacct
Linux version 3.10.17-yocto-standard (andrea@mizar) (gcc version 4.8.1
(GCC) ) #1 PREEMPT Sun Nov 10 10:33:32 CET 2013
CPU: StrongARM-1110 [6901b118] revision 8 (ARMv4), cr=3Dc000717f
CPU: VIVT data cache, VIVT instruction cache
Machine: Sharp-Collie
Memory policy: ECC disabled, Data cache writeback
On node 0 totalpages: 16384
  Normal zone: 128 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 16384 pages, LIFO batch:3
pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: root=3D/dev/sda1 rootfstype=3Dext2 rootwait
fbcon=3Drotate:1 console=3DttySA0,115200n8 console=3Dtty1 mem=3D64M
fbcon=3Drotate:1 debug
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB =3D 64MB total
Memory: 55500k/55500k available, 10036k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xc4800000 - 0xff000000   ( 936 MB)
    lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc07e6a90   (8059 kB)
      .init : 0xc07e7000 - 0xc0851e64   ( 428 kB)
      .data : 0xc0852000 - 0xc089f3e8   ( 309 kB)
       .bss : 0xc089f3e8 - 0xc0932fc8   ( 591 kB)
Preemptible hierarchical RCU implementation.
NR_IRQS:16 nr_irqs:53 53
sched_clock: 32 bits at 3686kHz, resolution 271ns, wraps every 1165084ms
Console: colour dummy device 80x30
console [tty1] enabled
console [ttySA0] enabled
allocated 262144 bytes of page_cgroup
please try 'cgroup_disable=3Dmemory' option if you don't want memory cgroup=
s
Calibrating delay loop... 136.60 BogoMIPS (lpj=3D683008)
pid_max: default: 32768 minimum: 301
Security Framework initialized
Mount-cache hash table entries: 512
Initializing cgroup subsys debug
Initializing cgroup subsys memory
Initializing cgroup subsys devices
Initializing cgroup subsys freezer
Initializing cgroup subsys net_cls
Initializing cgroup subsys blkio
CPU: Testing write buffer coherency: ok
ftrace: allocating 21312 entries in 63 pages
Setting up static identity map for 0xc05d8ab8 - 0xc05d8b10
devtmpfs: initialized
xor: measuring software checksum speed
   arm4regs  :    86.400 MB/sec
   8regs     :    79.200 MB/sec
   32regs    :    76.000 MB/sec
xor: using function: arm4regs (86.400 MB/sec)
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
Sharp Scoop Device found at 0x40800000 -> 0xc4846000
bio: create slab <bio-0> at 0
raid6: int32x1     32 MB/s
raid6: int32x2     31 MB/s
raid6: int32x4     25 MB/s
raid6: int32x8     23 MB/s
raid6: using algorithm int32x1 (32 MB/s)
raid6: using intx1 recovery algorithm
SCSI subsystem initialized
libata version 3.00 loaded.
Switching to clocksource oscr
NET: Registered protocol family 2
TCP established hash table entries: 512 (order: 0, 4096 bytes)
TCP bind hash table entries: 512 (order: -1, 2048 bytes)
TCP: Hash tables configured (established 512 bind 512)
TCP: reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
LoCoMo Chip: 7649
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
jffs2: version 2.2. (NAND) (SUMMARY)  =EF=BF=BD=EF=BF=BD 2001-2006 Red Hat,=
 Inc.
bio: create slab <bio-1> at 1
Btrfs loaded
aufs 3.10-20130819
yaffs: yaffs built Nov 10 2013 10:31:48 Installing.
msgmni has been set to 108
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Console: switching to colour frame buffer device 30x40
pcmcia_socket pcmcia_socket0: pccard: PCMCIA card inserted into slot 0
pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 35)
Serial: SA11x0 driver
sa11x0-uart.1: ttySA1 at MMIO 0x80010000 (irq =3D 15) is a SA1100
sa11x0-uart.3: ttySA0 at MMIO 0x80050000 (irq =3D 17) is a SA1100
brd: module loaded
input: Touchscreen panel as
/devices/platform/sa11x0-mcp/mcp0/ucb1x00/ucb1x00/input0
scsi0 : pata_pcmcia
ata1: PATA max PIO0 cmd 0xc4860000 ctl 0xc486000e irq 35
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
Creating 4 MTD partitions on "sa1100":
0x000000000000-0x0000000c0000 : "bootloader"
0x0000000c0000-0x0000001c0000 : "kernel"
0x0000001c0000-0x000000fe0000 : "rootfs"
0x000000fe0000-0x000001000000 : "bootblock"
mousedev: PS/2 mouse device common for all mice
input: LoCoMo keyboard as
/devices/platform/locomo.0/locomo-keyboard/input/input1
sa1100-rtc sa1100-rtc: rtc core: registered sa1100-rtc as rtc0
APM Battery Driver
ata1.00: CFA: SAMSUNG CF/ATA, CF031003, max PIO4
ata1.00: 1022112 sectors, multi 0: LBA
md: linear personality registered for level -1
md: raid0 personality registered for level 0
ata1.00: configured for PIO0
collie_bat_gpio irq
scsi 0:0:0:0: Direct-Access     ATA      SAMSUNG CF/ATA   CF03 PQ: 0 ANSI: =
5
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
md: multipath personality registered for level -4
sd 0:0:0:0: [sda] 1022112 512-byte logical blocks: (523 MB/499 MiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
md: faulty personality registered for level -5
device-mapper: ioctl: 4.24.0-ioctl (2013-01-15) initialised: dm-devel@redha=
t.com
sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't
support DPO or FUA
u32 classifier
    Actions configured
TCP: cubic registered
 sda: sda1
NET: Registered protocol family 10
sit: IPv6 over IPv4 tunneling driver
sd 0:0:0:0: [sda] Attached SCSI removable disk
NET: Registered protocol family 17
Key type dns_resolver registered
console [netcon0] enabled
netconsole: network logging started
sa1100-rtc sa1100-rtc: setting system clock to 1970-01-01 00:01:28 UTC (88)
md: Waiting for all devices to be available before autodetect
md: If you don't use raid, use raid=3Dnoautodetect
md: Autodetecting RAID arrays.
md: Scanned 0 and added 0 devices.
md: autorun ...
md: ... autorun DONE.
VFS: Mounted root (ext2 filesystem) readonly on device 8:1.
devtmpfs: mounted
Freeing unused kernel memory: 424K (c07e7000 - c0851000)
udevd[79]: starting version 182
collie_bat_gpio irq

collie login: root
root@collie:~# modprobe mtd_torturetest eb=3D10 ebcnt=3D2 dev=3D2 cycles_co=
unt=3D2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_torturetest: Warning: this program is trying to wear out your
flash, stop it if this is not wanted.
mtd_torturetest: MTD device: 2
mtd_torturetest: torture 2 eraseblocks (10-11) of mtd2
mtd_torturetest: write verify enabled
mtd_torturetest: not NAND flash, assume page size is 512 bytes.
mtd_torturetest: finished after 2 erase cycles
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@collie:~# modprobe mtd_torturetest eb=3D1 ebcnt=3D112 dev=3D2 cycles_c=
ount=3D2
root@collie:~# rmmod mtd_torturetest
root@collie:~# modprobe mtd_torturetest eb=3D1 ebcnt=3D112 dev=3D2 cycles_c=
ount=3D3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_torturetest: Warning: this program is trying to wear out your
flash, stop it if this is not wanted.
mtd_torturetest: MTD device: 2
mtd_torturetest: torture 112 eraseblocks (1-112) of mtd2
mtd_torturetest: write verify enabled
mtd_torturetest: not NAND flash, assume page size is 512 bytes.
mtd_torturetest: read wrong data from EB 82
mtd_torturetest: verify fails on 256 pages, 131072 bytes/917504 bits
mtd_torturetest: The following is a list of all differences between
what was read from flash and what was expected
---------------------------------------------------------------------------=
--------------
mtd_torturetest: Page 0 has 512 bytes/3584 bits failing verify,
starting at offset 0x0
Offset       Read                          Written
0x00000000:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000008:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000010:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000018:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000020:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000028:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000030:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000038:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000040:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000048:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000050:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000058:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000060:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000068:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000070:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000078:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000080:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000088:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000090:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000098:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000a0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000a8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000b0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000b8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000c0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000c8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000d0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000d8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000e0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000e8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000f0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000000f8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000100:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000108:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000110:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000118:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000120:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000128:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000130:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000138:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000140:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000148:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000150:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000158:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000160:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000168:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000170:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000178:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000180:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000188:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000190:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000198:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001a0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001a8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001b0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001b8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001c0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001c8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001d0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001d8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001e0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001e8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001f0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000001f8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000200:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
---------------------------------------------------------------------------=
--------------
mtd_torturetest: Page 1 has 512 bytes/3584 bits failing verify,
starting at offset 0x200
Offset       Read                          Written
0x00000200:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000208:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000210:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000218:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000220:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000228:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000230:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000238:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000240:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000248:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000250:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000258:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000260:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000268:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000270:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000278:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000280:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000288:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000290:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000298:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002a0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002a8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002b0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002b8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002c0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002c8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002d0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002d8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002e0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002e8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002f0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000002f8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000300:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000308:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000310:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000318:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000320:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000328:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000330:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000338:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000340:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000348:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000350:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000358:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000360:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000368:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000370:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000378:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000380:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000388:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000390:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000398:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003a0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003a8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003b0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003b8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003c0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003c8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003d0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003d8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003e0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003e8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003f0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x000003f8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
0x00000400:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
---------------------------------------------------------------------------=
--------------
...
and so on.



Seems same issue as:

root@collie:~# ubiformat /dev/mtd2
ubiformat: mtd2 (nor), size 14811136 bytes (14.1 MiB), 113 eraseblocks
of 131072 bytes (128.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 112 -- 100 % complete
ubiformat: warning!: 113 of 113 eraseblocks contain non-ubifs data
ubiformat: continue? (yes/no)  y
ubiformat: warning!: only 0 of 113 eraseblocks have valid erase counter
ubiformat: erase counter 0 will be used for all eraseblocks
ubiformat: note, arbitrary erase counter value may be specified using -e op=
tion
ubiformat: continue? (yes/no)  y
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: formatting eraseblock 112 -- 100 % complete

root@collie:~# ubiattach -p /dev/mtd2
UBI device number 0, total 113 LEBs (14796672 bytes, 14.1 MiB),
available 109 LEBs (14272896 bytes, 13.6 MiB), LEB size 130944 bytes
(127.9 KiB)

root@collie:~# ubimkvol /dev/ubi0 -N rootfs -m
Set volume size to 14272896
Volume ID 0, size 109 LEBs (14272896 bytes, 13.6 MiB), LEB size 130944
bytes (127.9 KiB), dynamic, name "rootfs", alignment 1

root@collie:~# ubiupdatevol /dev/ubi0_0 /rootfs.ubifs
sa1100: Chip not ready for buffer write. Xstatus =3D 80808080, status =3D 8=
0808080
UBI error: ubi_io_write: error -62 while writing 64 bytes to PEB
87:64, written 0 bytes
UBI error: vol_cdev_write: cannot accept more 13824 bytes of data, error -6=
2
ubiupdatevol: error!: cannot write 13824 bytes to volume "/dev/ubi0_0"
 error 62 (Timer expired)
root@collie:~#


>sa1100: Chip not ready for buffer write. Xstatus =3D 80808080, status =3D =
80808080


Can this happen because of overheating? Dying chip? Wrong voltages/timeouts=
?

Thanks in advance

Andrea
