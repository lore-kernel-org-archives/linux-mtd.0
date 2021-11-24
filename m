Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58870C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Nov 2021 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XGNI6fIhk/Ytq6huQ9go289kvhDIHe3SN28vnPgxYfE=; b=3goMZ2U+T4ERK9DP2OPeMr1q3i
	Se49keR68c+bkVE1KE6eg7vw3m8qotPbwktkRd41Gj3fIJ4B3Z5OxIe5R32gevf1guvPHqgEctnuw
	LdhwU/opu3eEYb7RWg0I3ntjlOmye7GAjhYnEq85aGJOXM3ZSYHt66ug8pivqfQMsO9w5j0iFOXmc
	P0V4fsH51IyUH5ZBb6aun2cdm2azH6IoGiKUp1/watWlY00fUesfuoC0+QbpSOQqHc2Xp1j6s/pCe
	1S76X+Rbo5NsquHqeg0Xuo+jHAO7qXKdDgdKCfyX3iu6Knhe3mqBtheleKpGTXsbYmGVA/U7GQWh3
	8SzngXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpvCb-005GPo-Sw; Wed, 24 Nov 2021 16:32:57 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpvCY-005GOG-8r; Wed, 24 Nov 2021 16:32:55 +0000
Received: by mail-lj1-x230.google.com with SMTP id z8so6639207ljz.9;
 Wed, 24 Nov 2021 08:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hWdL3+sC7Y3WgMzxQgq49FXg8O3lrY2U4JGqRbZI6tg=;
 b=gujWqpLYZ0ok4buE3cVMLWfC5uFpJyuXa42ARhUlnN4O23+qlO+EmYtRvyX/8c+8Cd
 T5a1dyyYrYP3SiqkVxU+nFVwtXCc1qsYP3l3IZjhohQlobFIZT7KVzpd/uD0tmpe0CvO
 aeCfiRXxliyhrHPinovV+UTXQVe/RaMFEMYjCu0hyn3k5BUgAGEZ29zDCOQVjlqJOFhL
 TZBbWI9gTerbMrFWXfehbYHCPQb+K2zUVIW0lpbY8uZKY04odxTxEAVckbrorzsLNVGk
 sCA4pYJSO2cZ60LDY064M6AwjoFewiMlf4tsmpailAug/kWALkfi3+l95LwEP1w10SMT
 n/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hWdL3+sC7Y3WgMzxQgq49FXg8O3lrY2U4JGqRbZI6tg=;
 b=KxJ5TWNxaHLcHNdF5/uc/qJ/PKDvw7xVTs+WANCAv/4DSAeALLyOcZ+EFNoydFKHsy
 Hr3YrXrR76dhcBCNqirBI1iLvafhqlfRDQUb1lsOdBbQsLqtrigJvi37wdHfrInYWTm+
 3ywUtedU8SFC1qM6jjcAXo6juyImqODisTfaZjB3ANp1qXohndcz+N7NI1QPzwjD5U+G
 /C/cQTltJqtJvVkqmUJlhIHEvqyVbuZHkhlirqA4uVRtjNwjZqY0EvxkYbovlEmThntJ
 Eq4O+GHrSqb14h1iaiMY1f2bQF4bpUbmaerePz5x5nLrDR/lt74MreesdplJuLKbcjWl
 GGPg==
X-Gm-Message-State: AOAM533VZOlt8lvHWiHhNFKOjE/Hn+d1ZJ2yIehFGipDq4LpIeZveUI8
 NCJ4pbaHNusyHzqbN31RZxE=
X-Google-Smtp-Source: ABdhPJzQ2dc3wLXSWKQBFY+mHq5x3ddsPjsCSkkhRryLlNJ0eKxp2Ar8mZbKuizWCxiSq5j6WRb8tw==
X-Received: by 2002:a2e:2a43:: with SMTP id q64mr17358890ljq.102.1637771570838; 
 Wed, 24 Nov 2021 08:32:50 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id m14sm31645ljg.2.2021.11.24.08.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:32:50 -0800 (PST)
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Orson Zhai
 <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org,
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
Date: Wed, 24 Nov 2021 19:32:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122222203.4103644-2-arnd@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_083254_339588_17A6BACD 
X-CRM114-Status: GOOD (  29.52  )
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

