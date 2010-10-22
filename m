Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P95K8-0000Eb-Ih
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 00:17:33 +0000
Received: by wyf22 with SMTP id 22so295985wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 17:17:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTimwhvNmfz5rVjzCTc5_GaNzCg185v+NLD6bLgno@mail.gmail.com>
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
Date: Fri, 22 Oct 2010 08:17:27 +0800
Message-ID: <AANLkTinjcF_4wDGXN+Jg43Pjq=iM++1YQ9+evHrgxPaa@mail.gmail.com>
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

On Thu, Oct 21, 2010 at 11:24 PM, Guillaume LECERF <glecerf@gmail.com> wrot=
e:
> 2010/10/21 yidong zhang <zhangyd6@gmail.com>:
>>> Hi.
>>> The patch use the fixup_sst39vf_rev_b() function which calls
>>> fixup_old_sst_eraseregion().
>>> It sets the NumEraseRegions to 1, thus CFI reports only the 1st erase
>>> region, i.e. the one calculated with the sector information (8KByte).
>>>
>>> Did you actually tested it with a real chip ?
>>
>> Yes, i did test both SST39VF6401B and SST38VF6401 a moment ago; The
>> SST39VF6401B works fine. But the SST38VF6401 couldn't work because of
>> the sector-size.It was 64KByte when i displayed the erase size.
>
> Could you send me your log with SST38VF6401 please ?
> I need to investigate on this.


Typical byte/word write timeout: 8 =B5s
Maximum byte/word write timeout: 16 =B5s
Typical full buffer write timeout: 8 =B5s
Maximum full buffer write timeout: 64 =B5s
Typical block erase timeout: 16 ms
Maximum block erase timeout: 32 ms
Typical chip erase timeout: 32 ms
Maximum chip erase timeout: 64 ms
Device size: 0x800000 bytes (8 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x20
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x10000 bytes, 1024 blocks
cif->cfiq->EraseRegionInfo[i] =3D 10003ff
  Erase Region #1: BlockSize 0x10000 bytes, 128 blocks
cif->cfiq->EraseRegionInfo[i] =3D 100007f
mb86hxx_pflash: Found 1 x16 devices at 0x0 in 16-bit bank
number of CFI chips: 1
ersize is 10000, ernum is 400
Sum of regions (4000000) !=3D total size of set of interleaved chips (80000=
0)



>
> --
> Guillaume LECERF
> GeeXboX developer - www.geexbox.org
>
