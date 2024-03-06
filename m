Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6468FC54E49
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 02:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZFzGyx3VTE6R90/y3vgp1v2R2NnIMbr03u1Zd6GP04=; b=fuNpdb0ghsTac2
	MvhNFmNHr3R4zvtbTByRWOvmm01GouPvQqF6Ei9nknrwE98uE9KlsplI95/B9FVd3dCyyP/9YbCcn
	WhYv1SUQViuRUqGQq09jIeW5KeJCUjQm7/Hpl7YTftMaeP//n7+dIMzIYe34NP5A/F23XVE7VgthV
	IxBM17sVyWIn+xxQzBdV0mTTHNF6WCSzzFXuq6JB/ahCZIWQmG6lsq76jywoJR+JvNzjIOlx8Wy42
	yhhYgAoZMfrGVV6NYCxAQf3PxPgFRuxaSUO6kBdl1JN25VN4hLTjeCFFSptlPchdn2PLaPmrExW9W
	LmV/ls/BGiM9pvBXMFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhT8-0000000G3L1-48iW;
	Wed, 06 Mar 2024 02:57:22 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhT6-0000000G3K7-0Tsm
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 02:57:21 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CB81287D33;
	Wed,  6 Mar 2024 03:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1709693835;
	bh=MdLLWoaeqVKgd0B/0AP9RFnXKekoCT5FjBTUNWG9p18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XirvTMaiiMeVk2TQzJZNIz0iSbhHGeFJ7C1YkrYQKaYg3E6b1vHJ+7QK6MnVcSuAl
	 gGiYN2owBfFd6HR2blBK0px1YYJKu4CDTQx92/PXy+wmBKcSbtXgQPFronPD72H7Wk
	 YPJ7k4z5T5ju79edPPcpVoRKrMwpoihS746Vu4CSiYP7r2p4CdIyu0dX9/eqU2GOAW
	 gdnXgQxCdbkldNvEwaQbIwjuoT8rM9lWctw25eFyWCcFewiA073WAtN7vpofjHtFB4
	 7yNREUoEjosy7lU6QXEQZG4MHjagtipkaotKk25GBs2E/inJiZic6JttyVhozBU/zB
	 95qAvXRLbWdoQ==
Message-ID: <ba2831d1-9ba1-4cd3-89c5-f4b9e8a4b94f@denx.de>
Date: Wed, 6 Mar 2024 03:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Clear Winbond SR3 WPS bit on boot
To: Michael Walle <michael@walle.cc>, u-boot@lists.denx.de
Cc: Hai Pham <hai.pham.ud@renesas.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Johann Neuhauser <jneuhauser@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Vignesh R <vigneshr@ti.com>, linux-mtd@lists.infradead.org
References: <20240304161607.82759-1-marex@denx.de>
 <CZLOVK212G8L.2ISEL1IIWU1YE@walle.cc>
 <7c0e2496-4338-497d-96cf-41d75e2fc52b@denx.de>
 <CZLTVKVR3AG1.BZIQQU2PYSU6@walle.cc>
 <a28b0543-67ee-4e33-91c1-86ae36eb44d5@denx.de>
 <CZLXRLFU5YKU.1S5D9EZ3GUTH4@walle.cc>
 <faa78709-6b7c-4394-8048-3c1f09b65a04@denx.de>
 <CZLZ391C9O5F.38A18T9S51BNT@walle.cc>
 <d522ac8e-8664-4798-9069-947691c6cd43@denx.de>
 <CZM55T7YDKCR.3AIA4OQT2VG0S@walle.cc>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CZM55T7YDKCR.3AIA4OQT2VG0S@walle.cc>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_185720_540966_FD7E925C 
