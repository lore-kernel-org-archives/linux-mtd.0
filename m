Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9JlR-0002tu-2l
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 15:42:41 +0000
Received: by ewy19 with SMTP id 19so521903ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Oct 2010 08:42:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com>
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
	<AANLkTi=NKDPhdoDYE0ZdM2tuqWdFBNbui1AHZw_wXx97@mail.gmail.com>
	<AANLkTikG5KWJwm2MFCX+-j2f4JiVTsiG1qsgh4T8aoZQ@mail.gmail.com>
	<AANLkTimrtKYLi9trbM7+t7gLqsSTme=_t--7nxdLkmAd@mail.gmail.com>
	<AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com>
Date: Fri, 22 Oct 2010 23:42:39 +0800
Message-ID: <AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com>
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

On Fri, Oct 22, 2010 at 11:36 PM, Guillaume LECERF <glecerf@gmail.com> wrot=
e:
> 2010/10/22 yidong zhang <zhangyd6@gmail.com>:
>>> Could you try setting cif->cfiq->EraseRegionInfo[0] to 0x02003FF in
>>> fixup_sst39vf_rev_b() ?
>>>
>> Hi
>> =A0how about this attached patch.
>
> If it works for you, I'll send a patch series for SST 39VF640xB and
> 38VF640x, because both chips needs 0x50 as erase command.

Sorry, i cannot test it right now.  I will sent the result as soon as i can=
.
>
> --
> Guillaume LECERF
> GeeXboX developer - www.geexbox.org
>
