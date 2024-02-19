Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26820C48BC3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Feb 2024 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmdUZRRSfT+0twHQHeumOU0ddeRVuvpZzWL2x6c1OQ0=; b=gRA7oBMQS8H9CS
	6xiu378lSFIe3C3OHSXq2GiIeUPbFeXg5bMObI7AbXp1HtaeY8Up3UyyWpD6JpvELL/kR1goOsQKW
	fdVIfhbMtTD7QsPGMI+LmLiXMxttZq4fUxFqDk/Irnxy0YLcKWbyPQtayIjB1e/EO5+vy81mQo5gn
	0G6a4qjX6y3tr08X4S5BZU99elzcbHF+jx2jZbs/mcRJ5IUYzvsbBFi75w9/G15BHg0ic12Q7ienC
	apxdWi6Mq5P1yyKCRJuFNtXLsVgltU3zFK+j3N/vzoF7fReL5cMHqn+fkbMOBimNbzlwRbvPZJhAE
	jQNv5aQVtCKPHZztJ4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3K1-0000000AX2e-0SXC;
	Mon, 19 Feb 2024 13:04:37 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Jn-0000000AWwT-1O0N
	for linux-mtd@lists.infradead.org;
	Mon, 19 Feb 2024 13:04:36 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7872ade6f0aso178149285a.1
        for <linux-mtd@lists.infradead.org>; Mon, 19 Feb 2024 05:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708347861; x=1708952661; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SY8Y2hH/CXJ9at2J0AQUWNH09vMSJ7Esh7RYr/Ugldg=;
        b=UcIWiVMaTRDR4UR+DOpdQPJZ4ygFnh8r0IeXVzegqMZKDhGkcMPOkSqTeByNdBroYE
         gLgYaGuItrPq+6KYZWy+B8eZs+hh+akOo1Rn19Ua71dsyZyk7uq2pXtd7resEY2Lqns6
         69EKkryvEpeIL1IvUuQa/WqitGjc69Ly488vfALNszpyk3zbeV1Py6NsT7qBskQraCpC
         UTYHW/zUubaP9uIVbU9+0Ik14azCNDLROSqpXU7Bdg9BFhSBq9kKmKJV7CZo1GUwwe2O
         p5jz6Ag1Y2W4VG0nWXBiIZ+aDBPadWgEuT2VO+zc93Kh8QUh5734yDBwMpMC5gqQM9jG
         DgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347861; x=1708952661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SY8Y2hH/CXJ9at2J0AQUWNH09vMSJ7Esh7RYr/Ugldg=;
        b=eUbuoHDsqP4JNSlKccplxWLrorlXns6OmOHCWm05vh1tlUi+rF8FThk6ml4FLwdz0u
         AYdzNZQToBmgd/WQXerKXEbDJry7SVxlGW2vQ+X84JYHFrtmP4AX7FSqvGT2TS80rmhC
         ipt5vLmJde0y2YQa/3HUvq6+aLAwvgd4la+1gprwSDJRKd/gis+NLh0kQ0r8XrcXwxgK
         lpRqfekVIzXYy4+XIRnTaetxgAHROO/TnvNAVUtIWBZk1Hjq0ZnGjfkewdFLwsgSAJv0
         ukpmY8JLLJ6A733QPVrOswshSaU7r7EmGV5QtzDAg7ZUnVcWntwRe4Ks8642DML9Ojox
         lhnA==
X-Forwarded-Encrypted: i=1; AJvYcCW+hQL2sV8qS27jGXTe1NBnCzjKrmEWTpYgd59VKVe4E44+5cdafutV7U9vmQvv1DrCKj1dulIsY4ChvlyNOH+TGv63ouuujYlEa6ORTw==
X-Gm-Message-State: AOJu0Yz2IHeWKoJ4up8rsAyYCXmbrS9cHLM55Q2m70dAorw3V5izJLPU
	FFoAQwPEjiMpMFk1AtxMkeVuyBJYmeYDASrtFF1Qm4D4TD2UyeGUg9y05UlRIQ==
X-Google-Smtp-Source: AGHT+IEKBSaPNzIeULQKEG+04Ak6UQqjqmNKykyWAsLL5EoP+wRKjhX8SKhSvx/abI7RnC7ox+lquw==
X-Received: by 2002:a37:c441:0:b0:787:16e1:e970 with SMTP id h1-20020a37c441000000b0078716e1e970mr12977495qkm.21.1708347861130;
        Mon, 19 Feb 2024 05:04:21 -0800 (PST)
Received: from thinkpad ([117.248.7.166])
        by smtp.gmail.com with ESMTPSA id l7-20020a05620a0c0700b007854696725fsm2431669qki.75.2024.02.19.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:04:20 -0800 (PST)
Date: Mon, 19 Feb 2024 18:34:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 0/5] Add QPIC SPI NAND driver
Message-ID: <20240219130412.GC3281@thinkpad>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_050423_461833_197ED04A 
X-CRM114-Status: GOOD (  16.64  )
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

