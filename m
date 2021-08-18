Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1B7C4320A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 05:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B3661051
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 05:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65B3661051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cbyCMh1uhlKXFe2kS0OxZD7gXBY7xQrNFMHnHgPSCbk=; b=m+lrGfxsGbH6NVXN5FehJObs70
	jFRD8wTdbSRDeQrze5FJyJFUwtjwdv6WmWI3wbCspXDxKZvfwiNhI/b30qik0nkUSoKDIuKtnITuv
	QPzuciZ4vvVerFsMtYGkBEsjN8Z6WA1VCYTkMiJI2ZrJ9DVdipKsB1oXWVAXjE+nKx/RAxBIthIHx
	TehkqOm8Hqo0sO9iPuOmtd3QITtU+mQ9o1UScE2sdmbLscPdAOUIbuBCMSlMjti7Xxpne2R9cA43U
	Vk79ozP/Irv/tcy91mPEDu1H+20JsEUfvphQ+MOcCmZ5Wdgu3ReKlF8nK6b5z+GUDWXubG3ByyY4g
	dnwnpEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGE1B-004EnI-Uw; Wed, 18 Aug 2021 05:21:38 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGE18-004Ely-Dj
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 05:21:35 +0000
Received: by mail-lj1-x22f.google.com with SMTP id y7so2842370ljp.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 22:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yOpS1WKSzyXtmkcc56y1iDICg2EoTDsJHsY4fPaSb5w=;
 b=czCBETSSjNQa96HeR8S2cXF9WItzalDZ+Bims31/WwUHmduqBSoEIrz2EHd1Rplnvm
 FFwAvQOnG91Y+0pNG7gcjM8fuOK7PmDvtjcps1eXeHj5mFDM7T8Il2gc/dhcMiEnsq3U
 dYqtv8hjrv5XQwoHcnwTEBGrRK1459O7Zm+K8cjotiTE0HUOwS7EWfdq/k1AdFePe/7T
 qIjtoVkBbmE3Zl1qSkUzqZv9CvHixrI856MdhPDyYrJSZk10aF2YpSr+G4t557R0fLe2
 gENb/8qw1Cif5pMMEHqGyMJt9OlS6t5IEPg7dmTF9mJyzzfy4L6tBS3Gp6x5EtTq9Otk
 Id/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yOpS1WKSzyXtmkcc56y1iDICg2EoTDsJHsY4fPaSb5w=;
 b=jDmtB2dziess6L+C4gZK1GudCXaLUdBv24XEm2KUe+33vh18gZAxVICVTn89JCWWey
 1Tu49Y0wBklXNHVLU7pYzrrR6M4Jtjxn3PIPcafsVASaferLW5bHr3R12MDGOLF8nKmM
 9qbuLy6EqvT4TFfI4DO471+KxbjmtpKk7tlDIU0zhEHvF0xvK6rw03g1QsOrwr6MvgRG
 KzXhPewucncvMKB9zv44l/g9WEEYo0Zj6lZizN0hwVXsfbvz+1PT5D3DDEOm2OluBiYN
 OBwpOO1xhwNzz7gaVZXZWAQi1ykjSQBp3OroJlRyRa3kDQfeIoVpRi2w0lnojzZ0MEIl
 SRQA==
X-Gm-Message-State: AOAM533erp5aYNdMtSPdGojw22y/bsagI1n8TFXKZNByGi7zIldnHtny
 wvdeEd9So8woKucq+tVSjhg=
X-Google-Smtp-Source: ABdhPJz2ztpis7OKP5puANjPipNjZh3C0caocgaMorHlmoNO+0jB7HIjn/fYUFG6yGBcOjPS91/Jnw==
X-Received: by 2002:a2e:8553:: with SMTP id u19mr1498129ljj.158.1629264092744; 
 Tue, 17 Aug 2021 22:21:32 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d9sm487076ljq.54.2021.08.17.22.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 22:21:32 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
Date: Wed, 18 Aug 2021 08:21:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818045307.4brb6cafkh3adjth@vireshk-i7>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_222134_532489_A9C12581 
X-CRM114-Status: GOOD (  21.26  )
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

