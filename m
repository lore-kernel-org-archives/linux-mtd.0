Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA550C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 20:24:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894B060C51
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 20:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 894B060C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vbj9gFgfOB8FCp5+/gVyZYnDrREgKP2fsEn1kxQkxpo=; b=aIVxTqKlhhKUEGrNLemTgz9sn4
	Tjk0aybMPnpqUrNg9euqSCk/QwZZbCffGiKlYSt/dqHtAj09Ihz/oLoT94IbJ8sqV0hX1KrFeeNCS
	s+H8Iwy30LoXAF84/FsZrXVqZvg/Lxe5nPY/nlqhGzk/Cm+4xrg2ky7fRADetW1VjClc9eDAMVpqI
	1kmAgZHj5+ldnXQL3mhcmnn6hzWXr6Ua2PGGnGhoUxg9K+aQpsYixYyG6CBgwgek6/wYcygAsqY9p
	5SoR23u92+ZlEy3DEThANrvFQC0DUfJbv+v/X/jNvHUmrsvWLWvVjweX08bxE6C8jQrLHovQfGhAy
	SND4Pr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIGUL-000Z6A-Bb; Mon, 23 Aug 2021 20:24:09 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIGUI-000Z5K-2b
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 20:24:07 +0000
Received: by mail-lj1-x233.google.com with SMTP id s12so8456386ljg.0
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J41x529VlTspZMrpThFHJLBr2g65jbs1WO5P40LCen4=;
 b=okYdM6r/OEM+GpVMmndUDSUnFuATe7k+UqV9Xd6SnEB6FCQnedxeMEPVsABonqs4N4
 bW0CUVBYgP/wVgNhvKRjjJZHkQWqjAfdAXHaWOprlSkmDVUGTjWH0QHqHe/JDzPhBYMW
 VS78dI9TbqWyfxbPdEd9M68PCp/85z5U4mMqUTiCNVQcQnpHeloJ5A8DDCAgG+UndNk2
 4AMRro0QimKicKoXkXK7fx6Xlty7DPO0Rz/T7e7AYrMNjr1lsW8oLXtit6l5wdRItw9Y
 0sCrelfgm2KgdesCrJhygLOJ6k4XDHAPdBtXpSk4O9XXGH416S+WsJAn5UMZlTogyo6e
 LVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J41x529VlTspZMrpThFHJLBr2g65jbs1WO5P40LCen4=;
 b=Uco6mfZ3nw845jKhXAAKHTf4k4a+1xfVw+XaXzdqnN7CyOVW8LDoOinQ3eX9LvSIE1
 O8UBOyZe31v5Me/Qd7LOheNaU6qJehCai+T/Rlh5V2htCVu2WjzJypcEhQDZ18C5AbVw
 1aPJqEHS06d8RQNDM+BD8Fdam0UCB+5h2sAVh68PlVinLMizbdPFzLkiJRo/akJxTbmP
 3ZUS9Ub/rB3dxaBTRtIQ05e7KWOP1vD3X9zsOpyw9XIn8v9p+dumbaLtps7l6LiVFJbV
 Q97rZg4y1j1dS8YBax1jEZ1uhI/4iWWWNhAmJ0gckPqK3SSkRFnq3lWbuopEljGCdLeA
 iCpw==
X-Gm-Message-State: AOAM532wlZoskD1sh9dMXIYyRtUyswHT9LirI4jQapL7VxXvFFKPwz2K
 o/6BHVEooIxIp+dHuBgexbg=
X-Google-Smtp-Source: ABdhPJwqnW4H12JkFByYZki5F25wX7CFl/4OxdrLQBKSJLK7Hp+HrjfGNLOpxwFObeZey6c6a7G84A==
X-Received: by 2002:a2e:a4db:: with SMTP id p27mr29314648ljm.161.1629750244353; 
 Mon, 23 Aug 2021 13:24:04 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id r2sm854722ljj.14.2021.08.23.13.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 13:24:03 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <CAPDyKFo0rzHT4AhueWjyz9k2ZqUy8N6Od5pbr8sL_m0Jf2AwUg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <085d1a2e-57b0-222e-c569-12f3c6bc8161@gmail.com>
