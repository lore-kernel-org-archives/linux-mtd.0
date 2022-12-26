Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA32C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV4y7RnjVI9z+RNp8U13mzPs786jfWnKGlZOYusnjLE=; b=Zq1Td1FrAUrTG9
	BlTZa2FHrRnYHok7Zhlc7l/YBc/qKYtElgZYG4NALIVJYlg5ZyT8XOc2cbDewwlKvzB0FJFJS3ORj
	5nf//y+3C4huwxspmIM0fFP1yd61An2jfCYsIqYfFTKnhzNEepE5UWpnskjof/SkKLuyRuekfW8Hc
	39O949/kq9VFWjVFqTgMaKURiK8Kf5CV0v3IBrjIYzu53nYnxSaMvow/9Q+0Jhuzj0sC4XTru29H6
	WXXVyYprDQT8Bq5aHQFkoo1rmZMdh5V3HIzfougaGAWPaFpB2WePJrOltSQEv3uuCiSs3wjr5T6ut
	3jjX7mn0jn9PlYInbcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ifa-002eAk-Mf; Mon, 26 Dec 2022 08:17:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ifX-002e9B-Ky
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 08:17:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso3736993wms.5
        for <linux-mtd@lists.infradead.org>; Mon, 26 Dec 2022 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DlEaU2ipuYNDCsSp9eEhyRPhSMuWMkrFixv4Lp/tLOw=;
        b=l+YBi3VdCvIJii1Sl3OpF+RosvfA98Pz3/nEcoyI4h24lEurQc4yqpJ+iYNaGqthmi
         ZD7Mnhc4OFu1mJN6jqdcEaovz5NPEXucfN5h1d5Fm77zaChmVcJSyqdd0hil66aOSOAJ
         /dpkN4DfidSzbDzKHIDCRhHl28v3bqZjXJdcenyK6/oh82xAhbUYhGMs5gyLQTKI3LiH
         ht33fyF7zb+eVpCvMddWSjULPVevp4LMu9eP+3vqUeg0cnKglUb74J7gdeEXJbmGzUjF
         QGOLiEsnY2c6ZXyTjQhJN0pr1nkSGWaHgHTCA4DbU36xjelecCz4Y8rDk3Dsh4Ing3HC
         HJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlEaU2ipuYNDCsSp9eEhyRPhSMuWMkrFixv4Lp/tLOw=;
        b=BmiRbno069sfCh803ux6LdSNJeSI0Qk8KG3ySGRkQzloSce5RLfYQ39UP3oHKlTVEU
         r+9iTG6erXPYBahvFpjN17530VP8OEh18m++qv6OWizZtEBoLouArhARwgguL5ykChZ8
         L9+N3gBz/X21d0/44kcpsRj5duyANI+TH337U3jOreEOtIJIEv7PukQc5V7w+UZqUYyv
         tSPSC59kTPhkdfNnKMqs0fFsTzdrpmfCxXfCTOAdUsKFpZKxQnfFdMiPBPSebSzBqSj2
         3neWCbaCCANOp+v+UbOgimuTJTGF9XEMQeDOtIclyG6Y38GRyc1vuO3RdkrpRNe8g2uq
         I42Q==
X-Gm-Message-State: AFqh2kr6CyL647exbGEqmMWQbQTY6KFWtAvBuoOn2vbdTHG9g/Q/XJIh
	ZJKwwYLFrcnQDvnz8xbsUWxweQ==
X-Google-Smtp-Source: AMrXdXs9hiMNzjyyGo7MgY5qWJrrLBaCmZIaGzRHkw/xGaeSOCDNA48xOFyRVI7k21dKTByTaPN8mw==
X-Received: by 2002:a05:600c:a4a:b0:3d3:3d1b:6354 with SMTP id c10-20020a05600c0a4a00b003d33d1b6354mr12512998wmq.3.1672042629259;
        Mon, 26 Dec 2022 00:17:09 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id w20-20020a1cf614000000b003cf4d99fd2asm13056707wmc.6.2022.12.26.00.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 00:17:08 -0800 (PST)
Message-ID: <eafebda5-7342-dfa9-7745-543d5f7d6f3d@linaro.org>
Date: Mon, 26 Dec 2022 10:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] mtd: spi-nor: Add support for IS25LX256 operating
 in 1S-8S-8S octal read mode
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-4-nathan.morrison@timesys.com>
 <9927a8c3-40cf-2c69-46c6-f660ff2422b1@linaro.org>