MTguMDguMjAyMSAwNzo1MywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTgtMDgtMjEs
IDA3OjM3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoaXMgd2lsbCBzZXQgdm9sdGFnZSBs
ZXZlbCB3aXRob3V0IGhhdmluZyBhbiBhY3RpdmVseSB1c2VkIGhhcmR3YXJlLgo+PiBUYWtlIGEg
M2QgZHJpdmVyIGZvciBleGFtcGxlLCBpZiB5b3Ugc2V0IHRoZSByYXRlIG9uIHByb2JlIGFuZAo+
PiBycG0tcmVzdW1lIHdpbGwgbmV2ZXIgYmUgY2FsbGVkLCB0aGVuIHRoZSB2b2x0YWdlIHdpbGwg
YmUgc2V0IGhpZ2gsCj4+IHdoaWxlIGhhcmR3YXJlIGlzIGtlcHQgc3VzcGVuZGVkIGlmIHVzZXJz
cGFjZSB3aWxsIG5ldmVyIHdha2UgaXQgdXAgYnkKPj4gZXhlY3V0aW5nIGEgM2Qgam9iLgo+IAo+
IFdoYXQgZXhhY3RseSBhcmUgd2UgbG9va2luZyB0byBhY2hpZXZlIHdpdGggdGhpcyBzdHVmZiA/
IENhY2hlIHRoZQo+IGN1cnJlbnQgcGVyZm9ybWFuY2Ugc3RhdGUgd2l0aCBnZW5wZCAoYmFzZWQg
b24gdGhlIHN0YXRlIGJvb3Rsb2FkZXIncwo+IGhhcyBzZXQpID8KClllcywgR0VOUEQgd2lsbCBj
YWNoZSB0aGUgcGVyZiBzdGF0ZSBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUgYW5kIGluaXRpYWxseQpj
YWNoZWQgdmFsdWUgaXMgb3V0IG9mIHN5bmMgd2l0aCBoL3cuCgo+IE9yIGFueXRoaW5nIGVsc2Ug
YXMgd2VsbCA/CgpOb3RoaW5nIGVsc2UuIEJ1dCBsZXQgbWUgY2xhcmlmeSBpdCBhbGwgYWdhaW4u
CgpJbml0aWFsbHkgdGhlIHBlcmZvcm1hbmNlIHN0YXRlIG9mIGFsbCBHRU5QRHMgaXMgMCBmb3Ig
YWxsIGRldmljZXMuCgpUaGUgY2xvY2sgcmF0ZSBpcyBwcmVpbml0aWFsaXplZCBmb3IgYWxsIGRl
dmljZXMgdG8gYSBzb21lIGRlZmF1bHQgcmF0ZQpieSBjbGsgZHJpdmVyLCBvciBieSBib290bG9h
ZGVyIG9yIGJ5IGFzc2lnbmVkLWNsb2NrcyBpbiBEVC4KCldoZW4gZGV2aWNlIGlzIHJwbS1yZXN1
bWVkLCB0aGUgcmVzdW1lIGNhbGxiYWNrIG9mIGEgZGV2aWNlIGRyaXZlcgplbmFibGVzIHRoZSBj
bG9jay4KCkJlZm9yZSBjbG9jayBpcyBlbmFibGVkLCB0aGUgdm9sdGFnZSBuZWVkcyB0byBiZSBj
b25maWd1cmVkIGluCmFjY29yZGFuY2UgdG8gdGhlIGNsayByYXRlLgoKU28gbm93IHdlIGhhdmUg
YSBHRU5QRCB3aXRoIHBzdGF0ZT0wIG9uIGEgZmlyc3QgcnBtLXJlc3VtZSwgd2hpY2gKZG9lc24n
dCBtYXRjaCB0aGUgaC93IGNvbmZpZ3VyYXRpb24uIENhbGxpbmcgZGV2X3BtX29wcF9zeW5jKCkg
c2V0cyB0aGUKcHN0YXRlIGluIGFjY29yZGFuY2UgdG8gdGhlIGgvdyBjb25maWcuCgpJbiBhIHBy
ZXZpb3VzIHY3IEkgcHJvcG9zZWQgdG8gcHJlc2V0IHRoZSBycG1fcHN0YXRlIG9mIEdFTlBEIChw
ZXJmCmxldmVsIHRoYXQgaXMgcmVzdG9yZWQgYmVmb3JlIGRldmljZSBpcyBycG0tcmVzdW1lZCkg
ZnJvbSBQRCdzCmF0dGFjaF9kZXYgY2FsbGJhY2ssIGJ1dCBVbGYgZGlkbid0IGxpa2UgdGhhdCBi
ZWNhdXNlIGl0IHJlcXVpcmVzIHRvIHVzZQphbmQgbW9kaWZ5IEdFTlBEICdwcml2YXRlJyB2YXJp
YWJsZXMgZnJvbSBhIFBEIGRyaXZlci4gV2UgZGVjaWRlZCB0aGF0CndpbGwgYmUgYmV0dGVyIHRv
IG1ha2UgZGV2aWNlIGRyaXZlcnMgdG8gZXhwbGljaXRseSBzeW5jIHRoZSBwZXJmIHN0YXRlLAp3
aGljaCBJIGltcGxlbWVudGVkIGluIHRoaXMgdjguCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
