Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E6C54798
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2024 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIYKZGr655oNXasR0ySAJwjMQV5ShitECWzcWOSq2zI=; b=dOSpHvN49Zwcrs
	V969cqa+SYOC3TUsPzTLxX3i4GUE4O1GstV4b4IUp+hp5/bfByOSnCx10c/6Pdzg2GDZuKU4+E/bY
	zbQrkDO6vBR9Q1HiXWi+4AQroxTLL3O7m9qvP7mV3SFh9t+xNW3of2kT6AcVO/EUTnW7/3WqbOt1F
	Fj42RNwuwIX9EOroCLAN1UaW2bMR/1n3LUmPJwQOwRGbWSrGy0kN1zSGVgdrVc6wC022pi7wpapTh
	TGZzSU9u7xkqhxZZyQ0J/QPKdgsoBuu0eSTCEM9BYkVTUg/8jqCGwmjGBLZKMuU3aB1LxiLBK3xzD
	ExhaFNzkakq1slwIqVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhWrI-0000000EIQH-0nTy;
	Tue, 05 Mar 2024 15:37:36 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhWrE-0000000EIOm-2mgH
	for linux-mtd@lists.infradead.org;
	Tue, 05 Mar 2024 15:37:34 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8C5398807F;
	Tue,  5 Mar 2024 16:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1709653049;
	bh=oQeztxbfR/dIxK41bpKZy/morSLGEMuh8oPe0cnNYQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wact1opwvUOIeqWWBd9Eyld7ajV4JUog2SlGpZC5H2GaxGqLhhEB8UgFHHN5ew3V9
	 TjJfDEHWONFzwqBiobDLgwnqWYX78ZCNXoAzovMD9QrKc4Y4lufLuWRxuUJzvUyZNj
	 JuMv4nzMzcl8qYXUKb8I0cuoSAPWltHyFBAdc+Ujgo6RxGb0NDTTyLsBrPe7LuqYHD
	 4Oy5c1Qdjb9tc+0mXC+LJTZn7jYyOxfTdlWVzHRFEK3g572kyCCMvf4c1wVgI3j8zH
	 w6hkJYiEntfFm13dFuAuSsIteXrPRg0atQXvmZqEWM2kS099/Da8CHvL5Xx1OuTZXl
	 eYap/cKpOl2pw==
Message-ID: <a28b0543-67ee-4e33-91c1-86ae36eb44d5@denx.de>
Date: Tue, 5 Mar 2024 16:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Clear Winbond SR3 WPS bit on boot
Content-Language: en-US
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CZLTVKVR3AG1.BZIQQU2PYSU6@walle.cc>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_073733_078240_B1346E0F 
X-CRM114-Status: GOOD (  36.13  )
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

On 3/5/24 1:50 PM, Michael Walle wrote:
> Hi Marek,

Hi,

> On Tue Mar 5, 2024 at 1:31 PM CET, Marek Vasut wrote:
>> On 3/5/24 9:55 AM, Michael Walle wrote:
>>> On Mon Mar 4, 2024 at 5:16 PM CET, Marek Vasut wrote:
>>>> Some Winbond SPI NORs have special SR3 register which is
>>>> used among other things to control whether non-standard
>>>> "Individual Block/Sector Write Protection" (WPS bit)
>>>> locking scheme is activated. This non-standard locking
>>>> scheme is not supported by either U-Boot or Linux SPI
>>>> NOR stack so make sure it is disabled, otherwise the
>>>> SPI NOR may appear locked for no obvious reason.
>>>
>>> I don't think it is a good idea to just disable the WPS bit.
>>> Usually, that bit is non-volatile and the default is not set.
>>
>> Yes, that's right, the bit is non-volatile and should not be set unless
>> the MTD stack can handle it correctly. Currently, neither U-Boot nor
>> Linux does handle the bit at all, instead both attempt to use the
>> standard SPI NOR locking scheme which is also implemented by this SPI
>> NOR model and they both fail to unlock the SPI NOR that way.
>>
>> Note that the SR3 WPS bit only switches between two different locking
>> schemes (unset = standard SPI NOR locking scheme, set = custom winbond
>> locking scheme), setting SR3 WPS does not immediately imply the SPI NOR
>> is locked, rather the opposite. Out of manufacturing, the SPI NOR is
>> unlocked in either locking scheme. Depending on the SR3 WPS bit state,
>> different commands are used to lock and unlock the SPI NOR.
>>
>> I recently ran across a device which had the SR3 WPS bit incorrectly set
>> out of manufacturing of that device (i.e. before it was populated on a
>> board at board manufacturer) and the device was locked using the custom
>> locking scheme. I was not able to unlock or use that device because both
>> U-Boot and Linux tried to use the standard scheme for that purpose.
> 
> Still, I don't think it makes any sense, to disable that bit for all
> winbond flashes just because there was one vendor which set it the
> wrong way - or the board manufacturer didn't test it and programmed
> the flash correctly.

OK

>> Clearing this SR3 WPS bit fixes that problem, both in U-Boot and in
>> Linux, since Linux that is booted afterward then gets a device that has
>> locking scheme configured in a way that Linux expects and can operate.
>>
>> Better yet, if some old LTS version of the Linux kernel is in use, it
>> will also work correctly, because this patch will configure the SPI NOR
>> locking scheme to what Linux expects it to be, before the SPI NOR is
>> handed over to that old kernel.
> 
> Agreed, but it should *not* be done automatically and nor
> unconditionally. Please don't just overwrite any locking bits just
> because there is one flash which have it set.

The unlock code is not triggered unconditionally, it is protected by

if (IS_ENABLED(CONFIG_SPI_FLASH_UNLOCK_ALL)...

Kconfig option, so this can be turned on/off in board config already.

> This should be either be a board level option or maybe expose some
> command line interface to let the user change the settings.
> 
>>> Thus,
>>> there is likely someone, probably the manufacturer of the board,
>>> who intentionally set this bit. Now, with this patch it will get
>>> disabled *unconditionally*, forever.
>>
>> In my case, it is exactly the opposite, the SR3 WPS shouldn't have been
>> set and the device should not have been locked, but it was and that
>> confused both U-Boot and Linux.
>>
>> I would argue that if the board manufacturer intention was to lock the
>> SPI NOR, they would have had multiple better options at their disposal,
>> and those options should have been aligned with the software support:
>> - nWP pin of the SPI NOR could be tied low to enable WRITE PROTECT
>> - OTP bits could have been programmed to enable permanent WRITE PROTECT
>> - standard SPI NOR locking scheme could have been used too
>>
>> If they did set SR3 WPS and hoped that U-Boot or Linux would fail to
>> unlock the SPI NOR using standard locking scheme commands, that is I
>> think broken design.
> 
> There might be software/OS which could handle that correctly. Also,
> if linux will ever learn to use the new locking scheme
> unconditionally, u-boot will always mess it up then.

See CONFIG_SPI_FLASH_UNLOCK_ALL above.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