In-Reply-To: <9927a8c3-40cf-2c69-46c6-f660ff2422b1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_001711_711636_2A9D750D 
X-CRM114-Status: GOOD (  18.72  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyNi4xMi4yMDIyIDEwOjA0LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IEhpLCBOYXRoYW4s
Cj4gCj4gVGhlIHNlcmllcyBpcyBzdGFydGluZyB0byBsb29rIGdvb2QsIGJ1dCBJJ2xsIG5lZWQg
YW5vdGhlciB2ZXJzaW9uLAo+IHBsZWFzZS4KPiAKPiBPbiAwMi4xMi4yMDIyIDE1OjU1LCBOYXRo
YW4gQmFycmV0dC1Nb3JyaXNvbiB3cm90ZToKPj4gVGhpcyBhZGRzIHRoZSBJUzI1TFgyNTYgY2hp
cCBpbnRvIHRoZSBJU1NJIGZsYXNoX2luZm8gcGFydHMgdGFibGUKPiAKPiBEZXNjcmliZSB5b3Vy
IGNoYW5nZXMgaW4gaW1wZXJhdGl2ZSBtb29kLCBlLmcuICJBZGQgc3VwcG9ydCBmb3IKPiBTMjVM
WDI1NiIgaW5zdGVhZCBvZiAiVGhpcyBhZGRzIC4uLiIKPiAKPiBJdCBtYXkgd29ydGggdG8gcmUt
cmVhZAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3Vi
bWl0dGluZy1wYXRjaGVzLmh0bWwKPiBvbmNlIGluIGEgd2hpbGUuCj4gCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IE5hdGhhbiBCYXJyZXR0LU1vcnJpc29uIDxuYXRoYW4ubW9ycmlzb25AdGltZXN5cy5j
b20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYyB8IDMyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4+IGluZGV4IDg5YTY2YTE5ZDc1NC4uMzYyYmMzNjAz
ZDhmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+PiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+PiBAQCAtMjksNiArMjksMzUgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBpczI1bHAyNTZfZml4dXBzIAo+PiA9IHsKPj4gwqDC
oMKgwqDCoCAucG9zdF9iZnB0ID0gaXMyNWxwMjU2X3Bvc3RfYmZwdF9maXh1cHMsCj4+IMKgIH07
Cj4+ICtzdGF0aWMgaW50Cj4+ICtpczI1bHgyNTZfcG9zdF9iZnB0X2ZpeHVwcyhzdHJ1Y3Qgc3Bp
X25vciAqbm9yLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qg
c2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHNmZHBfYmZwdCAqYmZwdCkKPj4gK3sKPj4gK8KgwqDC
oCAvKgo+PiArwqDCoMKgwqAgKiBJUzI1TFgyNTYgc3VwcG9ydHMgYm90aCAxUy0xUy04UyBhbmQg
MVMtOFMtOFMuCj4+ICvCoMKgwqDCoCAqIEhvd2V2ZXIsIHRoZSBCRlBUIGRvZXMgbm90IGNvbnRh
aW4gYW55IGluZm9ybWF0aW9uIGRlbm90aW5nIHRoaXMKPj4gK8KgwqDCoMKgICogZnVuY3Rpb25h
bGl0eSwgc28gdGhlIHByb3BlciBmYXN0IHJlYWQgb3Bjb2RlcyBhcmUgbmV2ZXIgc2V0dXAuCj4+
ICvCoMKgwqDCoCAqIFdlJ3JlIGNvcnJlY3RpbmcgdGhpcyBpc3N1ZSB2aWEgdGhlIGZpeHVwIGJl
bG93LsKgIFBhZ2UgcHJvZ3JhbQo+PiArwqDCoMKgwqAgKiBjb21tYW5kcyBhcmUgZGV0ZWN0ZWQg
YW5kIHNldHVwIHByb3Blcmx5IHZpYSB0aGUgNEJBSVQgbG9va3VwLgo+PiArwqDCoMKgwqAgKi8K
CldoeSBkb24ndCB5b3Ugc2V0IHRoZSBSRUFEIHN1cHBvcnQgd2hlbiBwYXJzaW5nIHRoZSA0YmFp
dCB0YWJsZT8gV2UgbmVlZAp0byBzZWUgdGhlIFNGRFAgZHVtcCB0byBkZXRlcm1pbmUgaG93IHdl
IHRyZWF0IHRoaXMuIEknbSBub3Qgc3VyZSBhCnBvc3RfYmZwdCBob29rIGlzIHRoZSByaWdodCB0
aGluZyB0byBkbyBmb3IgdGhpcyBmbGFzaC4KClRoYW5rcywKdGEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
