Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F8BD41D5F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzokdU/X2oK9iVQZJL9SAVZkprsHTOQvYPbBY1qiRaU=; b=V+AwagY4uDbsxW
	csV+eiYr+yow4/zAnaNTBSLtNXmnQ29TH///2Y6c+SqFQDxwTLWOfJyeiF4TofNoHNqetylSwoaZ5
	EeVakUBF0+qz8NRkm4M3RqRmdDo6uHjmlOAPIlR5jbZFyWo6YfEqch1ZZEQIs8hhGZPsC0d7EjJoY
	zORFp2Cn60SUI8LmBnkLoko0dSD5d1eh3KDd2mqw8eOnd+FqiqiOv74lkPiwycrUtKeFs2Mr1yW0w
	lSl7wymAQ9a8cs65CU7mMQ8cHeAsCB0wWYvr7qlXkMmDBMsZF4/M4vtQTDXIiZjjcv2pI9w3cw1mB
	oo+5gH1TQtv4J2IqoyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAl36-00000002QRl-0TmU;
	Tue, 12 Nov 2024 07:10:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkzC-00000002PiH-3KQU
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 07:06:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d495d217bso4865038f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 23:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731395209; x=1732000009; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hObYuYl1ei/ScT2ORpCtLDWMlshHpVMx0blZrTEJrO4=;
        b=C2rIaGLGqQ5f4zVA3H6up5r9DE+VrZSV+9t0Q70+BI2yrlJu7R3aMWUuxUp8geRocN
         2x2KY0qTk+ZwkXdqGJJSdgQJHqcg5vkWqY+zQmsbFyFGyoVIbPqyl9Cpukb9rJPdcr6v
         enJA8b27tYEJ5CiOAEoA57ZBGBwlzpILDHDBFL0ULGwzYMozNUJttdcAJiUsXIJ/RrdE
         9+fbftezrf/0uUNBm/gj2zto/lor9XTneVTpVhtW7C/RPDHG1g8X8aCC/Ur+zRn/mpkJ
         vrY30eBdLQSEvjROR6mscYsLTPUdMSfZlJwZ0cvH4/zG5M0Mag8oiD736LCH8Oh9QT+f
         60UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731395209; x=1732000009;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hObYuYl1ei/ScT2ORpCtLDWMlshHpVMx0blZrTEJrO4=;
        b=sJuzOfvXJTMdNVkDubDhgjJUzxGXaByrOfLn1Y8LO4Cf1W1Z8zZtIC3t3uEKsnAsXW
         zSE6H2Ib7/sagcZpgU7DUWciyobJK0Uqza4Svsh2Bfa36B1Ksvm06w/LbzhpLIQpr64x
         liD39TLH2QUKH0vYRH6P2F+nJMRJ2rDQNHZU8UnmvRAaltzvrFbe7GRhzRlhjrPKkGx8
         ilQ0r2hhEnvX4X1h7Ru7Bzr37JCZATkePx/Y0Fz16QP6EadTc9vPPeh/bXe9Gd7kzUZ4
         Bk9m24ytcyJDhkQh4aMZ3rZQOqorW4CvJMkq+BnfGECF5Jtqx8v5Wrk6s646bp0CtjZt
         cEXg==
X-Forwarded-Encrypted: i=1; AJvYcCUYv/CgdeMMxvRL5SUKTKk+tV05hgREZmjTSAQDH5usYlpd2DUgjGdvBNeQ4U+YJG8NRqdrwsj4Et4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMp0+AHqCt7HjMtGEMSYeeLCwfbX3wdktoZtIVCCLMFcYPg5aZ
	Z13KwvBDwglCMvpLX8TKxxGEBtJbJo6I6EjWC4vIOAzUK68yFvhyHcXEPijFltc=
X-Google-Smtp-Source: AGHT+IH8gDIE5xOMkpAzeXeRAOV1bnomwYmpdgqhgYxSHOdPk/NbqhfDihFAmoQcWiKF7A/HXTTLwQ==
X-Received: by 2002:a05:6000:20c3:b0:381:f603:ff62 with SMTP id ffacd0b85a97d-381f603ff95mr10336826f8f.20.1731395208994;
        Mon, 11 Nov 2024 23:06:48 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432cf1216d6sm6086765e9.0.2024.11.11.23.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 23:06:48 -0800 (PST)
Message-ID: <5a2c8f53-117f-4ffb-9f85-de1ae83ff835@linaro.org>
Date: Tue, 12 Nov 2024 07:06:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: replace dummy buswidth from addr to
 data
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20241107093016.151448-1-linchengming884@gmail.com>
 <437e9c87-fbae-4402-858c-ce6de0a992c7@linaro.org>
 <CAAyq3Sb-dmmF8YsOdTYxZqX8Wn4d=WiAXkS4bHp5FLn3S+ouXg@mail.gmail.com>
 <01160386-a65f-44b0-ac57-ad77754f01cc@linaro.org>
