Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BA8C54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9UWiVLMkkOeSXqqHV7BRhvYZPyX/izTNdV0D9VlL3w=; b=SnxJ3Yhykanx+u
	HpKZgm18nf1P2eKu18+IJrrwQM7zDzgwsXggeeSS7UF3KQ14E+8isqtQjjWQlK1SS8dmYbWtWbYY9
	fjxbEjH+omTxOhu6kfVOL+KnUfCiGEg3e8ZSzzis0Z57byZ40mkD6LU6RLmum0aNzdXzGaJ3dCX8X
	e/f53AzmduJCoIEKUTpTTdAmTSRa4iyGleyMX/TELsu5aeOzV/4PkFna7pe5BNi6USLUybj9DTxTd
	MnvDeqcDH2MdKSsHv3JzffyVujO6fWwPb26liOYHHbqT+MMplr/E97ejw6C0iQ49pL3ojUuUgzwGO
	7ahmkrjVdUrKhcp9bpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWV4-0000000A9PC-2tWf;
	Wed, 27 Mar 2024 16:51:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWV1-0000000A9Ni-0C25
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 16:51:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B652240008;
	Wed, 27 Mar 2024 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711558294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8dkDsTM+CyF3T1RfUsZvTaGtiJGxz0u7kuWWxBLiq70=;
	b=OlCqOZhRUE+LEglVKAzyRaIJnfHwR7NpVwTLoTmHNcTFLc1l2Ze/9ictqKZcclr3fbO0nE
	JFO/Ll9eSZm0QJZUc7JFGocaYue1wLCziUiLa/3wRMVohIQ2NLg7RI87xwUd3YtaU+owPM
	Vll6eIkZQFjuJGT1soHhKBI2DemQ2JnZx3vT1lIb+F2cQ2AuT2ZTc9LDO+/YBI6d+FnvGW
	kDbQt4FW3pInjRk5kBdRExWdgGsNnLTQbx3ypV2enI06lf+G8BbHC05YFWikJ+bJHQBIA+
	7arwt6GAfJQ/f6JD3pTIs/h0gSnDzYG4vuEA8A/B3CVYNpBvSNN/iujE0U5JhA==
Date: Wed, 27 Mar 2024 17:51:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Md
 Sadre Alam <quic_mdalam@quicinc.com>, Sricharan Ramabadhran
 <quic_srichara@quicinc.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix broken erase in
 misc_cmd_type in exec_op
Message-ID: <20240327175131.3c0100c3@xps-13>
In-Reply-To: <66044bea.050a0220.dee16.c250@mx.google.com>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
	<20240326072512.GA8436@thinkpad>
	<66044bea.050a0220.dee16.c250@mx.google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_095139_452964_B2E82688 
X-CRM114-Status: GOOD (  28.34  )
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