Date: Mon, 23 Aug 2021 23:24:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo0rzHT4AhueWjyz9k2ZqUy8N6Od5pbr8sL_m0Jf2AwUg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_132406_171227_07760184 
X-CRM114-Status: GOOD (  20.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MjAuMDguMjAyMSAxNTo1NywgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKLi4uCj4+IFdlIGFscmVh
ZHkgaGF2ZSBzaW1pbGFyIEFQSXMsIHNvIHRoYXQgd29uJ3QgYmUgYSBwcm9ibGVtLiBXZSBhbHNv
IGhhdmUKPj4gYSBtZWNoYW5pc20gaW5zaWRlIHRoZSBPUFAgY29yZSwgZnJlcXVlbmN5IGJhc2Vk
LCB3aGljaCBpcyB1c2VkIHRvCj4+IGd1ZXNzIHRoZSBjdXJyZW50IE9QUC4gTWF5YmUgd2UgY2Fu
IGVuaGFuY2UgYW5kIHVzZSB0aGF0IGRpcmVjdGx5Cj4+IGhlcmUuCj4gCj4gQWZ0ZXIgcmVhZGlu
ZyB0aGUgbGFzdCByZXBseSBmcm9tIERtaXRyeSwgSSBhbSBzdGFydGluZyB0byB0aGluayB0aGF0
Cj4gdGhlIHByb2JsZW0gaGUgaXMgZmFjaW5nIGNhbiBiZSBkZXNjcmliZWQgYW5kIHNvbHZlZCBp
biBhIG11Y2ggZWFzaWVyCj4gd2F5Lgo+IAo+IElmIEkgYW0gY29ycmVjdCwgaXQgbG9va3MgbGlr
ZSB3ZSBkb24ndCBuZWVkIHRvIGFkZCBBUElzIHRvIGdldCBPUFBzCj4gZm9yIGEgY2xvY2sgcmF0
ZSBvciBzZXQgaW5pdGlhbCBwZXJmb3JtYW5jZSBzdGF0ZSB2YWx1ZXMgYWNjb3JkaW5nIHRvCj4g
dGhlIEhXIGluIGdlbnBkLgo+IAo+IFNlZSBteSBvdGhlciByZXNwb25zZSB0byBEbWl0cnksIGxl
dCdzIHNlZSB3aGVyZSB0aGF0IGxlYWRzIHVzLgoKSSdtIGdvaW5nIHRvIHN0YXJ0IHByZXBhcmlu
ZyB2OSB3aXRoIEdFTlBEIHBlcmZvcm1hbmNlIHN0YXRlIHN5bmNpbmcgbW92ZWQgaW50byBkcml2
ZXIncyBwcm9iZSB3aGVyZSBhcHByb3ByaWF0ZS4KCkl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoZXRo
ZXIgaXQgd2lsbCBiZSBva2F5IHRvIGFkZCBhIGdlbmVyaWMgT1BQIHN5bmNpbmcgYnkgY2xvY2sg
cmF0ZSBvciBzaG91bGQgaXQgYmUgYSBUZWdyYS1zcGVjaWZpYyBoZWxwZXIuIFZpcmVzaCwgd2hh
dCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBnZW5lcmljIE9QUCBoZWxwZXI6CgovKioKICogZGV2
X3BtX29wcF9zeW5jX3dpdGhfY2xrX3JhdGUoKSAtIFN5bmMgT1BQIHN0YXRlIHdpdGggY2xvY2sg
cmF0ZQogKiBAZGV2OglkZXZpY2UgZm9yIHdoaWNoIHdlIGRvIHRoaXMgb3BlcmF0aW9uCiAqCiAq
IFN5bmMgT1BQIHRhYmxlIHN0YXRlIHdpdGggdGhlIGN1cnJlbnQgY2xvY2sgcmF0ZSBvZiBkZXZp
Y2UuCiAqCiAqIFJldHVybjogMCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3IgdmFsdWUu
CiAqLwppbnQgZGV2X3BtX29wcF9zeW5jX3dpdGhfY2xrX3JhdGUoc3RydWN0IGRldmljZSAqZGV2
KQp7CglzdHJ1Y3Qgb3BwX3RhYmxlICpvcHBfdGFibGU7CglpbnQgcmV0ID0gMDsKCgkvKiBEZXZp
Y2UgbWF5IG5vdCBoYXZlIE9QUCB0YWJsZSAqLwoJb3BwX3RhYmxlID0gX2ZpbmRfb3BwX3RhYmxl
KGRldik7CglpZiAoSVNfRVJSKG9wcF90YWJsZSkpCgkJcmV0dXJuIDA7CgoJLyogRGV2aWNlIG1h
eSBub3QgdXNlIGNsb2NrICovCglpZiAoSVNfRVJSKG9wcF90YWJsZS0+Y2xrKSkKCQlnb3RvIHB1
dF90YWJsZTsKCgkvKiBEZXZpY2UgbWF5IGhhdmUgZW1wdHkgT1BQIHRhYmxlICovCglpZiAoIV9n
ZXRfb3BwX2NvdW50KG9wcF90YWJsZSkpCgkJZ290byBwdXRfdGFibGU7CgoJcmV0ID0gZGV2X3Bt
X29wcF9zZXRfcmF0ZShkZXYsIGNsa19nZXRfcmF0ZShvcHBfdGFibGUtPmNsaykpOwpwdXRfdGFi
bGU6CgkvKiBEcm9wIHJlZmVyZW5jZSB0YWtlbiBieSBfZmluZF9vcHBfdGFibGUoKSAqLwoJZGV2
X3BtX29wcF9wdXRfb3BwX3RhYmxlKG9wcF90YWJsZSk7CgoJcmV0dXJuIHJldDsKfQpFWFBPUlRf
U1lNQk9MX0dQTChkZXZfcG1fb3BwX3N5bmNfd2l0aF9jbGtfcmF0ZSk7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
