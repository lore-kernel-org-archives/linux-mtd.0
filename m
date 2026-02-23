Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07FAEA4FD1
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpNJo3fb3HaIyvWp5b74tJj4ZUsJ/wj0s+/d9euZOjY=; b=FlB/pOw1ILA4ss
	5hxlTJtFM1HpxoWfQSVBjxCb/tArogs7kVOaobUI3x2TVyZazz8318dFzCe4rSdngLCjHlCnYUf+d
	TbAkIj2RDH3XXSR6T9k3IuaOqTUfz6gxpQmXrivh2TEE5Ikp4BAh9UkAdT65FQ1swzHykjY0tFFPU
	Q2cSaMDZgZCr/KVLJ9pM5VjyY/YUq/Wct1YN7llNVEVB48quaY6ExzkK9yJ9QREz8MmobzPYE56HY
	R7Jrii2mInjyYYRSIPoxAPLaB6KUrvnTAIdiiyT6wHRxAj+7gtk1R1mqDhf6AhV0QExuqbfmFL04+
	fXW+RzS9sDuTSVeKpEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXQk-00000000XRX-27hQ;
	Mon, 23 Feb 2026 15:01:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXQh-00000000XQ7-3UaO
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 15:01:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FFEA44516
	for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 15:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35137C116D0
	for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771858858;
	bh=jJpfPesRxhaR50wA0rFym+CE7VqMDrqzN0ixYQEnXbk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sf2iXMYDhaLUJQBy/PoWhUHluerF2w7HRzTytsMfb7hszq9hd1YooeBMNe3G5Lkn8
	 hIAo3wWLLujDQ4ytrYcTYXvKB8dYLAsGeVXb4s3aBDOoIW4j/pWQgqOjUgWjWQ5uQ6
	 rDDloOB4iMAzdMTBQCtqJE6pthCx2h/hFksKV9lu9Jm/I2r+19Sk63anfa7uo7HteP
	 pnR1FUcnB41AGpdAiecOwvsoAR134Fa0dJuhJFLsWIYaBn8TYLmss+Bm3t84JsqJvX
	 4CLB13G5wHRAdx8QGztjTLsKrJQ9OS6/M/PeGjF70TyYLPKw9Zx5FDspodCNV/RxZD
	 TNvhva2oMbYOw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65bfc858561so8491002a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 07:00:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjsZYjshfXhKwwrzFtCHpF+bERbfjih3JyWs2Nvi3V+bHLU4P2xxUtM4aUatujiBEpMlHWv4tMNko=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx66EodyZ0EZDGPxIywtaTn5U79kYoLoU/WafaNbIjl+EWImjac
	WWK8Pry/t9B/5RdI6VZAJGRQB8c6tNSiYyhCro8nPCa/EQS022Ac6sEKf/i0Q99jRx7q98wKdhQ
	ejfX8N8Xb89FZtcyUBiDMe4KNMdZH4A==
X-Received: by 2002:a17:907:7211:b0:b87:965:907a with SMTP id
 a640c23a62f3a-b9081aedfe8mr545215966b.32.1771858856734; Mon, 23 Feb 2026
 07:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20260122-spear-v1-1-fd44bc79695b@gmail.com> <CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
