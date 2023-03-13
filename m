Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC8C6FD19
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Mar 2023 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMszZMKgX/IOXnFBnJE+fT8gxgJnFzkhIwMagoMEs/s=; b=qWsCxGdzSCjIrW
	430QzRbV/mc70FBfL9hYhgJ3b7eEhs/ThgrwQ5u7JNB2JgtroNNvwZFkOLmf0YhmeCmDbHyFL6vm7
	M3GNm0CBQj2HHIROBSvAuA6rkzzyTj5RzLFXZFV35b1WbSGk9hB3W1L46LqqsI278M3fvEj/kwzKW
	SWDy7Frgc6jywrFdals9+sMcqLk/+KHQBkCAQ7aX7oHdX3y7Kn+W2TpCVR3okctRkPw9fF/icE2FI
	66S4OQllODpWI6eEmABjpHk3vXRmH4AWSTQnG9gT1c4t1IbLA38CzdEBJM8q0iYiEcfkGzk8aUqHx
	+tC0OyhbpwCSlDDuiMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgH4-005PGA-PI; Mon, 13 Mar 2023 11:23:30 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgGu-005PBm-Qe
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2023 11:23:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id da10so47311632edb.3
        for <linux-mtd@lists.infradead.org>; Mon, 13 Mar 2023 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678706596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lf1/86ozgaIa3RAGsRCPww/jl+a9ZNIHp7P9TXGkzms=;
        b=Cx/1iSede1uZX+5ocrnlaNMuoP2OpXl1i7utUBcfvmTvKRkqGW9qCQQu/BMISybk6V
         fafywXHq/X0KU4NZmNpvCzGZ0XOXrXdhgScUZRKBUwzdLt59MMO5dWoJw+A+rBcuo4GN
         bFVwX/alrzoojK3Eh0jBg8jBA55jlP/dsPAsceA/AJa6XG2j7u90oeZBNClxzNVqTNEG
         y4vZDiJFrVTQZ7+hvHqitrYoFLsq25Wa7Q13NHmlj5O6DMHiNmBVLr05cQGuHPHr58wf
         6aAP5uDrq/O4Uin8y3FLFys49PRIo83MbRVPoCVRhpxTKexofpiqce34e/vhOS2yHm5o
         R8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678706596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf1/86ozgaIa3RAGsRCPww/jl+a9ZNIHp7P9TXGkzms=;
        b=aIL04x3hHEtljfUVSHgC3UD6J+qPIHbW4L7YQ0udZZQ3+BxYurZymprTEOKZd6Qzxv
         HR6d2QhTd/G3KvvUzmeUuuo5LhlbdxVePIkVmpSQTK9oQHFGyvNuvaNJVMFRgI+S0xSa
         JLXrENinMF1BJOKtQZnMpuUcW8fGN3c8P2LeaAQ4HgCwhMq6cx+6eTiLtrRMQE7MdoGv
         33MTR3n2kiPUhvNCJcu3k4hAUi5rVr+G2Rcxuk8Du6gtna4bc+C6krZE7z6eCKJA/ai7
         33ILByIR0MRE9+smJ7UAp4kEVNxu4IYOmrKvjMs/QjOhVn74EqGLPmdT33m3BKKwSJtV
         8w4Q==
X-Gm-Message-State: AO0yUKUNNOBbBk6BxxwlG8HbJlgYX/EWth/jI8Axpzni7iwSTyQGThhq
	PPYCQGuYMlAOKuN8GO1OWsdzSg==
X-Google-Smtp-Source: AK7set+YPCeQcgti39T/fUEGCwOaIBLUWe9jpMzxFhKMF18/KNYCUiJGErM8NMh4xQEAmQefIxB/xg==
X-Received: by 2002:a17:907:c68a:b0:8de:acd1:90f6 with SMTP id ue10-20020a170907c68a00b008deacd190f6mr38250264ejc.4.1678706596350;
        Mon, 13 Mar 2023 04:23:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id pk10-20020a170906d7aa00b008d1693c212csm3310127ejb.8.2023.03.13.04.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 04:23:15 -0700 (PDT)
Message-ID: <939c029f-6679-b364-531c-bf0193135ffd@linaro.org>
Date: Mon, 13 Mar 2023 11:23:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] mtd: spi-nor: Add support for XMC XM25QH256C / XM25QU256C
 / XM25QH512C / XM25QU512C site: https://www.xmcwh.com/site/product#
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Luke He <sixuerain@gmail.com>, pratyush@kernel.org, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230313100153.15441-1-sixuerain@gmail.com>
 <d553beb1c6e38eac748d0b6b62bcd335@walle.cc> <20230313113304.1611638d@xps-13>
 <17d46633869f64e029e065693e341e3b@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <17d46633869f64e029e065693e341e3b@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_042320_896548_5922AE7B 
X-CRM114-Status: GOOD (  19.80  )
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

