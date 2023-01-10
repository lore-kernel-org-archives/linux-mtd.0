Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1C4C54EBE
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jan 2023 04:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7LDjEqlIk7e1TlWEVLvkiDQvuOf2CJ4L9LNaTapwZU=; b=z4WY6ROQT5gJnq
	hZtYSc2zPKo+gUr31sGoWI93K4FAvBAVZypUTrvZEMEIkyyjMjfU1xbjXRskQCLbUe8R6h3+SmF1l
	owRRx5Xo6AmvFzMagyyKLhSEfORMKGO67Q2cAiKwqaSLO0EH+x275S9W7P/DX0vlDYK52T518hv71
	S+L+KWs1RHIegqMLSgxrDIM2HYe2526uBZwKhI9UBj4W+PbmnA5YXaUrifpIosC084tXbbEx1Zztb
	5/6Mje8D8bJKF5U7uhdLRUGDU8CFu4+lPrxzsC7akV+LGlOmslB+9RJMlZ0EZ+SJJsGHXzunSc1oQ
	c21LPhsgBqupttwKtTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF6Q9-005GUL-Lr; Tue, 10 Jan 2023 04:39:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF6Q6-005GSm-Dn
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2023 04:39:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id n12so11051721pjp.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2023 20:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1imcIUxiMQK2StXdAmtpGIOjso+zqyOr795AM8rgSAY=;
        b=puZZzShrqSF2jvA8xcJNuiS35DXQJ3lAizr5R6dAuuLzwoJH3K5TZ5uDfIg3AFDvgJ
         +wjsDofC+B1TpwcwTadIZM04B2W7moY0WRUN+9+z25EO9es3gVRrjVPWtLtMwp5lzrl6
         AopC+FXSiBXCVhvYMv9R4TM/KHukDE7/ui1cbYCKtu4szds8EKNg2FsGfWk90hRjZW3Z
         7aFlE0ZToCLLmRG23JqIdIfwywRp2OhmXyinU/VBYXVrId4e+MpEEPG+0SV1TqiOYWnG
         m2C1N/WBfaJulf2gbM8VvZBR7lXynmcnc+03qHUKbzTbkCX0K1LXoLITHdokWAiG8WgW
         ASFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1imcIUxiMQK2StXdAmtpGIOjso+zqyOr795AM8rgSAY=;
        b=dF3mZDt+SbBJnugTmCDvMLdz5L9L2HcmS/PnhgJcdF9bJNVk7eedRb5BSTPsGsIBhN
         ZkMYNpepUqkw9PIUsT4d3fpg8uQXptLJei2SODKek8mMODq59KLOWs2snoYulDKvOe84
         hpgUHenILkODCeT2RV/FXdh0NdnqSeX1blVgM4Ddwdage00vfw0FtsYd3rMKiJGkw+Qa
         giO6/m30RFJtuRbtYyH5zsNDo0b9Xkp8S4JkRVqNBdLXptD0A4fgQNoafnaIQX5ZyUtP
         Pvb8Zu4L7OkGnxu/tc5I8HOSKt/kVe2akqCm19uHmjzR82ztMUpgyr0QXGXP55hNbdYh
         T3wg==
X-Gm-Message-State: AFqh2kqKLUvb1WQSBXI1oqVak66HogTOUQA1+LaR4N9W5zZtfthwOSa7
	Qs3U4rXOBczcwH8CrJWpSSw=
X-Google-Smtp-Source: AMrXdXtny4wVCEM5H+2LZfffSy5HfgCB2j6BuBdpu9KWUj+J7cjyrA7HcdeJ1y4a2SUhvs+310Gb+g==
X-Received: by 2002:a17:903:41cf:b0:192:a69d:11f7 with SMTP id u15-20020a17090341cf00b00192a69d11f7mr52036904ple.27.1673325567909;
        Mon, 09 Jan 2023 20:39:27 -0800 (PST)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902eec600b001811a197797sm5787820plb.194.2023.01.09.20.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 20:39:27 -0800 (PST)
Message-ID: <eb25673a-3f84-7231-8503-e38514056116@gmail.com>
Date: Tue, 10 Jan 2023 13:39:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] mtd: spi-nor: spansion: Keep CFR5V[6] as 1 in Octal DTR
 enable/disable
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, stable@vger.kernel.org
References: <20230106030601.6530-1-Takahiro.Kuwano@infineon.com>
 <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_203930_537970_C7A21DE2 
