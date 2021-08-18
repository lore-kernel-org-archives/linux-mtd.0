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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA8FC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 06:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CA360FDA
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 06:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4CA360FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZB9OZGUszafEOTuh+G0MIsIHr2cP+TFut1tySIzp0S4=; b=vH3wL1OFjRBqV8nRZ8Ee6GDHrN
	qcplIy3qtTAARFxmxJFqtafsnuB2EVHkPbfUeHEV8xVFrjKIveRRN2koTTAbYdi6c6JsFWBJqS+1z
	hIHx7JwEZkaxSvHFq+DRFlYKhs5Y5uyCY9k5fKWr7FfWWYVCOD8usx7f104wr8aTqKxlP7YGzADXh
	WYJxl/P4RkbbBbPsrcZ8DmMRla6vV5tt9NI9r84Upxf/6mGBfGy7kfx6DVnsCLIJvl0Zv6Amk4ixf
	nkzmmwqEhifbfzwZDPNddyyhZ3jx11tYUmZFQB8Ems0QBjdIfd75ura5AQqh/gt60HwsuKB0JteBR
	5HxvnnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGEye-004M6F-9n; Wed, 18 Aug 2021 06:23:04 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGEyb-004M50-9B
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 06:23:02 +0000
Received: by mail-lj1-x232.google.com with SMTP id f2so3093069ljn.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HRbW8G1xwSB2ls1NijjktR4beuv1neTM9+sNIEIh1SY=;
 b=QhekG6HEhPh05G6EVGmH5gG1vsu7rLtXHoMmf8TooWyY48CtokKXpp3Ao28M9gzDIL
 bOVJgsJpVuu4U6ZWhqbn/zzSzP/fh3SXlt9kSPpa9GZDTZZhDmzkZCL094g6b3/xpTlq
 nR0VqcsEMuT8DrZzKg9OpHD9vAWhvLMA9THzTn2p/fALoh3IOyqRWsGfYkKKKn80LTpF
 0ONjMpwOjktQ6neNrcoQ/FCq6G1LpKBpZ2d3r2xDohXQf3R33Yqsm7PvyRSmOAMdrmX2
 8g7Na8C+8jCc1UJQu7St/hkelmGm9SnYblY2IzzA+hu0M9oU3v9y97qHAydPZ+UblpGW
 RUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HRbW8G1xwSB2ls1NijjktR4beuv1neTM9+sNIEIh1SY=;
 b=tJgpgS6znKMsGgKlWOvOyGIXpIMQZzIAh9Efvb3LBn+dJQWcfTiDsGbAn1LkybDj2a
 nWe1xe/UlspofX/suITX5HUBROb972DPWmGAMZo48NL+FgzonzpLMUdaX1BdR4Bk4tI/
 ctPqI/3sFbJ2ItjdB9FcRgPJviNJ7mTsKpdPRMr8syb3kXQWMzMhyfjyKu4X4PDiNK8W
 NYDpdQuAweyOIUGCL4nhxOUNRDIP0Lrx5YrfDnHbA2T36u2TgwVkPs7WtZtLarPVFRd6
 V9vjJKPWEu0yAEiFaUlzEQHqvaoXJUbPekB6Hy7lOr6o5eFitylQLzn2EUGKHYwamJSA
 jvzA==
X-Gm-Message-State: AOAM530UCzQ8WuQEq4tPjRLXXDNO7UN/GyS95j1D2tKfHjGN591iWvin
 WojVtdtSfYD00+5m53id7K0=
X-Google-Smtp-Source: ABdhPJyL01ZM7X19Ri9kaNq915zcz165uE238H3LdTxs+q0TxSrtrvPc1BOJdsnl0Akd4i2Y2iKECw==
X-Received: by 2002:a2e:a785:: with SMTP id c5mr6383685ljf.434.1629267778216; 
 Tue, 17 Aug 2021 23:22:58 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id w4sm503212ljg.99.2021.08.17.23.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 23:22:57 -0700 (PDT)
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
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
Date: Wed, 18 Aug 2021 09:22:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_232301_390118_B1F3A8FF 
X-CRM114-Status: GOOD (  26.97  )
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