Content-Language: en-US
In-Reply-To: <01160386-a65f-44b0-ac57-ad77754f01cc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_230650_862546_E0AFAEE1 
X-CRM114-Status: GOOD (  13.23  )
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

CgpPbiAxMS8xMi8yNCA2OjQ1IEFNLCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDEx
LzEyLzI0IDI6NDIgQU0sIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+PiBIaSBUdWRvciwKPj4KPj4g
VHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiDmlrwgMjAyNOW5tDEx5pyI
MTHml6Ug6YCx5LiAIOS4i+WNiDY6MTjlr6vpgZPvvJoKPj4+Cj4+Pgo+Pj4KPj4+IE9uIDExLzcv
MjQgOTozMCBBTSwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4+Pj4gRnJvbTogQ2hlbmcgTWluZyBM
aW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPj4+Pgo+Pj4+IFRoZSBkZWZhdWx0IGR1bW15
IGN5Y2xlIGZvciBNYWNyb25peCBTUEkgTk9SIGZsYXNoIGluIE9jdGFsIE91dHB1dAo+Pj4+IFJl
YWQgTW9kZSgxLTEtOCkgaXMgMjAuCj4+Pj4KPj4+PiBDdXJyZW50bHksIHRoZSBkdW1teSBidXN3
aWR0aCBpcyBzZXQgYWNjb3JkaW5nIHRvIHRoZSBhZGRyZXNzIGJ1cyB3aWR0aC4KPj4+PiBJbiB0
aGUgMS0xLTggbW9kZSwgdGhpcyBtZWFucyB0aGUgZHVtbXkgYnVzd2lkdGggaXMgMS4gV2hlbiBj
b252ZXJ0aW5nCj4+Pj4gZHVtbXkgY3ljbGVzIHRvIGJ5dGVzLCB0aGlzIHJlc3VsdHMgaW4gMjAg
eCAxIC8gOCA9IDIgYnl0ZXMsIGNhdXNpbmcgdGhlCj4+Pj4gaG9zdCB0byByZWFkIGRhdGEgNCBj
eWNsZXMgdG9vIGVhcmx5Lgo+Pj4+Cj4+Pj4gU2luY2UgdGhlIHByb3RvY29sIGRhdGEgYnVzd2lk
dGggaXMgYWx3YXlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byB0aGUKPj4+PiBhZGRyZXNzIGJ1
c3dpZHRoLiBTZXR0aW5nIHRoZSBkdW1teSBidXN3aWR0aCB0byBtYXRjaCB0aGUgZGF0YSBidXN3
aWR0aAo+Pj4+IGluY3JlYXNlcyB0aGUgbGlrZWxpaG9vZCB0aGF0IHRoZSBkdW1teSBjeWNsZS10
by1ieXRlIGNvbnZlcnNpb24gd2lsbCBiZQo+Pj4+IGRpdmlzaWJsZSwgcHJldmVudGluZyB0aGUg
aG9zdCBmcm9tIHJlYWRpbmcgZGF0YSBwcmVtYXR1cmVseS4KPj4+Cj4+PiBUaGlzIGlzIHN0aWxs
IHZlcnkgd3JvbmcgYW5kIHRoZSBgZml4YCBpcyB3b3JraW5nIGp1c3QgYnkgY2hhbmNlLgo+Pj4g
Q29uc2lkZXIgd2hhdCBoYXBwZW5zIHdoZW4gb25lIHJlcXVpcmVzIDEwIGR1bW15IGN5Y2xlcy4g
QlRXLCBkb2VzIHRoaXMKPj4+IGZpeCBhIHJlYWwgcHJvYmxlbSwgb3IgaXQncyBqdXN0IGEgdGhl
b3JldGljYWwgZml4Pwo+Pgo+PiBJbiAxLTEtOCBtb2RlLCBzZXR0aW5nIHRoZSBkdW1teSBidXN3
aWR0aCB0byBtYXRjaCB0aGUgZGF0YQo+PiBidXN3aWR0aCBlbnN1cmVzIGEgZHVtbXkgYnVzd2lk
dGggb2YgOCwgd2hpY2ggY2FuIGFjY29tbW9kYXRlCj4+IGFsbCB0eXBlcyBvZiBkdW1teSBjeWNs
ZXMuCj4+Cj4+IFRoaXMgcGF0Y2ggcmVzb2x2ZXMgYSBzaWduaWZpY2FudCBpc3N1ZSBpbiAxLTEt
OCBtb2RlLCBhcyBkZXNjcmliZWQgYWJvdmUuCj4+Cj4gCj4gc2hhbGwgd2UgYWRkIGEgZml4ZXMg
dGFnIHRoZW4sIGFuZCBhIGNjIHRvIHN0YWJsZT8KCkkgbmVlZCBhIHBhdGNoIHRvZGF5IGlmIHlv
dSB3YW50IGl0IGludGVncmF0ZWQgaW4gdGhlIFNQSSBOT1IgUFIuCk90aGVyd2lzZSB3ZSdsbCBx
dWV1ZSBvbmUgaW4gdGhlIC1yYyBwaGFzZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
