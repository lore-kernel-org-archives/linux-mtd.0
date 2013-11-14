Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vgxaf-0000Rs-CT
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 14:08:15 +0000
Received: by mail-la0-f46.google.com with SMTP id eh20so1613064lab.19
 for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2013 06:07:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAQYJAs35b3v4Xgfpf8uqnGCR5iG_XG4OODL1ZtfeMNCniG+wA@mail.gmail.com>
References: <CAAQYJAtGEVUY98Z1gthPbYCMG_A8yWC-d+c-bJeGWUhTF0WbVw@mail.gmail.com>
 <CAAQYJAuq7X7vuKWJk3Uts0wfHGtHt3OQAtTh+7sZasq2XLA+EQ@mail.gmail.com>
 <CAAQYJAv9FF2mmQp6fUWBkAsrWkz8dDgerpi8YrT2qaW9TiSUdA@mail.gmail.com>
 <CAAQYJAufuPbjx4z3nQEX6wU=kwj14eXGVpi0pWF7WURD30Lbrw@mail.gmail.com>
 <CAAQYJAt=TmnXSMDmiDe-97-xpZkohd+jco0RvwzExh3a=cJ2+Q@mail.gmail.com>
 <CAAQYJAsF5T4s_S2bjJH-CNEu8NoRoUXBmiLFfdcgJk3+kZrWCg@mail.gmail.com>
 <CAAQYJAs35b3v4Xgfpf8uqnGCR5iG_XG4OODL1ZtfeMNCniG+wA@mail.gmail.com>
Date: Thu, 14 Nov 2013 15:07:48 +0100
Message-ID: <CAAQYJAt6ELofRvy721SQLOzniu80JmbK-MPFC7Vs9+W-PSETBg@mail.gmail.com>
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

<cut now>
>>>>> More questions...
>>>>> Ok, forcing detection and debug we get the CFI table:
>>>>>
>>>>> Number of erase regions: 2
>>>>> Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
>>>>> Primary Algorithm Table at 0039
>>>>> Alternative Vendor Command Set: 0000 (None)
>>>>> No Alternate Algorithm Table
>>>>> Vcc Minimum:  2.7 V
>>>>> Vcc Maximum:  3.6 V
>>>>> Vpp Minimum: 11.7 V
>>>>> Vpp Maximum: 12.3 V
>>>>> Typical byte/word write timeout: 16 =B5s
>>>>> Maximum byte/word write timeout: 256 =B5s
>>>>> Typical full buffer write timeout: 128 =B5s
>>>>> Maximum full buffer write timeout: 2048 =B5s
>>>>> Typical block erase timeout: 1024 ms
>>>>> Maximum block erase timeout: 8192 ms
>>>>> Typical chip erase timeout: 131072 ms
>>>>> Maximum chip erase timeout: 1048576 ms
>>>>> Device size: 0x800000 bytes (8 MiB)
>>>>> Flash Device Interface description: 0x0001
>>>>>   - x16-only asynchronous interface
>>>>> Max. bytes in buffer write: 0x20
>>>>> Number of Erase Block Regions: 2
>>>>>   Erase Region #0: BlockSize 0x10000 bytes, 127 blocks
>>>>>   Erase Region #1: BlockSize 0x2000 bytes, 8 blocks
>>>>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
>>>>> 0x0000b0 Chip ID 0x0000b0
>>>>> sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
>>>>> Intel/Sharp Extended Query Table at 0x0039
>>>>> Intel/Sharp Extended Query Table at 0x0039
>>>>> Intel/Sharp Extended Query Table at 0x0039
>>>>> Using buffer write method
>>>>>   Extended Query version 1.3
>>>>>   Feature/Command Support:      02E7
>>>>>      - Chip Erase:              supported
>>>>>      - Suspend Erase:           supported
>>>>>      - Suspend Program:         supported
>>>>>      - Legacy Lock/Unlock:      unsupported
>>>>>      - Queued Erase:            unsupported
>>>>>      - Instant block lock:      supported
>>>>>      - Protection Bits:         supported
>>>>>      - Page-mode read:          supported
>>>>>      - Synchronous read:        unsupported
>>>>>      - Simultaneous operations: supported
>>>>>      - Extended Flash Array:    unsupported
>>>>>   Supported functions after Suspend: 01
>>>>>      - Program after Erase Suspend: supported
>>>>>   Block Status Register Mask: 0003
>>>>>      - Lock Bit Active:      yes
>>>>>      - Lock-Down Bit Active: yes
>>>>>      - EFA Lock Bit:         no
>>>>>      - EFA Lock-Down Bit:    no
>>>>>   Vcc Logic Supply Optimum Program/Erase Voltage: 3.0 V
>>>>>   Vpp Programming Supply Optimum Program/Erase Voltage: 12.0 V


