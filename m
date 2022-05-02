Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 05:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8MhOvHaLpMvlCQTpNKgkQEYQDCu8iVSMgCxX5q5HJk=; b=g6n3uhjeXfAjrt
	3fvz+1NulAg+ZRlOuXVX33Y/PqZqYr30lO+o9lD9GwjL00gUITQh7jElIdFHqvlaxLYbhQzJmLxXT
	pRuf1geiqh1xdQ79LgR5oXuF7BIuTbTxxGXo0es6cV1ELYSjFOTRXMlaTm/FEOelTXIoxAhqkWUPj
	sRele7JQp0VZpfGlZIPFclK7pja6yOnw8XXu8Z1BvdbGdQTS4PcvTPnkJp/5FbRzVRyqTA9XM55Hw
	XNtotHFQeVm8SVVNQhWSYszyLFB4oQ1r3vJ4rjEXJ5TrmZxM6JFubip4y97pANCWzbKa32qMHhfg2
	o4yFPzo0PHuNjyz3ZwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlOpU-00HauQ-O2; Mon, 02 May 2022 05:42:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlOpN-00HamJ-7K
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 05:42:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id c11so8387498wrn.8
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SFf90Cp87yxtikwr5SrnqckhY2eRdXiPSkqLmdjSB0Y=;
 b=mdV8gUBfaGKV1xac9Fiq0BXYwgb3hP57li604oiegba4cvbj1pMaXz/DN3sYIqhhQJ
 1jU8oDoMqE5mXAFxOieJKCSi39cshQTbMNHkSSwmWq65LOgTNnEpRESqalbv+tSPWJIR
 uy7UI+FzEjUZlyXN8+xikq6VznA4QpzvpT1tEYOj/SPlE3jjx/A6cspg9FQnqpHqn6KQ
 yIp1dvoSjMDYUZdy+hOqsKd7YrFT5ZfrrRcpv+eWPO7xcAzoXcZqhbJQAuWFix4VkW3v
 hR7L3/p0AqS6TXhTf5hBlYXiKYEMIow7cX939169/z2xX0giDSazAI1pPNmStA6KJpDs
 0LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SFf90Cp87yxtikwr5SrnqckhY2eRdXiPSkqLmdjSB0Y=;
 b=mF/PXU9qibbqABHpzr9sF82zrdrGJQasvHAha7S2CQdU5Kdkeg9wzm5tZP2p1NXzXp
 +jmZ4/LOjTP6iF9qdck3HBQB1QtFo4jPZIen7cAvVH7fNqx7fW/BE9vstauRp6qfap/2
 m5NAzImC7jAvMr1tb1p0RdH6wvAcK3A4b/7bbQd2KmYm/Fa4w4XhHDXf/oDhGV8386xK
 eiuFJ6NahlAefPy8kjBkqtxPda0cFEMqxs/Z7AwRSX4QsJG6q9Y4oiAwbw+P1FcdN+01
 pMotLgTvYSMOdP69temR9e6sLGXOMQBX75fpOoIDSTmYRPrw9q7ey3+MUE2CBMOKIvXd
 2Adg==
X-Gm-Message-State: AOAM530+G8rJWSPR6qqJbA36ayMW3zo10ybHfhNss9k98doXO8nknoLG
 sETzDH1YPg2z5LpG/nsFx14=
X-Google-Smtp-Source: ABdhPJyZAcTn+ctBQ3cxL4EATaIUzzLMQqvYgKQQ4Qhmg9bQpcj1kAPOtDlrfaCGmcSPEu7FoGQmKw==
X-Received: by 2002:a05:6000:1681:b0:20c:5aa2:ae14 with SMTP id
 y1-20020a056000168100b0020c5aa2ae14mr4740062wrd.443.1651470146011; 
 Sun, 01 May 2022 22:42:26 -0700 (PDT)
Received: from ?IPV6:2a06:a003:501a:a7ce:5405:3d01:56ff:a60d?
 ([2a06:a003:501a:a7ce:5405:3d01:56ff:a60d])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c230600b003942a244ecfsm5397359wmo.20.2022.05.01.22.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 22:42:25 -0700 (PDT)
