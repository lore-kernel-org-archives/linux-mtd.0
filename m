Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F4BC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 15:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2902E611AF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 15:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2902E611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/v5hK3YI9PTbm0CpXIaMKTvcTFSgcRTYGjTOGgYJkSY=; b=C5DYwwYl1SsZbcG/XvlkFmZMKd
	Bs1AOtCtKd4WKLszp6/PnDWdZcnEKVUN32WqtF3LWaGQ5MxFVUrI9NBkj5ftEBGU+gIWb9mjsR8r/
	iZptw6L9lz1Fxp4qH6Nx4pk0Jy6QUMYawzIFV6ZWoegSUR2c4aTuNNWjlm9OBr21ro00PnH4cZwNX
	+hHt8s6XEced6v/PwK5PYxHniK9v8RuYfHZs4Oyaa8ar68Ym2pqvlXIQS8GsUlwRMFNjR+iI8xpfX
	z8vIda5UxkHCW6esCYTQkJGNCcvInx4Hp9A7zHjU6LK110WS4u9pEhFFKrhwXbK63IzSISBnzhBEq
	kVYC8vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mICHR-00HVHh-VF; Mon, 23 Aug 2021 15:54:34 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mICHP-00HVGd-05
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 15:54:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id y34so38822649lfa.8
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7mncJ6pduW/52O6ekhmOFTY3dWeez/jgkRyR/0Vdsyw=;
 b=GjDLwuw1u5t0huse+wcSUJvd9NlDsq9fLH5ifMhjoFLd/jX7arhT4V0b4pMg9fkZx0
 SFoXhZrGpDe1zyz7PwMpqtrmGVNRg4uenD426vrzx09jDp5+gZwPaSOWi2CzEdhHZN72
 biZ9w4cugGtwCB8oOkwmNR+z285tRdqilLSsiYBx3KMs+2gRQ2Qufwsaf9Kkn44cA20t
 ytzwyZjnYP+KTq05NUlj+435IalTyox6/J6oSbEJjWcMz4NbsCi+r8m8O7scEsRH0iPC
 mwCHAhLhpQqHYFd7f4axkEH/iwpXUU5wQP5pO5DMDqwE7H45GOLzvXAyvPw0J1h3bnVb
 85LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7mncJ6pduW/52O6ekhmOFTY3dWeez/jgkRyR/0Vdsyw=;
 b=QRXrS4OotAeYQ45uZrcVMIkGggnBdBGyUsSFmrE8vni0jWmA7JFqJcigaBTfk9d+5x
 yVij15jlHrEM6ERNbyI3pUZimqTzJFl7oLETnYIb8r+HjGI9M2G4DNTPKVOQTGrKWGDf
 sIIjXzWbLgGSngfeaWMOAlDO5Ry4dyPhh0pnPVo2UtoKtUAQTOPs8yV9kB1wLpnlp6RV
 8nuE8GkAo6aHeRZKTCF/YmJneCg5K9eS1QaLCKNisR6RYq2lmu0EPkWyXtwICbxXnySm
 XSmcshkw6xsfyfej1XQC8oqikPAAZvVLrHMS+CdttxZpF/+8fN6VKQST9n4BGPjkJXmf
 fzHA==
X-Gm-Message-State: AOAM530tkFy8E/NlRDTUfJNEPoAvTM/pep0GD3IcajQv6N6ADFz9wON3
 IF0a/F1pmotBH+A/MdDgIX0=
X-Google-Smtp-Source: ABdhPJzNDGjnGQzIrcQXTM2iukhjwhqvC5wj3OdYqtfrrWEzlRV302pS9l5Dkjzi+NNxjkL6pb5dHg==
X-Received: by 2002:a05:6512:3157:: with SMTP id
 s23mr24865578lfi.247.1629734069444; 
 Mon, 23 Aug 2021 08:54:29 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id u2sm1482543lfr.79.2021.08.23.08.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 08:54:28 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
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
 <CAPDyKFoQdn1rm91iFNJwZwpSYcKJBjDLqtJB4KZAkhgY1Grm-Q@mail.gmail.com>
 <87073fc2-d7b3-98f4-0067-29430ea2adef@gmail.com>
 <CAPDyKFqSsAk8a5CTNpRT2z4Wvf8BehJKDbVhUKfHc2Jzj7aTNA@mail.gmail.com>
 <9129a9f0-8c9b-d8e0-ddf5-c8820871fb7f@gmail.com>
 <CAPDyKFrWeQVNgxzmiLBXJ2gQW=iFf4aG16xvZ+ag1MkhXs9-BQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9a783eb3-786b-a3b2-7854-2be6954527db@gmail.com>
Date: Mon, 23 Aug 2021 18:54:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrWeQVNgxzmiLBXJ2gQW=iFf4aG16xvZ+ag1MkhXs9-BQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_085431_105260_6F190336 
X-CRM114-Status: GOOD (  27.42  )
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

