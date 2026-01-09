Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F995D1A623
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9hvhq2rb01FAK3hpp15nKe3BUMP5VohhVusQpzl7yI=; b=2Mhwcmt1CTrs2k
	2b54Ty/Z7M5OMgoHBT0GEJH2sxDRt64ItfAeH6eLx0B5hANgAy2T2kpMenStLQVuamCdQIHoSjqxv
	m+ZaZbTLgrAowekje8FCTCcmJ6nCEKgvWHHKi2TTqchYcaqk84R8CDfTzv4YQvjPd8gWMj65nXp+c
	401UMSi/CEpefQAHKJFujbG/KE+puvehdxzOVhQMiSKelZfmZjkjAqTHYFxywEPViXhDHy5oJvab+
	ymNCbfpysFkqc35FnHJJzLPtm65Xy+27HEvjrZKSFV/Of4RCw/pyygysYFdlgUQFyisW57CZ3OQca
	WrQ7y1u6CQZEsaKORTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCsr-00000002NGQ-4Asl;
	Fri, 09 Jan 2026 13:50:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCsm-00000002NFn-1AR7
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 13:50:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED7B74E42023;
	Fri,  9 Jan 2026 13:50:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B428E606C6;
	Fri,  9 Jan 2026 13:50:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE4EA103C8329;
	Fri,  9 Jan 2026 14:50:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767966623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7zjuKf+UIxL3bVA44Jw3Yx6helDynPKRicBwZQnETMM=;
	b=d0aTQxGsylzWCcJ5fUfL8+ZNebSEojE2M/GcU0sjfELjBB41JEP78+mhpOsqLNVRRdgqB5
	EoucvonRbo3e914sIVvlidNUHYWsEPClnCO9pKYvAd3mnNMFW/gI1PwNLsG0mHhrJ7IfRh
	rixwSyhKoIwZ1vHTVdICtZCC0a/RMFCfu6sILe8sAU8fMgGRlj0ikxutSud32ieKdgvPVX
	kJSGCyhHNubMt7NDeqZfUuq3HuvwGsd0a+7F9febBhoefUyU/CUg4IRjdQpk+2tiBlhADp
	r8fuKUqHaNiTa4wu1pcNc/YiVHiKe6MhsE3n3QflzWzvy+rSy/3r5WrAv9ta0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,  "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  Alexander Usyskin <alexander.usyskin@intel.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,  Tomas Winkler
 <tomasw@gmail.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
In-Reply-To: <aWDNNOoYTa0Mi7LM@black.igk.intel.com> (Raag Jadav's message of
	"Fri, 9 Jan 2026 10:41:08 +0100")
References: <aUZFLezigzZQVt55@kspp> <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
	<0c69b711-4c88-4e64-afe7-f7de147a490b@infradead.org>
	<aWDNNOoYTa0Mi7LM@black.igk.intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 09 Jan 2026 14:50:18 +0100
Message-ID: <87a4ymyjxh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_055028_825253_022E9852 
X-CRM114-Status: GOOD (  13.52  )
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

T24gMDkvMDEvMjAyNiBhdCAxMDo0MTowOCArMDEsIFJhYWcgSmFkYXYgPHJhYWcuamFkYXZAaW50
ZWwuY29tPiB3cm90ZToKCj4gT24gV2VkLCBKYW4gMDcsIDIwMjYgYXQgMDM6MTc6NDBQTSAtMDgw
MCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBIaSwKPj4gCj4+IE9uIDEyLzE5LzI1IDExOjA3IFBN
LCBSYWFnIEphZGF2IHdyb3RlOgo+PiA+IE9uIFNhdCwgRGVjIDIwLCAyMDI1IGF0IDAzOjQxOjQ5
UE0gKzA5MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4+ID4+IEZpeCB0aGUgVUJTQU46
IGFycmF5LWluZGV4LW91dC1vZi1ib3VuZHMgaXNzdWUgYmVsb3cgYnkgdXBkYXRpbmcKPj4gPj4g
Y291bnRlciBudm0tPm5yZWdpb25zIGJlZm9yZSB0aGUgZmlyc3QgYWNjZXNzIHRvIGZsZXhpYmxl
LWFycmF5Cj4+ID4+IG1lbWJlciBudm0tPnJlZ2lvbnNbXS4KPj4gPj4KPj4gPj4gZnJvbSBrZXJu
ZWwgYnVnemlsbGE6Cj4+ID4+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjIwODIzCj4+ID4+Cj4+ID4+IERlYyAxNSAyMjowMTo1MiBvcnBoZXVzIGtlcm5lbDog
VUJTQU46IGFycmF5LWluZGV4LW91dC1vZi1ib3VuZHMgaW4KPj4gPj4gL3Zhci90bXAvcG9ydGFn
ZS9zeXMta2VybmVsL2dlbnRvby1rZXJuZWwtNi4xOC4xL3dvcmsvbGludXgtNi4xOC9kcml2ZXJz
L210ZC9kZXZpY2VzL210ZF9pbnRlbF9kZy5jOjc1MDoxNQo+PiA+Pgo+PiA+PiBOb3RpY2UgdGhh
dCB0aGlzIGZsZXhpYmxlIGFycmF5IGlzIGFubm90YXRlZCB3aXRoIHRoZSBjb3VudGVkX2J5KCkK
Pj4gPj4gYXR0cmlidXRlLCBoZW5jZSB0aGUgY291bnRlciBtdXN0IGFsd2F5cyBiZSB1cGRhdGVk
IGJlZm9yZSB0aGUKPj4gPj4gZmlyc3QgYWNjZXNzIHRvIHRoZSBhcnJheS4KPj4gPiAKPj4gPiBB
bHJlYWR5IGZpeGVkWzFdLCBidXQgbm90IHN1cmUgaWYgaXQncyBsYW5kZWQgeWV0Lgo+PiA+IAo+
PiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNTExMTEtbXRkLW5y
ZWdpb25zLXYxLTEtNjFkYjYxZTc4YzYzQGludGVsLmNvbS8KPj4gCj4+IFdoYXQncyB0aGUgc3Rh
dHVzIG9mIHRoaXMgcGF0Y2gsIHBsZWFzZT8KPgo+IEknbSBhc3N1bWluZyBpdCdsbCBnbyB0aHJv
dWdoIG10ZCB0cmVlPyBNaXF1ZWw/CgpJdCBzaG91bGQgaW5kZWVkLiBIb3dldmVyIG9ubHkgdGhl
IG10ZCBsaXN0IGhhcyBiZWVuIGluY2x1ZGVkLCBzbyBpdAp3b24ndCBhcHBlYXIgaW4gIm15IiB0
b2RvIGxpc3QuIEx1Y2FzIGNhbiB5b3UgcGxlYXNlIHJlc2VuZCwgYW5kIHVzZSBhCnRvb2wgc3Vj
aCBhcyBiNCB0byBtYW5hZ2UgdGhlIHNlcmllcyBvciBhdCBsZWFzdCBydW4gZ2V0X21haW50YWlu
ZXJzLnBsPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
