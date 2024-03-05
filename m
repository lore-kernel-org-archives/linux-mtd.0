Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0B5C54E41
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2024 12:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVaKswZYZIJiqkyu6VQO28cV5JduxPkLBJltbqm4hO0=; b=KC8Sy2OVo/eZ+O
	1G7nIOsEy5plhM+B4FM1NNxoNR+C6LExGSJhZgIoPFDcAX+hYHadgkOarVn7OUHpEgXKyet1Mk6Ek
	hXqIXiUfoyoT0toVXIdIwbyBBsA1cQR+gzBV0KfZykeKIRdvF+LytLU2bTFbTq3l38/JvAPFjkukM
	X7vWkE4stt1ddMfOVvDlp1lgOXQ3oOCSRoHHZ96tR2MilG6M0sLYS/4FmHtjEurRmYMl0IzOsPTyk
	Qx0HR21PMZVlJ2mIBkiL3YxorD91lQSUPrgxT7jh7Uf/NBfkoSFuxoapGCU465iEGpPJJRajS4BrW
	ub1vrlc1066pbg9Adg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTxF-0000000DaOv-1FIg;
	Tue, 05 Mar 2024 12:31:33 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTxC-0000000DaMK-17iY
	for linux-mtd@lists.infradead.org;
	Tue, 05 Mar 2024 12:31:32 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 13BAA87FE3;
	Tue,  5 Mar 2024 13:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1709641883;
	bh=b5FUKla9Ox9RUd3EY5pDmOikcTElfOzG53xJPCh6f0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0rs+RuLgXR6sbTxJb6gydQzzjLnARJ0Tuyrb9Use7wveiH1Iwi6c457BVqZND96t
	 efld1bzsiKXvAUCjI3CodKj0lb5amw3n9O1hNqJmTazI34IpvKw8McNSCFe4giRuks
	 CG/u5MAlt3CP01MMdJxfMUHwJncqFeDQRu5St6S4uWa1qbloB08Ut1HjExAcYxL69p
	 xdN1OWrEAsAHJhYngNDb/m7plXJWkyYnhjE4xQkoJIdO509KLfe7kfQm5CfzDCzKUE
	 MQuhtok8iTzItBhWmtKgOw2G0OMQM5yzRmSE3uLm0tEnPd/Cjas5wmSzxRjcwu/fNl
	 NDtItPqoTZdYA==
Message-ID: <7c0e2496-4338-497d-96cf-41d75e2fc52b@denx.de>
Date: Tue, 5 Mar 2024 13:31:21 +0100
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CZLOVK212G8L.2ISEL1IIWU1YE@walle.cc>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_043130_729386_2A882F4F 
X-CRM114-Status: GOOD (  24.60  )
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

On 3/5/24 9:55 AM, Michael Walle wrote:
> [+ linux-mtd ]
> 
> Hi Marek,

Hi,

> On Mon Mar 4, 2024 at 5:16 PM CET, Marek Vasut wrote:
>> Some Winbond SPI NORs have special SR3 register which is
>> used among other things to control whether non-standard
>> "Individual Block/Sector Write Protection" (WPS bit)
>> locking scheme is activated. This non-standard locking
>> scheme is not supported by either U-Boot or Linux SPI
>> NOR stack so make sure it is disabled, otherwise the
>> SPI NOR may appear locked for no obvious reason.
> 
> I don't think it is a good idea to just disable the WPS bit.
> Usually, that bit is non-volatile and the default is not set.

Yes, that's right, the bit is non-volatile and should not be set unless 
the MTD stack can handle it correctly. Currently, neither U-Boot nor 
Linux does handle the bit at all, instead both attempt to use the 
standard SPI NOR locking scheme which is also implemented by this SPI 
NOR model and they both fail to unlock the SPI NOR that way.

Note that the SR3 WPS bit only switches between two different locking 
schemes (unset = standard SPI NOR locking scheme, set = custom winbond 
locking scheme), setting SR3 WPS does not immediately imply the SPI NOR 
is locked, rather the opposite. Out of manufacturing, the SPI NOR is 
unlocked in either locking scheme. Depending on the SR3 WPS bit state, 
different commands are used to lock and unlock the SPI NOR.

I recently ran across a device which had the SR3 WPS bit incorrectly set 
out of manufacturing of that device (i.e. before it was populated on a 
board at board manufacturer) and the device was locked using the custom 
locking scheme. I was not able to unlock or use that device because both 
U-Boot and Linux tried to use the standard scheme for that purpose.

Clearing this SR3 WPS bit fixes that problem, both in U-Boot and in 
Linux, since Linux that is booted afterward then gets a device that has 
locking scheme configured in a way that Linux expects and can operate.

Better yet, if some old LTS version of the Linux kernel is in use, it 
will also work correctly, because this patch will configure the SPI NOR 
locking scheme to what Linux expects it to be, before the SPI NOR is 
handed over to that old kernel.

> Thus,
> there is likely someone, probably the manufacturer of the board,
> who intentionally set this bit. Now, with this patch it will get
> disabled *unconditionally*, forever.

In my case, it is exactly the opposite, the SR3 WPS shouldn't have been 
set and the device should not have been locked, but it was and that 
confused both U-Boot and Linux.

I would argue that if the board manufacturer intention was to lock the 
SPI NOR, they would have had multiple better options at their disposal, 
and those options should have been aligned with the software support:
- nWP pin of the SPI NOR could be tied low to enable WRITE PROTECT
- OTP bits could have been programmed to enable permanent WRITE PROTECT
- standard SPI NOR locking scheme could have been used too

If they did set SR3 WPS and hoped that U-Boot or Linux would fail to 
unlock the SPI NOR using standard locking scheme commands, that is I 
think broken design.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
