Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D7DCD128A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2024 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFl0FTINux5g7ELigOQEMqvjkQn4m5ri+5rmJqbI4jo=; b=21go14khNw+HY3
	v9nt0/+2Dm1gTYqqSpRg8eon9dRnB8E9LmxfjShHtUwflrYqoLfyd0w684eYw70NjzGxZt3USemuZ
	SmwYx3N0DhBeryD5C+6earyj1eYbGaGKME7RrcnV2jNUDmZZrmk/XF55ik1wb1vzc8bsd7J/z+G78
	+IZGzaobScfs/YREm9voqRafX2SQu/+p89UG8pRq2Zo1xo8YNMDbefSpV5u6Zelglsb7GW6X80f2t
	d8K5RqfkQDD4yvtjgQR4Phgu0KHEdaticemS3RJq84LVo+IIkKRCUChUDsE2s7w7hONyddFeUmn6n
	CVvRA2sGZcgxHMJod03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXWk-0000000DILx-1P8C;
	Sun, 07 Apr 2024 18:46:02 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXWh-0000000DILC-0hQd
	for linux-mtd@lists.infradead.org;
	Sun, 07 Apr 2024 18:46:00 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6e68a30e6a1so1501110a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2024 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712515554; x=1713120354; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgqXg60aT6MJfLtaMlnATNJXESBqIL1BHJEEWOvVlh0=;
        b=DqgVKC18jGa/ZAUKdy21sBw3p4+4g9Bnyi0k4n2FUnu2DsoMxhLAMZjpxaKnqsXGBb
         RSxxSBkiCMlPcoOfimYJUEN3qyyWYuufUvpGSSbpGQAJkYP9phlI/AiA+36dW+0JImod
         jEFYGsVrglOhomi8MaQEO+/wFZc9nO+yciEULq/23AFRy7aTXGJF3yMw47Nh17sF7K+D
         gdlJUcqm3D/9T4O7cabO/1jSErmll3Ap/fItOM6j3KtHPxeeDXutJDpTf0UHxiVADUgl
         Zl4CLCbmTNqPtlurpzQOp8d0IYjn5gsbkctouD8QjqNRjxKmlYDB/SBtuEotCSuwxjpI
         P3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712515554; x=1713120354;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgqXg60aT6MJfLtaMlnATNJXESBqIL1BHJEEWOvVlh0=;
        b=sROANhBntyyR1NmXcBbTT2DNXyqIJrTefKwvIqWHfiMe+qKmU8R5HFHxF85iySbfBQ
         CRV01ZRge76rU/gEL2LTHk+eJ84Uj8eeWpYD+kGOrz4tSZYKhVFoWRrywyQH8e9qyIL8
         kmcbwQdqIxjC7+K6u44cFnAYcFXFcSaitWjlvf4oJFcMB07ENJzAqN5MkZPTPKdgp5bl
         3XfOKWgxCNqIwwl2qKSv4vkNeEMbZPsI1IyICA+8hEK1Su5YLOIyqzwmrZ5lucc2fEQ7
         MbsZvtgQUQBmw+jNCoK+3Mhwrmr+jHEMKcPfanF5D06JnG2fOqGdWvwyTVsBRqfHCnSY
         dUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRopeKgATFfrm8ruRrM9xe3UNtAezsmPjbdZKB3lhgRO2pRETR4GqODIJ8/VpF4DsS6C/Fxl7ayDeejH5SW4ST2FqvvOxzOg9RWFRW/A==
X-Gm-Message-State: AOJu0YyO8bs2Ow9hIjpg5+l1gQRzJUTGRrA2l7yPc2wwj14cz0Ob+XX2
	1HpGGfPgA5HjfQEdbjKQZg1pc+/n5ET23Ocfph7xmvrS5u67Uh8V
