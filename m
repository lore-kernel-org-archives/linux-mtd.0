Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203F2E7E636
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDc6CZTYgsDEJGRHsQ1J6Nz9INTeVgb+oUzynRJ04Mo=; b=3A2Eca4m8pxKDp
	DFs7gY2Mp0H7d6UWGmKhwXsSSFoyqWgB2AgzEG32zhp9+8daIMOOIBcrMKrG1A8F39GQS1Q577MSb
	RmMQOji/tqWzJnohptNr/f1nByfxGqYM+/U+vKBvmv9a/J1EkkCB3WxpOzwiqDd3B+7qOlRVELjEV
	w7xUsaoNrxC97rwnSFup1VenzwwZDp4+Atr7A7+0jpu6+yud1khBNsAbk37igpwaodJAs3ttNtkaV
	FNc7mp8tJ9zdTEZXNAcKXtLl1lRbl0clDJAHX/N59yHWFCnKxO4z6aHbz9yQweQh9VNqzF9JsFLMR
	TZA6S/74wukund+SrIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7xy-00GSLe-1V;
	Tue, 26 Sep 2023 13:19:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7xu-00GSIu-0M
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 13:19:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3231dff4343so3258594f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2023 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734338; x=1696339138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PjPtI/KNSgGV2G6UEPfAmxRBmkSix0OyKfO1YcoktM=;
        b=qYMXeE9NcUdpWk6CiB9t+EWGWG21wMpEmT4e18om2f5UrkliZN06uo5JiFDvqa0W1z
         13v77Dmz+Cz3KonKJydNzlck2xpsHHGfy6/c4Z5anYvP0W0We/59kDrYi7i/ZWsGHrXM
         pa+t5PvixGMcr/a2frzg4K+nAXSRXovLbsHYYWKGSOLWxTbQvJBACHKdtehvyq+40EH3
         qVTht1yuYpvR+cIMpBkivLbREn5i4Vu/kVhQ5qgMweoi09x0FG0N0robNyMDHDTUoQrH
         raIIYI04elkJcDWKcegNPukTMDAmlkWRdJnBqpswJA6rg1b8a/3nLSZZuE4rPHa95K6y
         CoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734338; x=1696339138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PjPtI/KNSgGV2G6UEPfAmxRBmkSix0OyKfO1YcoktM=;
        b=OqLk9Rl/OIrfKGcoD4h1Z35zu6EcmhJ8Kq7oXkdfp3K4fpEbYtBNVwdQ3jtRPSAqOk
         D7s8k8CxKDoodXnQAwU9hBwZz/Cqoy32f6zcGZ4w9TdcBcG5NdMKiw+ddWekK9aJS8DU
         79xZIA6/7lwPgdmwzTYamHxs2W2w784VX9lCKWof+FoXdz0u1zqSBMhhxILUIaPUhbku
         aI+ga21fnjJiD2lBrWjZ6oFF/QuppSq20rmxK4ofCWuz1l2K1l/gZlMzg5RMx/BSo2En
         Hcric50kA8mHsvB/IU61rW47JWNfoz2AmXYpTUlsFUmJ/d/O7PNfMgAiAuCzIfpshn32
         vUJA==
X-Gm-Message-State: AOJu0YzxeSI3UxFldf3Z6i22wo9NfzxMhDez4J4Cjd4JE/uTUl8vGDlX
	7AfYmCCZuUe7wz1zIbkuMbeQZA==
X-Google-Smtp-Source: AGHT+IFiMTinsYIoj1BsaQVVf58PkDZPG+2WTFp2DLMqdQLJG1eFlaTsIoD2X/R7rdtOZIXPVcOnkg==
X-Received: by 2002:a5d:5246:0:b0:319:6b56:94d9 with SMTP id k6-20020a5d5246000000b003196b5694d9mr2014087wrc.2.1695734337954;
        Tue, 26 Sep 2023 06:18:57 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id d6-20020adff2c6000000b003217af3f530sm14973127wrp.0.2023.09.26.06.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 06:18:57 -0700 (PDT)
