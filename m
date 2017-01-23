Received: from mail-qt0-f193.google.com ([209.85.216.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVoFm-00072Z-2s
 for linux-mtd@lists.infradead.org; Mon, 23 Jan 2017 23:42:27 +0000
Received: by mail-qt0-f193.google.com with SMTP id n13so20984505qtc.0
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jan 2017 15:42:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <06d8264e-5ddb-aa76-a83e-4c2c3af42f08@denx.de>
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
 <3e1f1c8e-4a87-e186-20cb-2ba784bd58d5@denx.de>
 <CAOMqctT-JMczFR4yZ0Ncy8f41aH-inOjaw8HoJv2MmSWM-AhSA@mail.gmail.com>
 <06d8264e-5ddb-aa76-a83e-4c2c3af42f08@denx.de>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 23 Jan 2017 18:41:03 -0500
Message-ID: <CAC=U0a1ESxC__PBOjW5L6AE3W5ebs8tMf1T1P1cuDzgFzWdxbA@mail.gmail.com>
Subject: Re: [PATCH,
 1/2] mtd: m25p80: Let m25p80_read() fallback to spi transfer
To: Marek Vasut <marex@denx.de>
Cc: Michal Suchanek <hramrach@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Brown <broonie@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"ret can never be > 0 , it is only 0 or negative "

I can fix this.

>>> This looks really fragile and special-casing EINVAL here doesn't scale.
>>> But still, if your controller driver is buggy, fix the driver, do not
>>> pollute core code with workarounds. If you do support this sort of
>>> accelerated read and it fails, it means something is seriously wrong.
>>> If you need to invoke regular SPI reads to complete under some obscure
>>> circumstances, do it from the driver, not here.
>>
>> I guess the other half of m25p80_read can be factored out and used as
>> fallback from either m25p80_read or the controller driver.
>
> I think I see what you mean, but care to show an RFC patch ?
>
> --

Its not the controller driver, but he hardware limitation with older
controller version. I have tried to see how I can do this better,
however when spi_flash_read() is called  cannot handle it within my
driver without returning from the function. I went over this with Mark
previously and this current solution seemed reasonable. Any other
solution outside of the generic driver would replicate a lot of code
unnecessarily.

> Best regards,
> Marek Vasut


Thanks
Kamal
