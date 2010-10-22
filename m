Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9DGi-0005sv-LV
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 08:46:34 +0000
Received: by wwb34 with SMTP id 34so643438wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Oct 2010 01:46:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTinr5E2E4Nth_-XybNPKfHnrgSFPWtVqxkMdQa-Y@mail.gmail.com>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
	<20101016131752.GA2676@pengutronix.de>
	<AANLkTim+RBZRsYFyqXRD65tPw69s3rKogEnBFBQr4E5q@mail.gmail.com>
	<20101018114104.GC15440@pengutronix.de>
	<AANLkTimcpMb6-VykL0jSsocVF4z19TLMUi4c6dvvbNtF@mail.gmail.com>
	<AANLkTi=jNvWZe-bED0fZa-XbvoLmpu7VcFN7nUN=4Tru@mail.gmail.com>
	<AANLkTinLTW25faUTBfKBVcpFXFrtv1UhWWDN9Dgm1jOH@mail.gmail.com>
	<AANLkTiknoWR_v-TfV5M5ZwsV3Lsk=EDDD185kXp4B96V@mail.gmail.com>
	<AANLkTin-4fGYzD8a9rDp9M7YEk1y7JbXmZVLjA=3iU3Q@mail.gmail.com>
	<AANLkTimwhvNmfz5rVjzCTc5_GaNzCg185v+NLD6bLgno@mail.gmail.com>
	<AANLkTinjcF_4wDGXN+Jg43Pjq=iM++1YQ9+evHrgxPaa@mail.gmail.com>
	<AANLkTinr5E2E4Nth_-XybNPKfHnrgSFPWtVqxkMdQa-Y@mail.gmail.com>
Date: Fri, 22 Oct 2010 16:46:30 +0800
Message-ID: <AANLkTi=NKDPhdoDYE0ZdM2tuqWdFBNbui1AHZw_wXx97@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
From: yidong zhang <zhangyd6@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: taliaferro62@gmail.com, yegorslists@googlemail.com,
	linux-mtd@lists.infradead.org,
	Wolfram Sang <w.sang@pengutronix.de>, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 22, 2010 at 3:52 PM, Guillaume LECERF <glecerf@gmail.com> wrote=
:
> 2010/10/22 yidong zhang <zhangyd6@gmail.com>:
>>>> Yes, i did test both SST39VF6401B and SST38VF6401 a moment ago; The
>>>> SST39VF6401B works fine. But the SST38VF6401 couldn't work because of
>>>> the sector-size.It was 64KByte when i displayed the erase size.
>>>
>>> Could you send me your log with SST38VF6401 please ?
>>> I need to investigate on this.
>>
>> Typical byte/word write timeout: 8 =B5s
>> Maximum byte/word write timeout: 16 =B5s
>> Typical full buffer write timeout: 8 =B5s
>> Maximum full buffer write timeout: 64 =B5s
>> Typical block erase timeout: 16 ms
>> Maximum block erase timeout: 32 ms
>> Typical chip erase timeout: 32 ms
>> Maximum chip erase timeout: 64 ms
>> Device size: 0x800000 bytes (8 MiB)
>> Flash Device Interface description: 0x0001
>> =A0- x16-only asynchronous interface
>> Max. bytes in buffer write: 0x20
>> Number of Erase Block Regions: 2
>
> You didn't applied my latest patch, you would have only 1 erase region
> if you did.
  It was printed by the print_cfi_ident function. And the region
number is readed from the flash. So there was 2 erase region

>> =A0Erase Region #0: BlockSize 0x10000 bytes, 1024 blocks
>> cif->cfiq->EraseRegionInfo[i] =3D 10003ff
>> =A0Erase Region #1: BlockSize 0x10000 bytes, 128 blocks
>> cif->cfiq->EraseRegionInfo[i] =3D 100007f
>> mb86hxx_pflash: Found 1 x16 devices at 0x0 in 16-bit bank
>> number of CFI chips: 1
>> ersize is 10000, ernum is 400
>> Sum of regions (4000000) !=3D total size of set of interleaved chips (80=
0000)
>
> This is the typical error with SST chips when the
> fixup_sst39vf_rev_b() fixup function isn't called.

   It did call the fixup_sst39vf_recv_b() function, so you can see
 >>number of CFI chips: 1
When we take the 1st erase region, we will get the wrong flash size
because of the wrong information(ersize is 10000, ernum is 400).

>
> Could you try and report me which patches you applied and what results
> you have with SST38VF6401 ?

Sorry, my current kernel version is not the latest one. My kernel
version is 2.6.31. I changed the code as your patch.  But i can
confirm that the flash(SST39VF6401B) works fine. But the SST38VF6401
flash couldn't pass the probe. Please see the log below

>>  Erase Region #0: BlockSize 0x10000 bytes, 1024 blocks
>> cif->cfiq->EraseRegionInfo[i] =3D 10003ff
>>  Erase Region #1: BlockSize 0x10000 bytes, 128 blocks
>> cif->cfiq->EraseRegionInfo[i] =3D 100007f

I think the information we get from the flash is wrong. So we
shuoldn't take the 1st Erase Region. We can not  get the right
description of the flash in the CFI mode. Maybe they should be moved
to JEDEC mode.

> --
> Guillaume LECERF
> GeeXboX developer - www.geexbox.org
>
