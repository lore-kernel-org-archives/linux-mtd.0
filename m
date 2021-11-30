Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070F9C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zGi4JIW4MS5JxqeiUw6j/10j0KdCCub2Qscps47mWNc=; b=afgzl4oKOHDyqmobSLtSKompAZ
	QX4JGvd7XdfFPLlOApyOnY0oR81AQCbcQ4wChOFU/RcXcrrGr7f810ixhOBLfmOWJRWYpBuwltK++
	2nieSnu860oJQE28iSTgwXDmgMS6pEYMOFBXyVBYF9Usc2BI7742qTecaGocNL7aTD0jAOt6uwura
	NRqA8UUNoXUZGKrNZF4GQ1z/74nohTlGH1rQqWx0NSAlRRYlioV8XXlOOhmO37lUoJ59LuTSj9Til
	Wp2GLcQUQ3DdAC/Pb5tVFcjZ+uzL44gIivbvV/2A+gcATEzHg2tJ1lpI4Vulu7FzTFSg5vQSF3tlD
	gY+IUGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms9QW-006cN6-6M; Tue, 30 Nov 2021 20:08:32 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms9QP-006cML-9G
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 20:08:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id b40so56749601lfv.10
 for <linux-mtd@lists.infradead.org>; Tue, 30 Nov 2021 12:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7JdcQD2gHw8mJRZkpMLuKPrRtMfe79QTxAa5BKkqe1c=;
 b=fjzIGck3py3iiHKaVF+NvBwVw2PYlI1/8kpJBfpq9aVM7PL9dLMO8n46AjAoOJLmsv
 Ul1ly0XiAkZ2dYBJxAJ3FGGpwsgPCoBhhUtA+MyxgDrcvSU75dMQDhywARODnmvpJ9f6
 K2mnoppoZo3CBObWoEDemDz8SbK7uokesXybGyy2Iyrmh+ErUBzv5p7ofY/SnDxzPgJ7
 JS87Q2cKmc15KwMZNPYlIXvyFiRjuI0FACeOT5S+fap5i7+UgUt6N+sYz381DnTD17Rb
 pEOQZxoDbDYM1bakqBcMnfIJJZkoVGG5jgSqZzj5yOPAocxdbioUsZhKAqYNKrA8wdtQ
 piIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7JdcQD2gHw8mJRZkpMLuKPrRtMfe79QTxAa5BKkqe1c=;
 b=CAFlkHHV1vPCE+f5yRGDeVEiGioTvzGhnC/YO3payy4gwVoTNG89q7wAz/41/E4LQz
 fQdaQA/lV3q6DKp0+Z720VmPopUARRgxQuZZvBBKo49Umg9iUQq79dwwnIt/TfjFBa1j
 uZHwxuVcqHcvgc64eQhVg/SHqP39miUs/nGWXKG2t388VGfu6IUeKnwc7ti6IqGjG1Fj
 3LmbfzO51bBHYZQ732oUV6IAlheb36EE+QoYuTfrIYu9rLm+/LKknhtMM0TjBQfc6YZL
 jWicoGTsC2hKMmNtp7MuAHQgA00EW2vyXpX0FpiP+1n++bF15/TYTlUNhLyNPz4crEsK
 0ooQ==
X-Gm-Message-State: AOAM531qspVedFP5j4O5xwP8PsvYtCFNZTz4qqphuss1WgPI7Mmmsjv1
 wfTSPSw78yMh7tGRkGA38J4=
X-Google-Smtp-Source: ABdhPJyoZOJhv+FDusWXLIfIYnl/DUwY50qJw+eFkwVhVscVOcf6ZxCNVEjK4qCdctHINQCnLqZfpw==
X-Received: by 2002:a05:6512:1082:: with SMTP id
 j2mr1289087lfg.557.1638302902537; 
 Tue, 30 Nov 2021 12:08:22 -0800 (PST)
Received: from [172.16.0.150] ([31.148.138.103])
 by smtp.gmail.com with ESMTPSA id a1sm1818910lfc.92.2021.11.30.12.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 12:08:22 -0800 (PST)
Subject: Re: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, nagasure@xilinx.com, richard@nod.at,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
References: <20211127180758.30884-1-okitain@gmail.com>
 <20211129095559.01aa63a6@xps13>
 <3da5dff5-53d4-15db-075d-9b195f2f75dd@gmail.com>
 <20211130082017.1400f24b@xps13>
