Return-Path: <SRS0=7f2K=JT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD2FC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Apr 2021 13:29:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC7C061425
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Apr 2021 13:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC7C061425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eo9xLrjjERrNNiEVhY7SHqcJ3sphJ+iEOTVEXBvIvss=; b=YzDv7EPbWPb2Tuhfq/D0GQbQ3
	oo30RO5R2raIp0RMbzeNki2hUVthIfEuXZEpWc8Y2We/8PmWMVspFhu+e1iY9oa4a0L0VmW2R2oAt
	mVLYpSxIjPZcHo+cs4l8plb4dIre4SCw4LuXqxFayNAlvKwA+reaycol1rjioHyJ50uN3lmNsghtv
	NsQTVzgmj7LNkGYwbtujVO77+Rd+xLv2FU0oz3MZp+Tehp/Pa/fCd9eitMbKCTPk6DZhTW1OYGZcR
	VcgEXdtEeiLsbfmoZvJdCB0XvtGtg7lbSpWbVkWbXqMcvjZ5jYuICR1THdV53I3pREpgr7FqrgMZL
	QcL0NNv2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZNn-00Go36-87; Thu, 22 Apr 2021 13:28:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZNl-00Go2z-VL
 for linux-mtd@desiato.infradead.org; Thu, 22 Apr 2021 13:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=V2t+vlnLaRsOPxA0MY6djbCSloRof1gUo5U8cUvAiSA=; b=xxFMNVZtn7DkVda2eJpfUZssrC
 OJqIHL+p1+HQwlWD3/xRJu8LaVIlGjVht/Qfbz165yC/dOpnE5j/wb0TV8/pAWpr2VWFqf9X1gJ0l
 t/plulhRrc4MyGyHml9VeAF760X1yBmntCUhu2DK2s3B60zCys+mbv8TXbl68sy9apA7BonfoQsab
 uosR9vNUEa2kmQ/f/yPkhW4DWFgQn9kQi7EzqHsZ0ypxDpxMAOmZFIA4UKk2LFb+gZwBCXcekwcMa
 fPJl3JkOoWW7pXTR4aT2MxI4HxnsGVT5rKChNv3Dsr7/tBLCNZj0QtnSUTnBfg8HpQEiGQqJIa/K1
 N0NwfzHA==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZNj-00DiSS-EF
 for linux-mtd@lists.infradead.org; Thu, 22 Apr 2021 13:28:36 +0000
Received: by mail-lj1-x234.google.com with SMTP id o5so18750827ljc.1
 for <linux-mtd@lists.infradead.org>; Thu, 22 Apr 2021 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2t+vlnLaRsOPxA0MY6djbCSloRof1gUo5U8cUvAiSA=;
 b=J/PvWtC6m1uQNK6hSJhtgIwHHhxbGZzliUOC+7RQue4Y/BLjQyiv/srH5hRQyseg2p
 CuoYRm3lfqcySvg8DJD/tNNDnVooO+NHaOtuWTpTrL6Vqkc+VCw633+1GsA+T00ckiWa
 zlK/sjKMXjcvCmy1Etd2cVsfJL4pKAoARwb/SKajU4RaLV3a62Tyb9B9ipu7kEzKiC0G
 9Fb1YGs+YFNd4Acnrp5SWaYYXF02+nQHkGwyS7t3z6K52KXIjnSe848y9sw+pXY6uHJ5
 +Z0l260a9Mm6NqnMgtbtvAwtHEEipoFO6b0by/3ikwVHFUig0OR4b7dSXoRVbQfGLuzr
 97RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2t+vlnLaRsOPxA0MY6djbCSloRof1gUo5U8cUvAiSA=;
 b=um3BJDYEpTWVd4vwjwMWpqGAWwaN5dz7fVwYRSez1NATRMYAzML1Rc52waD6/4PRvk
 Vym+Z1nAAUVX7hvAkztGKiuceNNp+SigrXWKmJi0uKEsSULGJgW1xzpl51s/VxbLPXgt
 G0ptxySr5gP3lnLvLcJggASDnaETAPI/InFlhv8yuAQyION49rZM1rDPr/wVbjB4cPI5
 WiawuzZgADKSEKQl4JtP6Vr5eXHTkyizbWGsPnscx7kvv6hfjYI9PjkPW6FzmeFsK6Gy
 9D9KPve0miVh7/atrRT7bcoOLwgo/SAaMGqlKx8XrjYISWfeHsPVsLG8P1AN8qn9F3Hf
 knyQ==
X-Gm-Message-State: AOAM5339cionFFIWvt9BrUNrYuM4SMZY7L0Z7rBkzMS5kCuG+BLeSxK8
 jV4/8S1zGERLAnSidWIWqkHo8yZ5VJDkL2QsS3FuKgqWVJw=
X-Google-Smtp-Source: ABdhPJwOsBaVTIXa5LpnnkXDli60sNUlWPBNRMr4NXqqZXBBGi2CkjSCl076yv9LTFrgqyNQaKP+IDG0MT2Viq/IWDY=
X-Received: by 2002:a2e:990b:: with SMTP id v11mr2487577lji.53.1619098112882; 
 Thu, 22 Apr 2021 06:28:32 -0700 (PDT)
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
In-Reply-To: <0be8dcae-e650-fe70-1388-44e644f4d3f8@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Apr 2021 10:28:21 -0300
Message-ID: <CAOMZO5CbZS2J+T5DQQ4vAtHnKCHxPSK73j7F5uEb0MddW4-09A@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <S.Riedmueller@phytec.de>, 
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?Jan_L=C3=BCbbe?= <j.luebbe@pengutronix.de>, 
 "kernelci-results@groups.io" <kernelci-results@groups.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_062835_514149_D8A055DC 
X-CRM114-Status: GOOD (  11.32  )
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

On Thu, Apr 22, 2021 at 10:16 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:

> This device is only available in Pengutronix's lab which is
> currently being moved to a new location, so I'm being told.  I
> guess we'll check again when it's back online.

Ok, no problem. Yes, we can check again when it is back online.

> Are you aware of any other platform in KernelCI showing the same
> issue?  I could take a look but there's been more boot failure
> regressions than usual on linux-next recently...

There should probably be other platforms affected, but I am not aware
of a different platform than imx27-phytec-phycard-s-rdk in KernelCI at
the moment.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
