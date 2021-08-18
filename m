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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F394C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:46:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E60246101A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E60246101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B8wtRd5QXsAw9NiKmftWcQur0eRasEGtfuuowbl8his=; b=lzMvGtvmNP05tgP/YW/XPfXMnd
	lm1bdNhdmODE9VRoxmFRJQLgLcgY323BJ4JM3VQN6hfofNL8fhNJ7WV4yMiwv0nZmnHVrmHb5DFyR
	TtuQ3MNzqcTZFBCXSbn5s4xeYBOSp0VN7UWz1iHGtIQfU/funVOZwSiRA1VbdtPWjAEf/SDuwuKfi
	RWn96JyJhC/4dCgMWhLpsI3V2ETkFne6rppQV3v9gDEJmhPGaWlVgf2eKNRYsV9uILbnvzLfR5nIR
	22C+xS1MYaCNG0KXC3wH4trJ3Q4jGnG4TE03sqc/rLqwv4Acwcido7mS/cXmTa2BI8H3+fmTt/K67
	mtBgKA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNlh-0066Be-JV; Wed, 18 Aug 2021 15:46:17 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNld-0066AN-EN
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 15:46:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id y34so5550415lfa.8
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JieIqWdhDDBOyoPQjj0L36XO6x8aJlMqSaMCMlfoZXA=;
 b=djv3Y4pk3V9YUhEA2+Gp7+1puSGj/ScHPzkFaChXRMQ9M5OMmulU1OjrBl8G1QZ+Sd
 u/OsC07L8kILBtvZw3VRSsYC2EFjSMQbF5wT+1yI9SCq0UfT2ra5mmwQLk71rDCt52ix
 +WGFoDUc0+yAkAosChOb9CVwlpU8GOJOVGPb6vn+ghBMisK2B72C3WCnuVO1CY4z0SFW
 dwbBRAzomUOkWquhEQgz6ZWmGjojVv1nYnUhIzdx0oQg23e6McWrhqImpDmmiXFwn1Ch
 axdy3S2COKId/VAFRe/Vw3Og9nEzScvpEh5CqOIRp3SqzrgDxkvcVltSFp1kEPyMrI3N
 dOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JieIqWdhDDBOyoPQjj0L36XO6x8aJlMqSaMCMlfoZXA=;
 b=EcXhJ8YB2glgcqABXDgz3Hv0Fw0GpdcG55ZzAZRT9+CTmjpuz10nFOc0PjHKfZDR9v
 59mSgzNRKg3FTzw06F5AHeM0uQDVV9N/oh6C2wZUZ2utvjX5s0s1chNj64W5xlWR1GBq
 viGT6XFqa6o+XYoDqB43ocTaZvl23iSCu61Ay70PHc64t2Qv0GEqyEjYgp4Gdsq2Xlt5
 UCSScYrT+oq8rta8zVdgc7RX5DK6b3fBVrIIAv8XiKoiPv1hbjuRVPLvjNfhaaEo3OE3
 91WmASRqUXasPXvQgrhmGGxTBCi7tTCg6UTe/N40tlr85PSlhDeWIFdNphfuJSIAnRIp
 lT7g==
X-Gm-Message-State: AOAM5330/RhtJ12lqAtJAKiHmeT32Eai36cKM1r8nVsPDxb2L4tCtwza
 oVyFJ3mjxVZWkibb8YyqmnI=
X-Google-Smtp-Source: ABdhPJyz6htisvp+J6/IItkzMKPUV9WFPIMTTkHzWeWJzG1OYk6xq6Q2Gi45+ssTCXzSje0g7I6JOg==
X-Received: by 2002:a05:6512:45b:: with SMTP id
 y27mr6749279lfk.619.1629301571851; 
 Wed, 18 Aug 2021 08:46:11 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id g27sm6017lfh.300.2021.08.18.08.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:46:11 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
From: Dmitry Osipenko <digetx@gmail.com>
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
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
 <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
 <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
Message-ID: <fd791644-e295-a56a-459e-82a4de2691bb@gmail.com>
Date: Wed, 18 Aug 2021 18:46:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_084613_561746_C9203F47 
X-CRM114-Status: GOOD (  28.48  )
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