Message-ID: <125fe1a7-bc52-46a7-93d5-b09caf5ca9f8@linaro.org>
Date: Tue, 26 Sep 2023 14:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25ff321a entry
To: Nicolas Ferre <nicolas.ferre@microchip.com>, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230908151400.164470-1-nicolas.ferre@microchip.com>
 <8d72820d-bbaa-abc8-4448-87f0f054c381@linaro.org>
 <4c9b0dff-6350-376b-60ac-c36f98378a51@microchip.com>
 <306a6aa0-c608-418a-a591-6f8aa95817fb@linaro.org>
 <925723a2-dc2d-9949-5b8f-4351b49d2f4b@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <925723a2-dc2d-9949-5b8f-4351b49d2f4b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_061902_151353_8E5F1279 
X-CRM114-Status: GOOD (  26.05  )
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

CgpPbiA5LzI2LzIzIDEzOjU5LCBOaWNvbGFzIEZlcnJlIHdyb3RlOgo+IE9uIDIxLzA5LzIwMjMg
YXQgMDk6MTQsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cKPj4gdGhlIGNv
bnRlbnQgaXMgc2FmZQo+Pgo+PiBPbiA5LzIwLzIzIDE3OjE2LCBOaWNvbGFzIEZlcnJlIHdyb3Rl
Ogo+Pj4gT24gMTkvMDkvMjAyMyBhdCAxODoxMiwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPj4+PiBP
biAwOC4wOS4yMDIzIDE4OjE0LCBuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+
Pj4+IEZyb206IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4KPj4+
Pj4KPj4+Pj4gQWRkIHRoZSBhdDI1ZmYzMjFhIDRNQiBTUEkgZmxhc2ggd2hpY2ggaXMgYWJsZSB0
byBwcm92aWRlCj4+Pj4+IFNGRFAgaW5mb3JtYXRpb25zLgo+Pj4+PiBEYXRhc2hlZXQ6Cj4+Pj4+
IGh0dHBzOi8vd3d3LnJlbmVzYXMuY29tL3VzL2VuL2RvY3VtZW50L2RzdC9hdDI1ZmYzMjFhLWRh
dGFzaGVldAo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFz
LmZlcnJlQG1pY3JvY2hpcC5jb20+Cj4+Pj4+IC0tLQo+Pj4KPj4+IFsuLl0KPj4+Cj4+Pj4+IMKg
wqAgZHJpdmVycy9tdGQvc3BpLW5vci9hdG1lbC5jIHwgNCArKysrCj4+Pj4+IMKgwqAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9hdG1lbC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9hdG1lbC5jCj4+Pj4+
IGluZGV4IDU4OTY4YzFlN2QyZi4uYzk0ZDUyOTUxNDgxIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9h
dG1lbC5jCj4+Pj4+IEBAIC0xODQsNiArMTg0LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxh
c2hfaW5mbyBhdG1lbF9ub3JfcGFydHNbXQo+Pj4+PiA9IHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEZMQUdTKFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX1NXUF9JU19W
T0xBVElMRSkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxB
R1MoU0VDVF80SykKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMg
PSAmYXRtZWxfbm9yX2dsb2JhbF9wcm90ZWN0aW9uX2ZpeHVwcyB9LAo+Pj4+PiArwqDCoMKgwqAg
eyAiYXQyNWZmMzIxYSIsIElORk8oMHgxZjQ3MDgsIDAsIDY0ICogMTAyNCzCoCA2NCkKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGTEFHUyhTUElfTk9SX0hBU19MT0NLIHwgU1BJX05P
Ul9TV1BfSVNfVk9MQVRJTEUpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFSU0Vf
U0ZEUAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmYXRtZWxfbm9y
X2dsb2JhbF9wcm90ZWN0aW9uX2ZpeHVwcyB9LAo+Pj4+Cj4+Pj4gV2UgaGF2ZSByZWNlbnRseSBj
aGFuZ2VkIGhvdyB0aGUgZmxhc2ggZW50cmllcyBhcmUgZGVmaW5lZC4gV291bGQgeW91Cj4+Pj4g
cGxlYXNlIHRyeSB0aGUgZm9sbG93aW5nIGNoYW5nZXMgaW5zdGVhZD8KPj4+Pgo+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMgYi9kcml2ZXJzL210ZC9zcGktbm9y
L2F0bWVsLmMKPj4+PiBpbmRleCA5NWYwZTEzOTI4NGUuLjQ0MjE4NzE2ZDgxZSAxMDA2NDQKPj4+
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMKPj4+PiArKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL2F0bWVsLmMKPj4+PiBAQCAtMjEzLDYgKzIxMywxMiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGZsYXNoX2luZm8KPj4+PiBhdG1lbF9ub3JfcGFydHNbXSA9IHsKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5mbGFncyA9IFNQSV9OT1JfSEFTX0xPQ0sgfCBT
UElfTk9SX1NXUF9JU19WT0xBVElMRSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SywKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmYXRtZWxfbm9yX2dsb2JhbF9wcm90ZWN0aW9uX2Zp
eHVwcwo+Pj4+ICvCoMKgwqDCoMKgwqAgfSwgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5pZCA9IFNOT1JfSUQoMHgxZiwgMHg0NywgMHgwOCksCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiYXQyNWZmMzIxYSIsCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfU1dQ
X0lTX1ZPTEFUSUxFLAo+Pj4KPj4+IEhlcmUsIEkgYWRkZWQ6Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SywKPj4+Cj4+PiB0byBt
YXRjaCB0aGUgb3RoZXIgZGV2aWNlcyBvZiB0aGUgZmFtaWx5Li4uIEkgY2hlY2tlZCBvbiB0aGUg
ZGF0YXNoZWV0LAo+Pj4gNEsgc2VjdG9ycyBhcmUgb2theSwgYnV0IEkgZG9uJ3Qga25vdyBleGFj
dGx5IGlmIHRoaXMgaXMgZWxpZ2libGUgdG8gdGhlCj4+PiAibm9fc2ZkYl9mbGFncyIgcHJvcGVy
dHkuLi4gZm9yZ2l2ZSBtZSwgSSBkaWRuJ3QgY2hlY2sgZnVydGhlciBrbm93aW5nCj4+PiB0aGF0
IHlvdSBtaWdodCBoYXZlIGJldHRlciB2aWV3IG9uIHRoaXMgdGhhbiBtZSA7LSkKPj4KPj4geWVh
aCwgbm8gd29ycmllcy4gWW91IHNob3VsZCBub3Qgc3BlY2lmeSA0ayBoZXJlLCBhcyBpdCBzaG91
bGQgYWxyZWFkeQo+PiBiZSBzZXQgd2hlbiBwYXJzaW5nIFNGRFAuIFlvdSBjYW4gdXNlIG10ZGlu
Zm8gL2Rldi9tdGR4IHRvIGNoZWNrIHdoYXQKPj4gZXJhc2Ugc2l6ZSBnZXRzIHNldC4gSW4gdGhl
IGNvcmUgd2Ugc2V0IHRoZSBtYXhpbXVtIHN1cHBvcnRlZCBlcmFzZSBzaXplCj4+IGZvciBzcGVl
ZCBjb25zaWRlcmF0aW9ucyBhbmQgbWFraW5nIHViaWZzIGhhcHB5LCBzbyB5b3UnbGwgcHJvYmFi
bHkgc2VlCj4+IDY0ayB3aGVuIGNoZWNraW5nIHdpdGggbXRkaW5mby4gQnV0IHlvdSBjYW4gdHJ5
IDRrIGVyYXNlcyBhcyB3ZWxsIGJ5Cj4+IHNldHRpbmcgTVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RP
UlMuCj4gCj4gQWJzb2x1dGVseSwgaGVyZSBpcyB3aGF0IEknbSBleHBlcmllbmNpbmc6Cj4gIyBu
b19zZmRwX2ZsYWdzIG5vdCBzZXQgLyBsaW51eC1uZXh0IC8gc2FtYTVkMjcgd2xzb20xIGVrCj4g
IyBDT05GSUdfTVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RPUlM9eQo+IHJvb3RAc2FtYTVkMjctd2xz
b20xLWVrLXNkOn4jIG10ZGluZm8gL2Rldi9tdGQwCj4gbXRkMAo+IE5hbWU6wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGkwLjEKPiBUeXBlOsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yCj4g
RXJhc2VibG9jayBzaXplOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0MDk2IGJ5dGVz
LCA0LjAgS2lCCj4gQW1vdW50IG9mIGVyYXNlYmxvY2tzOsKgwqDCoMKgwqDCoMKgwqDCoCAxMDI0
ICg0MTk0MzA0IGJ5dGVzLCA0LjAgTWlCKQo+IE1pbmltdW0gaW5wdXQvb3V0cHV0IHVuaXQgc2l6
ZTogMSBieXRlCj4gU3ViLXBhZ2Ugc2l6ZTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDEgYnl0ZQo+IENoYXJhY3RlciBkZXZpY2UgbWFqb3IvbWlub3I6wqDCoCA5MDowCj4gQmFk
IGJsb2NrcyBhcmUgYWxsb3dlZDrCoMKgwqDCoMKgwqDCoMKgIGZhbHNlCj4gRGV2aWNlIGlzIHdy
aXRhYmxlOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cnVlCj4gCj4gIyBub19zZmRwX2ZsYWdz
IG5vdCBzZXQgLyBsaW51eC1uZXh0IC8gc2FtYTVkMjcgd2xzb20xIGVrCj4gIyAjIENPTkZJR19N
VERfU1BJX05PUl9VU0VfNEtfU0VDVE9SUyBpcyBub3Qgc2V0Cj4gcm9vdEBzYW1hNWQyNy13bHNv
bTEtZWstc2Q6fiMgbXRkaW5mbyAvZGV2L210ZDAKPiBtdGQwCj4gTmFtZTrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaTAuMQo+IFR5cGU6wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3IKPiBF
cmFzZWJsb2NrIHNpemU6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDY1NTM2IGJ5dGVz
LCA2NC4wIEtpQgo+IEFtb3VudCBvZiBlcmFzZWJsb2NrczrCoMKgwqDCoMKgwqDCoMKgwqAgNjQg
KDQxOTQzMDQgYnl0ZXMsIDQuMCBNaUIpCj4gTWluaW11bSBpbnB1dC9vdXRwdXQgdW5pdCBzaXpl
OiAxIGJ5dGUKPiBTdWItcGFnZSBzaXplOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMSBieXRlCj4gQ2hhcmFjdGVyIGRldmljZSBtYWpvci9taW5vcjrCoMKgIDkwOjAKPiBCYWQg
YmxvY2tzIGFyZSBhbGxvd2VkOsKgwqDCoMKgwqDCoMKgwqAgZmFsc2UKPiBEZXZpY2UgaXMgd3Jp
dGFibGU6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRydWUKPiAKCmxvb2tzIGdvb2QhCgo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmYXRtZWxfbm9yX2dsb2Jh
bF9wcm90ZWN0aW9uX2ZpeHVwcwo+Pj4+ICvCoMKgwqDCoMKgwqAgfSwgewo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCB9LCB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
aWQgPSBTTk9SX0lEKDB4MWYsIDB4NDgsIDB4MDApLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiYXQyNWRmNjQxIiwKPj4+Cj4+PiBUaGF0IHdvcmtzIHBl
cmZlY3RseSB3ZWxsIChJIGNhbiByZS1wb3N0IHRoZSB0ZXN0IHJlc3VsdHMgYXMgbXkgcHJldmlv
dXMKPj4+IHBhdGNoIGlmIG5lZWRlZCk6IGRvIHlvdSB3YW50IG1lIHRvIHNlbmQgdGhlIHVwZGF0
ZWQgcGF0Y2ggd2l0aCB5b3VyCj4+PiBTdWdnZXN0ZWQtYnkgdGFnIG9yIHlvdSBjYW4gc2VuZCB5
b3VycywgdGVsbCBtZSB3aGF0IHlvdSBwcmVmZXIuCj4+Cj4+IFNlbmQgYSBuZXcgcGF0Y2ggcGxl
YXNlLCBpdCB3YXMganVzdCBhIHN1Z2dlc3Rpb24gdG8gc3BlZWQgdGhlIHRoaW5ncyB1cC4KPiAK
PiBTdXJlLCBJJ20gb24gaXQgOy0pCj4gCj4+PiBUaGFua3MgZm9yIHRoZSBoZWFkcy11cCBvbiB0
aGlzIHVwZGF0ZSB0aGF0IEkgaGFkbid0IG5vdGljZWQuIEJlc3QKPj4+IHJlZ2FyZHMsCj4+PiDC
oMKgIE5pY29sYXMKPj4+Cj4+IHlvdSdyZSB3ZWxjb21lISBDaGVlcnMhCj4gCj4gQmVzdCByZWdh
cmRzLAo+IMKgTmljb2xhcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
