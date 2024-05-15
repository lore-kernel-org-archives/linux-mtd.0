Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0BDC25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2024 15:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9POf+rB6tww8HN0/nPT34d+tRnepNUQhQjJlyc5vE2Y=; b=NpdkhKIZ3BHv27
	HxZeLY2+4/vfvM17anKlWZHTf8m+iPwNWv3R0QrpHkwC5o0bT1SyfF70lWv6fDmY/mas5rY047SMp
	mKBK7bNL0bemyLl+v6+1DJq98oVwHvHn11AYDIftmniXtIPghV3N9tYczZ8dz9GeFM3V7eHZH76BB
	criQTtWNf7rrPK+1zWtCzIonsnnng0Nry0OKp5LzQyOKnP9aPKx2Rxu8uZBZaFRli6CZWLJbX6bNB
	MmxeAdy6s6Ka1jJ9mu5YILPMuT/ouxlcMZz69T7yrrz3NNsJhqQpqmhGvl8KUkkzn8ufZsSAflzS5
	O+YoTL/BLfZz/LTZWs7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Gei-00000001yf4-2fwq;
	Wed, 15 May 2024 15:35:00 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Gec-00000001ych-2OM8
	for linux-mtd@lists.infradead.org;
	Wed, 15 May 2024 15:34:56 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 827AB8826C;
	Wed, 15 May 2024 17:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1715787291;
	bh=qpDDMZnH4oh16JFkL5vC8XgjNaFyOtdyPIqtGSul/2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z1JM2eE0Er10itepZxwytSeH4lmJlWwYzfvoXRxzOMHP6J2E4JXXfGn4zNSculB3B
	 N0LNRK94cLSu1M+ri0xV1uX2zq54yuXoRojrlZgd8gQeof2vhFGXFygb/rfbaIyX6d
	 9p3el+DfGUISrmjSkwFLf83cumWGixPIxkIPZZ1ohNr8hVb1O2we2fKSG2SAkQeV27
	 GtW8folVsllhleExA5cqGothnC/CbbdspPagNCFf8hAn0g7JNjx5HhU2YxKMiQxrVl
	 jVkxkQEZgiimZb7w6spDy4DQPWBRvZFWRZjv2iDQIRkCPvYXN4iMy6ItTBjq8HXIvl
	 0/uL7H8wHos3g==
Message-ID: <515848c8-65e3-41de-8a2c-af1c9e5351f1@denx.de>
Date: Wed, 15 May 2024 16:55:29 +0200
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
 <ba2831d1-9ba1-4cd3-89c5-f4b9e8a4b94f@denx.de>
 <CZMOLX07WDHJ.36M7NNZK94F99@walle.cc>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CZMOLX07WDHJ.36M7NNZK94F99@walle.cc>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_083454_785785_251C51F4 
X-CRM114-Status: GOOD (  11.14  )
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

On 3/6/24 1:55 PM, Michael Walle wrote:
> Hi,
> 
> On Wed Mar 6, 2024 at 3:56 AM CET, Marek Vasut wrote:
>>> I'd argue if one wants to use the locking at all, you have to set
>>> UNLOCK_ALL=n. Otherwise, the bootloader might come alone and just
>>> clear your locking bits again. Clearing the WPS bit there is just
>>> one more thing which IMHO doesn't make much sense.
>>
>> On the other hand, if UNLOCK_ALL=y is supposed to work and reset
>> locking, then the SR3 WPS bit has to be configured to select the
>> standard SPI NOR locking scheme, so the locking can actually be reset
>> using that scheme.
> 
> Yes, that's what I've meant with "the unlock all works as
> advertised" and your patch is fine.

Can this be applied ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
