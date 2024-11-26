Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1B7D5A6DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 05:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2IFGz3+PQd64HLW4cj32PC6TuvVpxyHUiwIWpqqyyo=; b=nBWQpUolHyc+x4
	ayeRXAdcnM2kIbsrGz3onfEle44hnRr6jgxPvrpEWrMBmtgYCRHdmpVPaqg+HVfRp76VYpnwXMWdm
	zEgsqRGhZbPWvdAY7hPUqCfYGxokPGjD4AxZRy1+OTiqOjgchauKATphFTKmu3U0tPhwRqFG7oSv3
	EKvQdw5cL69vhdstM5rSvgcW2xSINFevhrL7FfItABN4CVQyt/PkCEOlGyXBPPlHSwE4nhG3NJ8C8
	k8XbSp2Z0dvd9qgx4KEtT9fIZdUx1S6PgTrTQNWAkDIEmgT3Blt3EueXgPez+gPdKZ1anAAmmveyT
	5YX8oxCnlfmu2uvn1bAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFo9e-00000009flS-0Z0L;
	Tue, 26 Nov 2024 05:30:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFo9a-00000009fkz-1weQ
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 05:30:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2129fd7b1a5so35241305ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732599025; x=1733203825; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DRK5oxyyGXu9C+opb6esMTgR5oRPw3Spok7HT4y56m0=;
        b=v+Vonx9AvENMApn/giXYzW8wu5T51upEnOHKCq7MoCT94hB7Mie6xOvc3S5l+5RovL
         zua+CUt+QChTYtMkP74sAWysb4tm53i210kMv3UdF6XjX0pM3GRK+bF6sPqn54kXrhjC
         N+jfJZlXhQ72Cu8TtufPPfmfqSSRB1JMDRe6FbQHWBqQfEcWT1URpNbKMTAoBTmZXIEQ
         wsY+kqmK5SZDRs+OpiSaFI157VpHFDaz+jROeMGW7Ljk6yPN7y9MHCs8y+/fSXvFVK7C
         1E492atarDxpNmi+aYlx+jHQIHhI+NYJSwrAvil2bHZgxktNAlXbXZnSBEV4O365GmE4
         Sa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732599025; x=1733203825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRK5oxyyGXu9C+opb6esMTgR5oRPw3Spok7HT4y56m0=;
        b=U/L01ShgbfzygNO8xCX0I8SqSvCNXMupC1msSdV/ybqZ1IBMxqQYUVsuhPEvnUTUxM
         A9hTAJ2zfOtryFurfmjxnvB9k3MFlNW7k4ffO/fjf5vNwJ1CVBSThnDb6k9EmkvuaWP+
         MHdwV8XJu5/k1jnMRkg3JFFZ6xL5a9d3FhaDWMwI4lyrF4iCXpixjzQAvSIUcGFCMXn4
         AJXrTRcQfEj7lcKDz4vXNQN8HLf25RpJ1g5hVqV3bg3ONV0qs0eYY6jIVWrXgWYKs+vC
         PqxZzfBUuHYV/H/h4vj5R0pDM9zKp/iSTXq2r4tRIuLpBOV1eVqIl+TO5CgbUXkj16RS
         dhWw==
X-Forwarded-Encrypted: i=1; AJvYcCXEkvdqZINBUNXFL73mCzt17ykeFeB+jeyaa8lLodTwalg3IWqscocfQyHt+9xJP841n4Yq9B1l4xc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBLcGKB1t+Tghz/nZdw3ZU6U1CjyiswSaMzIglEHGkeZQQCexV
	Tu8gDK6nBcpXahtvwFjIz0S8f4OAlMt+bKPh0PYlmqXK2xl4aMGBcaqMuilYfg==
X-Gm-Gg: ASbGncsttgX633J28c03gCrRIyXs956Hdf0f3KF2BBkT7ZmUaaxKBodAzZbFMt+3Xsy
	wW9VigN2HJhge5xL5q2qeXR+L28qccySnAuaeJNH7/TtGYWUCsAV1y6aj07r1Ha2MlfOazmzdZA
	eIhpYszuvw2gZ8xLSFtMMqTJclYx9tHsvng7BXReWekR6I2byS/+UNxY+dv2MhNWLDTpa+2khFW
	eOrlxzosJJgWP26eiiTMNsTK0/w+mxfV14EwBBu8sOWTOmJnkHB/CFX3e3OQo8=
