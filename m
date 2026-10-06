Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1DCCA5FFC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2026 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgRI/saZOmiFPeqaARpJREmkjkWa5MjLjVRIZmZyzAY=; b=bYi/ij9cUTgWqb
	gB4nlayF+ro1JWHIgKNFs/+z1Gwyg8ONO2pj1P80agtEPv0SZcj/T5mwCNSu+/qG4/dXJ72p+cWvy
	wXU5NbGYR36grC8GozeGxMtYab8mUTSjIq4qLg3TkhDJteeDR9I05WXHkHavRx8ZXU/Zs0y0CCgo8
	UoilEKZMPAqNVPYYK8sFHIO440ph+Viih7yu3zTzFYQEbKXG3tSJmnX2bO7pKnTcpyMfu2N3kopnM
	0GOfu07s/KHIoyyDoSwlUctoyrk6T6NhHRfyfzNN6k626608ztMI5ElQBhmBlUXWTKTCBBJtNjxIj
	jrrkv5ZvKgOTS9MqSxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyzH-000000009ew-3zZG;
	Tue, 06 Oct 2026 06:49:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyzF-000000009eV-07mq
	for linux-mtd@lists.infradead.org;
	Tue, 06 Oct 2026 06:49:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48afe75f055so2083491f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2026 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269355; x=1791874155; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dQqu7u1PnHAzJlGyGfMmZKvvCDRPUclc9gbsVzDpIrw=;
        b=X6Cl0GAqdOVIG3XljXmM+ZZijTmg7gysWLd6a1tWmNkFF1L72eZVPSG69jTax2KI+a
         7KHCwGTiZoFDga7aMpxeQ6AXy57QWsiVw4yYGbXDHzplHLzVWAaba+VViBg7wRcOPIA9
         UKz3gyTMaNobsEvzZUTuPagVHxSdMkjWop6L5Zf+Q0lNG83Jiwhxsw2M+xxhqJsZw8R4
         QaB42t7ffr3s+l8mIrxYKWeBODf/0FQS7Thla8GvyGoXJSWBQ/lvTq5D6miTtB6YQBtT
         dKlIxKkm9kJeEo2RpVDhQuCfW9m2W7dGTGcFrQDcrQdxdSu/knzePGM4vaIR+eTkr3y/
         60yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269355; x=1791874155;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQqu7u1PnHAzJlGyGfMmZKvvCDRPUclc9gbsVzDpIrw=;
        b=GH49bZnSWGyQ/EvAwTn5Nv5PTFg+FPfZZEg/+7L8BnzFhHv647T83P8cfwUoBplh+f
         fMTE9E5Xfuy0vhq65OcpPQYiYmLYkOcS0f5fxWf1NWDe3fRHLi3PE6L2f+aokWL/CFD1
         DbqlT+PKv7ff3PdFixbEQBJiCfUyVja4Hp+lCMazY7u9McgYKrNH7H+J7irRCDF2dPrK
         z5SfBnlz0jKH4oADheBoQOyr0gnqr2kigqpI0mbm3gqV5lBwKirfnsJqXu7dkok4PwyW
         veTfBYusdJmwkbozDc/DFKYlU3zweYjerLFgh6BW9VL4HF4rOwC60wMpwTTRr4T5pYiD
         U8bg==
X-Forwarded-Encrypted: i=1; AKwUvBxSO978R1/8posC9maKUhwu4Ou6AI20OTRb2s+hS50pGBhyv8g5Hc/zjtmQU4a20fMh2b8aowdnM6w=@lists.infradead.org
X-Gm-Message-State: AFq9FYJjvPPJxpdogce9hIrL7bOzU3DIzGTzYsY4ysO+X2ONUqpNgQ4o
	IfQfqeWZPsf0572I9bg97O/t3YO/GF9Q9j/sH+Oa5x4HFKXFAjhyAaCBn6L82g==