In-Reply-To: <CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Feb 2026 09:00:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKSpsj1BQB1q_s1+j1FT+XLORgWRijMTNc4wTawKDZxQw@mail.gmail.com>
X-Gm-Features: AaiRm53-Y6dnAZYqKV1rXAfu1AoHKdJYC0HRW1e_dtbqsIdf2nlotws2rYUNEQw
Message-ID: <CAL_JsqKSpsj1BQB1q_s1+j1FT+XLORgWRijMTNc4wTawKDZxQw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT schema
To: Akhila YS <akhilayalmati@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_070059_908399_5F8807CD 
X-CRM114-Status: GOOD (  23.86  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgNzo0N+KAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTA6MjPigK9BTSBBa2hp
bGEgWVMgPGFraGlsYXlhbG1hdGlAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBDb252ZXJ0IFNU
TWljcm9lbGVjdHJvbmljcyBTUEVBcjYwMCBTZXJpYWwgTWVtb3J5IEludGVyZmFjZSAoU01JKQo+
ID4gQ29udHJvbGxlciBiaW5kaW5nIHRvIFlBTUwgZm9ybWF0Lgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFraGlsYSBZUyA8YWtoaWxheWFsbWF0aUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BlYXJfc21pLnR4dCAgICAgICAgICB8IDI5IC0tLS0t
LS0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zdCxzcGVhcjYwMC1zbWkueWFt
bCAgIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNzIg
aW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BlYXJfc21pLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BlYXJfc21pLnR4dAo+ID4gZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCBjNDE4NzNlOTJkMjYuLjAwMDAwMDAwMDAwMAo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGVhcl9zbWkudHh0
Cj4gPiArKysgL2Rldi9udWxsCj4gPiBAQCAtMSwyOSArMCwwIEBACj4gPiAtKiBTUEVBciBTTUkK
PiA+IC0KPiA+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gLS0gY29tcGF0aWJsZSA6ICJzdCxz
cGVhcjYwMC1zbWkiCj4gPiAtLSByZWcgOiBBZGRyZXNzIHJhbmdlIG9mIHRoZSBtdGQgY2hpcAo+
ID4gLS0gI2FkZHJlc3MtY2VsbHMsICNzaXplLWNlbGxzIDogTXVzdCBiZSBwcmVzZW50IGlmIHRo
ZSBkZXZpY2UgaGFzIHN1Yi1ub2Rlcwo+ID4gLSAgcmVwcmVzZW50aW5nIHBhcnRpdGlvbnMuCj4g
PiAtLSBpbnRlcnJ1cHRzOiBTaG91bGQgY29udGFpbiB0aGUgU1RNTUFDIGludGVycnVwdHMKPiA+
IC0tIGNsb2NrLXJhdGUgOiBGdW5jdGlvbmFsIGNsb2NrIHJhdGUgb2YgU01JIGluIEh6Cj4gPiAt
Cj4gPiAtT3B0aW9uYWwgcHJvcGVydGllczoKPiA+IC0tIHN0LHNtaS1mYXN0LW1vZGUgOiBGbGFz
aCBzdXBwb3J0cyByZWFkIGluIGZhc3QgbW9kZQo+ID4gLQo+ID4gLUV4YW1wbGU6Cj4gPiAtCj4g
PiAtICAgICAgIHNtaTogZmxhc2hAZmMwMDAwMDAgewo+ID4gLSAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAic3Qsc3BlYXI2MDAtc21pIjsKPiA+IC0gICAgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPiA+IC0gICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiA+IC0g
ICAgICAgICAgICAgICByZWcgPSA8MHhmYzAwMDAwMCAweDEwMDA+Owo+ID4gLSAgICAgICAgICAg
ICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnZpYzE+Owo+ID4gLSAgICAgICAgICAgICAgIGludGVy
cnVwdHMgPSA8MTI+Owo+ID4gLSAgICAgICAgICAgICAgIGNsb2NrLXJhdGUgPSA8NTAwMDAwMDA+
OyAgICAgICAgLyogNTBNSHogKi8KPiA+IC0KPiA+IC0gICAgICAgICAgICAgICBmbGFzaEBmODAw
MDAwMCB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBzdCxzbWktZmFzdC1tb2RlOwo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgLi4uCj4gPiAtICAgICAgICAgICAgICAgfTsKPiA+IC0g
ICAgICAgfTsKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3N0LHNwZWFyNjAwLXNtaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9zdCxzcGVhcjYwMC1zbWkueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uOGZlMjdhYWU3NTI3Cj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3N0LHNwZWFyNjAw
LXNtaS55YW1sCj4gPiBAQCAtMCwwICsxLDcyIEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3N0LHNwZWFyNjAwLXNt
aS55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1BFQXI2MDAg
U2VyaWFsIE1lbW9yeSBJbnRlcmZhY2UgKFNNSSkgQ29udHJvbGxlcgo+ID4gKwo+ID4gK21haW50
YWluZXJzOgo+ID4gKyAgLSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+ID4g
Kwo+ID4gK2Rlc2NyaXB0aW9uOgo+ID4gKyAgVGhlIFNQRUFyNjAwIFNlcmlhbCBNZW1vcnkgSW50
ZXJmYWNlIChTTUkpIGlzIGEgZGVkaWNhdGVkIHNlcmlhbCBmbGFzaAo+ID4gKyAgY29udHJvbGxl
ciBzdXBwb3J0aW5nIHVwIHRvIGZvdXIgY2hpcCBzZWxlY3RzIGZvciBzZXJpYWwgTk9SIGZsYXNo
ZXMKPiA+ICsgIGNvbm5lY3RlZCBpbiBwYXJhbGxlbC4gVGhlIGNvbnRyb2xsZXIgaXMgbWVtb3J5
LW1hcHBlZCBhbmQgdGhlIGF0dGFjaGVkCj4gPiArICBmbGFzaCBkZXZpY2VzIGFwcGVhciBpbiB0
aGUgQ1BVIGFkZHJlc3Mgc3BhY2UuVGhlIGRyaXZlcgo+ID4gKyAgKGRyaXZlcnMvbXRkL2Rldmlj
ZXMvc3BlYXJfc21pLmMpIHByb2JlcyB0aGUgYXR0YWNoZWQgZmxhc2hlcwo+ID4gKyAgZHluYW1p
Y2FsbHkgYnkgc2VuZGluZyBjb21tYW5kcyAoZS5nLiwgUkRJRCkgdG8gZWFjaCBiYW5rLgo+ID4g
KyAgRmxhc2ggc3ViIG5vZGVzIGRlc2NyaWJlIHRoZSBtZW1vcnkgcmFuZ2UgYW5kIG9wdGlvbmFs
IHBlci1mbGFzaAo+ID4gKyAgcHJvcGVydGllcy4KPiA+ICsKPiA+ICthbGxPZjoKPiA+ICsgIC0g
JHJlZjogbXRkLnlhbWwjCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6
Cj4gPiArICAgIGNvbnN0OiBzdCxzcGVhcjYwMC1zbWkKPiA+ICsKPiA+ICsgIHJlZzoKPiA+ICsg
ICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIGludGVycnVwdHM6Cj4gPiArICAgIG1heEl0ZW1z
OiAxCj4gPiArCj4gPiArICAiI2FkZHJlc3MtY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMQo+ID4g
Kwo+ID4gKyAgIiNzaXplLWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDEKPiA+ICsKPiA+ICsgIGNs
b2NrLXJhdGU6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQzMgo+ID4gKyAgICBkZXNjcmlwdGlvbjogRnVuY3Rpb25hbCBjbG9jayByYXRlIG9mIHRo
ZSBTTUkgY29udHJvbGxlciBpbiBIei4KPiA+ICsKPiA+ICsgIHN0LHNtaS1mYXN0LW1vZGU6Cj4g
PiArICAgIHR5cGU6IGJvb2xlYW4KPiA+ICsgICAgZGVzY3JpcHRpb246IEluZGljYXRlcyB0aGF0
IHRoZSBhdHRhY2hlZCBmbGFzaCBzdXBwb3J0cyBmYXN0IHJlYWQgbW9kZS4KPiA+ICsKPiA+ICty
ZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gY2xvY2st
cmF0ZQo+ID4gKwo+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+ICtl
eGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICBmbGFzaEBmYzAwMDAwMCB7Cj4gPiArICAgICAg
ICBjb21wYXRpYmxlID0gInN0LHNwZWFyNjAwLXNtaSI7Cj4gPiArICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAg
cmVnID0gPDB4ZmMwMDAwMDAgMHgxMDAwPjsKPiA+ICsgICAgICAgIGludGVycnVwdC1wYXJlbnQg
PSA8JnZpYzE+Owo+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDwxMj47Cj4gPiArICAgICAgICBj
bG9jay1yYXRlID0gPDUwMDAwMDAwPjsgIC8qIDUwIE1IeiAqLwo+ID4gKwo+ID4gKyAgICAgICAg
Zmxhc2hAZjgwMDAwMDAgewo+Cj4gVGhpcyBpcyBub3cgYSB3YXJuaW5nIGluIGxpbnV4LW5leHQ6
CgpOb3cgdGhpcyBpcyBhIHdhcm5pbmcgaW4gdjcuMC1yYzEuIE1pcXVlbCwgcGxlYXNlIHJldmVy
dCB0aGlzIGFzIHRoZXJlCmhhcyBiZWVuIG5vIHJlc3BvbnNlLgoKPgo+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3Qsc3BlYXI2MDAtc21pLmV4YW1wbGUuZHRiOgo+IGZs
YXNoQGZjMDAwMDAwIChzdCxzcGVhcjYwMC1zbWkpOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFy
ZSBub3QKPiBhbGxvd2VkICgnZmxhc2hAZjgwMDAwMDAnIHdhcyB1bmV4cGVjdGVkKQo+ICAgICAg
ICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvc3Qs
c3BlYXI2MDAtc21pLnlhbWwKPgo+IFBsZWFzZSBzZW5kIGEgZml4IChhbmQgdGVzdCB5b3VyIHNj
aGVtYXMgYmVmb3JlIHNlbmRpbmcpLgo+Cj4gUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
