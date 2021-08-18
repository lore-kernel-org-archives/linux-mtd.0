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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BD1C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:38:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E4F60C40
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91E4F60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=knxROwQVEFrlcdrioTXjUpUvkuLLt2hW2GOgjbtb13w=; b=F5V+RWlaB8u3W7de+TvuStdEs+
	mdXvkRe47SDogOdRk+pV/SMsebDAibibhVdB/AG2DBtfQYYRNtqu6YmYRct6M23LApwIqxYtX2vfK
	s07xsLJCWmxZ7Y9ahVSH/9k0Y4DlXvKuf1fqy1/5F7w5xCZf9NTyPu6Lb7zkSyXH/84y4dh+Q4a9j
	Jw3CDgssWB8Zx+mbWQd9Ah2/tHYIReSUHsaoFhovgmsyKd7RY1eNOR6w9DGVcs2c1i1gRlKqSN2ed
	6nDU/DnmjPovJ1ODDEC7rgdRj+nA737mAfL/yS4sgnZSVErGBq092oR2qQwGkdmr1neq/XbizE6A/
	1LjMMMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDKu-0048rH-JO; Wed, 18 Aug 2021 04:37:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDKo-0048oS-8p
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 04:37:54 +0000
Received: by mail-lj1-x22d.google.com with SMTP id w4so1152547ljh.13
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 21:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S4mf5vN/pcvdDF2PDP6Ptfzme/x90AlzqPWZLad8qYk=;
 b=YypYPePkPS0/5iONL6py8zYup5OlWdAHOzXwUxSzXCTttHeiyHI1wBwOMxdh2YLTML
 GUG8WKu/wZ5FCfyCJkx9ssRzVLntih0+ubH+uDS+zmF3bxOqd2tl/449gf1xUqAVXItO
 LqiecgJsCsgvauiiDdsEehmvy0IU9XdA8B4yG8nhfmpfcFmWhN5Jun7BhL8RSDevKzhD
 5m92TbfweR+jl3jR2rl2muugEzylfS+HI0GxLknGIK7R/Man0BfWVmBpB4t+5yrdD4Ss
 yfjwL+HUMAT1ajkSz1UUq6oqw5ejKgNP+90FXVrdigsXBfoBVVWYufOaoxLArk4ZGnuj
 JnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S4mf5vN/pcvdDF2PDP6Ptfzme/x90AlzqPWZLad8qYk=;
 b=FxDmzSetrfATD3kFZhX5tEZEYtZCd76HpSjiwZyhD5qM4tlz4PfAiWs4cAQTvFbddC
 47p8TSpmMDEH5KBpyEkUjaHjUG5a49jQ21UVFMy25PeeH8nYybXIJuzzAGK821xby6/5
 DiZPLF24LCS7YqTtojIrUG0sh4Xa6HGI1Y92j9iLYAMPkhW+M18LC65WI5ohOJ2ue+sT
 RM9SCjXU9YH0VZ6PF6uZ2HbW/QR8q5q1zEPxs4/473+wAtFVvArH98I636SukqMwFXUY
 590+6/v/UZD9Cemc2FuWztphkXsnvMDMfzwNGHIh4fN6/pIvGShrz9hXeMbmXn2RVv1w
 b/Cg==
X-Gm-Message-State: AOAM530ueQqTQk0ulg65cqt6NIRpejyJFAirtifKfXWy5UE7jvAd+cN0
 fgnnP3OOd8GjApI9GjgGBnE=
X-Google-Smtp-Source: ABdhPJyVioyoewr8IK0TXDc8qP95URDUgfYjdExTYurgnMDYKEK8I1b+Ft9rT09ZtYUxKjozPrkphA==
X-Received: by 2002:a05:651c:32f:: with SMTP id
 b15mr5355209ljp.322.1629261468379; 
 Tue, 17 Aug 2021 21:37:48 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id s27sm379103lfs.279.2021.08.17.21.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 21:37:47 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
Date: Wed, 18 Aug 2021 07:37:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_213750_382544_B1A8A20C 
X-CRM114-Status: GOOD (  19.24  )
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

MTguMDguMjAyMSAwNzozMSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTgtMDgtMjEs
IDA3OjEyLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDE4LjA4LjIwMjEgMDY6NTUsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gT24gMTctMDgtMjEsIDE4OjQ5LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+Pj4gMTcuMDguMjAyMSAxMDo1NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6
Cj4+Pj4gLi4uCj4+Pj4+PiAraW50IGRldl9wbV9vcHBfc3luYyhzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4+Pj4+PiArewo+Pj4+Pj4gKwlzdHJ1Y3Qgb3BwX3RhYmxlICpvcHBfdGFibGU7Cj4+Pj4+PiAr
CXN0cnVjdCBkZXZfcG1fb3BwICpvcHA7Cj4+Pj4+PiArCWludCByZXQgPSAwOwo+Pj4+Pj4gKwo+
Pj4+Pj4gKwkvKiBEZXZpY2UgbWF5IG5vdCBoYXZlIE9QUCB0YWJsZSAqLwo+Pj4+Pj4gKwlvcHBf
dGFibGUgPSBfZmluZF9vcHBfdGFibGUoZGV2KTsKPj4+Pj4+ICsJaWYgKElTX0VSUihvcHBfdGFi
bGUpKQo+Pj4+Pj4gKwkJcmV0dXJuIDA7Cj4+Pj4+PiArCj4+Pj4+PiArCWlmICghX2dldF9vcHBf
Y291bnQob3BwX3RhYmxlKSkKPj4+Pj4+ICsJCWdvdG8gcHV0X3RhYmxlOwo+Pj4+Pj4gKwo+Pj4+
Pj4gKwlvcHAgPSBfZmluZF9jdXJyZW50X29wcChkZXYsIG9wcF90YWJsZSk7Cj4+Pj4+PiArCXJl
dCA9IF9zZXRfb3BwKGRldiwgb3BwX3RhYmxlLCBvcHAsIG9wcC0+cmF0ZSk7Cj4+Pj4+Cj4+Pj4+
IEFuZCBJIGFtIG5vdCBzdXJlIGhvdyB0aGlzIHdpbGwgZW5kIHVwIHdvcmtpbmcsIHNpbmNlIG5l
dyBPUFAgd2lsbCBiZQo+Pj4+PiBlcXVhbCB0byBvbGQgb25lLiBTaW5jZSBJIHNlZSB5b3UgY2Fs
bCB0aGlzIGZyb20gcmVzdW1lKCkgYXQgbWFueQo+Pj4+PiBwbGFjZXMuCj4+Pj4KPj4+PiBJbml0
aWFsbHkgT1BQIHRhYmxlIGlzICJ1bmluaXRpYWxpemVkIiBhbmQgb3BwX3RhYmxlLT5lbmFibGVk
PWZhbHNlLAo+Pj4+IGhlbmNlIHRoZSBmaXJzdCBzeW5jIGFsd2F5cyB3b3JrcyBldmVuIGlmIE9Q
UCBpcyBlcXVhbCB0byBvbGQgb25lLiBPbmNlCj4+Pj4gT1BQIGhhcyBiZWVuIHN5bmNlZCwgYWxs
IGZ1cnRoZXIgc3luY3MgYXJlIE5PLU9QcywgaGVuY2UgaXQgZG9lc24ndAo+Pj4+IG1hdHRlciBo
b3cgbWFueSB0aW1lcyBzeW5jaW5nIGlzIGNhbGxlZC4KPj4+Pgo+Pj4+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE0LXJjNi9zb3VyY2UvZHJpdmVycy9vcHAvY29yZS5jI0wx
MDEyCj4+Pgo+Pj4gUmlnaHQsIGJ1dCBob3cgd2lsbCB0aGlzIHdvcmsgZnJvbSBSZXN1bWUgPyBX
b24ndCB0aGF0IGJlIGEgbm8tb3AgPwo+Pgo+PiBUaGUgZmlyc3QgcmVzdW1lIGluaXRpYWxpemVz
IHRoZSBPUFAgc3RhdGUgb24gc3luYywgYWxsIGZ1cnRoZXIgc3luY3Mgb24KPj4gcmVzdW1lIGFy
ZSBuby1vcHMuCj4gCj4gQnV0IHRoZSBPUFBzIHNob3VsZCBhbHJlYWR5IGJlIGluaXRpYWxpemVk
IGFzIHNvbWVvbmUgbXVzdCBoYXZlIGNhbGxlZAo+IG9wcC1zZXQtcmF0ZSBlYXJsaWVyID8gV2h5
IGRvIHRoaXMgZnJvbSByZXN1bWUgYW5kIG5vdCBwcm9iZSA/CgpUaGlzIHdpbGwgc2V0IHZvbHRh
Z2UgbGV2ZWwgd2l0aG91dCBoYXZpbmcgYW4gYWN0aXZlbHkgdXNlZCBoYXJkd2FyZS4KVGFrZSBh
IDNkIGRyaXZlciBmb3IgZXhhbXBsZSwgaWYgeW91IHNldCB0aGUgcmF0ZSBvbiBwcm9iZSBhbmQK
cnBtLXJlc3VtZSB3aWxsIG5ldmVyIGJlIGNhbGxlZCwgdGhlbiB0aGUgdm9sdGFnZSB3aWxsIGJl
IHNldCBoaWdoLAp3aGlsZSBoYXJkd2FyZSBpcyBrZXB0IHN1c3BlbmRlZCBpZiB1c2Vyc3BhY2Ug
d2lsbCBuZXZlciB3YWtlIGl0IHVwIGJ5CmV4ZWN1dGluZyBhIDNkIGpvYi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