MjMuMTEuMjAyMSAwMToyMSwgQXJuZCBCZXJnbWFubiDQv9C40YjQtdGCOgo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVGhlIERNQSByZXNvdXJjZSBpcyBuZXZlciBz
ZXQgdXAgYW55d2hlcmUsIGFuZCBwYXNzaW5nIHRoaXMgYXMgc2xhdmVfaWQKPiBoYXMgbm90IGJl
ZW4gdGhlIHByb3BlciBwcm9jZWR1cmUgaW4gYSBsb25nIHRpbWUuCj4gCj4gQXMgYSBwcmVwYXJh
dGlvbiBmb3IgcmVtb3ZpbmcgYWxsIHNsYXZlX2lkIHJlZmVyZW5jZXMgZnJvbSB0aGUgQUxTQSBj
b2RlLAo+IHJlbW92ZSB0aGlzIG9uZS4KPiAKPiBBY2NvcmRpbmcgdG8gRG1pdHJ5IE9zaXBlbmtv
LCB0aGlzIGRyaXZlciBoYXMgbmV2ZXIgYmVlbiB1c2VkIGFuZAo+IHRoZSBtZWNoYW5pc20gZm9y
IGNvbmZpZ3VyaW5nIERNQSB3b3VsZCBub3Qgd29yayBhcyBpdCBpcyBpbXBsZW1lbnRlZCwKPiBz
byB0aGlzIHBhcnQgd2lsbCBnZXQgcmV3cml0dGVuIHdoZW4gdGhlIGRyaXZlciBnZXRzIHB1dCBp
bnRvIHVzZQo+IGFnYWluIGluIHRoZSBmdXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgc291bmQvc29jL3RlZ3JhL3RlZ3JhMjBf
c3BkaWYuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEyMF9zcGRpZi5jIGIvc291bmQvc29jL3RlZ3Jh
L3RlZ3JhMjBfc3BkaWYuYwo+IGluZGV4IDlmZGM4MmQ1OGRiMy4uMWMzMzg1ZGE2ZjgyIDEwMDY0
NAo+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTIwX3NwZGlmLmMKPiArKysgYi9zb3VuZC9z
b2MvdGVncmEvdGVncmEyMF9zcGRpZi5jCj4gQEAgLTI4NCw3ICsyODQsNiBAQCBzdGF0aWMgaW50
IHRlZ3JhMjBfc3BkaWZfcGxhdGZvcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgCXNwZGlmLT5wbGF5YmFja19kbWFfZGF0YS5hZGRyID0gbWVtLT5zdGFydCArIFRFR1JB
MjBfU1BESUZfREFUQV9PVVQ7Cj4gIAlzcGRpZi0+cGxheWJhY2tfZG1hX2RhdGEuYWRkcl93aWR0
aCA9IERNQV9TTEFWRV9CVVNXSURUSF80X0JZVEVTOwo+ICAJc3BkaWYtPnBsYXliYWNrX2RtYV9k
YXRhLm1heGJ1cnN0ID0gNDsKPiAtCXNwZGlmLT5wbGF5YmFja19kbWFfZGF0YS5zbGF2ZV9pZCA9
IGRtYXJlcS0+c3RhcnQ7Cj4gIAo+ICAJcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7Cj4g
IAo+IAoKVGhhbmtzLCBBcm5kIQoKVGhlIGNvbW1pdCBtZXNzYWdlIGlzIGNvcnJlY3QsIGhvd2V2
ZXIgeW91IGNvdWxkIHJlbW92ZSBldmVuIG1vcmUgY29kZQpoZXJlLiBCdXQgdGhlcmUgaXMgbm8g
bmVlZCB0byBtYWtlIGEgdjMganVzdCBiZWNhdXNlIHRoaXMgcGF0Y2ggYmVjYXVzZQpJIGFscmVh
ZHkgcHJlcGFyZWQgcGF0Y2hzZXQgdGhhdCByZXZpdmVzIHRoaXMgUy9QRElGIGRyaXZlciBhbmQg
ZW5hYmxlcwpIRE1JIGF1ZGlvIG9uIFRlZ3JhMjAuIEknbGwgdGFrZSBjYXJlIG9mIGNsZWFuaW5n
IHVwIHRoZSB3aG9sZSBjb2RlIG9mCnRoaXMgZHJpdmVyLgoKZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy90ZWdyYS90ZWdyYTIwX3NwZGlmLmMKYi9zb3VuZC9zb2MvdGVncmEvdGVncmEyMF9zcGRpZi5j
CmluZGV4IDc3NTE1NzVjZDZkNi4uMWMzMzg1ZGE2ZjgyIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mv
dGVncmEvdGVncmEyMF9zcGRpZi5jCisrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTIwX3NwZGlm
LmMKQEAgLTI1MSw3ICsyNTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcK
dGVncmEyMF9zcGRpZl9yZWdtYXBfY29uZmlnID0gewogc3RhdGljIGludCB0ZWdyYTIwX3NwZGlm
X3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IHRlZ3JhMjBfc3BkaWYgKnNwZGlmOwotCXN0cnVjdCByZXNvdXJjZSAqbWVtLCAqZG1hcmVxOwor
CXN0cnVjdCByZXNvdXJjZSAqbWVtOwogCXZvaWQgX19pb21lbSAqcmVnczsKIAlpbnQgcmV0OwoK
QEAgLTI3MywxMiArMjczLDYgQEAgc3RhdGljIGludCB0ZWdyYTIwX3NwZGlmX3BsYXRmb3JtX3By
b2JlKHN0cnVjdApwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKElTX0VSUihyZWdzKSkKIAkJ
cmV0dXJuIFBUUl9FUlIocmVncyk7CgotCWRtYXJlcSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShw
ZGV2LCBJT1JFU09VUkNFX0RNQSwgMCk7Ci0JaWYgKCFkbWFyZXEpIHsKLQkJZGV2X2VycigmcGRl
di0+ZGV2LCAiTm8gRE1BIHJlc291cmNlXG4iKTsKLQkJcmV0dXJuIC1FTk9ERVY7Ci0JfQotCiAJ
c3BkaWYtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfbW1pbygmcGRldi0+ZGV2LCByZWdzLAog
CQkJCQkgICAgJnRlZ3JhMjBfc3BkaWZfcmVnbWFwX2NvbmZpZyk7CiAJaWYgKElTX0VSUihzcGRp
Zi0+cmVnbWFwKSkgewpAQCAtMjkwLDcgKzI4NCw2IEBAIHN0YXRpYyBpbnQgdGVncmEyMF9zcGRp
Zl9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QKcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXNwZGlmLT5w
bGF5YmFja19kbWFfZGF0YS5hZGRyID0gbWVtLT5zdGFydCArIFRFR1JBMjBfU1BESUZfREFUQV9P
VVQ7CiAJc3BkaWYtPnBsYXliYWNrX2RtYV9kYXRhLmFkZHJfd2lkdGggPSBETUFfU0xBVkVfQlVT
V0lEVEhfNF9CWVRFUzsKIAlzcGRpZi0+cGxheWJhY2tfZG1hX2RhdGEubWF4YnVyc3QgPSA0Owot
CXNwZGlmLT5wbGF5YmFja19kbWFfZGF0YS5zbGF2ZV9pZCA9IGRtYXJlcS0+c3RhcnQ7CgogCXBt
X3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
