Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62079CD128A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2024 18:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCEUAH6JpQ49MpP9wXaPukDwNifQZbS/Jkov4Vry/0E=; b=UyASFvfWfsYAAV
	nd6PP/q7MdrVLQEiYeEKSjxQk6507yL3UqSt4kEMavEL3bNv8OtjRr+QCSxOok/4ieCWX5MFAnMwf
	BbH9jvelaSEMh7BdRx+ldoWtaXf1zNRPJdQqV9au38YV5+D1pOMby5yyGc98Y7yH33mbdDmKQufu7
	JTW4kw/UHpuIrfahtZwTBmpsFZJZhe7i9PKu46mOVeetOB7DoswaFX6YMp62pZetbHEDnlWODnP4m
	FuHgLNt4c8EFe5rl/ormMXlx/7HRbpJDaSXGiMMwFhRw9+QFGYzXrDxDusC0wTCAKcLn3lfMZJ2Yz
	WtXFbkZrt2P5Ni7coLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXRL-0000000DHoD-2dPm;
	Sun, 07 Apr 2024 18:40:27 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXRH-0000000DHn7-48n6
	for linux-mtd@lists.infradead.org;
	Sun, 07 Apr 2024 18:40:25 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6e6d089f603so2495877a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2024 11:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712515222; x=1713120022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUKtwHYYOS78zOcm53x8cFgShMzlmboFlKQVfaRJWT8=;
        b=QlHLQYKCUW23ok0FkpSbkYGrwreGAK6sPqeBVtE1f2hzX1hBypBe+NBOFOMhke4/Sh
         uEIrGKS9pSGvCw5eNC6idn1yiDd58WX28UVDo3NnkQ/RxzllY2S2TstjMSVPM477NqNx
         5xptpgksKXbYuYR6Ml/FGo1VCtQFpP3ul8wIkHECUCg69tSffpJ/BWXMT5nXaPegfp3q
         G7IH6gAXbTiJoF8r87EFmvcxrs+3lKaldefcTq9gZ8mPr7pOCwkQdMFwTpNbFtvpyYKz
         YRwcvwfnlYxNm6+dbowz2gjm5KtvUv1ne0BTrIxFmXBbC6wCHplEgKYtnz/DZLklcze4
         BzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712515222; x=1713120022;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUKtwHYYOS78zOcm53x8cFgShMzlmboFlKQVfaRJWT8=;
        b=rQpLw/BOaGZPKrEse9Bs/Zm1YN0Y+Kw8djrLgWWqLumCV3DkTxbh1fCyww3yxtIK40
         SSgxZn4uxTjnrfRtqUyq40Mk+khwPGu2vZuAB/iN2jh6/93LrXKPj9ZPse25IOmy9Zn7
         U88hi/TWIYnJonpbuIxOEFwsnFOBFin6pDo90gcjBuRq18U4NnF12eY6uFbiI25wSYYu
         fPC8UcaG/Y54SG0UaRK4UuY7uN1UPiVaa2uLTrBr5jorI8NsWPhjm5T7EUnu6GybJ66r
         m2KtHeqk9QjkTmgDB40oOpKTU/kndKlasjhKUUxJSNYxAEKz8RIbQAKi+o7gDZkzjQHR
         kItg==
X-Forwarded-Encrypted: i=1; AJvYcCVzBkN5NMCqnJpeLTXFRUfqgAmj5ZjrIpFzXYApupe1LZaBbb83CLNSpGsdawhnCsZhc1/fIrrwFbc/TbIPa5O3S72X3s3c3xqh/NT4dw==
X-Gm-Message-State: AOJu0Yz7qqdsXvK7tdmvlTxdsMUlDuDz/fFeoyNSK4fkMH0nR6yzeKsN
	dbvwq8+RtjcSG6hlTfQLSKmh0fOBhWUfLWEqmDG+ZmIfSMCKzw+8
X-Google-Smtp-Source: AGHT+IGcqRPsdihGAZOFsMaEZYvWNrkAJe8AeEvdxDpvELNxvl9nXMdBo8DkpHTLIvxk68A3QU/rRA==
X-Received: by 2002:a05:6830:1341:b0:6e9:f501:1943 with SMTP id r1-20020a056830134100b006e9f5011943mr7227024otq.33.1712515222151;
        Sun, 07 Apr 2024 11:40:22 -0700 (PDT)
Received: from [192.168.7.110] (c-98-197-58-203.hsd1.tx.comcast.net. [98.197.58.203])
        by smtp.gmail.com with ESMTPSA id p13-20020a056830338d00b006e6cb624064sm1176829ott.40.2024.04.07.11.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 11:40:21 -0700 (PDT)
Message-ID: <4f72048a-a764-43de-846c-3b4edc1232e3@gmail.com>
Date: Sun, 7 Apr 2024 13:40:20 -0500
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
In-Reply-To: <1c803d8c-80b2-47a9-bc8c-8b13cbfc6841@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_114024_606716_9B87A4A4 
X-CRM114-Status: GOOD (  12.63  )
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

