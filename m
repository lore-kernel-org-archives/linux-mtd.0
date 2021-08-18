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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F950C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDF460EFF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CDF460EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PuBsoMYXXV3M6rWLOUkaBp1ZlVyFu52dZONnjtOD0qs=; b=jmOuf8pb0RmUh8QGVPkHm221pi
	Jormpj48FzRhxydymCdcErizIVSVe9D1BvwgRdjcOAVhmnjj0xjcDhxMlBxndBFMkWQMYyJ9t9ObS
	Okk2UgPKNdhwrIUgYkVV/OE6sA0DJzQ7iokahZGxcYGwUA6si2juIfjvdx/WBeysfapos2kI3TJ/H
	suXW0/AS4vxqrYScERrhRRAxjAnGxFkyZXTZ4dHEra9nIhnnZiHhfg8dNOApZpfHfUpnehN1EJdjO
	Uzlsn6mNVWp0hvM0uBIfx21uCm/B0tFKk4L9316zxMO44OUMBqEgz201XaaLrSBXX8fXEsrPnHnGT
	UFeCiCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNiv-0065Oe-VD; Wed, 18 Aug 2021 15:43:26 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNij-0065K4-Cm
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 15:43:16 +0000
Received: by mail-lj1-x231.google.com with SMTP id q21so5898245ljj.6
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lIuMFp8lfdAxjvsE4KV5hsgygseTRFOfUkeg317UTqw=;
 b=dtxLX4b5qLF8zJg4U/tH1i5TLkCJQlLRGlM2ztQHxAxkEicBA3GgWrdEZtc+2qzQQ0
 6a8pb1OUyJBXSSUlTK4EwMpTqT1ojblCSfASZ95zK5PrbpQsC7mdRTU1//Ez3cWcrBRe
 Iq/odKvRlhN3wJQDN8V8dZOm8Clfju/bJu1hebRScB6VdPRLcb8AsNEhaoe5Nz2Fcb7V
 xDRyCCAdBrHHixEpfT3gLjONzBy264Yfv49IIXx4JnjGiqPrqldsrBs6YegkW2URPTvj
 GDyCPXiG3rcBxKDlskFp0j+TcRhfWoCzYU6QHjIUcKA7TczgiZtN0vnVaED8i1VKeTlS
 ny2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lIuMFp8lfdAxjvsE4KV5hsgygseTRFOfUkeg317UTqw=;
 b=TTfIaEWSq4bqppjfRA/M22XIUUor15sWXh7X4tzMcS4qC4wVazRUzjpL0F3R44mM0k
 lH1+FKrW3N8WgWQRd+JBNWk4hJqfA50s5cJ5I5WTIDB5+lFADnWLZwjPs9TefNzhJ/sO
 ZdEW99NPa2J/GKyKi+W5tW4QwAmhxVcbFzYWMrdXexOF0MxAh99b5d+C04Cfru/n6MY8
 IfUNVjzDUDnz/HIre5iOpOVWvxLmHdBkfm6Y68QkitnyUh1gNzqH/spGGZ/4WFBMs5/d
 3jfVyjeHeX1t5EBCRZ6G5w0tnspNRtmxV3UOBhTuB+XDKpk3es9cZ2ASVfkzhT44ctZ/
 7Yyg==
X-Gm-Message-State: AOAM533P2iD2Eb+GtPHsSdaX2pfaSdnNa3gmmKf+UVmRuRPTKsgNUVOb
 gAofQvlPcQTj5noWFYoePOc=
X-Google-Smtp-Source: ABdhPJxHinOU9QfMFxcyBQEWGYvz/BOpXsNrwiitYcP2iJAqNtbW+KnNJW82u2bMuO8HNcWCppaSuQ==
X-Received: by 2002:a2e:8008:: with SMTP id j8mr8242690ljg.233.1629301390791; 
 Wed, 18 Aug 2021 08:43:10 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d20sm6145lfs.155.2021.08.18.08.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:43:10 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
Date: Wed, 18 Aug 2021 18:43:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_084313_485950_06CF2288 
X-CRM114-Status: GOOD (  26.61  )
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

MTguMDguMjAyMSAxMzowOCwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPiBPbiBXZWQsIDE4IEF1
ZyAyMDIxIGF0IDExOjUwLCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPiB3
cm90ZToKPj4KPj4gT24gMTgtMDgtMjEsIDExOjQxLCBVbGYgSGFuc3NvbiB3cm90ZToKPj4+IE9u
IFdlZCwgMTggQXVnIDIwMjEgYXQgMTE6MTQsIFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxp
bmFyby5vcmc+IHdyb3RlOgo+Pj4+IFdoYXQgd2UgbmVlZCBoZXJlIGlzIGp1c3QgY29uZmlndXJl
LiBTbyBzb21ldGhpbmcgbGlrZSB0aGlzIHRoZW46Cj4+Pj4KPj4+PiAtIGdlbnBkLT5nZXRfcGVy
Zm9ybWFuY2Vfc3RhdGUoKQo+Pj4+ICAgLT4gZGV2X3BtX29wcF9nZXRfY3VycmVudF9vcHAoKSAv
L05ldyBBUEkKPj4+PiAgIC0+IGRldl9wbV9nZW5wZF9zZXRfcGVyZm9ybWFuY2Vfc3RhdGUoZGV2
LCBjdXJyZW50X29wcC0+cHN0YXRlKTsKPj4+Pgo+Pj4+IFRoaXMgY2FuIGJlIGRvbmUganVzdCBv
bmNlIGZyb20gcHJvYmUoKSB0aGVuLgo+Pj4KPj4+IEhvdyB3b3VsZCBkZXZfcG1fb3BwX2dldF9j
dXJyZW50X29wcCgpIHdvcms/IERvIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbj8KPj4KPj4gVGhlIG9w
cCBjb3JlIGFscmVhZHkgaGFzIGEgd2F5IG9mIGZpbmRpbmcgY3VycmVudCBPUFAsIHRoYXQncyB3
aGF0Cj4+IERtaXRyeSBpcyB0cnlpbmcgdG8gdXNlIGhlcmUuIEl0IGZpbmRzIGl0IHVzaW5nIGNs
a19nZXRfcmF0ZSgpLCBpZgo+PiB0aGF0IGlzIHplcm8sIGl0IHBpY2tzIHRoZSBsb3dlc3QgZnJl
cSBwb3NzaWJsZS4KPj4KPj4+IEkgYW0gc3VyZSBJIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0uIFdo
ZW4gYSBkZXZpY2UgaXMgZ2V0dGluZyBwcm9iZWQsCj4+PiBpdCBuZWVkcyB0byBjb25zdW1lIHBv
d2VyLCBob3cgZWxzZSBjYW4gdGhlIGNvcnJlc3BvbmRpbmcgZHJpdmVyCj4+PiBzdWNjZXNzZnVs
bHkgcHJvYmUgaXQ/Cj4+Cj4+IERtaXRyeSBjYW4gYW5zd2VyIHRoYXQgYmV0dGVyLCBidXQgYSBk
ZXZpY2UgZG9lc24ndCBuZWNlc3NhcmlseSBuZWVkCj4+IHRvIGNvbnN1bWUgZW5lcmd5IGluIHBy
b2JlLiBJdCBjYW4gY29uc3VtZSBidXMgY2xvY2ssIGxpa2UgQVBCIHdlCj4+IGhhdmUsIGJ1dCB0
aGUgbW9yZSBlbmVyZ3kgY29uc3VtaW5nIHN0dWZmIGNhbiBiZSBsZWZ0IGRpc2FibGVkIHVudGls
Cj4+IHRoZSB0aW1lIGEgdXNlciBjb21lcyB1cC4gUHJvYmUgd2lsbCBqdXN0IGVuZCB1cCByZWdp
c3RlcmluZyB0aGUKPj4gZHJpdmVyIGFuZCBpbml0aWFsaXppbmcgaXQuCj4gCj4gVGhhdCdzIHBl
cmZlY3RseSBmaW5lLCBhcyB0aGVuIGl0J3MgbGlrZWx5IHRoYXQgaXQgd29uJ3Qgdm90ZSBmb3Ig
YW4KPiBPUFAsIGJ1dCBjYW4gcG9zdHBvbmUgdGhhdCBhcyB3ZWxsLgo+IAo+IFBlcmhhcHMgdGhl
IHByb2JsZW0gaXMgcmF0aGVyIHRoYXQgdGhlIEhXIG1heSBhbHJlYWR5IGNhcnJ5IGEgbm9uLXpl
cm8KPiB2b3RlIG1hZGUgZnJvbSBhIGJvb3Rsb2FkZXIuIElmIHRoZSBjb25zdW1lciBkcml2ZXIg
dHJpZXMgdG8gY2xlYXIKPiB0aGF0IHZvdGUgKGNhbGxpbmcgZGV2X3BtX29wcF9zZXRfcmF0ZShk
ZXYsIDApLCBmb3IgZXhhbXBsZSksIGl0IHdvdWxkCj4gc3RpbGwgbm90IGxlYWQgdG8gYW55IHVw
ZGF0ZXMgb2YgdGhlIHBlcmZvcm1hbmNlIHN0YXRlIGluIGdlbnBkLAo+IGJlY2F1c2UgZ2VucGQg
aW50ZXJuYWxseSBoYXMgaW5pdGlhbGl6ZWQgdGhlIHBlcmZvcm1hbmNlLXN0YXRlIHRvCj4gemVy
by4KCldlIGRvbid0IG5lZWQgdG8gZGlzY292ZXIgaW50ZXJuYWwgU29DIGRldmljZXMgYmVjYXVz
ZSB3ZSB1c2UKZGV2aWNlLXRyZWUgb24gQVJNLiBGb3IgbW9zdCBkZXZpY2VzIHBvd2VyIGlzbid0
IHJlcXVpcmVkIGF0IGEgcHJvYmUKdGltZSBiZWNhdXNlIHByb2JlIGZ1bmN0aW9uIGRvZXNuJ3Qg
dG91Y2ggaC93IGF0IGFsbCwgdGh1cyBkZXZpY2VzIGFyZQpsZWZ0IGluIHN1c3BlbmRlZCBzdGF0
ZSBhZnRlciBwcm9iZS4KCldlIGhhdmUgdGhyZWUgY29tcG9uZW50cyBjb21wcmlzaW5nIFBNIG9u
IFRlZ3JhOgoKMS4gUG93ZXIgZ2F0ZQoyLiBDbG9jayBzdGF0ZQozLiBWb2x0YWdlIHN0YXRlCgpH
RU5QRCBvbi9vZmYgcmVwcmVzZW50cyB0aGUgJ3Bvd2VyIGdhdGUnLgoKQ2xvY2sgYW5kIHJlc2V0
IGFyZSBjb250cm9sbGVkIGJ5IGRldmljZSBkcml2ZXJzIHVzaW5nIGNsayBhbmQgcnN0IEFQSXMu
CgpWb2x0YWdlIHN0YXRlIGlzIHJlcHJlc2VudGVkIGJ5IEdFTlBEJ3MgcGVyZm9ybWFuY2UgbGV2
ZWwuCgpHRU5QRCBjb3JlIGFzc3VtZXMgdGhhdCBhdCBhIGZpcnN0IHJwbS1yZXN1bWUgb2YgYSBj
b25zdW1lciBkZXZpY2UsIGl0cwpnZW5wZF9wZXJmb3JtYW5jZT0wLiBOb3QgdHJ1ZSBmb3IgVGVn
cmEgYmVjYXVzZSBoL3cgb2YgdGhlIGRldmljZSBpcwpwcmVjb25maWd1cmVkIHRvIGEgbm9uLXpl
cm8gcGVyZiBsZXZlbCBpbml0aWFsbHksIGgvdyBtYXkgbm90IHN1cHBvcnQKemVybyBsZXZlbCBh
dCBhbGwuCgpHRU5QRCBjb3JlIGFzc3VtZXMgdGhhdCBjb25zdW1lciBkZXZpY2VzIGNhbiB3b3Jr
IGF0IGFueSBwZXJmb3JtYW5jZQpsZXZlbC4gTm90IHRydWUgZm9yIFRlZ3JhIGJlY2F1c2Ugdm9s
dGFnZSBuZWVkcyB0byBiZSBzZXQgaW4gYWNjb3JkYW5jZQp0byB0aGUgY2xvY2sgcmF0ZSBiZWZv
cmUgY2xvY2sgaXMgZW5hYmxlZCwgb3RoZXJ3aXNlIGgvdyB3b24ndCB3b3JrCnByb3Blcmx5LCBw
ZXJoYXBzIGNsb2NrIG1heSBiZSB1bnN0YWJsZSBvciBoL3cgd29uJ3QgYmUgbGF0Y2hpbmcuCgpQ
ZXJmb3JtYW5jZSBsZXZlbCBzaG91bGQgYmUgc2V0IHRvIDAgd2hpbGUgZGV2aWNlIGlzIHN1c3Bl
bmRlZC4KUGVyZm9ybWFuY2UgbGV2ZWwgbmVlZHMgdG8gYmUgYnVtcGVkIG9uIHJwbS1yZXN1bWUg
b2YgYSBkZXZpY2UgaW4KYWNjb3JkYW5jZSB0byBoL3cgc3RhdGUgYmVmb3JlIGhhcmR3YXJlIGlz
IGVuYWJsZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