X-Google-Smtp-Source: AGHT+IGZ020HY/PPdo2y57mtAEO25NQ77pGViPvf4gHiy78OoGcD1OclydKAhtt/4Zcov+z5xdsELQ==
X-Received: by 2002:a17:902:cec4:b0:212:52b9:1571 with SMTP id d9443c01a7336-2129f28a295mr213455245ad.43.1732599025102;
        Mon, 25 Nov 2024 21:30:25 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfa342sm75502395ad.115.2024.11.25.21.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 21:30:24 -0800 (PST)
Date: Tue, 26 Nov 2024 11:00:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 1/3] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <20241126053019.ujdb7nkkj3f25jyn@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122085933.2663927-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_213026_519789_8D86D90B 
X-CRM114-Status: GOOD (  29.09  )
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

T24gRnJpLCBOb3YgMjIsIDIwMjQgYXQgMDI6Mjk6MzFQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBDdXJyZW50bHkgd2UgYXJlIGNvbmZpZ3VyaW5nIGxvd2VyIDI0IGJpdHMgb2YgYWRk
cmVzcyBpbiBkZXNjcmlwdG9yCj4gd2hlcmVhcyBRUElDIGRlc2lnbiBleHBlY3RzIDE4IGJpdCBy
ZWdpc3RlciBvZmZzZXQgZnJvbSBRUElDIGJhc2UKPiBhZGRyZXNzIHRvIGJlIGNvbmZpZ3VyZWQg
aW4gY21kIGRlc2NyaXB0b3JzLiBUaGlzIGlzIGxlYWRpbmcgdG8gYQo+IGRpZmZlcmVudCBhZGRy
ZXNzIGFjdHVhbGx5IGJlaW5nIHVzZWQgaW4gSFcsIGxlYWRpbmcgdG8gd3JvbmcgdmFsdWUKPiBy
ZWFkLgo+IAo+IHRoZSBhY3R1YWwgaXNzdWUgaXMgdGhhdCB0aGUgTkFORGMgYmFzZSBhZGRyZXNz
IGlzIGRpZmZlcmVudCBmcm9tIHRoZQo+IFFQSUMgYmFzZSBhZGRyZXNzLiBCdXQgdGhlIGRyaXZl
ciBkb2Vzbid0IHRha2UgaXQgaW50byBhY2NvdW50IGFuZCBqdXN0Cj4gdXNlZCB0aGUgUVBJQyBi
YXNlIGFzIHRoZSBOQU5EYyBiYXNlLiBUaGlzIHVzZWQgdG8gd29yayBhcyB0aGUgTkFORGMgSVAK
PiBvbmx5IGNvbnNpZGVycyB0aGUgbG93ZXIgMTggYml0cyBvZiB0aGUgYWRkcmVzcyBwYXNzZWQg
YnkgdGhlIGRyaXZlciB0bwo+IGRlcml2ZSB0aGUgcmVnaXN0ZXIgb2Zmc2V0LiBTaW5jZSB0aGUg
YmFzZSBhZGRyZXNzIG9mIFFQSUMgdXNlZCB0byBjb250YWluCj4gYWxsIDAgZm9yIGxvd2VyIDE4
IGJpdHMgKGxpa2UgMHgwNzk4MDAwMCksIHRoZSBkcml2ZXIgZW5kZWQgdXAgcGFzc2luZyB0aGUK
ClNEWDU1J3MgTkFORGMgYmFzZSBpcyAweDAxYjMwMDAwIGFuZCBpdCBoYXMgYml0cyAxNyBhbmQg
MTggc2V0IGNvcnJlc3BvbmRpbmcgdG8KMHgzMDAwMC4gU28gaXQgaXMgY29ycmVjdCB0aGF0IHRo
ZSBJUCBvbmx5IGNvbnNpZGVycyBsb3dlciAxOCBiaXRzIGFuZCBpdCB1c2VkCnRvIHdvcmsgYXMg
dGhlIGRyaXZlciBlbmRlZCB1cCBwYXNzaW5nIDB4MzAwMCArIHJlZ2lzdGVyIG9mZnNldC4KCllv
dXIgd29yZGluZyBpcyBub3QgY29ycmVjdC4KCj4gYWN0dWFsIHJlZ2lzdGVyIG9mZnNldCBpbiBp
dCBhbmQgTkFORGMgd29ya2VkIHByb3Blcmx5LiBCdXQgb24gbmV3ZXIgU29Dcwo+IGxpa2UgU0RY
NzUsIHRoZSBRUElDIGJhc2UgYWRkcmVzcyBkb2Vzbid0IGNvbnRhaW4gYWxsIDAgZm9yIGxvd2Vy
IDE4IGJpdHMKPiAobGlrZSAweDAxQzk4MDAwKS4gU28gTkFORGMgc2VlcyB3cm9uZyBvZmZzZXQg
YXMgcGVyIHRoZSBjdXJyZW50IGxvZ2ljCj4gCgonYWxsIDAgZm9yIGxvd2VyIDE4IGJpdHMnIGlz
IG5vdCB0cnVlLgoKPiBPbGRlciB0YXJnZXRzIGFsc28gdXNlZCBzYW1lIGNvbmZpZ3VyYXRpb24g
KGxvd2VyIDI0IGJpdHMpIGxpa2UgU0RYNTUsCj4gU0RYNjUsIElQUTgwNzQsIElQUTYwMTggIGV0
Yy4gYnV0IGlzc3VlIGlzIG1hc2tlZCBpbiBvbGRlciB0YXJnZXRzIGR1ZQo+IHRvIGxvd2VyIDE4
IGJpdHMgb2YgUVBJQyBiYXNlIGFkZHJlc3MgYmVpbmcgemVybyBsZWFkaW5nIHRvIGV4cGVjdGVk
Cj4gYWRkcmVzcyBnZW5lcmF0aW9uLgo+IAoKVGhpcyBwYXJhZ3JhcGggaXMgcmVkdW5kYW50IG5v
dy4KCj4gVGhlIGFkZHJlc3Mgc2hvdWxkIGJlIHBhc3NlZCB0byBCQU0gMHgzMDAwMCArIG9mZnNl
dC4gSW4gb2xkZXIgdGFyZ2V0cwo+IHRoZSBsb3dlciAxOC1iaXRzIGFyZSB6ZXJvIHNvIHRoYXQg
Y29ycmVjdCBhZGRyZXNzIGJlaW5nIHBhYXNlZC4gQnV0Cj4gaW4gbmV3ZXIgdGFyZ2V0cyB0aGUg
bG93ZXIgMTgtYml0cyBhcmUgbm9uLXplcm8gaW4gUVBJQyBiYXNlIHNvIHRoYXQKPiAweDMwMDAw
MCArIG9mZnNldCBnaXZpbmcgdGhlIHdyb25nIHZhbHVlLgo+IAo+IFNEWDc1IDogUVBJQ19RUElD
IHwgMHgwMUM5ODAwMCAoTG93ZXIgMTggYml0cyBhcmUgbm9uIHplcm8pCj4gU0RYNTUgOiBRUElD
X1FQSUMgfCAweDA3OTgwMDAwIChMb3dlciAxOCBiaXRzIGFyZSB6ZXJvKSBTYW1lIGZvcgoKVGhp
cyBhZGRyZXNzIGlzIHdyb25nIGFzIEkgbWVudGlvbmVkIGFib3ZlLgoKPiBvbGRlciB0YXJnZXRz
Lgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDhkNmI2ZDdlMTM1ZSAo
Im10ZDogbmFuZDogcWNvbTogc3VwcG9ydCBmb3IgY29tbWFuZCBkZXNjcmlwdG9yIGZvcm1hdGlv
biIpCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5j
b20+Cj4gLS0tCj4gCj4gQ2hhbmdlIGluIFt2Ml0KPiAKPiAqIFVwZGF0ZWQgY29tbWl0IG1lc3Nh
Z2UKPiAKPiAqIEFkZGVkIEZpeGVzIHRhZwo+IAo+ICogQWRkZWQgc3RhYmxlIGtlcm5lbCB0YWcK
PiAKPiAqIFJlbmFtZWQgdGhlIHZhcmlhYmxlIGZyb20gb2Zmc2V0X2Zyb21fcXBpYyB0byBuYW5k
Y19vZmZzZXQKPiAKPiBDaGFuZ2UgaW4gW3YxXQo+IAo+ICogUHJlbGltaW5hcnkgY29ycmVjdGlv
biBmb3IgdGhlIHJlZ2lzdGVyIGFkZHJlc3MgZm9yd2FyZGVkIHRvIEJBTQo+ICAKPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgOSArKysrKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jCj4gaW5kZXggYjhjZmY5MjQwYjI4Li5jYzU5NDYxZGY3MmUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTIwNyw3ICsyMDcsNyBAQCBuYW5kY19zZXRfcmVn
KGNoaXAsIHJlZywJCQlcCj4gICNkZWZpbmUgZGV2X2NtZF9yZWdfYWRkcihuYW5kYywgcmVnKSAo
KG5hbmRjKS0+cHJvcHMtPmRldl9jbWRfcmVnX3N0YXJ0ICsgKHJlZykpCj4gIAo+ICAvKiBSZXR1
cm5zIHRoZSBOQU5EIHJlZ2lzdGVyIHBoeXNpY2FsIGFkZHJlc3MgKi8KPiAtI2RlZmluZSBuYW5k
Y19yZWdfcGh5cyhjaGlwLCBvZmZzZXQpICgoY2hpcCktPmJhc2VfcGh5cyArIChvZmZzZXQpKQo+
ICsjZGVmaW5lIG5hbmRjX3JlZ19waHlzKGNoaXAsIG9mZnNldCkgICgobmFuZGMpLT5wcm9wcy0+
bmFuZGNfb2Zmc2V0ICsgKG9mZnNldCkpCj4gIAo+ICAvKiBSZXR1cm5zIHRoZSBkbWEgYWRkcmVz
cyBmb3IgcmVnIHJlYWQgYnVmZmVyICovCj4gICNkZWZpbmUgcmVnX2J1Zl9kbWFfYWRkcihjaGlw
LCB2YWRkcikgXAo+IEBAIC01NjEsNiArNTYxLDcgQEAgc3RydWN0IHFjb21fbmFuZGNfcHJvcHMg
ewo+ICAJYm9vbCBpc19xcGljOwo+ICAJYm9vbCBxcGljX3YyOwo+ICAJYm9vbCB1c2VfY29kZXdv
cmRfZml4dXA7Cj4gKwl1MzIgbmFuZGNfb2Zmc2V0Owo+ICB9Owo+ICAKPiAgLyogRnJlZXMgdGhl
IEJBTSB0cmFuc2FjdGlvbiBtZW1vcnkgKi8KPiBAQCAtMzQ3Nyw2ICszNDc4LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIGlwcTgwNnhfbmFuZGNfcHJvcHMgPSB7Cj4g
IAkuaXNfYmFtID0gZmFsc2UsCj4gIAkudXNlX2NvZGV3b3JkX2ZpeHVwID0gdHJ1ZSwKPiAgCS5k
ZXZfY21kX3JlZ19zdGFydCA9IDB4MCwKPiArCS5uYW5kY19vZmZzZXQgPSAweDMwMDAwLAo+ICB9
Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIGlwcTQwMTlfbmFu
ZGNfcHJvcHMgPSB7Cj4gQEAgLTM0ODQsNiArMzQ4Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cWNvbV9uYW5kY19wcm9wcyBpcHE0MDE5X25hbmRjX3Byb3BzID0gewo+ICAJLmlzX2JhbSA9IHRy
dWUsCj4gIAkuaXNfcXBpYyA9IHRydWUsCj4gIAkuZGV2X2NtZF9yZWdfc3RhcnQgPSAweDAsCj4g
KwkubmFuZGNfb2Zmc2V0ID0gMHgzMDAwMCwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcWNvbV9uYW5kY19wcm9wcyBpcHE4MDc0X25hbmRjX3Byb3BzID0gewo+IEBAIC0zNDkxLDYg
KzM0OTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHFjb21fbmFuZGNfcHJvcHMgaXBxODA3NF9u
YW5kY19wcm9wcyA9IHsKPiAgCS5pc19iYW0gPSB0cnVlLAo+ICAJLmlzX3FwaWMgPSB0cnVlLAo+
ICAJLmRldl9jbWRfcmVnX3N0YXJ0ID0gMHg3MDAwLAo+ICsJLm5hbmRjX29mZnNldCA9IDB4MzAw
MDAsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHFjb21fbmFuZGNfcHJvcHMgc2R4
NTVfbmFuZGNfcHJvcHMgPSB7Cj4gQEAgLTM0OTgsNyArMzUwMiw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcWNvbV9uYW5kY19wcm9wcyBzZHg1NV9uYW5kY19wcm9wcyA9IHsKPiAgCS5pc19iYW0g
PSB0cnVlLAo+ICAJLmlzX3FwaWMgPSB0cnVlLAo+ICAJLnFwaWNfdjIgPSB0cnVlLAo+IC0JLmRl
dl9jbWRfcmVnX3N0YXJ0ID0gMHg3MDAwLAo+ICsJLmRldl9jbWRfcmVnX3N0YXJ0ID0gMHgwLAoK
V2hhdCBpcyB0aGlzIGNoYW5nZT8KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+Cu
qeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