CgpPbiAzLzEzLzIzIDEwOjM5LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMDMtMTMg
MTE6MzMsIHNjaHJpZWIgTWlxdWVsIFJheW5hbDoKPj4gSGkgTWljaGFlbCwKPj4KPj4gbWljaGFl
bEB3YWxsZS5jYyB3cm90ZSBvbiBNb24sIDEzIE1hciAyMDIzIDExOjA4OjE1ICswMTAwOgo+Pgo+
Pj4gSGksCj4+Pgo+Pj4gcGxlYXNlIGhhdmUgYSBsb29rIGF0IERvY3VtZW50YXRpb24vcHJvY2Vz
cy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0Cj4+PiBob3cgdG8gcHJvcGVybHkgZm9ybWF0IHBhdGNo
ZXMuIEJ1dCBhbHNvIHNlZSBiZWxvdy4KPj4+Cj4+PiBBbSAyMDIzLTAzLTEzIDExOjAxLCBzY2hy
aWViIEx1a2UgSGU6Cj4+PiA+IFNpZ25lZC1vZmYtYnk6IEx1a2UgSGUgPHNpeHVlcmFpbkBnbWFp
bC5jb20+Cj4+PiA+IC0tLQo+Pj4gPsKgIGRyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMgfCAxMiAr
KysrKysrKysrKysKPj4+ID7CoCAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Pj4g
Pgo+Pj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3IveG1jLmMKPj4+ID4gaW5kZXggMDUxNDExZTg2MzM5Li42ZGIwMWI4MDIzN2Yg
MTAwNjQ0Cj4+PiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMKPj4+ID4gKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYwo+Pj4gPiBAQCAtMTYsNiArMTYsMTggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHhtY19ub3JfcGFydHNbXSA9IHsKPj4+ID7CoMKgwqDC
oMKgIHsgIlhNMjVRSDEyOEEiLCBJTkZPKDB4MjA3MDE4LCAwLCA2NCAqIDEwMjQsIDI1NikKPj4+
ID7CoMKgwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9EVUFM
X1JFQUQgfAo+Pj4gPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQSV9O
T1JfUVVBRF9SRUFEKSB9LAo+Pj4gPiArwqDCoMKgIHsgIlhNMjVRSDI1NkMiLCBJTkZPKDB4MjA0
MDE5LCAwLCA2NCAqIDEwMjQsIDUxMikKPj4+ID4gK8KgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxB
R1MoU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwKPj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgU1BJX05PUl9RVUFEX1JFQUQgfCBTUElfTk9SXzRCX09QQ09ERVMp
IH0sCj4+PiA+ICvCoMKgwqAgeyAiWE0yNVFVMjU2QyIsIElORk8oMHgyMDQxMTksIDAsIDY0ICog
MTAyNCwgNTEyKQo+Pj4gPiArwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwg
U1BJX05PUl9EVUFMX1JFQUQgfAo+Pj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgU1BJX05PUl9RVUFEX1JFQUQgfCBTUElfTk9SXzRCX09QQ09ERVMpIH0sCj4+PiA+ICvCoMKg
wqAgeyAiWE0yNVFINTEyQyIsIElORk8oMHgyMDQwMjAsIDAsIDY0ICogMTAyNCwgMTAyNCkKPj4+
ID4gK8KgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9S
RUFEIHwKPj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQSV9OT1JfUVVB
RF9SRUFEIHwgU1BJX05PUl80Ql9PUENPREVTKSB9LAo+Pj4gPiArwqDCoMKgIHsgIlhNMjVRVTUx
MkMiLCBJTkZPKDB4MjA0MTIwLCAwLCA2NCAqIDEwMjQsIDEwMjQpCj4+PiA+ICvCoMKgwqDCoMKg
wqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4+PiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9SX1FVQURfUkVBRCB8IFNQSV9O
T1JfNEJfT1BDT0RFUykgfQo+Pj4KPj4+IEkndmUganVzdCBsb29rZWQgYXQgWE0yNVFIMjU2QyBb
MV0sIGJ1dCBJIHN1c3BlY3QgYWxsIG9mIHRoZXNlCj4+PiBmbGFzaGVzIHN1cHBvcnRzIFNGRFAs
IHRoZXJlZm9yZSB5b3Ugc2hvdWxkbid0IHVzZSB0aGUgTk9fU0ZEUF9GTEFHUy4KPj4KPj4gSSBk
aWRuJ3QgY2hlY2ssIGRvIHdlIGhhdmUgYSBrZG9jIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQgd2hp
Y2ggZXhwbGFpbnMKPj4gd2hhdCBmbGFncyB0byB1c2UgYW5kIHdoZW4/Cj4gCj4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMy1yYzIvc291cmNlL2RyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5oI0w0MjkKPiAKPiBXaGF0J3MgbWlzc2luZyBpcyBzdGlsbCBzb21lIG92ZXJ2aWV3
IGRvY3VtZW50IHdoZW4gYW5kIGhvdyB0byBhZGQgYSBuZXcKPiBlbnRyeSB0byBvdXIgZGF0YWJh
c2UuIC9tZSBsb29rcyBpbiBUdWRvcnMgZGlyZWN0aW9uIDopCj4gCgpSaWdodCwgdGhlIGNvZGUg
Y29tbWVudHMgc2hvdWxkIGhlbHAuIEkndmUgYmVlbiBwbGFubmluZyB0byBkbyB0aGUKZG9jdW1l
bnRhdGlvbiwgZXZlbiBzdGFydGVkIGl0IGZldyBtb250aHMgYWdvLCBidXQgSSdtIHN0aWxsIGJl
aGluZCB3aXRoCnNvbWUgcGF0Y2ggcmV2aWV3cywgaW5jbHVkaW5nIE1pcXVlbCdzLCBzbyB0aGUg
ZG9jdW1lbnRhdGlvbiBoYXMgdG8Kd2FpdC4gSSdtIGRvaW5nIHRoaXMgaW4gbXkgc3BhcmUgdGlt
ZSwgc28gSSdsbCBzdG9wIGdpdmluZyBlc3RpbWF0ZXMuCgpDaGVlcnMsCnRhCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