MjMuMDguMjAyMSAxMzo0NiwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPj4+IC4uLgo+Pj4gZGV2
X3BtX29wcF9zZXRfcmF0ZShyYXRlKQo+Pj4gcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoKQo+Pj4g
cG1fcnVudGltZV9zZXRfYWN0aXZlKCkKPj4+IHBtX3J1bnRpbWVfZW5hYmxlKCkKPj4+IC4uLgo+
Pj4gcG1fcnVudGltZV9wdXQoKQo+Pj4gLi4uCj4+Pgo+Pj4gV2UgbmVlZCB0byBjYWxsIGdlbnBk
X3NldF9wZXJmb3JtYW5jZV9zdGF0ZSgpIGluZGVwZW5kZW50bHkgb2Ygd2hldGhlcgo+Pj4gdGhl
IGRldmljZSBpcyBydW50aW1lIHN1c3BlbmRlZCBvciBub3QuCj4+Cj4+IEkgZG9uJ3Qgc2VlIHdo
ZXJlIGlzIHRoZSBwcm9ibGVtIGluIHlvdXJzIGV4YW1wbGUuCj4+Cj4+IHBtX3J1bnRpbWVfc3Vz
cGVuZGVkKCkgPSBmYWxzZSB3aGlsZSBSUE0gaXMgZGlzYWJsZWQuIFdoZW4gZGV2aWNlIGlzCj4+
IHJlc3VtZWQsIHRoZSBycG1fcHN0YXRlPTAsIHNvIGl0IHdvbid0IGNoYW5nZSB0aGUgcHN0YXRl
IG9uIHJlc3VtZS4KPiAKPiBZZXMsIHlvdSBhcmUgY2VydGFpbmx5IGNvcnJlY3QsIG15IGJhZCEg
SSBtaXhlZCBpdCB1cCB3aXRoCj4gcG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCksIHdoaWNo
IG9ubHkgY2FyZXMgYWJvdXQgdGhlIHN0YXR1cy4KPiAKPiBTbywgYWZ0ZXIgYSBzZWNvbmQgdGhv
dWdodCwgeW91ciBzdWdnZXN0aW9uIHNvdW5kcyB2ZXJ5IG11Y2gKPiByZWFzb25hYmxlIHRvIG1l
ISBJIGhhdmUgYWxzbyB0cmllZCB0byBjb25zaWRlciBhbGwgZGlmZmVyZW50Cj4gc2NlbmFyaW9z
LCBpbmNsdWRpbmcgdGhlIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBwYXRoLCBidXQgSSB0aGluayBp
dAo+IHNob3VsZCBiZSBmaW5lLgoKSXQgY291bGQgYmUgaW1wcm92ZWQgc2xpZ2h0bHkgdG8gY292
ZXIgbW9yZSBjYXNlcy4KCj4gSSBhbHNvIHRoaW5rIHRoYXQgYSBwYXRjaCBsaWtlIHRoZSBhYm92
ZSBzaG91bGQgYmUgY29uc2lkZXJlZCBhcyBhCj4gZml4LCBiZWNhdXNlIGl0IGFjdHVhbGx5IGZp
eGVzIGEgcHJvYmxlbSwgYWNjb3JkaW5nIHRvIHdoYXQgSSBzYWlkIGluCj4gbXkgZWFybGllciBy
ZXBseSwgYmVsb3cuCj4gCj4gRml4ZXMgOiA1OTM3YzNjZTIxMjIgKCJQTTogZG9tYWluczogRHJv
cC9yZXN0b3JlIHBlcmZvcm1hbmNlIHN0YXRlCj4gdm90ZXMgZm9yIGRldmljZXMgYXQgcnVudGlt
ZSBQTSIpLgo+IAo+Pgo+Pj4gQWx0aG91Z2gsIGl0IGFjdHVhbGx5IHNlZW1zIGxpa2UgZ29vZCBp
ZGVhIHRvIHVwZGF0ZQo+Pj4gZGV2X2dwZF9kYXRhKGRldiktPnJwbV9wc3RhdGUgPSBzdGF0ZSBo
ZXJlLCBhcyB0byBtYWtlIHN1cmUKPj4+IGdlbnBkX3J1bnRpbWVfcmVzdW1lKCkgZG9lc24ndCBy
ZXN0b3JlIGFuIG9sZC9pbnZhbGlkIHZhbHVlIHRoYXQgd2FzCj4+PiBzYXZlZCB3aGlsZSBkcm9w
cGluZyB0aGUgcGVyZm9ybWFuY2Ugc3RhdGUgdm90ZSBmb3IgdGhlIGRldmljZSBpbgo+Pj4gZ2Vu
cGRfcnVudGltZV9zdXNwZW5kKCkgZWFybGllci4KPj4+Cj4+PiBMZXQgbWUgc2VuZCBhIHBhdGNo
IGZvciB0aGlzIHNob3J0bHksIHRvIGNsb3NlIHRoaXMgd2luZG93IG9mIGEgcG9zc2libGUgZXJy
b3IuCj4+Cj4+IEl0IHdpbGwgYWxzbyByZW1vdmUgdGhlIG5lZWQgdG8gcmVzdW1lIGRldmljZSBq
dXN0IHRvIGNoYW5nZSB0aGUgY2xvY2sKPj4gcmF0ZSwgbGlrZSBJIG5lZWRlZCB0byBkbyBpdCBp
biB0aGUgUFdNIHBhdGNoIG9mIHRoaXMgc2VyaWVzLgo+IAo+IERvIHlvdSB3YW50IHRvIHNlbmQg
dGhlIHBhdGNoIGZvcm1hbGx5PyBPciBkbyB5b3UgcHJlZmVyIGl0IGlmIEkgZG8gaXQ/CgpJJ2xs
IHNlbmQgdGhlIHBhdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