>>>>
>>>> sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
>>>> 0x0000b0 Chip ID 0x0000b0
>>>> Intel/Sharp Extended Query Table at 0x0039
>>>> Intel/Sharp Extended Query Table at 0x0039
>>>> Intel/Sharp Extended Query Table at 0x0039
>>>> Using buffer write method
>>>> Using auto-unlock on power-up/resume
>>>> cfi_cmdset_0001: Erase suspend on write enabled
>>>> erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D127
>>>> erase region 1: offset=3D0xfe0000,size=3D0x4000,blocks=3D8
>>>> sa1100-0: 1 set(s) of 2 interleaved chips --> 1 partitions of 16384 Ki=
B
>>>> SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
>>>> Creating 3 MTD partitions on "sa1100":
>>>> 0x000000000000-0x0000000c0000 : "bootloader"
>>>> 0x0000000c0000-0x0000001c0000 : "kernel"
>>>> 0x0000001c0000-0x000000fe0000 : "rootfs"
>>>>
>>>
>>> collie login: root
>>> root@collie:~# modprobe mtd_torturetest eb=3D10 ebcnt=3D2 dev=3D2 cycle=
s_count=3D2
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> mtd_torturetest: Warning: this program is trying to wear out your
>>> flash, stop it if this is not wanted.
>>> mtd_torturetest: MTD device: 2
>>> mtd_torturetest: torture 2 eraseblocks (10-11) of mtd2
>>> mtd_torturetest: write verify enabled
>>> mtd_torturetest: not NAND flash, assume page size is 512 bytes.
>>> mtd_torturetest: finished after 2 erase cycles
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> root@collie:~# modprobe mtd_torturetest eb=3D1 ebcnt=3D112 dev=3D2 cycl=
es_count=3D2
>>> root@collie:~# rmmod mtd_torturetest
>>> root@collie:~# modprobe mtd_torturetest eb=3D1 ebcnt=3D112 dev=3D2 cycl=
es_count=3D3
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> mtd_torturetest: Warning: this program is trying to wear out your
>>> flash, stop it if this is not wanted.
>>> mtd_torturetest: MTD device: 2
>>> mtd_torturetest: torture 112 eraseblocks (1-112) of mtd2
>>> mtd_torturetest: write verify enabled
>>> mtd_torturetest: not NAND flash, assume page size is 512 bytes.
>>> mtd_torturetest: read wrong data from EB 82
>>> mtd_torturetest: verify fails on 256 pages, 131072 bytes/917504 bits
>>> mtd_torturetest: The following is a list of all differences between
>>> what was read from flash and what was expected
>>> -----------------------------------------------------------------------=
------------------
>>> mtd_torturetest: Page 0 has 512 bytes/3584 bits failing verify,
>>> starting at offset 0x0
>>> Offset       Read                          Written
>>> 0x00000000:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000008:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001b0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001b8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001c0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001c8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001d0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001d8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001e0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001e8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001f0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000001f8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000200:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> -----------------------------------------------------------------------=
------------------
>>> mtd_torturetest: Page 1 has 512 bytes/3584 bits failing verify,
>>> starting at offset 0x200
>>> Offset       Read                          Written
>>> 0x00000200:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000208:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000210:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000218:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000220:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000228:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000230:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000238:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000240:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000248:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000250:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000258:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000260:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000268:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000270:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000278:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000280:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000288:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000290:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000298:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002a0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002a8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002b0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002b8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002c0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002c8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002d0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002d8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002e0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002e8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002f0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000002f8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000300:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000308:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000310:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000318:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000320:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000328:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000330:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000338:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000340:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000348:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000350:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000358:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000360:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000368:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000370:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000378:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000380:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000388:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000390:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000398:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003a0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003a8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003b0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003b8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003c0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003c8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003d0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003d8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003e0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003e8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003f0:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x000003f8:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> 0x00000400:  80 80 80 80 80 80 80 80  ***  ff ff ff ff ff ff ff ff
>>> -----------------------------------------------------------------------=
------------------
>>> ...
>>> and so on.
>>>
>>>
>>>
>>> Seems same issue as:
>>>
>>> root@collie:~# ubiformat /dev/mtd2
>>> ubiformat: mtd2 (nor), size 14811136 bytes (14.1 MiB), 113 eraseblocks
>>> of 131072 bytes (128.0 KiB), min. I/O size 1 bytes
>>> libscan: scanning eraseblock 112 -- 100 % complete
>>> ubiformat: warning!: 113 of 113 eraseblocks contain non-ubifs data
>>> ubiformat: continue? (yes/no)  y
>>> ubiformat: warning!: only 0 of 113 eraseblocks have valid erase counter
>>> ubiformat: erase counter 0 will be used for all eraseblocks
>>> ubiformat: note, arbitrary erase counter value may be specified using -=
e option
>>> ubiformat: continue? (yes/no)  y
>>> ubiformat: use erase counter 0 for all eraseblocks
>>> ubiformat: formatting eraseblock 112 -- 100 % complete
>>>
>>> root@collie:~# ubiattach -p /dev/mtd2
>>> UBI device number 0, total 113 LEBs (14796672 bytes, 14.1 MiB),
>>> available 109 LEBs (14272896 bytes, 13.6 MiB), LEB size 130944 bytes
>>> (127.9 KiB)
>>>
>>> root@collie:~# ubimkvol /dev/ubi0 -N rootfs -m
>>> Set volume size to 14272896
>>> Volume ID 0, size 109 LEBs (14272896 bytes, 13.6 MiB), LEB size 130944
>>> bytes (127.9 KiB), dynamic, name "rootfs", alignment 1
>>>
>>> root@collie:~# ubiupdatevol /dev/ubi0_0 /rootfs.ubifs
>>> sa1100: Chip not ready for buffer write. Xstatus =3D 80808080, status =
=3D 80808080
>>> UBI error: ubi_io_write: error -62 while writing 64 bytes to PEB
>>> 87:64, written 0 bytes
>>> UBI error: vol_cdev_write: cannot accept more 13824 bytes of data, erro=
r -62
>>> ubiupdatevol: error!: cannot write 13824 bytes to volume "/dev/ubi0_0"
>>>  error 62 (Timer expired)
>>> root@collie:~#
>>>
>>>
>>>>sa1100: Chip not ready for buffer write. Xstatus =3D 80808080, status =
=3D 80808080
>>>
>>>
>>> Can this happen because of overheating? Dying chip? Wrong voltages/time=
outs?
>>>
>>> Thanks in advance
>>>
>>> Andrea
>>
>> Reading the appendix [2] I can decode the status register as follows:
>>  0x80 =3D   01010000 the bits are SR4 and SR6
>> SR4 =3D Error in (page buffer) program or OTP program (PBPOPS)
>> SR6 =3D Block erase suspended  (BESS)
>>
>> I will try to disable  /* #define
>> CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
>
>


Err... I have read 0x80 as decimal 80
The bitmask is very different ofc 10000000 so the SR.0 - SR.7 are all 0

It is expected that a read to the Extended Sattus Register (XStatus)
after programming the buffer command 0xe8 should confirm the
availability of a buffer.
Maybe I'm misunderstanding cmdset_0001 code.

Any help/idea is appreciated

Andrea




> Thsi seems to have fixed many things, still testing now but I see i.e.
>
> root@collie:~# ubiupdatevol -t /dev/ubi0_0
> SR.4 or SR.5 bits set in buffer write (status ffffffff). Clearing.
>
> So there are 'corrections'.
>
> Will report definitive (sic!) results ;)
>
> Sorry for the noise
>
> Andrea
>
>
>
> */ and maybe  #define
>> FORCE_WORD_WRITE 0
>>
>> Thanks in advance for any help...
>>
>> Andrea
>>
>>
>> [1] Datasheet v. 2.41
>> http://www.datasheetarchive.com/dlmain/Datasheets-314/276727.pdf
>>
>> [2] Appendix v. 2.44
>> http://www.datasheetarchive.com/dl/Datasheet-019/DSA00340384.pdf