CgpPbiA0LzcvMjQgMTI6NDgsIEFsZXggRy4gd3JvdGU6Cj4gT24gMy84LzI0IDAzOjE3LCBNZCBT
YWRyZSBBbGFtIHdyb3RlOgo+PiBBZGQgcXBpYyBzcGkgbmFuZCBkcml2ZXIgc3VwcG9ydC4gVGhl
IHNwaSBuYW5kCj4+IGRyaXZlciBjdXJyZW50bHkgc3VwcG9ydGVkIHRoZSBiZWxvdyBjb21tYW5k
cy4KPj4KPj4gLS0gUkVTRVQKPj4gLS0gUkVBRCBJRAo+PiAtLSBTRVQgRkVBVFVSRQo+PiAtLSBH
RVQgRkVBVFVSRQo+PiAtLSBSRUFEIFBBR0UKPj4gLS0gV1JJVEUgUEFHRQo+PiAtLSBFUkFTRSBQ
QUdFCj4+Cj4+IENvLWRldmVsb3BlZC1ieTogU3JpY2hhcmFuIFJhbWFiYWRocmFuIDxxdWljX3Ny
aWNoYXJhQHF1aWNpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTcmljaGFyYW4gUmFtYWJhZGhy
YW4gPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+IENvLWRldmVsb3BlZC1ieTogVmFyYWRh
cmFqYW4gTmFyYXlhbmFuIDxxdWljX3ZhcmFkYUBxdWljaW5jLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogVmFyYWRhcmFqYW4gTmFyYXlhbmFuIDxxdWljX3ZhcmFkYUBxdWljaW5jLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4+IC0t
LQo+IAo+IEZvciB0aGUgZW50aXJlIHNlcmllczoKPiAKPiBUZXN0ZWQtYnk6IEFsZXhhbmRydSBH
YWduaXVjIDxtci5udWtlLm1lQGdtYWlsLmNvbT4KPiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3BpL0tjb25maWcgYi9kcml2ZXJzL3NwaS9LY29uZmlnCj4+IGluZGV4IGJjNzAyMWRhMmZlOS4u
NjM3NjRlOTQzZDgyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NwaS9LY29uZmlnCj4+ICsrKyBi
L2RyaXZlcnMvc3BpL0tjb25maWcKPj4gQEAgLTg4Miw2ICs4ODIsMTQgQEAgY29uZmlnIFNQSV9R
Q09NX1FTUEkKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgIFFTUEkoUXVhZCBT
UEkpIGRyaXZlciBmb3IgUXVhbGNvbW0gUVNQSSBjb250cm9sbGVyLgo+PiArY29uZmlnIFNQSV9R
UElDX1NOQU5ECj4+ICvCoMKgwqAgdHJpc3RhdGUgIlFQSUMgU05BTkQgY29udHJvbGxlciIKCkFs
c28sIGRvbid0IHRyaXN0YXRlIHRoaXMuIEl0IGNhbiBiZSBzZXQgYXMgQ09ORklHX1FQSUNfQ09N
TU9OPW0sIHdoaWNoIAp3aWxsIGNhdXNlIHRoZSBidWlsZCB0byBmYWlsIGJlY2F1c2UgeW91IGRv
bid0IGhhdmUgYSBNT0RVTEVfTElDRU5TRSgpLgoKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIEFSQ0hf
UUNPTSB8fCBDT01QSUxFX1RFU1QKPiAKPiBIZXJlLCBpdCBuZWVkcyB0byAnc2VsZWN0IFFQSUNf
Q09NTU9OYC4gT3RoZXJ3aXNlIGl0IGNhbiBydW4gaW50byAKPiB1bnJlc29sdmVkIHN5bWJvbHM6
Cj4gCj4gOiBkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5vOiBpbiBmdW5jdGlvbiBgc25hbmRj
X3NldF9yZWcnOgo+ICDCoGRyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmM6NTY6KC50ZXh0KzB4
NDg0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byAKPiBgcWNvbV9vZmZzZXRfdG9fbmFuZGNfcmVn
Jwo+IC4uLgo+IAo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgUVBJQ19TTkFORCAoUVBJ
QyBTUEkgTkFORCkgZHJpdmVyIGZvciBRdWFsY29tbSBRUElDIGNvbnRyb2xsZXIuCj4+ICvCoMKg
wqDCoMKgIFFQSUMgY29udHJvbGxlciBzdXBwb3J0cyBib3RoIHBhcmFsbGVsIG5hbmQgYW5kIHNl
cmlhbCBuYW5kLgo+PiArwqDCoMKgwqDCoCBUaGlzIGNvbmZpZyB3aWxsIGVuYWJsZSBzZXJpYWwg
bmFuZCBkcml2ZXIgZm9yIFFQSUMgY29udHJvbGxlci4KPj4gKwo+PiDCoCBjb25maWcgU1BJX1FV
UAo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJRdWFsY29tbSBTUEkgY29udHJvbGxlciB3aXRoIFFV
UCBpbnRlcmZhY2UiCj4+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBBUkNIX1FDT00gfHwgQ09NUElM
RV9URVNUCj4gCj4gQWxleApBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