X-Google-Smtp-Source: AGHT+IGSn06uT5ucJhVN5SnUx0jyRnD9d8nrQg0jfAzNly2yaljheoBXT7c0SivtFbbTlY9NP236LQ==
X-Received: by 2002:a9d:6b19:0:b0:6e6:8d2f:4013 with SMTP id g25-20020a9d6b19000000b006e68d2f4013mr3139289otp.8.1712515554251;
        Sun, 07 Apr 2024 11:45:54 -0700 (PDT)
Received: from [192.168.7.110] (c-98-197-58-203.hsd1.tx.comcast.net. [98.197.58.203])
        by smtp.gmail.com with ESMTPSA id y2-20020a056830208200b006e9e7c28850sm1177981otq.44.2024.04.07.11.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 11:45:53 -0700 (PDT)
Message-ID: <0c0487cb-c73d-42dd-94f8-499c29009730@gmail.com>
Date: Sun, 7 Apr 2024 13:45:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] spi: spi-qpic: Add qpic spi nand driver support
Content-Language: en-US
From: "Alex G." <mr.nuke.me@gmail.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 manivannan.sadhasivam@linaro.org, neil.armstrong@linaro.org,
 daniel@makrotopia.org, arnd@arndb.de, chris.packham@alliedtelesis.co.nz,
 christophe.kerello@foss.st.com, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
 <20240308091752.16136-4-quic_mdalam@quicinc.com>
 <1c803d8c-80b2-47a9-bc8c-8b13cbfc6841@gmail.com>
 <4f72048a-a764-43de-846c-3b4edc1232e3@gmail.com>
In-Reply-To: <4f72048a-a764-43de-846c-3b4edc1232e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_114559_233572_BA124393 
X-CRM114-Status: GOOD (  11.03  )
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

