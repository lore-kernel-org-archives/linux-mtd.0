Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0806DC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 09:01:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D72B64DD1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 09:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D72B64DD1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mU/2ffCh3V9kzWqpfeDgPnWEac6p9gyaRruCMGt0QnY=; b=2VNvEP0O6VOu3AX3MAf91dOX0
	DdOcHwzXAy75LjzSOnYXBqKwGyk2chGRkQ9P4ZeRPXEqTAvFfcdL3wobH1Bn+9IoWaTr1GfqN0ZNg
	fPn5Vqj6797rc+D7usvwr4pidG6X8h+Yv416OPrbZKXBndc5KhON6JzJJXcNgtMC8zyEIG9LqGg/8
	MzIDUU2M3e+fWUtKTCWLyKGJvl+Q58vSgLq4lFXeU8L2LMKy7Wtj6+hv74DUei7ABFqyKCpVDsaGr
	u4jfus2puC305VPB+Eaj9HEdUa2qbAlCZBk8m+Myv8OU3uL2oZSFVDjcTy9S2KVzQX4RRRhdRdcu+
	9pzi1sHhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l53AQ-0006Z6-FE; Thu, 28 Jan 2021 09:00:42 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l53AM-0006YP-QB
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 09:00:40 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A1B11FF818;
 Thu, 28 Jan 2021 09:00:33 +0000 (UTC)
Date: Thu, 28 Jan 2021 10:00:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH] mtd: use refcount to prevent corruption
Message-ID: <20210128100032.5eb542c6@xps13>
In-Reply-To: <f91d7eff1d764ba7b47f023bc0fafacb@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
 <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
 <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
 <f91d7eff1d764ba7b47f023bc0fafacb@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_040039_051287_31F7AB11 