From: Olga Kitaina <okitain@gmail.com>
Message-ID: <fb6a4b49-7c10-4ed1-7054-5dd8ce2d8073@gmail.com>
Date: Tue, 30 Nov 2021 23:08:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130082017.1400f24b@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_120825_354022_D76CBCEC 
X-CRM114-Status: GOOD (  34.66  )
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

SGkgTWlxdWVsLAoKT24gMzAuMTEuMjAyMSAxMDoyMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBPbGdhLAo+IAo+IG9raXRhaW5AZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMjkgTm92IDIwMjEg
MjE6MDY6MDUgKzAzMDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gT24gMjkuMTEuMjAyMSAxMTo1
NSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIE9sZ2EsCj4+Pgo+Pj4gUGxlYXNlIGFkZCBh
bGwgdGhlIE1URCBtYWludGFpbmVycyBpbiBjb3B5LCBhcyByZXF1ZXN0ZWQgYnkKPj4+IGdldF9t
YWludGFpbmVycy5wbC4KPj4+Cj4+PiBva2l0YWluQGdtYWlsLmNvbSB3cm90ZSBvbiBTYXQsIDI3
IE5vdiAyMDIxIDIxOjA3OjU4Cj4+PiArMDMwMDoKPj4+ICAgCj4+Pj4gQWNjb3JkaW5nIHRvIHRo
ZSBBcmFzYW4gTkFORCBjb250cm9sbGVyIHNwZWMsCj4+Pj4gdGhlIGZsYXNoIGNsb2NrIHJhdGUg
Zm9yIFNEUiBtdXN0IGJlIDw9IDEwMCBNSHosCj4+Pj4gd2hpbGUgZm9yIE5WLUREUiBpdCBtdXN0
IGJlIHRoZSBzYW1lIGFzIHRoZSByYXRlCj4+Pj4gb2YgdGhlIENMSyBsaW5lIGZvciB0aGUgbW9k
ZS4gIAo+Pj4KPj4+IEkgY29tcGxldGVseSBtaXNzZWQgdGhhdCwgd2hlcmUgZGlkIHlvdSBnZXQg
dGhlIGluZm9ybWF0aW9uPyAgCj4+Cj4+IFRoZSAiRGF0YSBJbnRlcmZhY2UgVHJhbnNpdGlvbnMi
IGNoYXB0ZXIgb2YgdGhlIHNwZWMgY29udGFpbnMgdGltaW5ncyBmb3IgZmxhc2ggY2xvY2sgc2V0
dXAgaW4gTlYtRERSCj4+IGFuZCBOVi1ERFIyIG1vZGVzLiBUaGUgInRpbWUgcGVyaW9kIiBvZiB0
aG9zZSBjbG9ja3MgaXMgZXF1YWwgdG8gdENLIGluIE5WLUREUiBhbmQgdFJDIGluIE5WLUREUjIu
Cj4+Cj4+IFRoZSBzYW1lIGNoYXB0ZXIgc2hvdWxkIGhhdmUgaW5mb3JtYXRpb24gYWJvdXQgbmVj
ZXNzYXJ5IHN0ZXBzIHRvIHN3aXRjaCBmcm9tIE5WLUREUiB0byBTRFIsCj4+IHdoaWNoIGluY2x1
ZGVzIHNldHRpbmcgdGhlIGZsYXNoIGNsb2NrIHRvIDEwMCBNSHouCj4+Cj4+Cj4+IEp1c3QgdG8g
bWFrZSBzdXJlIGknbSBub3Qgc2hvb3RpbmcgbXlzZWxmIGluIHRoZSBmb290OiBhbSBJIGNoYW5n
aW5nIHRoZSByaWdodCBjbG9jaz8KPj4gVGhlIGRvY3VtZW50YXRpb24gcG9pbnRzIG91dCB0aGF0
IHdlIGhhdmUgdG8gY2hhbmdlIGZsYXNoX2Nsaywgd2hpY2ggaSB0aG91Z2h0IHdhcwo+PiBuZmMt
PmNvbnRyb2xsZXJfY2xrIGFuZCBzZXQgdXAgYnkgYW5hbmQtPmNsaywgYnV0IGl0IHNlZW1zIGxp
a2UgaXQgbWlnaHQgYWN0dWFsbHkgYmUgbmZjLT5idXNfY2xrLgo+IAo+IEkgYmVsaWV2ZSBJIG1h
ZGUgYSBzZXJpb3VzIG1pc3Rha2UsIHJlLXJlYWRpbmcgdGhlIGNvZGUgaXQgZmVlbHMgbGlrZQo+
IEknbSBjaGFuZ2luZyB0aGUgc3lzdGVtJ3MgY2xvY2sgKHdoaWNoIGJhc2ljYWxseSBjaGFuZ2Vz
IG5vdGhpbmcgaW4gb3VyCj4gY2FzZSkgaW5zdGVhZCBvZiBjaGFuZ2luZyB0aGUgTkFORCBidXMg
Y2xvY2suCj4gCj4+IEluIHRoYXQgY2FzZSwgZG9lcyBzZXR0aW5nIG5mYy0+Y29udHJvbGxlcl9j
bGsgdG8gMTAwIE1IeiBieSBkZWZhdWx0IG1ha2Ugc2Vuc2U/Cj4+IFRoZXJlIGlzbid0IGEgaGFy
ZCBsaW1pdCBvbiB3aGF0IHRoZSBzeXN0ZW0gY2xvY2sgbWlnaHQgYmUgKGJleW9uZCBhIHNwZWNp
ZmljIFNvQyksCj4+IGJ1dCB0aGVyZSBhcmUgdGltaW5nIHJlcXVpcmVtZW50cyBmb3IgdGhlIGZs
YXNoIGNsb2NrLCBhbmQgc28gc2V0dGluZyBhIHNwZWNpZmljIAo+PiBzeXN0ZW0gY2xvY2sgZnJl
cXVlbmN5IHNlZW1zIHVubmVjZXNzYXJ5IGZvciBtb3N0IGRldmljZXMuCj4+Cj4gCj4gUGxlYXNl
IGNyZWF0ZSBhIHR3by1wYXRjaCBzZXJpZXM6Cj4gMS0gU2V0dGluZyB0aGUgcmlnaHQgY2xvY2sg
aW4gdGhlIGN1cnJlbnQgY29kZSBiYXNlIChpbnZlcnRpbmcgYnVzX2Nsawo+IGFuZCBjb250cm9s
bGVyX2NsayB3aGVyZSByZWxldmFudCwgc2V0dGluZyBvbmUgdG8gMTAwTUh6IGFuZCBsZXR0aW5n
Cj4gdGhlIG90aGVyIGFzIGl0IGlzKQo+IDItIENoYW5naW5nIHRoZSBkZWZhdWx0IE5WLUREUiBy
YXRlIGJhc2VkIG9uIHRDSyAoYmVsb3cgcGF0Y2gpLgo+IAo+IERvIHlvdSBoYXZlIHRoZSBuZWNl
c3NhcnkgaGFyZHdhcmUgZm9yIHRlc3Rpbmc/CgpJJ20gc29ycnkgdG8gc2F5IC0gSSBkbyBub3Qu
IFRoZSBTb0MgdGhpcyBwcm9ibGVtIHdhcyBpbml0aWFsbHkgbm90aWNlZCBvbiBjYW4ndCBydW4g
bGF0ZXN0IExpbnV4LAphbmQgZXZlbiBpZiBpdCBkaWQgSSBoYXZlIG5vIHdheSBvZiBhY3F1aXJp
bmcgYW4gTlYtRERSLWNhcGFibGUgZmxhc2guCgpTaW5jZSBCb290bGluIG1lcmdlZCBpbiBOVi1E
RFIgc3VwcG9ydCBpbnRvIHRoZSBrZXJuZWwsIGlzIGl0IHBvc3NpYmxlIGZvciB5b3UgdG8gdGVz
dCAKdGhlIG5leHQgaXRlcmF0aW9uIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIG9uIE5WLUREUiBoYXJk
d2FyZSBhcyB3ZWxsPwpTYXksIGJ5IHB1cnBvc2VmdWxseSBwcmV2ZW50aW5nIE5WLUREUiBtb2Rl
IDUgZnJvbSBiZWluZyBjaG9zZW4gaW4gYW5mY19zZXR1cF9pbnRlcmZhY2UoKT8KCj4+Pj4gVGhl
IGRyaXZlciBwcmV2aW91c2x5IGFsd2F5cyBzZXQgMTAwIE1IeiBmb3IgTlYtRERSLCB3aGljaAo+
Pj4+IHdvdWxkIHJlc3VsdCBpbiBpbmNvcnJlY3QgYmVoYXZpb3IgZm9yIE5WLUREUiBtb2RlcyAw
LTQuCj4+Pj4KPj4+PiBUaGUgYXBwcm9wcmlhdGUgY2xvY2sgcmF0ZSBjYW4gYmUgY2FsY3VsYXRl
ZAo+Pj4+IGZyb20gdGhlIE5WLUREUiB0aW1pbmcgcGFyYW1ldGVycyBhcyAxL3RDSywgb3IgZm9y
IHJhdGVzCj4+Pj4gbWVhc3VyZWQgaW4gcGljb3NlY29uZHMsIDEwXjEyIC8gbmFuZF9udmRkcl90
aW1pbmdzLT50Q0tfbWluLgo+Pj4+ICAKPj4+Cj4+PiBZb3UgbmVlZCBhIGNvdXBsZSBvZiBGaXhl
cyArIENjOiBzdGFibGUgdGFncyBoZXJlLCBvdGhlcndpc2UgdGhlCj4+PiBwYXRjaCBsb29rcyBn
b29kIHRvIG1lLgo+Pj4gICAKPj4KPj4gV2lsbCBpbmNsdWRlIGluIHRoZSBuZXh0IGl0ZXJhdGlv
biBvZiB0aGUgcGF0Y2gsIHRoYW5rIHlvdS4KPj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGdhIEtp
dGFpbmEgPG9raXRhaW5AZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgfCA4ICsrKysrKystCj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPj4+PiBpbmRleCA1M2Jk
MTA3Mzg0MTguLmVkNGVlOTk0MjQ0MSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPj4+PiBAQCAtMTgsNiArMTgsNyBAQAo+Pj4+
ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+Pj4+ICAjaW5jbHVkZSA8bGludXgv
aW50ZXJydXB0Lmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPj4+PiArI2luY2x1
ZGUgPGxpbnV4L21hdGg2NC5oPgo+Pj4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+Pj4g
ICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9tdGQvcGFy
dGl0aW9ucy5oPgo+Pj4+IEBAIC0xMDQzLDcgKzEwNDQsMTIgQEAgc3RhdGljIGludCBhbmZjX3Nl
dHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgdGFyZ2V0LAo+Pj4+ICAJ
CQkJIERRU19CVUZGX1NFTF9PVVQoZHFzX21vZGUpOwo+Pj4+ICAJfQo+Pj4+ICAKPj4+PiAtCWFu
YW5kLT5jbGsgPSBBTkZDX1hMTlhfU0RSX0RGTFRfQ09SRV9DTEs7Cj4+Pj4gKwlpZiAobmFuZF9p
bnRlcmZhY2VfaXNfc2RyKQo+Pj4+ICsJCWFuYW5kLT5jbGsgPSBBTkZDX1hMTlhfU0RSX0RGTFRf
Q09SRV9DTEs7Cj4+Pj4gKwllbHNlCj4+Pj4gKwkJLyogT05GSSB0aW1pbmdzIGFyZSBkZWZpbmVk
IGluIHBpY29zZWNvbmRzICovCj4+Pj4gKwkJYW5hbmQtPmNsayA9IGRpdl91NjQoKHU2NClOU0VD
X1BFUl9TRUMgKiAxMDAwLAo+Pj4+ICsJCQkJICAgICBjb25mLT50aW1pbmdzLm52ZGRyLnRDS19t
aW4pOwo+Pj4+ICAKPj4+PiAgCS8qCj4+Pj4gIAkgKiBEdWUgdG8gYSBoYXJkd2FyZSBidWcgaW4g
dGhlIFp5bnFNUCBTb0MsIFNEUiB0aW1pbmcgbW9kZXMgMC0xIHdvcmsKPj4+Pgo+Pj4+IGJhc2Ut
Y29tbWl0OiBmNTNkNGMxMDlhNjY2YmYxYTQ4ODNiNDVkNTQ2ZmJhMDc5MjU4NzE3ICAKPj4+Cj4+
Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobAo+Pj4gICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOo
bAo+IAoKVGhhbmtzLApPbGdhLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