Message-ID: <abf8fb56-2ad0-8128-ccd4-105055af9226@gmail.com>
Date: Mon, 2 May 2022 08:42:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
 <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
 <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
 <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
 <bd533827-b575-caad-c230-af060851b231@gmail.com>
 <db70e53b-7484-43bf-e9c8-b6a2dce1fbb5@linaro.org>
 <25da3f43-c46e-8108-2da9-0e4f2b7cc1a4@gmail.com>
 <b279040a-a782-a2ca-2acb-2d8f07709081@linaro.org>
 <1c19faf9-fc1c-9adf-d038-97b673a8f0be@gmail.com>
 <a84df850-149e-9656-43fa-1f040368a9f1@linaro.org>
 <0450d781-c506-c28e-a0e5-435bee16721f@gmail.com>
 <2e51842a-d2c9-8953-13aa-02ad3abb3f14@linaro.org>
 <ee5f293a-e59a-03d8-d9e4-ef35d33b5383@gmail.com>
 <6c3ba4a7-80b0-5fd1-eb08-1f9e256b02c4@linaro.org>
 <909094fd-ded0-38f9-b374-dd5f7b63e298@gmail.com>
 <11fbbafd-e7ce-f921-2073-146e96f01f6b@linaro.org>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <11fbbafd-e7ce-f921-2073-146e96f01f6b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_224234_076514_95C4FBB5 
X-CRM114-Status: GOOD (  19.36  )
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

