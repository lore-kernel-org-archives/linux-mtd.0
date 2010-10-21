Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8x0L-0002ia-VL
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 15:24:34 +0000
Received: by qyk4 with SMTP id 4so4164030qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 08:24:32 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <AANLkTin-4fGYzD8a9rDp9M7YEk1y7JbXmZVLjA=3iU3Q@mail.gmail.com>
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
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 21 Oct 2010 17:24:11 +0200
Message-ID: <AANLkTimwhvNmfz5rVjzCTc5_GaNzCg185v+NLD6bLgno@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
To: yidong zhang <zhangyd6@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

2010/10/21 yidong zhang <zhangyd6@gmail.com>:
>> Hi.
>> The patch use the fixup_sst39vf_rev_b() function which calls
>> fixup_old_sst_eraseregion().
>> It sets the NumEraseRegions to 1, thus CFI reports only the 1st erase
>> region, i.e. the one calculated with the sector information (8KByte).
>>
>> Did you actually tested it with a real chip ?
>
> Yes, i did test both SST39VF6401B and SST38VF6401 a moment ago; The
> SST39VF6401B works fine. But the SST38VF6401 couldn't work because of
> the sector-size.It was 64KByte when i displayed the erase size.

Could you send me your log with SST38VF6401 please ?
I need to investigate on this.

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