MTguMDguMjAyMSAxODo0MywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTguMDguMjAy
MSAxMzowOCwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPj4gT24gV2VkLCAxOCBBdWcgMjAyMSBh
dCAxMTo1MCwgVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4+
Pgo+Pj4gT24gMTgtMDgtMjEsIDExOjQxLCBVbGYgSGFuc3NvbiB3cm90ZToKPj4+PiBPbiBXZWQs
IDE4IEF1ZyAyMDIxIGF0IDExOjE0LCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8u
b3JnPiB3cm90ZToKPj4+Pj4gV2hhdCB3ZSBuZWVkIGhlcmUgaXMganVzdCBjb25maWd1cmUuIFNv
IHNvbWV0aGluZyBsaWtlIHRoaXMgdGhlbjoKPj4+Pj4KPj4+Pj4gLSBnZW5wZC0+Z2V0X3BlcmZv
cm1hbmNlX3N0YXRlKCkKPj4+Pj4gICAtPiBkZXZfcG1fb3BwX2dldF9jdXJyZW50X29wcCgpIC8v
TmV3IEFQSQo+Pj4+PiAgIC0+IGRldl9wbV9nZW5wZF9zZXRfcGVyZm9ybWFuY2Vfc3RhdGUoZGV2
LCBjdXJyZW50X29wcC0+cHN0YXRlKTsKPj4+Pj4KPj4+Pj4gVGhpcyBjYW4gYmUgZG9uZSBqdXN0
IG9uY2UgZnJvbSBwcm9iZSgpIHRoZW4uCj4+Pj4KPj4+PiBIb3cgd291bGQgZGV2X3BtX29wcF9n
ZXRfY3VycmVudF9vcHAoKSB3b3JrPyBEbyB5b3UgaGF2ZSBhIHN1Z2dlc3Rpb24/Cj4+Pgo+Pj4g
VGhlIG9wcCBjb3JlIGFscmVhZHkgaGFzIGEgd2F5IG9mIGZpbmRpbmcgY3VycmVudCBPUFAsIHRo
YXQncyB3aGF0Cj4+PiBEbWl0cnkgaXMgdHJ5aW5nIHRvIHVzZSBoZXJlLiBJdCBmaW5kcyBpdCB1
c2luZyBjbGtfZ2V0X3JhdGUoKSwgaWYKPj4+IHRoYXQgaXMgemVybywgaXQgcGlja3MgdGhlIGxv
d2VzdCBmcmVxIHBvc3NpYmxlLgo+Pj4KPj4+PiBJIGFtIHN1cmUgSSB1bmRlcnN0YW5kIHRoZSBw
cm9ibGVtLiBXaGVuIGEgZGV2aWNlIGlzIGdldHRpbmcgcHJvYmVkLAo+Pj4+IGl0IG5lZWRzIHRv
IGNvbnN1bWUgcG93ZXIsIGhvdyBlbHNlIGNhbiB0aGUgY29ycmVzcG9uZGluZyBkcml2ZXIKPj4+
PiBzdWNjZXNzZnVsbHkgcHJvYmUgaXQ/Cj4+Pgo+Pj4gRG1pdHJ5IGNhbiBhbnN3ZXIgdGhhdCBi
ZXR0ZXIsIGJ1dCBhIGRldmljZSBkb2Vzbid0IG5lY2Vzc2FyaWx5IG5lZWQKPj4+IHRvIGNvbnN1
bWUgZW5lcmd5IGluIHByb2JlLiBJdCBjYW4gY29uc3VtZSBidXMgY2xvY2ssIGxpa2UgQVBCIHdl
Cj4+PiBoYXZlLCBidXQgdGhlIG1vcmUgZW5lcmd5IGNvbnN1bWluZyBzdHVmZiBjYW4gYmUgbGVm
dCBkaXNhYmxlZCB1bnRpbAo+Pj4gdGhlIHRpbWUgYSB1c2VyIGNvbWVzIHVwLiBQcm9iZSB3aWxs
IGp1c3QgZW5kIHVwIHJlZ2lzdGVyaW5nIHRoZQo+Pj4gZHJpdmVyIGFuZCBpbml0aWFsaXppbmcg
aXQuCj4+Cj4+IFRoYXQncyBwZXJmZWN0bHkgZmluZSwgYXMgdGhlbiBpdCdzIGxpa2VseSB0aGF0
IGl0IHdvbid0IHZvdGUgZm9yIGFuCj4+IE9QUCwgYnV0IGNhbiBwb3N0cG9uZSB0aGF0IGFzIHdl
bGwuCj4+Cj4+IFBlcmhhcHMgdGhlIHByb2JsZW0gaXMgcmF0aGVyIHRoYXQgdGhlIEhXIG1heSBh
bHJlYWR5IGNhcnJ5IGEgbm9uLXplcm8KPj4gdm90ZSBtYWRlIGZyb20gYSBib290bG9hZGVyLiBJ
ZiB0aGUgY29uc3VtZXIgZHJpdmVyIHRyaWVzIHRvIGNsZWFyCj4+IHRoYXQgdm90ZSAoY2FsbGlu
ZyBkZXZfcG1fb3BwX3NldF9yYXRlKGRldiwgMCksIGZvciBleGFtcGxlKSwgaXQgd291bGQKPj4g
c3RpbGwgbm90IGxlYWQgdG8gYW55IHVwZGF0ZXMgb2YgdGhlIHBlcmZvcm1hbmNlIHN0YXRlIGlu
IGdlbnBkLAo+PiBiZWNhdXNlIGdlbnBkIGludGVybmFsbHkgaGFzIGluaXRpYWxpemVkIHRoZSBw
ZXJmb3JtYW5jZS1zdGF0ZSB0bwo+PiB6ZXJvLgo+IAo+IFdlIGRvbid0IG5lZWQgdG8gZGlzY292
ZXIgaW50ZXJuYWwgU29DIGRldmljZXMgYmVjYXVzZSB3ZSB1c2UKPiBkZXZpY2UtdHJlZSBvbiBB
Uk0uIEZvciBtb3N0IGRldmljZXMgcG93ZXIgaXNuJ3QgcmVxdWlyZWQgYXQgYSBwcm9iZQo+IHRp
bWUgYmVjYXVzZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IHRvdWNoIGgvdyBhdCBhbGwsIHRodXMg
ZGV2aWNlcyBhcmUKPiBsZWZ0IGluIHN1c3BlbmRlZCBzdGF0ZSBhZnRlciBwcm9iZS4KPiAKPiBX
ZSBoYXZlIHRocmVlIGNvbXBvbmVudHMgY29tcHJpc2luZyBQTSBvbiBUZWdyYToKPiAKPiAxLiBQ
b3dlciBnYXRlCj4gMi4gQ2xvY2sgc3RhdGUKPiAzLiBWb2x0YWdlIHN0YXRlCj4gCj4gR0VOUEQg
b24vb2ZmIHJlcHJlc2VudHMgdGhlICdwb3dlciBnYXRlJy4KPiAKPiBDbG9jayBhbmQgcmVzZXQg
YXJlIGNvbnRyb2xsZWQgYnkgZGV2aWNlIGRyaXZlcnMgdXNpbmcgY2xrIGFuZCByc3QgQVBJcy4K
PiAKPiBWb2x0YWdlIHN0YXRlIGlzIHJlcHJlc2VudGVkIGJ5IEdFTlBEJ3MgcGVyZm9ybWFuY2Ug
bGV2ZWwuCgpPUFAgZnJhbWV3b3JrIGNvdXBsZXMgdGhlIHBlcmZvcm1hbmNlIGxldmVsIHdpdGgg
dGhlIGNsb2NrIHJhdGUuCgo+IEdFTlBEIGNvcmUgYXNzdW1lcyB0aGF0IGF0IGEgZmlyc3QgcnBt
LXJlc3VtZSBvZiBhIGNvbnN1bWVyIGRldmljZSwgaXRzCj4gZ2VucGRfcGVyZm9ybWFuY2U9MC4g
Tm90IHRydWUgZm9yIFRlZ3JhIGJlY2F1c2UgaC93IG9mIHRoZSBkZXZpY2UgaXMKPiBwcmVjb25m
aWd1cmVkIHRvIGEgbm9uLXplcm8gcGVyZiBsZXZlbCBpbml0aWFsbHksIGgvdyBtYXkgbm90IHN1
cHBvcnQKPiB6ZXJvIGxldmVsIGF0IGFsbC4KPiAKPiBHRU5QRCBjb3JlIGFzc3VtZXMgdGhhdCBj
b25zdW1lciBkZXZpY2VzIGNhbiB3b3JrIGF0IGFueSBwZXJmb3JtYW5jZQo+IGxldmVsLiBOb3Qg
dHJ1ZSBmb3IgVGVncmEgYmVjYXVzZSB2b2x0YWdlIG5lZWRzIHRvIGJlIHNldCBpbiBhY2NvcmRh
bmNlCj4gdG8gdGhlIGNsb2NrIHJhdGUgYmVmb3JlIGNsb2NrIGlzIGVuYWJsZWQsIG90aGVyd2lz
ZSBoL3cgd29uJ3Qgd29yawo+IHByb3Blcmx5LCBwZXJoYXBzIGNsb2NrIG1heSBiZSB1bnN0YWJs
ZSBvciBoL3cgd29uJ3QgYmUgbGF0Y2hpbmcuCj4gCj4gUGVyZm9ybWFuY2UgbGV2ZWwgc2hvdWxk
IGJlIHNldCB0byAwIHdoaWxlIGRldmljZSBpcyBzdXNwZW5kZWQuCj4gUGVyZm9ybWFuY2UgbGV2
ZWwgbmVlZHMgdG8gYmUgYnVtcGVkIG9uIHJwbS1yZXN1bWUgb2YgYSBkZXZpY2UgaW4KPiBhY2Nv
cmRhbmNlIHRvIGgvdyBzdGF0ZSBiZWZvcmUgaGFyZHdhcmUgaXMgZW5hYmxlZC4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