X-CRM114-Status: GOOD (  25.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVG9tYXMsCgoiV2lua2xlciwgVG9tYXMiIDx0b21hcy53aW5rbGVyQGludGVsLmNvbT4gd3Jv
dGUgb24gVGh1LCAyOCBKYW4gMjAyMQowODo1Mzo0MyArMDAwMDoKCj4gPiBUb21hcywKPiA+IAo+
ID4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLSAgCj4gPiA+PiA+PiBDYW4geW91IHBs
ZWFzZSBleHBsYWluIGEgbGl0dGxlIG1vcmUgd2hhdCBkZXZpY2VzIGFyZSBpbnZvbHZlZD8KPiA+
ID4+ID4+IERvZXMgaXQgaW1wbGVtZW50IF9nZXRfZGV2aWNlKCkgYW5kIF9wdXRfZGV2aWNlKCk/
ICAKPiA+ID4+ID4gTm8gdGhpcyBpcyBub3QgY29ubmVjdGVkIHRvIHRob3NlIGhhbmRsZXJzIG9m
IHRoZSB1bmRlcmx5aW5nIGRldmljZQo+ID4gPj4gPiBhbmQgdGhvc2Ugd29uJ3QgaGVscC4KPiA+
ID4+ID4gSSBoYXZlIGEgc3BpIGRldmljZSBwcm92aWRlZCBieSBNRkQgZnJhbWV3b3JrIHNvIGl0
IGNhbiBnbyBhd2F5IGFueXRpbWUuICAKPiA+ID4+Cj4gPiA+PiBDYW4gaXQgZ28gYXdheSBwaHlz
aWNhbGx5IG9yIGp1c3QgaW4gc29mdHdhcmU/ICAKPiA+ID4gU29mdHdhcmUsIGJ1dCBzaW5jZSB0
aGlzIGlzIG1mZCBpdCdzIGJhc2ljYWxseSBob3RwbHVnLiBUaGUga2VybmVsIGlzCj4gPiA+IGNy
YXNoaW5nIHdoZW4gSSBzaW11bGF0ZSBoYXJkd2FyZSBmYWlsdXJlLiAgCj4gPiA+Pgo+ID4gPj4g
VXN1YWxseSB0aGUgcGF0dGVybiBpcyB0aGF0IHlvdSBtYWtlIHN1cmUgaW4gdGhlIGRldmljZSBk
cml2ZXIgdGhhdAo+ID4gPj4gbm9ib2R5IGNhbiBvcnBoYW4gdGhlIE1URCB3aGlsZSBpdCBpcyBp
biB1c2UuCj4gPiA+PiBlLmcuIGRyaXZlcnMvbXRkL3ViaS9nbHVlYmkuYyBkb2VzIHNvLiBJbiBf
Z2V0X2RldmljZSgpIGl0IGdyYWJzIGEKPiA+ID4+IHJlZmVyZW5jZSBvbiB0aGUgdW5kZXJseWlu
ZyBVQkkgdm9sdW1lIHRvIG1ha2Ugc3VyZSBpdCBjYW5ub3QgZ28gYXdheQo+ID4gPj4gd2hpbGUg
dGhlIE1URCAob24gdG9wIG9mIFVCSSkgaXMgaW4gdXNlLiAgCj4gPiA+Cj4gPiA+IEkgY2FuIHRy
eSB0aGF0IGlmIGl0IGhlbHBzLCBiZWNhdXNlIHdlIGFyZSBzaW11bGF0aW5nIHBvc3NpYmxlIGxv
d2VyCj4gPiA+IGxldmVsIGNyYXNoLgo+ID4gPiBJbiBhbiBjYXNlIEkgYmVsaWV2ZSB0aGF0IHRo
ZSBwcm9wZXIgcmVmY291dGluZyBpcyBtdWNoIG1vcmUgcm9idXN0Cj4gPiA+IHNvbHV0aW9uLCB0
aGFuIHRoZSBjdXJyZW50IG9uZS4KPiA+ID4gSSdkIGFwcHJlY2lhdGUgaWYgc29tZW9uZSBjYW4g
cmV2aWV3IHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24uICAKPiA+IAo+ID4gVGhpcyBoYXBwZW5z
IHJpZ2h0IG5vdywgSSB0cnkgdG8gdW5kZXJzdGFuZCB3aHkgZXhhY3RseSB0aGUgY3VycmVudCB3
YXkgaXMgbm90Cj4gPiBnb29kIGluIGVub3VnaC4gOi0pCj4gPiAKPiA+IFlvdXIgYXBwcm9hY2gg
bWFrZXMgc3VyZSB0aGF0IHRoZSBNVEQgaXRzZWxmIGRvZXMgbm90IGdvIGF3YXkgd2hpbGUgaXQg
aGFzCj4gPiB1c2VycyBidXQgaG93IGRvZXMgdGhpcyBoZWxwIGluIHRoZSBjYXNlIHdoZXJlIHRo
ZSB1bmRlcmx5aW5nIE1GRCBqdXN0Cj4gPiB2YW5pc2hlcz8KPiA+IFRoZSBNVEQgY2FuIGJlIGlu
IHVzZSBhbmQgdGhlIE1GRCBjYW4gZ28gYXdheSB3aGlsZSBlLmcuIG10ZF9yZWFkKCkgb3Igc3Vj
aAo+ID4gdGFrZXMgcGxhY2UuICAKPiAKPiBSZWFkIHdpbGwgZmFpbCwgYnV0IGtlcm5lbCB3b24n
dCBjcmFzaCBvbiBhY2Nlc3MgdG8gbWVtb3J5IHRoYXQgd2FzIGZyZWVkLgoKQXMgUmljaGFyZCB3
YXMgc2F5aW5nLCB3ZSBhcmUgcmVhbGx5IG9wZW4gdG8gZW5oYW5jZSBNVEQgcmVmY291bnRpbmcu
CgpIb3dldmVyLCB0aGUgaXNzdWUgeW91IGFyZSBmYWNpbmcgaXMsIElNSE8sIG5vdCByZWxhdGVk
IHRvIE1URCBidXQgdG8KTUZELiBUaGVyZSBzaG91bGQgYmUgYSB3YXkgdG8gYXZvaWQgTUZEIHRv
IHZhbmlzaCBieSB0YWtpbmcgYSByZWZlcmVuY2UKb2YgaXQgdGhyb3VnaCBtdGQtPl9nZXRfZGV2
aWNlKCkuIEkgZG9uJ3QgdGhpbmsgYWRkcmVzc2luZyB0aGUgY2FzZQp3aGVyZSBNRkQgdmFuaXNo
ZXMgd2hpbGUgTVREIChhcyBhIHVzZXIpIGlzIHN0aWxsIGFjdGl2ZSBpcyB0aGUKcmlnaHQgYXBw
cm9hY2guCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