SGksCgphbnN1ZWxzbXRoQGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDI3IE1hciAyMDI0IDE2OjIw
OjU4ICswMTAwOgoKPiBPbiBUdWUsIE1hciAyNiwgMjAyNCBhdCAxMjo1NToxMlBNICswNTMwLCBN
YW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAx
MTozMDo0N0FNICswMTAwLCBDaHJpc3RpYW4gTWFyYW5naSB3cm90ZTogIAo+ID4gPiBtaXNjX2Nt
ZF90eXBlIGluIGV4ZWNfb3AgaGF2ZSBtdWx0aXBsZSBwcm9ibGVtcy4gV2l0aCBjb21taXQgYTgy
OTkwYzhhNDA5Cj4gPiA+ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0
IG9wcyBpbiBleGVjX29wIHBhdGgiKSBpdCB3YXMKPiA+ID4gcmV3b3JrZWQgYW5kIGdlbmVyYWxp
emVkIGJ1dCBhY3R1YWxseSBicm9rZSB0aGUgaGFuZGxpbmcgb2YgdGhlCj4gPiA+IEVSQVNFX0JM
T0NLIGNvbW1hbmQuCj4gPiA+IAo+ID4gPiBBZGRpdGlvbmFsIGxvZ2ljIHdhcyBhZGRlZCB0byB0
aGUgZXJhc2UgY29tbWFuZCBjeWNsZSB3aXRob3V0IGNsZWFyCj4gPiA+IGV4cGxhaW5hdGlvbiBj
YXVzaW5nIHRoZSBlcmFzZSBjb21tYW5kIHRvIGJlIGJyb2tlbiBvbiB0ZXN0aW5nIGl0IG9uCj4g
PiA+IGEgaXBxODA2eCBuYW5kYy4KPiA+ID4gCj4gPiA+IEZpeCB0aGUgZXJhc2UgY29tbWFuZCBi
eSByZXZlcnRpbmcgdGhlIGFkZGl0aW9uYWwgbG9naWMgYW5kIG9ubHkgYWRkaW5nCj4gPiA+IHRo
ZSBOQU5EX0RFVjBfQ0ZHMCBhZGRpdGlvbmFsIGNhbGwgKHJlcXVpcmVkIGZvciBlcmFzZSBjb21t
YW5kKS4KPiA+ID4gCj4gPiA+IEZpeGVzOiBhODI5OTBjOGE0MDkgKCJtdGQ6IHJhd25hbmQ6IHFj
b206IEFkZCByZWFkL3JlYWRfc3RhcnQgb3BzIGluIGV4ZWNfb3AgcGF0aCIpCj4gPiA+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBNYXJh
bmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZXMgdjI6Cj4g
PiA+IC0gU3BsaXQgdGhpcyBhbmQgcmV3b3JrIGNvbW1pdCBkZXNjcmlwdGlvbiBhbmQgdGl0bGUK
PiA+ID4gCj4gPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA1ICsrLS0t
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gPiBpbmRleCBiMDc5NjA1
Yzg0ZDMuLjE5ZDc2ZTM0NWE0OSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYwo+ID4gPiBAQCAtMjgzMCw5ICsyODMwLDggQEAgc3RhdGljIGludCBxY29tX21pc2NfY21k
X3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBzdHJ1Y3QgbmFuZF9zdWIK
PiA+ID4gIAluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfRVhFQ19DTUQsIDEpOwo+ID4gPiAgCj4g
PiA+ICAJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9GTEFTSF9DTUQsIGluc3RycywgTkFORF9C
QU1fTkVYVF9TR0wpOwo+ID4gPiAtCShxX29wLmNtZF9yZWcgPT0gT1BfQkxPQ0tfRVJBU0UpID8g
d3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9ERVYwX0NGRzAsCj4gPiA+IC0JMiwgTkFORF9CQU1f
TkVYVF9TR0wpIDogcmVhZF9yZWdfZG1hKG5hbmRjLAo+ID4gPiAtCU5BTkRfRkxBU0hfU1RBVFVT
LCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gPiA+ICsJaWYgKHFfb3AuY21kX3JlZyA9PSBPUF9C
TE9DS19FUkFTRSkKPiA+ID4gKwkJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9ERVYwX0NGRzAs
IDIsIE5BTkRfQkFNX05FWFRfU0dMKTsgIAo+ID4gCj4gPiBTbyB0aGlzIG9ubHkgYXZvaWRzIHRo
ZSBjYWxsIHRvLCAncmVhZF9yZWdfZG1hKG5hbmRjLCBOQU5EX0ZMQVNIX1NUQVRVUywgMSwKPiA+
IE5BTkRfQkFNX05FWFRfU0dMKScgaWYgcV9vcC5jbWRfcmVnICE9IE9QX0JMT0NLX0VSQVNFLiBC
dXQgZm9yIHFfb3AuY21kX3JlZyA9PQo+ID4gT1BfQkxPQ0tfRVJBU0UsIHRoZSByZXN1bHQgaXMg
dGhlIHNhbWUuCj4gPiAKPiA+IEknbSB3b25kZXJpbmcgaG93IGl0IHJlc3VsdHMgaW4gZml4aW5n
IHRoZSBPUF9CTE9DS19FUkFTRSBjb21tYW5kLgo+ID4gCj4gPiBDYW4geW91IHNoYXJlIHRoZSBh
Y3R1YWwgaXNzdWUgdGhhdCB5b3UgYXJlIHNlZWluZz8gTGlrZSBlcnJvciBsb2dzIGV0Yy4uLgo+
ID4gIAo+IAo+IElzc3VlIGlzIHRoYXQgbmFuZGMgZ29lcyB0byBBRE0gdGltZW91dCBhcyBzb29u
IGFzIGEgQkxPQ0tfRVJBU0UgaXMKPiBjYWxsZWQuIEJMT0NLX0VSQVNFIG9wZXJhdGlvbiBtYXRj
aCBhbHNvIGFub3RoZXIgb3BlcmF0aW9uIGZyb20gTVRECj4gcmVhZC4gKHBhcnNlciBhbHNvIG1h
cHMgdG8gb3RoZXIgc3R1ZmYpCj4gCj4gSSB3aWxsIGJlIGF3YXkgZnJvbSB0aGUgdGVzdGluZyBi
b2FyZCBmb3IgNy0xMCBkYXlzIHNvIEkgY2FuJ3QgcHJvdmlkZQo+IGxvZ3MgY3VycmVudGx5LgoK
U28sIHNoYWxsIHdlIHdhaXQgZm9yIGFkZGl0aW9uYWwgbG9ncyBmcm9tIENocmlzdGlhbiBvciBz
aGFsbCBJIG1lcmdlCnRoZSB0d28tcGF0Y2hlcyBzZXJpZXM/IEknbSBub3Qgc3VyZSB3aGF0J3Mg
dGhlIHN0YXR1cyBhbnltb3JlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