X-CRM114-Status: GOOD (  15.33  )
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

T24gMS82LzIwMjMgNjo0NyBQTSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiBIZXksIFRha2FoaXJv
LAo+IAo+IE9uIDA2LjAxLjIwMjMgMDU6MDYsIHRrdXc1ODQ5MjRAZ21haWwuY29tIHdyb3RlOgo+
PiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+
Cj4+IENGUjVWWzZdIGlzIHJlc2VydmVkIGJpdCBhbmQgbXVzdCBhbHdheXMgYmUgMS4KPiAKPiBo
YXZlIHlvdSBzZWVuIHNvbWUgc3RyYW5nZSBiZWhhdmlvcj8KTm8sIGp1c3QgdG8gZm9sbG93IHRo
ZSBkYXRhc2hlZXQuCgo+Pgo+PiBGaXhlczogYzMyNjZhZjEwMWYyICgibXRkOiBzcGktbm9yOiBz
cGFuc2lvbjogYWRkIHN1cHBvcnQgZm9yIEN5cHJlc3MgU2VtcGVyIGZsYXNoIikKPj4gU2lnbmVk
LW9mZi1ieTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiAtLS0KPj4gwqAgZHJpdmVycy9tdGQvc3Bp
LW5vci9zcGFuc2lvbi5jIHwgNCArKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGkt
bm9yL3NwYW5zaW9uLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMKPj4gaW5kZXgg
YjYyMWNkZmQ1MDZmLi40ZTA5NGE0MzJkMjkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3BhbnNpb24uYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMK
Pj4gQEAgLTIxLDggKzIxLDggQEAKPj4gwqAgI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZS
M1bCoMKgwqDCoMKgwqDCoCAweDAwODAwMDA0Cj4+IMKgICNkZWZpbmUgU1BJTk9SX1JFR19DWVBS
RVNTX0NGUjNWX1BHU1rCoMKgwqDCoMKgwqDCoCBCSVQoNCkgLyogUGFnZSBzaXplLiAqLwo+PiDC
oCAjZGVmaW5lIFNQSU5PUl9SRUdfQ1lQUkVTU19DRlI1VsKgwqDCoMKgwqDCoMKgIDB4MDA4MDAw
MDYKPj4gLSNkZWZpbmUgU1BJTk9SX1JFR19DWVBSRVNTX0NGUjVWX09DVF9EVFJfRU7CoMKgwqAg
MHgzCj4+IC0jZGVmaW5lIFNQSU5PUl9SRUdfQ1lQUkVTU19DRlI1Vl9PQ1RfRFRSX0RTwqDCoMKg
IDAKPj4gKyNkZWZpbmUgU1BJTk9SX1JFR19DWVBSRVNTX0NGUjVWX09DVF9EVFJfRU7CoMKgwqAg
MHg0Mwo+PiArI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSNVZfT0NUX0RUUl9EU8KgwqDC
oCAweDQwCj4gCj4gTm8sIHRoaXMgbG9va3MgYmFkLiBJbnN0ZWFkIG9mIG92ZXJ3cml0aW5nIENG
UjVWIHdpdGggd2hhdGV2ZXIgdmFsdWUsIHdlCj4gc2hvdWxkIGluc3RlYWQgZmlyc3QgcmVhZCBp
dCBhbmQgdGhlbiB1cGRhdGUgb25seSB0aGUgYml0IHRoYXQgd2UncmUKPiBpbnRlcmVzdGVkIGlu
LiBJZiBpdCBoYXBwZW5zIHRvIHdyaXRlIENGUjVWIGJlZm9yZSBvY3RhbCBlbmFibGUvZGlzYWJs
ZSwKPiB5b3UnbGwgb3ZlcndyaXRlIHRoZSBwcmV2aW91cyBzZXQgdmFsdWVzLgo+IApJIHVuZGVy
c3RhbmQgcmVhZC1tb2RpZnktd3JpdGUgaXMgdGhlIHJpZ2h0IHRoaW5nIGluIGdlbmVyYWwuIEFj
dHVhbGx5CkNGUjVWWzddIGFuZCBDRlI1Vls1OjJdIGFyZSByZXNlcnZlZCBhbmQgbXVzdCBiZSAw
IHNvIEkgcHJlZmVycmVkIGEgc2ltcGxlCmZpeCBmb3IgdGhpcyBwYXJ0aWN1bGFyIGNhc2UuCgpU
aGFua3MsClRha2FoaXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