X-CRM114-Status: GOOD (  33.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/5/24 10:41 PM, Michael Walle wrote:
> On Tue Mar 5, 2024 at 7:54 PM CET, Marek Vasut wrote:
>> On 3/5/24 5:55 PM, Michael Walle wrote:
>>
>> [...]
>>
>>>>>>>> Clearing this SR3 WPS bit fixes that problem, both in U-Boot and in
>>>>>>>> Linux, since Linux that is booted afterward then gets a device that has
>>>>>>>> locking scheme configured in a way that Linux expects and can operate.
>>>>>>>>
>>>>>>>> Better yet, if some old LTS version of the Linux kernel is in use, it
>>>>>>>> will also work correctly, because this patch will configure the SPI NOR
>>>>>>>> locking scheme to what Linux expects it to be, before the SPI NOR is
>>>>>>>> handed over to that old kernel.
>>>>>>>
>>>>>>> Agreed, but it should *not* be done automatically and nor
>>>>>>> unconditionally. Please don't just overwrite any locking bits just
>>>>>>> because there is one flash which have it set.
>>>>>>
>>>>>> The unlock code is not triggered unconditionally, it is protected by
>>>>>>
>>>>>> if (IS_ENABLED(CONFIG_SPI_FLASH_UNLOCK_ALL)...
>>>>>>
>>>>>> Kconfig option, so this can be turned on/off in board config already.
>>>>>
>>>>> Ahh, OK then :)
>>>>>
>>>>> But keep in mind that enabling this option is foobar and I've gone
>>>>> lengths to eliminate it in linux. And actually made that option in
>>>>> u-boot.
>>>>>
>>>>> See linux commit 31ad3eff093c ("mtd: spi-nor: keep lock bits if they
>>>>> are non-volatile").
>>>>
>>>> So, how shall we proceed here?
>>>
>>> Regarding this patch, I think it's fine. It will unlock the whole
>>> flash as advertised.
>>
>> This change won't unlock the flash, it will switch to the supported
>> locking scheme, one which can then be used to unlock the flash.
> 
> I can't follow you here. The code is added right below the
> write_sr(0), which will clear all the BP bits, thus unlocking
> everything if WPS=0. Therefore, no locking will be enabled anymore
> afterwards. What did I miss?

Ah, I think you didn't miss anything. Toggling the SR3 WPS does not 
clear any lock bits (BP or page ones), it only selects the locking 
scheme. The SR0 write does clear lock bits (BP ones) using the standard 
locking scheme.

>>> But u-boot should really consider making that a "default n" option.
>>> And most likely adding =y to every existing defconfig out there so
>>> that at least new boards will benefit from it.
>>
>> Yes, I agree with that.
>>
>>>> The way I see this, if Linux ever implements this scheme, Linux can set
>>>> the SR3 WPS bit as needed, it does not matter which way bootloader sets
>>>> the bit as the protection bits are not cleared when the bit is cleared,
>>>> they seem to be stored elsewhere.
>>>
>>> On each reboot you'd wear out that cell with two erases/writes.
>>> That's another reason why that whole unlocking thing is foobar for
>>> non-volatile bits. For me, non-volatile bits are for provisioning,
>>> so during a normal boot they should not be touched at all. Just
>>> during board manufacturing or because the user actively want to
>>> protect something.
>>
>> That is what happens here, the write to clear the bit is triggered only
>> if the bit is set , so OK .
>>
>> And if Linux wants to use the new locking scheme, then the bootloader
>> should ideally be updated to match, i.e. SPI_FLASH_UNLOCK_ALL=n etc, so
>> that is also OK .
> 
> I'd argue if one wants to use the locking at all, you have to set
> UNLOCK_ALL=n. Otherwise, the bootloader might come alone and just
> clear your locking bits again. Clearing the WPS bit there is just
> one more thing which IMHO doesn't make much sense.

On the other hand, if UNLOCK_ALL=y is supposed to work and reset 
locking, then the SR3 WPS bit has to be configured to select the 
standard SPI NOR locking scheme, so the locking can actually be reset 
using that scheme.

>> In other words, there should be no writes into the non-volatile bits,
>> unless U-Boot and Linux disagree on the locking scheme,
> 
> Agreed.
> 
>> in which case
>> writes are unavoidable (if you want unlock to work in both projects).
> 
> But this should only happen if the user want to change the locking
> at all. u-boot should not just do "oh this bit is set, I'm clearing
> it" during SPI flash probe. Again, I'm not caring much if this is
> guarded by the UNLOCK_ALL=y, because u-boot is already doing "oh the
> BP bits are set, lets clear em".

It is guarded, yes.

>>> If you clear this bit during the unlock all command, all the locking
>>> bits are cleared anyway. Or do you mean, the individual bits are
>>> still retained?
>>
>> The lock bits themselves are retained, this SR3 WPS only selects which
>> of those bits take effect, whether the SR ones (standard locking scheme)
>> or the per-page ones (winbond custom locking scheme).
> 
> Ok. So switching back to WPS=1 might come with some suprises :)

Yes, the bad kind.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