T24gNS8xLzIwMjIgNzoxNyBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gT24gMDEv
MDUvMjAyMiAxNjo1MSwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+PiBPbiA1LzEvMjAyMiAxMTox
NyBBTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4KPj4+IE9uIDMwLzA0LzIwMjIgMjA6
NTQsIE1pa2hhaWwgWmhpbGtpbiB3cm90ZToKPj4+PiDCoHBhdHRlcm5Qcm9wZXJ0aWVzOgo+Pj4+
IMKgwqAgIkBbMC05YS1mXSskIjoKPj4+PiAtwqDCoMKgICRyZWY6ICJwYXJ0aXRpb24ueWFtbCMi
Cj4+Pj4gK8KgwqDCoCBhbGxPZjoKPj4+PiArwqDCoMKgwqDCoCAtICRyZWY6ICJwYXJ0aXRpb24u
eWFtbCMiCj4+Pj4gK8KgwqDCoMKgwqAgLSBpZjoKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHBy
b3BlcnRpZXM6Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb25zdDogc2VyY29tbSxzYy1wYXJ0aXRpb25zCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHRoZW46Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlcmNvbW0sc2NwYXJ0LWlkOgo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogUGFydGl0aW9uIGlkIGluIFNlcmNvbW0g
cGFydGl0aW9uIG1hcC4gUGFyc2VyCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1c2VzIHRoaXMgaWQgdG8gZ2V0IHBhcnRpdGlvbiBvZmZzZXQgYW5kIHNpemUgdmFsdWVzIGZy
b20KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR5bmFtaWMgcGFydGl0aW9u
IG1hcC4KPj4+IFBhcnRpdGlvbiBvZmZzZXQgYW5kIHNpemUgdmFsdWVzIGFyZSBub3QgZGVyaXZl
ZCBmcm9tIHNjcGFydC1pZC4gSSBhbQo+Pj4gc29ycnkgYnV0IGFmdGVyIGFsbCB0aGVzZSBxdWVz
dGlvbnMgLSBpdCdzIHRoZSB0aGlyZCB0aW1lIG5vdyAtIHlvdQo+Pj4gbmV2ZXIgYW5zd2VyIHdo
eSBkbyB5b3UgbmVlZCB0aGlzIHByb3BlcnR5IGFuZCB3aGF0IGlzIGl0IHVzZWQgZm9yLiBGcm9t
Cj4+PiBhbGwgdGhlIGV4YW1wbGVzIGl0IGNvdWxkIGJlIHNpbXBseSByZW1vdmVkIGFuZCB0aGUg
cGFydGl0aW9uIG1hcCB3aWxsCj4+PiBiZSBleGFjdGx5IHRoZSBzYW1lLgo+PiBzY3BhcnQtaWQg
aXMgbmVjZXNzYXJ5IHRvIGdldCAodXNpbmcgbXRkIHBhcnNlcikgcGFydGl0aW9uIG9mZnNldCBh
bmQKPj4gc2l6ZSBmcm9tIGR5bmFtaWMgcGFydGl0aW9uIG1hcCAoTk9UIGZyb20gdGhlIHJlZyBw
cm9wZXJ0eSk6Cj4+Cj4+IOKdryB4eGQgLWUgLWMgMTIgLXMgJCgoMHg4MDApKSAtbCAkKCgweDc4
KSkgbXRkMQo+PiAwMDAwMDgwMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAxMDAwMDDCoCAuLi4uLi4u
Li4uLi4KPj4gMDAwMDA4MGM6IDAwMDAwMDAxIDAwMTAwMDAwIDAwMTAwMDAwwqAgLi4uLi4uLi4u
Li4uCj4+IDAwMDAwODE4OiAwMDAwMDAwMiAwMDIwMDAwMCAwMDEwMDAwMMKgIC4uLi4uLiAuLi4u
Lgo+PiAwMDAwMDgyNDogMDAwMDAwMDMgMDAzMDAwMDAgMDAxMDAwMDDCoCAuLi4uLi4wLi4uLi4K
Pj4gMDAwMDA4MzA6IDAwMDAwMDA0IDAwNDAwMDAwIDAwNjAwMDAwwqAgLi4uLi4uQC4uLmAuCj4+
IDAwMDAwODNjOiAwMDAwMDAwNSAwMGEwMDAwMCAwMDYwMDAwMMKgIC4uLi4uLi4uLi5gLgo+PiAw
MDAwMDg0ODogMDAwMDAwMDYgMDEwMDAwMDAgMDIwMDAwMDDCoCAuLi4uLi4uLi4uLi4KPj4gMDAw
MDA4NTQ6IDAwMDAwMDA3IDAzMDAwMDAwIDAyMDAwMDAwwqAgLi4uLi4uLi4uLi4uCj4+IDAwMDAw
ODYwOiAwMDAwMDAwOCAwNTAwMDAwMCAwMTQwMDAwMMKgIC4uLi4uLi4uLi5ALgo+PiAwMDAwMDg2
YzogMDAwMDAwMDkgMDY0MDAwMDAgMDFiODAwMDDCoCAuLi4uLi5ALi4uLi4KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHNjcGFydC1pZMKgIG9mZnNldMKgwqAgwqDCoCBzaXplCj4+Cj4+IFdpdGggc2Vy
Y29tbSxzYy1wYXJ0aXRpb25zIHRoZSByZWcgcHJvcGVydHkgd2lsbCBiZSBpZ25vcmVkIChvZmZz
ZXQgPQo+PiAweDIwMDAwMCwgc2l6ZSA9IDB4MTAwMDAwKSBhbmQgdGhlIHZhbHVlcyB3aWxsIGJl
IHRha2VuIGZyb20gcGFydGl0aW9uIG1hcC4KPj4KPj4gRm9yIGV4YW1wbGUgd2UgaGF2ZSB0aGlz
IGlzIGR0czoKPj4KPj4gcGFydGl0aW9uQDIwMDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbGFiZWwgPSAiRmFjdG9yeSI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4
MjAwMDAwIDB4MTAwMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXJjb21tLHNjcGFy
dC1pZCA9IDwyPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWFkLW9ubHk7Cj4+IMKgwqDC
oMKgwqDCoMKgIH07Cj4+Cj4+IER5bmFtaWMgcGFydGl0aW9uIG1hcDoKPj4KPj4gc2NwYXJ0LWlk
ID0gMjsgb2Zmc2V0ID0gMHgwMDIwMDAwMDsgc2l6ZSA9IDB4MDAxMDAwMDAKPj4KPj4gMDAwMDAw
MDIgMDAyMDAwMDAgMDAxMDAwMDDCoCAuLi4uLi4gLi4uLi4KPj4KPj4gSW4gdGhpcyBleGFtcGxl
IHRoZSBvZmZzZXQgYW5kIHNpemUgYXJlIHRoZSBzYW1lIGluIHJlZyBhbmQgZHluYW1pYwo+PiBw
YXJ0aXRpb24gbWFwLiBJZiBkZXZpY2UgaGF2ZSBiYWQgYmxvY2tzIG9uIE5BTkQgdGhlIHZhbHVl
cyB3aWxsIGJlIGEKPj4gbGl0dGxlIGRpZmZlcmVudC4gQW5kIHdlIGhhdmUgdG8gdGFrZSBwYXJ0
aXRpb24gb2Zmc2V0cyBmcm9tIHBhcnRpdGlvbgo+PiBtYXAgdG8gYXZvaWQgYm9vdCBsb29wcywg
d3JvbmcgZWVwcm9tIGxvY2F0aW9uIGFuZCBvdGhlciBiYWQgdGhpbmdzLgo+Pgo+PiBJcyB0aGVy
ZSBhbnl0aGluZyB0aGF0IG5lZWRzIHRvIGJlIGV4cGxhaW5lZCBpbiBtb3JlIGRldGFpbD8KPiBU
aGFua3MgYSBsb3QsIHRoaXMgY2xhcmlmaWVzIHRoZSB0b3BpYy4gTG9va3MgZ29vZC4gTWF5YmUg
eW91IGNvdWxkIHB1dAo+IHBhcnRzIG9mIHRoaXMgaW50byB0aGUgc2NwYXJ0LWlkIGZpZWxkIGRl
c2NyaXB0aW9uPwoKVGhhbmsgeW91IGZvciB5b3Ugc3VwcG9ydCEgSSB1cGRhdGVkIHRoZSBzY3Bh
cnQtaWQgZGVzY3JpcHRpb24gYW5kIGhvcGUKdGhpcyBzaG91bGQgYmUgY2xlYXIgZW5vdWdoLiBJ
ZiBzbywgSSdsbCBwcmVwYXJlIFBBVENIIHYzLgoKwqBwYXR0ZXJuUHJvcGVydGllczoKwqDCoCAi
QFswLTlhLWZdKyQiOgotwqDCoMKgICRyZWY6ICJwYXJ0aXRpb24ueWFtbCMiCivCoMKgwqAgYWxs
T2Y6CivCoMKgwqDCoMKgIC0gJHJlZjogInBhcnRpdGlvbi55YW1sIyIKK8KgwqDCoMKgwqAgLSBp
ZjoKK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlOgorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6CivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IHNlcmNvbW0sc2MtcGFydGl0aW9ucwor
wqDCoMKgwqDCoMKgwqAgdGhlbjoKK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgorwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzZXJjb21tLHNjcGFydC1pZDoKK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRlc2NyaXB0aW9uOiBQYXJ0aXRpb24gaWQgaW4gU2VyY29tbSBwYXJ0aXRpb24g
bWFwLiBNdGQKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJzZXIgdXNlcyB0aGlz
IGlkIHRvIGZpbmQgYSByZWNvcmQgaW4gdGhlIHBhcnRpdG9uIG1hcAorwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnRhaW5pbmcgb2Zmc2V0IGFuZCBzaXplIG9mIHRoZSBjdXJyZW50
IHBhcnRpdGlvbi4gVGhlCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsdWVzIGZy
b20gcGFydGl0aW9uIG1hcCBvdmVycmlkZXMgcGFydGl0aW9uIG9mZnNldCBhbmQKK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplIGRlZmluZWQgaW4gcmVnIHByb3BlcnR5IG9mIHRo
ZSBkdHMuIEZyZXF1ZW50bHkgdGhlc2UKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2
YWx1ZXMgYXJlIHRoZSBzYW1lLCBidXQgbWF5IGRpZmZlciBpZiBkZXZpY2UgaGFzIGJhZAorwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyYXNlYmxvY2tzIG9uIGEgZmxhc2guCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzIKCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKLS0gCkJlc3QgcmVnYXJk
cywKTWlraGFpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