T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMDc6MTg6NTFQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBUaGlzIHNlcmllcyBvZiBwYXRjaGVzIHdpbGwgYWRkIGluaXRpYWwgc3VwcG9ydHMK
PiBmb3IgUVBJQyBTUEkgTkFORCBkcml2ZXIuCj4gCj4gQ3VycmVudGx5IHRoaXMgZHJpdmVyIHN1
cHBvcnQgZm9sbG93aW5nIGNvbW1hbmRzCj4gCj4gLS0gUkVTRVQKPiAtLSBSRUFEIElECj4gLS0g
QkxPQ0sgRVJBU0UKPiAtLSBQQUdFIFJFQUQKPiAtLSBQQUdFIFdSSVRFCj4gLS0gR0VUIEZFQVRV
UkUKPiAtLSBTRVQgRkVBVFVSRQo+IC0tIEJBRCBCTE9DSyBDSEVDSwo+IAo+IFRoaXMgZHJpdmVy
IGhhcyBiZWVuIHRlc3RlZCB3aXRoIGRkIGNvbW1hbmQgd2l0aCByZWFkL3dyaXRlIHBhZ2UKPiB3
aXRoIG11bHRpcGxlIGZpbGUgc2l6ZSAxTWlCLCAxME1pQiw0ME1pQiBldGMuCj4gQWxzbyB0ZXN0
ZWQgd2l0aCAibXRkIiBjb21tYW5kIGxpa2UgbXRkIGVyYXNlLCBtdGQgd3JpdGUsIG10ZCB2ZXJp
ZnkgZXRjLgo+IAoKVGhpcyBpcyBub3QgdGhlIGZpcnN0IHZlcnNpb24gaXNuJ3QgaXQ/IFdoZXJl
IGlzIHRoZSBjaGFuZ2Vsb2cgZGVzY3JpYmluZyB3aGF0CmhhcyBjaGFuZ2VkIHNpbmNlIHRoZW4/
CgotIE1hbmkKCj4gTmVlZCBoZWxwIHRvIHRlc3QgdGhlc2UgYWxsIHBhdGNoZXMgb24gU0RYNjUg
YW5kIFNEWDc1IHBsYXRmb3JtLgo+IAo+IE1kIFNhZHJlIEFsYW0gKDUpOgo+ICAgc3BpOiBkdC1i
aW5kaW5nczogYWRkIGJpbmRpbmcgZG9jIGZvciBzcGktcXBpYy1zbmFuZAo+ICAgZHJpdmVyczog
bXRkOiBuYW5kOiBBZGQgcXBpY19jb21tb24gQVBJIGZpbGUKPiAgIHNwaTogc3BpLXFwaWM6IEFk
ZCBxcGljIHNwaSBuYW5kIGRyaXZlciBzdXBwb3J0Cj4gICBhcm02NDogZHRzOiBxY29tOiBpcHE5
NTc0OiBBZGQgU1BJIG5hbmQgc3VwcG9ydAo+ICAgYXJtNjQ6IGR0czogcWNvbTogaXBxOTU3NDog
RGlzYWJsZSBlTU1DIG5vZGUKPiAKPiAgLi4uL2JpbmRpbmdzL3NwaS9xY29tLHNwaS1xcGljLXNu
YW5kLnlhbWwgICAgIHwgICA4MiArKwo+ICAuLi4vYm9vdC9kdHMvcWNvbS9pcHE5NTc0LXJkcC1j
b21tb24uZHRzaSAgICAgfCAgIDQzICsKPiAgYXJjaC9hcm02NC9ib290L2R0cy9xY29tL2lwcTk1
NzQtcmRwNDMzLmR0cyAgIHwgICAgMiArLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vaXBx
OTU3NC5kdHNpICAgICAgICAgfCAgIDI3ICsKPiAgZHJpdmVycy9tdGQvbmFuZC9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gIGRyaXZlcnMvbXRkL25hbmQvcXBpY19jb21t
b24uYyAgICAgICAgICAgICAgICB8ICA3OTQgKysrKysrKysrKysKPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jICAgICAgICAgICAgIHwgMTIyNiArLS0tLS0tLS0tLS0tLS0tLQo+
ICBkcml2ZXJzL3NwaS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5ICsK
PiAgZHJpdmVycy9zcGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAr
Cj4gIGRyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgICAgICAgICAgICAgICAgICB8IDEwMjUg
KysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oICAg
ICAgICAgIHwgIDU0OCArKysrKysrKwo+ICAxMSBmaWxlcyBjaGFuZ2VkLCAyNTQ3IGluc2VydGlv
bnMoKyksIDEyMTEgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3Fjb20sc3BpLXFwaWMtc25hbmQueWFtbAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9uLmgKPiAKPiAtLSAKPiAy
LjM0LjEKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/
4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
