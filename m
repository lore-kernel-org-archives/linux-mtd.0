Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C22C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 12:14:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47E0663249
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 12:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47E0663249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=metafoo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESnjoUI+Da/mELJFR61o7m5ycQ/dxMdCgZNHGMm07A0=; b=0Bg1N3TCPLl+LlfvVntN6RCMFj
	HfdLsB2J7p1UaAV8YaCX9da/8hvNOowM3TfqqpXoFJ/wVZWzIVniSlNLohMDECYrLXFPOPFMGQX1w
	VD4t2uid/64XM1vtz118HAJN7xUTUctM0GgZ+qXni12k3OtREON94AQnRlCZVM2a8eEM7IOueSkB+
	SH54OHdtTEy+zy24/5LMJZYicxd0pHWWETGY2D0tWJq4fz7ZUYwDWHTkq1K05g7+Av8aT+cFKxG4g
	ilCVXMuAJtoNjWxpN9JBbjTwEj0VXw5Wzg5fvaJxicPhbU23SEbYJErd4hFsYXdJrEQS49HOfu6iO
	zq6MWX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmarq-00FU4F-PX; Mon, 15 Nov 2021 12:13:46 +0000
Received: from www381.your-server.de ([78.46.137.84])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmarn-00FU33-OX; Mon, 15 Nov 2021 12:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=toF67llO+BAwsdq0Ra1tOzp5njbcpYDZtx+Ajrw2D5M=; b=Fdhydmz9sHTMX39b4OR+PnWK29
 ollzQvnmIQR6UYtKJJv+pdNenKDhmJoe1m+AZz1r/UzmBuh/s/zyEVT/qUSOAY+AepfailB3KakGl
 nzMJPMS8YSL/mnxq67rqUJ7DGip2AxA33Vlw4H7McDxqIsQkCuDgzYTS3PpC3S4JeCR7BBcBbUbNI
 zMk0Qwr7AHYBGE7YmvvEhxReJcSjOojKOUKKRtntZ7OnV/zed4/BbkqMvJs3SZ7PDbAEwJGvaYuyr
 n93yvvpN0QrMdCXLyiVSv13S7LoWnUnb5JznQFPOzPr8bw/l91uSL6xCRsqIjm0Tb3QDvxbpszYjo
 WFHKC7mA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mmaYO-000B0u-Vm; Mon, 15 Nov 2021 12:53:41 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mmaYO-000AKe-8G; Mon, 15 Nov 2021 12:53:40 +0100
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Orson Zhai
 <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, linux-staging@lists.linux.dev,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
 <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
Date: Mon, 15 Nov 2021 12:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26354/Mon Nov 15 10:21:07 2021)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_041343_841399_11ACDD7F 
X-CRM114-Status: GOOD (  28.21  )
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

On 11/15/21 11:42 AM, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 11:14 AM Lars-Peter Clausen <lars@metafoo.de> wrote:
>> On 11/15/21 9:53 AM, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> This field is never set, and serves no purpose, so remove it.
>> I agree that we should remove it. Its been legacy support code for a
>> while, but the description that there is no user is not right.
>>
>> The tegra20_spdif driver obviously uses it and that user is removed in
>> this patch. I think it makes sense to split that out into a separate
>> patch with a description why the driver will still work even with
>> slave_id removed. Maybe the best is to remove the whole tegra20_spdif
>> driver.
> Ok, I'll split out the tegra patch and try to come up with a better
> description for it. What I saw in that driver is it just passes down the
> slave_id number from a 'struct resource', but there is nothing in
> the kernel that sets up this resource.
>
> Do you or someone else have more information on the state of this
> driver? I can see that it does not contain any of_device_id based
> probing, so it seems that this is either dead code, the platform_device
> gets created by some other code that is no longer compatible with
> this driver.

I've looked into this a while back, when I tried to remove slave_id. And 
as far as I can tell there were never any in-tree users of this driver, 
even back when we used platform board files. Maybe somebody from Nvidia 
knows if there are out-of-tree users.

- Lars


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