X-Gm-Gg: AYBFou2hDdWP9pEOFnBBYI3NXYAIeG/LPidXRk9+8hD2r/kYRz+HRRjPr7V6z8wC0ju
	PsQ3D5sDQWi7/PAOziyMoht4A0TyDeUmJAfb5DK/+Kk0BdAHbJnPytzLaAHxJiuZcr6uHGbVgLR
	c6kFWNPO+/fAEA8GsgZHvcAUK+YW8Htz5uGgwMg0Dz4HbjvPWIGup8R1mDK1ZTS8guUC6ATsvg5
	kWlxSKTw3jZ/whYI24GD60JWnoKGP7nUkugw2OrFxzNNBYv7ibLgckLUT0I6XthtP3ErtINJifD
	wFGY0wwe6ZNuB/iXz3U3e/5TGCWuUGCpwVynOCk4Xh5SZjpZfogyxWmMeN50ZRFw3LUSLEMgeGd
	WjodNydjnmVrAeDIK0XF9nwusjz7HzpHBeB1fJSN0O2DF8/TaBto4F3xjaERUDipVRVkZlUuUwS
	l4FxW/2I5Qu7c3PzE2MSSMfoRo937MigX5k1JLJnm1fLVQonVE2TOpCwoziZ7m+q1WNtGYMKSXA
	jAcwG0PNwvTk8dODts8KduHV4iLhnOYjLuPqyyfi36edw/ASDYBAw6STfSgvTa/3hfOK+056a+V
	CByPbZO4gkCM7lZP
X-Received: by 2002:a05:6000:22c6:b0:488:83b1:16a1 with SMTP id ffacd0b85a97d-48c6d0f47a2mr789373f8f.7.1791269354706;
        Mon, 05 Oct 2026 23:49:14 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717f8sm1302935f8f.48.2026.10.05.23.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:49:14 -0700 (PDT)
Message-ID: <c79f5f39a5656fa838e424ad2ca72fe74a1d31a8.camel@gmail.com>
Subject: Re: [RFC PATCH 0/4] spi: cadence-xspi: add ACMD PIO support for
 NAND and NOR
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: Fei Xie <fei.xie@horizon.auto>, Mark Brown <broonie@kernel.org>, 
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Date: Tue, 06 Oct 2026 07:50:44 +0100
In-Reply-To: <87bj99lef4.fsf@bootlin.com>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
		<arOwdePAmoghlakj@nsa> <20260928055005.3987624-1-fei.xie@horizon.auto>
		<arp-E1MDFLfV1ASq@nsa> <87bj99lef4.fsf@bootlin.com>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_234917_113025_44AFDADD 
X-CRM114-Status: GOOD (  47.83  )
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