MTguMDguMjAyMSAwODo1OCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTgtMDgtMjEs
IDA4OjIxLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFllcywgR0VOUEQgd2lsbCBjYWNoZSB0
aGUgcGVyZiBzdGF0ZSBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUgYW5kIGluaXRpYWxseQo+PiBjYWNo
ZWQgdmFsdWUgaXMgb3V0IG9mIHN5bmMgd2l0aCBoL3cuCj4+Cj4+IE5vdGhpbmcgZWxzZS4gQnV0
IGxldCBtZSBjbGFyaWZ5IGl0IGFsbCBhZ2Fpbi4KPiAKPiBUaGFua3MgZm9yIHlvdXIgZXhwbGFu
YXRpb24uCj4gCj4+IEluaXRpYWxseSB0aGUgcGVyZm9ybWFuY2Ugc3RhdGUgb2YgYWxsIEdFTlBE
cyBpcyAwIGZvciBhbGwgZGV2aWNlcy4KPj4KPj4gVGhlIGNsb2NrIHJhdGUgaXMgcHJlaW5pdGlh
bGl6ZWQgZm9yIGFsbCBkZXZpY2VzIHRvIGEgc29tZSBkZWZhdWx0IHJhdGUKPj4gYnkgY2xrIGRy
aXZlciwgb3IgYnkgYm9vdGxvYWRlciBvciBieSBhc3NpZ25lZC1jbG9ja3MgaW4gRFQuCj4+Cj4+
IFdoZW4gZGV2aWNlIGlzIHJwbS1yZXN1bWVkLCB0aGUgcmVzdW1lIGNhbGxiYWNrIG9mIGEgZGV2
aWNlIGRyaXZlcgo+PiBlbmFibGVzIHRoZSBjbG9jay4KPj4KPj4gQmVmb3JlIGNsb2NrIGlzIGVu
YWJsZWQsIHRoZSB2b2x0YWdlIG5lZWRzIHRvIGJlIGNvbmZpZ3VyZWQgaW4KPj4gYWNjb3JkYW5j
ZSB0byB0aGUgY2xrIHJhdGUuCj4+Cj4+IFNvIG5vdyB3ZSBoYXZlIGEgR0VOUEQgd2l0aCBwc3Rh
dGU9MCBvbiBhIGZpcnN0IHJwbS1yZXN1bWUsIHdoaWNoCj4+IGRvZXNuJ3QgbWF0Y2ggdGhlIGgv
dyBjb25maWd1cmF0aW9uLiBDYWxsaW5nIGRldl9wbV9vcHBfc3luYygpIHNldHMgdGhlCj4+IHBz
dGF0ZSBpbiBhY2NvcmRhbmNlIHRvIHRoZSBoL3cgY29uZmlnLgo+IAo+IFdoYXQgYWJvdXQgY2Fs
bGluZyBkZXZfcG1fb3BwX3NldF9yYXRlKGRldiwgY2xrX2dldF9yYXRlKGRldikpIGhlcmUKPiBp
bnN0ZWFkID8gVGhhdCB3aWxsIHdvcmssIHJpZ2h0ID8gVGhlIGFkdmFudGFnZSBpcyBpdCB3b3Jr
cyB3aXRob3V0Cj4gYW55IHNwZWNpYWwgcm91dGluZSB0byBkbyBzby4KCkl0IHdpbGwgd29yaywg
YnV0IGEgZGVkaWNhdGVkIGhlbHBlciBpcyBuaWNlci4KCj4gSSBhbHNvIHdvbmRlciBsb29raW5n
IGF0IHlvdXIgZ3IzZC5jIGNoYW5nZXMsIHlvdSBzZXQgYSBzZXQtb3BwCj4gaGVscGVyLCBidXQg
dGhlIGRyaXZlciBkb2Vzbid0IGNhbGwgc2V0X29wcF9yYXRlIGF0IGFsbC4gV2hvIGNhbGxzIGl0
Cj4gPwoKZGV2X3BtX29wcF9zeW5jKCkgY2FsbHMgaXQgZnJvbSBfc2V0X29wcCgpLgoKPiBBbmQg
aWYgaXQgaXMgYWxsIGFib3V0IGp1c3Qgc3luY2luZyB0aGUgZ2VucGQgY29yZSwgdGhlbiBjYW4g
dGhlIGdlbnBkCj4gY29yZSBkbyBzb21ldGhpbmcgbGlrZSB3aGF0IGNsayBmcmFtZXdvcmsgZG9l
cz8gaS5lLiBhbGxvdyBhIG5ldwo+IG9wdGlvbmFsIGdlbnBkIGNhbGxiYWNrLCBnZXRfcGVyZm9y
bWFuY2Vfc3RhdGUoKSAoanVzdCBsaWtlCj4gc2V0X3BlcmZvcm1hbmNlX3N0YXRlKCkpLCB3aGlj
aCBjYW4gYmUgY2FsbGVkIGluaXRpYWxseSBieSB0aGUgY29yZSB0bwo+IGdldCB0aGUgcGVyZm9y
bWFuY2UgdG8gc29tZXRoaW5nIG90aGVyIHRoYW4gemVyby4gb3BwLXNldC1yYXRlIGlzCj4gdGhl
cmUgdG8gc2V0IHRoZSBwZXJmb3JtYW5jZSBzdGF0ZSBhbmQgZW5hYmxlIHRoZSBzdHVmZiBhcyB3
ZWxsLgo+IFRoYXQncyB3aHkgaXQgbG9va3MgaW5jb3JyZWN0IGluIHlvdXIgY2FzZSwgd2hlcmUg
dGhlIGZ1bmN0aW9uIHdhcwo+IG9ubHkgcmVxdWlyZWQgdG8gYmUgY2FsbGVkIG9uY2UsIGFuZCB5
b3UgYXJlIGVuZGluZyB1cCBjYWxsaW5nIGl0IG9uCj4gZWFjaCByZXN1bWUuIExpbWl0aW5nIHRo
YXQgd2l0aCBhbm90aGVyIGxvY2FsIHZhcmlhYmxlIGlzIGJhZCBhcyB3ZWxsLgoKV2UgZGlzY3Vz
c2VkIHZhcmlhbnQgd2l0aCBnZXRfcGVyZm9ybWFuY2Vfc3RhdGUoKSBwcmV2aW91c2x5IGFuZCBV
bGYKZGlkbid0IGxpa2UgaXQgZWl0aGVyIHNpbmNlIGl0IHN0aWxsIHJlcXVpcmVzIHRvIHRvdWNo
ICdpbnRlcm5hbHMnIG9mIEdFTlBELgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
