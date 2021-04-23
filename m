Return-Path: <SRS0=ovMs=JU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE873C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 21:05:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2E661409
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 21:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2E661409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k8qUXgI80+NvSfCWhCe9ntlaqQiIj71Se5t3vawszIs=; b=YX5FVGqON5K7B7fDSYsr+6uVI
	syTTpP0XpHFNnsHJ+StOwONLCCj5vhF3ZHzyrPYLBZRgHF8auoJ4NRzk2+yrDzx/g461bnFtrZO/G
	R+lKugCYVLhSIaAZpsrJR3wW6p9R+Wfqt6C0wvpM4565ktsCIOjXcAGnt6NRPxPQjSRAdrGb0754d
	HknxxY0ckgNGkI4eG+yIyaDthoAdqFFUm7gEtycLf5ic9lT4465MBAmRmy0qWpJkVhGRiHGy3pgjF
	e6dtCEl4mKxeiGn2AN6Ba+RfV/7XC8b6rSdzz4Kh8RpsSe9BqLqWO+0tEWy0GBel9YtkACNuwHS9K
	N1UWFYcbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la2z2-002Mrr-MH; Fri, 23 Apr 2021 21:05:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la2yz-002MrO-MT
 for linux-mtd@desiato.infradead.org; Fri, 23 Apr 2021 21:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FBMJe3l28t/b6WUewJOmH9IEkKKx0roqRgeof2hfKWY=; b=d3HpZp/shWxUgIkqHSpOAsd1lt
 gLnATMEET4x93KHOTpMJpS6h/jPXqPnkdHC57KwpX0I0ZV3rjkpbbmrHwAHF47/PtUnf0NtNBzVTh
 4O+oXVVf5/HBKcz+YTFzMBqivmSu+abd3AK5D3Y0sZ0hTCgzX7wOWIGZh8kz9mfBdTFDeicH0zcfz
 WhyqGcz4vvKHqF6kStwnO+Pkdt6AbjMwlphdWTJrHfSCFJOF6cd/Ln8RQKzIGKkAZxcP1AZ1VRLhz
 cWF6pvniaklf9Sxyxhi7rzg+/GnfJIFntrKaE4lStbo/v4/NEw4cHJiosDEYf0U7izr5j5Kj0zvrG
 QKXnbj3g==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la2yx-00EhSm-1B
 for linux-mtd@lists.infradead.org; Fri, 23 Apr 2021 21:05:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id q22so16985745lfu.8
 for <linux-mtd@lists.infradead.org>; Fri, 23 Apr 2021 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FBMJe3l28t/b6WUewJOmH9IEkKKx0roqRgeof2hfKWY=;
 b=mCTrL21Juqjpuf85ujMClLUTeSNXAgVoC/Ynbp7ORqFQejgcy4hBoJn1JUmfddgpNl
 L8Q5gmGaGtYfFeDrgvd171gXZKBmV2o6iJT9iuEpEvkeCUt16cEaJS3LYMb1iNsJpglC
 8I/I1SQp11srtpLSkYzuDE4AXDrnWNI0PYIaCFVkp8GWAMn/bjSatkGZKzL534MuY32P
 U/nxe4OntwtfR3I2YzZlUNO7h1lwEtBRrUGVu8FjymdJtZwwjhCarScGzMv3XUc7Q5hs
 /Jhmn8h4yJncik5AuhUcnkJHrE3JgIXujph0XAltCALKcApsrV/4uZGcUNCEtipYjttl
 7pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FBMJe3l28t/b6WUewJOmH9IEkKKx0roqRgeof2hfKWY=;
 b=P8AwQ5cOdvuPyAMpBmquAIbu0R0A8OU6LNc2MOYCQvOM8pwB2+6Klhltic+DUGUbs5
 rMFd/tSlkv0oOKKll9DMGr4HyGqofyddW9THbGJ5PpbcmQzI2EuzXUJZlF+IwZrJOsFN
 wJ8mrtAfVhbwS0lwi5B8UUrEIulmR1O8yHquDB/pPYY2UGz1nW0SqvTsOII4etZiGGEg
 sUcfUmTi/5qlzqPtYpm8dzglcAnPJ5IBIzJ9Smrrpd33zoSsCGrVGKU5UKYBbVkA1MNl
 tftN9buNRoAtizvxIPnrCMKGUbGF46TdoIfegDoMJWVfCmIuXpYW0h5pc1e/cyOmQ+Rh
 +yTw==
X-Gm-Message-State: AOAM53058qkMazaGTMxBfoFM0orJwE4+ubs4xGKQOvRoBf05EXZ+ueT5
 hq8lGHb7Rg49MCJJsrKj+SXn/HUQoC6KfB1jDZ8=
X-Google-Smtp-Source: ABdhPJxat34ujqJCGiq5tCnbpOUTr9gp/1F0egQmX4/VT4UnD0StN2HqaWcDaalmgBfZKtFZ1WMo2sP16WlsAVk+7lc=
X-Received: by 2002:ac2:491a:: with SMTP id n26mr4232462lfi.539.1619211896074; 
 Fri, 23 Apr 2021 14:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <b6c62efc5b24bc0e04f222095573285f0c977216.camel@phytec.de>
 <20210419173608.434f4b8d@xps13>
 <13112dfe42b99e0c5ef340d9382bb76014bb870c.camel@phytec.de>
 <7615b69a-3b5d-c785-76b9-94b70412e7ca@collabora.com>
 <CAOMZO5AG-fgZ7a12_Eioj8u+bjjJ5WPG0paS-A+2yXvurw8WFA@mail.gmail.com>
 <0be8dcae-e650-fe70-1388-44e644f4d3f8@collabora.com>
 <CAOMZO5CbZS2J+T5DQQ4vAtHnKCHxPSK73j7F5uEb0MddW4-09A@mail.gmail.com>
In-Reply-To: <CAOMZO5CbZS2J+T5DQQ4vAtHnKCHxPSK73j7F5uEb0MddW4-09A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 Apr 2021 18:04:43 -0300
Message-ID: <CAOMZO5Bf3wU2J6PRkfX3SmuPTEg9J0Hj0KCiMAX5aa+GdLgjyQ@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <S.Riedmueller@phytec.de>, 
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?Jan_L=C3=BCbbe?= <j.luebbe@pengutronix.de>, 
 "kernelci-results@groups.io" <kernelci-results@groups.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_140459_110542_66F57DF2 
X-CRM114-Status: GOOD (  10.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

On Thu, Apr 22, 2021 at 10:28 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Guillaume,
>
> On Thu, Apr 22, 2021 at 10:16 AM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
>
> > This device is only available in Pengutronix's lab which is
> > currently being moved to a new location, so I'm being told.  I
> > guess we'll check again when it's back online.
>
> Ok, no problem. Yes, we can check again when it is back online.

I see it is back:
https://storage.kernelci.org/next/master/next-20210423/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

NAND is correctly probed now, so we are all good!

Thanks for the good work with kernelci! It is super helpful :-)

Cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