T24gU3VuLCAyMDI2LTEwLTA0IGF0IDE2OjM3ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhlbGxvLAo+IAo+IE9uIDI4LzA5LzIwMjYgYXQgMTY6MDI6MjcgKzAxLCBOdW5vIFPDoSA8bnVu
by5zYUBhbmFsb2cuY29tPiB3cm90ZToKPiAKPiA+IE9uIE1vbiwgU2VwIDI4LCAyMDI2IGF0IDAx
OjUwOjA1UE0gKzA4MDAsIEZlaSBYaWUgd3JvdGU6Cj4gPiAKPiA+IEhpIEZlaSwKPiA+IAo+ID4g
PiBIaSBOdW5vLCBNaXF1ZWwsCj4gPiA+IAo+ID4gPiBUaGFua3MgZm9yIGFza2luZyBmb3IgYmVu
Y2htYXJrcy4gSSBiYWNrcG9ydGVkIHRoZSAzMi82NC1iaXQgU1RJRyBTRE1BCj4gPiA+IHRyYW5z
ZmVyIGNoYW5nZXMgZnJvbSB0aGUgcGF0Y2ggTnVubyBwb2ludGVkIHRvIFsxXSB0byBvdXIgdmVu
ZG9yIDYuMQo+ID4gPiBrZXJuZWwsIGFuZCBjb21wYXJlZCB0aGF0IFNUSUcgcGF0aCBhZ2FpbnN0
IHRoZSBBQ01EIFNQSSBOQU5EIHBhdGggZnJvbQo+ID4gPiB0aGlzIFJGQy4gSSBoYXZlIG5vdCBh
cHBsaWVkIE51bm8ncyBzZXBhcmF0ZSBBQ01EIHJlYWQgaW1wbGVtZW50YXRpb247Cj4gPiA+IHRo
ZSBmaWd1cmVzIGJlbG93IGFyZSBmb3IgdGhlIGltcGxlbWVudGF0aW9uIGluIHRoaXMgUkZDLgo+
ID4gPiAKPiA+ID4gVGhlIGRldmljZSBpcyBhIEdENUY0R004UkUgU1BJIE5BTkQgKDIgS2lCIHBh
Z2VzLCAxMjggS2lCIGVyYXNlYmxvY2tzKQo+ID4gPiBvbiBhIEhvcml6b24gSjZCIGJvYXJkLCBy
dW5uaW5nIGF0IDgwIE1IeiBpbiBxdWFkIFNEUiBtb2RlLiBCb3RoIHBhdGhzCj4gPiA+IHVzZWQg
dGhlIHNhbWUgYm9hcmQgUEhZIGNvbmZpZ3VyYXRpb24uIFNUSUcgbmVlZGVkIG9uZSBhZGRpdGlv
bmFsIGR1bW15Cj4gPiA+IGNsb2NrIGZvciB0aGUgRUJoIHJlYWQtY2FjaGUgY29tbWFuZCBvbiB0
aGlzIGJvYXJkIHRvIHJldHVybiBjb3JyZWN0Cj4gPiA+IGRhdGEgYXQgODAgTUh6LiBUaGlzIGlz
IGEgbG9jYWwgdGVzdCBhZGp1c3RtZW50LCBub3QgcGFydCBvZiB0aGUgcG9zdGVkCj4gPiA+IFJG
QyBvciBbMV07IEkgZXhjbHVkZWQgdGhlIGluY29ycmVjdCBTVElHIHJlYWRzIGZyb20gdGhlIGNv
bXBhcmlzb24uCj4gPiA+IAo+ID4gPiBJIHJhbiBmbGFzaF9zcGVlZCAtYyA1IC1kIC9kZXYvbXRk
MTggdGhyZWUgdGltZXMgd2l0aCBlYWNoIG1vZGUuIFRoZQo+ID4gPiBudW1iZXJzIGJlbG93IGFy
ZSB0aGUgYXJpdGhtZXRpYyBtZWFucywgaW4gS2lCL3M6Cj4gPiA+IAo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1RJR8Kg
wqDCoMKgwqAgQUNNRCBQSU8KPiA+ID4gwqAgZXJhc2VibG9jayB3cml0ZSBzcGVlZMKgwqDCoMKg
wqAgMzY4NcKgwqDCoMKgwqDCoMKgwqDCoCAzNTU1Cj4gPiA+IMKgIGVyYXNlYmxvY2sgcmVhZCBz
cGVlZMKgwqDCoMKgwqAgMTI0NjjCoMKgwqDCoMKgwqDCoMKgIDE0MjIyCj4gPiA+IMKgIHBhZ2Ug
d3JpdGUgc3BlZWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDM2NzHCoMKgwqDCoMKgwqDCoMKgwqAg
MzUxMAo+ID4gPiDCoCBwYWdlIHJlYWQgc3BlZWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDExOTMx
wqDCoMKgwqDCoMKgwqDCoCAxMzcxNgo+ID4gPiDCoCBlcmFzZSBzcGVlZMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA0MDAwMMKgwqDCoMKgwqDCoMKgwqAgMzc2NDcKPiA+IAo+ID4gU28g
dGhpcyBnb2VzIGFsb25nIHdpdGggbXkgZXhwZWN0YXRpb25zLiBJIHRoaW5rIHdlIGNhbiBhbGwg
YWdyZWUgdGhhdAo+ID4gUFJPR1JBTSArIEVSQVNFIGlzIG5vdCB3b3J0aCB0aGUgdHJvdWJsZT8g
V2UgZXZlbiBsb29zZSBwZXJmb3JtYW5jZS4uLgo+IAo+IFllYWguCj4gCj4gPiA+IEZvciBhIHNl
cGFyYXRlIHNlcXVlbnRpYWwtcmVhZCB0ZXN0LCBJIGVyYXNlZCBhbmQgcHJvZ3JhbW1lZCB0aGUg
Zmlyc3QKPiA+ID4gNjQgTWlCIHdpdGgga25vd24gcmFuZG9tIGRhdGEsIHRoZW4gY2hlY2tlZCB0
aGF0IGVhY2ggbW9kZSByZWFkIGJhY2sKPiA+ID4gdGhlIGNvbXBsZXRlIGFyZWEgYnl0ZS1mb3It
Ynl0ZS4gQm90aCBTSEEtMjU2IGhhc2hlcyBtYXRjaGVkIHRoZSBzb3VyY2U7Cj4gPiA+IHRoZSBy
ZXBvcnRlZCBFQ0MgZmFpbHVyZSBjb3VudHMgd2VyZSB6ZXJvLiBJIHRoZW4gcmFuOgo+ID4gCj4g
PiBXaGF0IGRvIHlvdSBtZWFuIGJ5IHNlcXVlbnRpYWwgcmVhZD8gRG9lcyB5b3VyIGZsYXNoIHN1
cHBvcnRzIGNvbnRpbnVvdXMKPiA+IHJhZHMgKG9yIGJ1ZmZlcmVkIG1vZGUgSSB0aGluaykuIElm
IHNvLCBJIHdvdWxkIGV4cGVjdCBtdWNoIGJldHRlcgo+ID4gbnVtYmVyIGZvciB0aGUgQUNNRCBj
YXNlLiBCdXQgdGhhdCBjYW4gYmUgdGhlIGlzc3VlIG9mIGhhdmluZyBib3RoIHRoZQo+ID4gY29u
dHJvbGxlciBhbmQgdGhlIGNoaXAgdHJ5aW5nIHRvIHdhbGsgcGFnZXMuCj4gCj4gU2VxdWVudGlh
bCwgY29udGludW91cyBhbmQgYnVmZmVyZWQgc2hvdWxkIG1lYW4gdGhlIHNhbWUgaW4gdGhlIE5B
TkQKPiBjb250ZXh0Lgo+IAo+ID4gPiDCoCAvdmFyL2J1c3lib3gvdGltZSAtZiAncmVhbD0lZSB1
c2VyPSVVIHN5cz0lUyBjcHU9JVAnIFwKPiA+ID4gwqDCoMKgIGRkIGlmPS9kZXYvbXRkMTggb2Y9
L2Rldi9udWxsIGJzPTFNIGNvdW50PTY0Cj4gPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTVElHwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgQUNNRCBQSU8KPiA+ID4gwqAgZWxhcHNlZCAodGhyZWUgcnVucynCoMKgwqAgNS4zMC81
LjI4LzUuMjYgc8KgIDQuNjYvNC42NS80LjY1IHMKPiA+ID4gwqAgbWVhbiB0aHJvdWdocHV0wqDC
oMKgwqDCoMKgwqDCoCAxMi4xMiBNaUIvc8KgwqDCoMKgwqDCoCAxMy43NSBNaUIvcwo+ID4gPiDC
oCBtZWFuIHN5c3RlbSB0aW1lwqDCoMKgwqDCoMKgwqAgMy41NSBzwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAxLjA2IHMKPiA+ID4gwqAgcHJvY2VzcyBDUFUgdXNhZ2XCoMKgwqDCoMKgwqAgNjclwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyMiUKPiA+ID4gCj4gPiA+IE9uIHRoaXMgTkFORCwg
QUNNRCBpbXByb3ZlcyB0aGUgNjQgTWlCIHJlYWQgdGhyb3VnaHB1dCBieSBhYm91dCAxMy41JQo+
ID4gPiBhbmQgcmVkdWNlcyB0aGUgcmVhZGluZyBwcm9jZXNzJ3MgQ1BVIHVzYWdlIGJ5IDQ1IHBl
cmNlbnRhZ2UgcG9pbnRzLgo+ID4gPiBUaGUgZmxhc2hfc3BlZWQgcmVzdWx0cyBzaG93IGEgc2lt
aWxhciBnYWluIGZvciByZWFkcywgaW5jbHVkaW5nCj4gPiA+IHNpbmdsZS1wYWdlIHJlYWRzLgo+
IAo+IEZZSSwgaWYgeW91IHB1bGwgYSByZWNlbnQgdmVyc2lvbiBvZiBtdGQtdXRpbHMsIGZsYXNo
X3NwZWVkIGNhbgo+IGJlbmNobWFyayBjb250aW51b3VzIHJlYWQgaW1wcm92ZW1lbnRzIHdpdGgg
dGhlIC1DIG9wdGlvbi4KPiAKPiA+ID4gSSBkbyBub3Qgc2VlIGEgcHJvZ3JhbSBvciBlcmFzZSB0
aHJvdWdocHV0IGJlbmVmaXQ6Cj4gPiA+IEFDTUQgaXMgc2xpZ2h0bHkgc2xvd2VyIGZvciBib3Ro
IGluIHRoaXMgc2V0dXAuIFRoZXNlIGFyZSBTUEkgTkFORAo+ID4gPiByZXN1bHRzIG9ubHk7IEkg
aGF2ZSBub3QgYmVuY2htYXJrZWQgdGhlIE5PUiBwYXRoIG9uIHRoaXMgYm9hcmQuCj4gPiAKPiA+
IFNvIENQVSByZXN1bHRzIGFyZSB0aGUgYmluZyB0aGluZyBoZXJlLiBJIGd1ZXNzIHdlIG5lZWQg
dG8gZGVjaWRlIGlmCj4gPiBpdCdzIHdvcnRoIHRoZSBhbW91bnQgb2YgY29tcGxleGl0eSBpdCBy
ZXF1aXJlcyBmb3IgdGhlIHdob2xlIHRoaW5nIHRvCj4gPiB3b3JrLiBBcyBJIG1lbnRpb25lZCwg
aWYgdGhlIGNoaXAgaGFzIGNvbnRpbnVvdXMgbW9kZSBhbmQgd2UgdHJ5IHRvCj4gPiByZWFkIGFu
eXRoaW5nIGJpZ2dlciB0aGFuIHBhZ2Ugc2l6ZSB3ZSBzaG91bGQgbGV0IHRoZSBuYW5kIGNoaXAg
dG8KPiA+IHdhbGsgdGhlIHBhZ2VzIGFuZCB0aGF0IG1lYW5zIHRoZSBiZWhhdmlvciB3ZSBoYXZl
IHRvZGF5IChJTUhPIG9mCj4gPiBjb3Vyc2UpOgo+ID4gCj4gPiAweDEzIChTVElHKSArIHdhaXQg
KyByZWFkIGZyb20gY2FjaGUgKEFDTUQpCj4gPiAKPiA+IElmIHdlJ3JlIG9ubHkgcmVhZGluZyBh
IHNpbmdsZSBwYWdlIHRoZW4gdGhlIGxvZ2ljIGluIHRoaXMgc2VyaWVzIHdvdWxkCj4gPiBwYXlv
ZmYgKHNsaWdodCBwZXJmb3JtYW5jZSBnYWluICsgc2lnbmlmaWNhbnQgZHJvcCBpbiBjcHUgbG9h
ZCkuIE9uZSBzaW1wbGUKPiA+IHdheSBmb3IgZG9pbmcgdGhpcyBhcyBhIHN0YXJ0aW5nIHBvaW50
IHdvdWxkIGJlOgo+ID4gCj4gPiAqIE5hbmQgaGFzIGNvbnQgbW9kZSAtPiB4c3BpIGNvbnRyb2xs
ZXIgZG9lcyBub3RoaW5nIHNwZWNpYWwKPiA+ICogTmFuZCBoYXMgbm8gY29udCBtb2RlIC0+IEFn
Z3JlZ2F0ZSB0aGUgeGZlcnMgdG9nZXRoZXIuCj4gCj4gSSdtIGZpbmUgd2l0aCBzdGF0aWMgZGVj
aXNpb25zIGxpa2UgdGhhdCwgYnV0IG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlCj4gYWJvdmUgaXMg
dGhhdCBBQ01EIG1vZGUgaXMgdXNlZnVsIGZvciBhbGwgcmVhZHMuIHNvIEkgZG9uJ3QgZ2V0IHdo
eSB5b3UKPiB3b3VsZCBubyB1c2UgaXQgZm9yIGFsbC4gTWF5YmUgYmVjYXVzZSBpdCB3b3VsZCBi
cmVhayBjb250aW51b3VzIHJlYWRzPwo+IChzb3JyeSBJIGxvc3QgYSBiaXQgb2YgdGhlIGNvbnRl
eHQgYWxyZWFkeSkuCgpFeGFjdGx5LiBJbiBBQ01ELCBpcyBhbHNvIGNhcGFibGUgb2YgIndhbGtp
bmcgcGFnZXMiIGZvciByZWFkcyBiaWdnZXIgdGhhbiBwYWdlIHNpemUKKGhlbmNlIHRoZSBuZWVk
IHRvIGtub3cgdGhlIGZsYXNoIGdlb21ldHJ5KSBhbmQgSUlSQywgdGhhdCBkb2VzIG5vdCByZWFs
bHkgd29yayB3ZWxsCndoZW4gdGhlIGZsYXNoIGlzIGFsc28gZG9pbmcgaXQuCgo+IAo+IEZvciB3
cml0ZXMgYW5kIGVyYXNlcyBob3dldmVyLCBpdCBzZWVtcyBsaWtlIHdlIGNvdWxkIGtlZXAgdGhl
IFNUSUcgcGF0aC4KPiAKPiA+IERvaW5nIHNvbWV0aGluZyBkeW5hbWljIHdvdWxkIGJlIG11Y2gg
bW9yZSBjb21wbGV4IEkgZ3Vlc3MuIFdpdGggdGhlCj4gPiBhYm92ZSByZWFzb25pbmcsIGhhdmlu
ZyBzb21lIG1lbV9pbmZvKCkga2luZCBvZiBzcGlfbWVtIGNhbGxiYWNrIHRvIHRlbGwKPiA+IHVz
IHRoaW5ncyBsaWtlIGdlb21ldHJ5LCBjb250aW51b3VzIG1vZGUgc3VwcG9ydCwgZXRjIHdvdWxk
IGJlIGVub3VnaCB0bwo+ID4gaGFuZGxlIHRoZSBhYm92ZSBJIHRoaW5rLiBUaGUgcmVhc29uaW5n
IGlzIHRoYXQgcmVhZGluZyBhIG5hbmQgcGFnZSBpcwo+ID4gYWx3YXlzIGxpa2Ugc3BpbmFuZF9s
b2FkX3BhZ2Vfb3AoKSAob3Bjb2RlIDB4MTMpICsgc3BpbmFuZF93YWl0KCkgKwo+ID4gc3BpbmFu
ZF9yZWFkX2Zyb21fY2FjaGVfb3AoKSBzbyB3ZSBjb3VsZCBwcm9iYWJseSBhZ2dyZWdhdGUgZXZl
cnl0aGluZwo+ID4gaW4gdGhlIGxhc3QgY2FsbCBvbiB0aGUgY29udHJvbGxlciBzaWRlIHdpdGhv
dXQgY29tcGxpY2F0aW5nIHRoZSBuYW5kIGNvcmUKPiA+IGxvZ2ljLgo+IAo+IEluIGdlbmVyYWws
IGRyaXZlcnMgbWFraW5nIGFzc3VtcHRpb25zIGhhcyBiZWVuIGEgZGlzYXN0ZXIgaW4gdGhlIHJh
dwo+IE5BTkQgd29ybGQuIFRoaXMgd2FzIHRoZSBtYWluIHJlYXNvbiBmb3IgdGhlIC0+ZXhlY19v
cCgpIGludHJvZHVjdGlvbgo+IHRoZXJlOiBnaXZpbmcgdGhlIHdob2xlIG9wZXJhdGlvbiB0byB0
aGUgY29udHJvbGxlciBzbyBpdCBjYW4gZGVjaWRlCj4gd2hhdCB0byBkbyB3aXRob3V0IGd1ZXNz
aW5nLiBCdXQgd2UgdGhpbmtpbmcgYXQgdGhlIG9wZXJhdGlvbiBib3VuZGFyeSwKPiBub3QgYXQg
dGhlICJzZXQgb2Ygb3BlcmF0aW9ucyIgbGV2ZWwuIFNpbmNlIC0+ZXhlY19vcCgpIGluIHRoZSBT
UEkgTkFORAo+IHN1YnN5c3RlbSBoYXMgYmVlbiB3cml0dGVuIGZvbGxvd2luZyB0aGUgc2FtZSBw
aGlsb3NvcGh5LCBJIGZlYXIgd2UncmUKPiBnb2luZyB0byB0cnkgbWFrZSByb3VuZHMgZml0IGlu
c2lkZSBzcXVhcmVzLiBPbmUgb2YgdGhlIHBvc3NpYmxlCgpGYWlyIGVub3VnaCEgQWdyZWVkCgo+
IGFwcHJvYWNoIHdvdWxkIGJlIHRvIG1pbWljIHdoYXQgd2UndmUgZG9uZSBmb3IgdGhlIHNvbWUg
bGltaXRlZAo+IGNvbnRyb2xsZXJzOiBwYWNrIGV2ZXJ5dGhpbmcgaW4gb25lIHNpbmdsZSBvcCAo
c2VlIHRoZSBfbW9ub2xpdGhpYwo+IHN1ZmZpeCBpbiBkcml2ZXJzL210ZC9uYW5kL3Jhdy8pLiBU
aGF0J3MganVzdCBvbmUgaWRlYS4KPiAKCkkgY2FuIHRha2UgYSBsb29rIG1vc3RseSBmb3IgY3Vy
aW9zaXR5IGFzIG15IGludGVudGlvbiBpcyBub3QgdG8gInN0ZWFsIiB0aGlzIHdvcmsKZnJvbSBG
ZWkuIElmIGV2ZXJ5b25lIGFncmVlcyAoc3BlY2lhbGx5IEZlaSksIHdoYXQgSSBjYW4gZG8gaXMg
dG8gc2VuZCBteSBzaW1wbGVyCnBhdGNoZXMgdGhhdCBqdXN0IHN1cHBvcnQgQUNNRCAod2l0aG91
dCBhbnkgc3BlY2lhbCBkaXN0aW5jdGlvbiBiZXR3ZWVuIE5hbmQgYW5kIE5vcikKRm9yIE5hbmRz
LCBJIGhhdmUgYSBtaXggb2YgU1RJRyBhbmQgQUNNRCwgd2hlcmUgYmlnIGdhaW5zIGNvbWUgZnJv
bSBOYW5kcyB3aXRoIGNvbnQKbW9kZS4KClRoZW4gd2UgY2FuIGJ1aWxkIG9uIHRvcCBvZiBpdCBp
biBvcmRlciB0byBpbXByb3ZlIE5hbmQgc3VwcG9ydCAobW9zdGx5IG9uIENQVSBsb2FkKS4KCi0g
TnVubyBTw6EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