CgpPbiA0LzcvMjQgMTM6NDAsIEFsZXggRy4gd3JvdGU6Cj4gCj4gCj4gT24gNC83LzI0IDEyOjQ4
LCBBbGV4IEcuIHdyb3RlOgo+PiBPbiAzLzgvMjQgMDM6MTcsIE1kIFNhZHJlIEFsYW0gd3JvdGU6
Cj4+PiBBZGQgcXBpYyBzcGkgbmFuZCBkcml2ZXIgc3VwcG9ydC4gVGhlIHNwaSBuYW5kCj4+PiBk
cml2ZXIgY3VycmVudGx5IHN1cHBvcnRlZCB0aGUgYmVsb3cgY29tbWFuZHMuCj4+Pgo+Pj4gLS0g
UkVTRVQKPj4+IC0tIFJFQUQgSUQKPj4+IC0tIFNFVCBGRUFUVVJFCj4+PiAtLSBHRVQgRkVBVFVS
RQo+Pj4gLS0gUkVBRCBQQUdFCj4+PiAtLSBXUklURSBQQUdFCj4+PiAtLSBFUkFTRSBQQUdFCj4+
Pgo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBTcmljaGFyYW4gUmFtYWJhZGhyYW4gPHF1aWNfc3JpY2hh
cmFAcXVpY2luYy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTcmljaGFyYW4gUmFtYWJhZGhyYW4g
PHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+PiBDby1kZXZlbG9wZWQtYnk6IFZhcmFkYXJh
amFuIE5hcmF5YW5hbiA8cXVpY192YXJhZGFAcXVpY2luYy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBWYXJhZGFyYWphbiBOYXJheWFuYW4gPHF1aWNfdmFyYWRhQHF1aWNpbmMuY29tPgo+Pj4gU2ln
bmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4+PiAt
LS0KPj4KPj4gRm9yIHRoZSBlbnRpcmUgc2VyaWVzOgo+Pgo+PiBUZXN0ZWQtYnk6IEFsZXhhbmRy
dSBHYWduaXVjIDxtci5udWtlLm1lQGdtYWlsLmNvbT4KPj4KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NwaS9LY29uZmlnIGIvZHJpdmVycy9zcGkvS2NvbmZpZwo+Pj4gaW5kZXggYmM3MDIxZGEy
ZmU5Li42Mzc2NGU5NDNkODIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3NwaS9LY29uZmlnCj4+
PiArKysgYi9kcml2ZXJzL3NwaS9LY29uZmlnCj4+PiBAQCAtODgyLDYgKzg4MiwxNCBAQCBjb25m
aWcgU1BJX1FDT01fUVNQSQo+Pj4gwqDCoMKgwqDCoCBoZWxwCj4+PiDCoMKgwqDCoMKgwqDCoCBR
U1BJKFF1YWQgU1BJKSBkcml2ZXIgZm9yIFF1YWxjb21tIFFTUEkgY29udHJvbGxlci4KPj4+ICtj
b25maWcgU1BJX1FQSUNfU05BTkQKPj4+ICvCoMKgwqAgdHJpc3RhdGUgIlFQSUMgU05BTkQgY29u
dHJvbGxlciIKPiAKPiBBbHNvLCBkb24ndCB0cmlzdGF0ZSB0aGlzLiBJdCBjYW4gYmUgc2V0IGFz
IENPTkZJR19RUElDX0NPTU1PTj1tLCB3aGljaCAKPiB3aWxsIGNhdXNlIHRoZSBidWlsZCB0byBm
YWlsIGJlY2F1c2UgeW91IGRvbid0IGhhdmUgYSBNT0RVTEVfTElDRU5TRSgpLgoKUGxlYXNlIGRp
c3JlZ2FyZCBteSBpZGlvdGljIHN1Z2dlc3Rpb24gaGVyZS4gSSBtZWFudCB0byBtYWtlIHRoaXMg
CmNvbW1lbnQgb24gdGhlIHByZXZpb3VzIHBhdGNoLgoKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBB
UkNIX1FDT00gfHwgQ09NUElMRV9URVNUCj4+Cj4+IEhlcmUsIGl0IG5lZWRzIHRvICdzZWxlY3Qg
UVBJQ19DT01NT05gLiBPdGhlcndpc2UgaXQgY2FuIHJ1biBpbnRvIAo+PiB1bnJlc29sdmVkIHN5
bWJvbHM6Cj4+Cj4+IDogZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQubzogaW4gZnVuY3Rpb24g
YHNuYW5kY19zZXRfcmVnJzoKPj4gwqDCoGRyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmM6NTY6
KC50ZXh0KzB4NDg0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSAKPj4gdG8gYHFjb21fb2Zmc2V0X3Rv
X25hbmRjX3JlZycKPj4gLi4uCj4+Cj4+PiArwqDCoMKgIGhlbHAKPj4+ICvCoMKgwqDCoMKgIFFQ
SUNfU05BTkQgKFFQSUMgU1BJIE5BTkQpIGRyaXZlciBmb3IgUXVhbGNvbW0gUVBJQyBjb250cm9s
bGVyLgo+Pj4gK8KgwqDCoMKgwqAgUVBJQyBjb250cm9sbGVyIHN1cHBvcnRzIGJvdGggcGFyYWxs
ZWwgbmFuZCBhbmQgc2VyaWFsIG5hbmQuCj4+PiArwqDCoMKgwqDCoCBUaGlzIGNvbmZpZyB3aWxs
IGVuYWJsZSBzZXJpYWwgbmFuZCBkcml2ZXIgZm9yIFFQSUMgY29udHJvbGxlci4KPj4+ICsKPj4+
IMKgIGNvbmZpZyBTUElfUVVQCj4+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJRdWFsY29tbSBTUEkg
Y29udHJvbGxlciB3aXRoIFFVUCBpbnRlcmZhY2UiCj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24g
QVJDSF9RQ09NIHx8IENPTVBJTEVfVEVTVAo+Pgo+PiBBbGV4Cj4gQWxleAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
