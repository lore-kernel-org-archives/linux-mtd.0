Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E38C35249
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 08:22:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721EB20730
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 08:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NGN/8XX4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721EB20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlCX4lxw+7jCUJmNaprRlOeoxHbki+Bm7UP4OvzuJ34=; b=NGN/8XX4kBOrQ2
	vXyNRzxGSqsgCeD8AIUXyTzOEEP5EgLGdfJEYwpWA3WuXDdXN6jitKH9x1syy7juuEuAUwjggi8gm
	yQ47VDto5xyr+8oyDqcWRmdMJQITdv4kdtpaYoQ1cvtDHuFWY2D4+FUMiGDmhBTsPbxgIaYgwArnm
	4q7ZFPAOb6zijNbVsJ2T+JS2Rk59W2uabycxxjKh4+DOVJNwLn5yXWQjiODzyZR3wjJlKK8WyZ5JS
	pMiIruXWMTa08YIuOVdEKUVOeW0s9NAH4iU3cwOKq4TAPiNTGfbpY8HcnUADQ3a2KKEetidJAktRZ
	IV+zQqCMO+yKDuSfbVeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izFwz-00015G-BU; Wed, 05 Feb 2020 08:22:21 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izFwv-000140-Ap
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 08:22:19 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A03A5FF815;
 Wed,  5 Feb 2020 08:22:02 +0000 (UTC)
Date: Wed, 5 Feb 2020 09:22:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Driesen Jef (JDI)" <Jef.Driesen@niko.eu>
Subject: Re: ubifs: mounting fails due to error in orphan file handling
Message-ID: <20200205092202.5f0929c3@xps13>
In-Reply-To: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_002217_646304_9AC233BE 
X-CRM114-Status: GOOD (  19.33  )
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
Cc: richard@nod.at,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmVmLAoKIkRyaWVzZW4gSmVmIChKREkpIiA8SmVmLkRyaWVzZW5Abmlrby5ldT4gd3JvdGUg
b24gVHVlLCAyOApKYW4gMjAyMCAxMDo1MTozOSArMDAwMDoKCj4gSGksCj4gCj4gV2UncmUgZXhw
ZXJpZW5jaW5nIHNvbWUga2luZCBvZiBmaWxlIHN5c3RlbSBjb3JydXB0aW9uIHdpdGggdGhlIFVC
SUZTIAo+IGZpbGUgc3lzdGVtIGFmdGVyIHBvd2VyIGN1dHMuIFRoZSBwcm9ibGVtIHNob3dzIHVw
IGFzIGFuIGVycm9yIGR1cmluZyBtb3VudDoKPiAKPiAjIG1vdW50IC10IHViaWZzIHViaTA6aG9t
ZSAvaG9tZQo+IG1vdW50OiAvaG9tZTogc3BlY2lhbCBkZXZpY2UgdWJpMDpob21lIGRvZXMgbm90
IGV4aXN0Lgo+IAo+IFRoZSB1bmRlcmx5aW5nIFVCSSB2b2x1bWVzIGFyZSBhbGwgZmluZToKPiAK
PiAjIG10ZGluZm8gL2Rldi9tdGQwCj4gbXRkMAo+IE5hbWU6ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWJpCj4gVHlwZTogICAgICAgICAgICAgICAgICAgICAgICAgICBuYW5kCj4gRXJhc2Vi
bG9jayBzaXplOiAgICAgICAgICAgICAgICAxMzEwNzIgYnl0ZXMsIDEyOC4wIEtpQgo+IEFtb3Vu
dCBvZiBlcmFzZWJsb2NrczogICAgICAgICAgODE5MiAoMTA3Mzc0MTgyNCBieXRlcywgMTAyNC4w
IE1pQikKPiBNaW5pbXVtIGlucHV0L291dHB1dCB1bml0IHNpemU6IDIwNDggYnl0ZXMKPiBTdWIt
cGFnZSBzaXplOiAgICAgICAgICAgICAgICAgIDIwNDggYnl0ZXMKPiBPT0Igc2l6ZTogICAgICAg
ICAgICAgICAgICAgICAgIDY0IGJ5dGVzCj4gQ2hhcmFjdGVyIGRldmljZSBtYWpvci9taW5vcjog
ICA5MDowCj4gQmFkIGJsb2NrcyBhcmUgYWxsb3dlZDogICAgICAgICB0cnVlCj4gRGV2aWNlIGlz
IHdyaXRhYmxlOiAgICAgICAgICAgICB0cnVlCj4gCj4gIyB1YmluZm8gLWEKPiBVQkkgdmVyc2lv
bjogICAgICAgICAgICAgICAgICAgIDEKPiBDb3VudCBvZiBVQkkgZGV2aWNlczogICAgICAgICAg
IDEKPiBVQkkgY29udHJvbCBkZXZpY2UgbWFqb3IvbWlub3I6IDEwOjU4Cj4gUHJlc2VudCBVQkkg
ZGV2aWNlczogICAgICAgICAgICB1YmkwCj4gCj4gdWJpMAo+IFZvbHVtZXMgY291bnQ6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMwo+IExvZ2ljYWwgZXJhc2VibG9jayBzaXplOiAgICAgICAg
ICAgICAgICAgMTI2OTc2IGJ5dGVzLCAxMjQuMCBLaUIKPiBUb3RhbCBhbW91bnQgb2YgbG9naWNh
bCBlcmFzZWJsb2NrczogICAgIDgxOTIgKDEwNDAxODczOTIgYnl0ZXMsIDk5Mi4wIE1pQikKPiBB
bW91bnQgb2YgYXZhaWxhYmxlIGxvZ2ljYWwgZXJhc2VibG9ja3M6IDAgKDAgYnl0ZXMpCj4gTWF4
aW11bSBjb3VudCBvZiB2b2x1bWVzICAgICAgICAgICAgICAgICAxMjgKPiBDb3VudCBvZiBiYWQg
cGh5c2ljYWwgZXJhc2VibG9ja3M6ICAgICAgIDAKPiBDb3VudCBvZiByZXNlcnZlZCBwaHlzaWNh
bCBlcmFzZWJsb2NrczogIDE2MAo+IEN1cnJlbnQgbWF4aW11bSBlcmFzZSBjb3VudGVyIHZhbHVl
OiAgICAgMzYKPiBNaW5pbXVtIGlucHV0L291dHB1dCB1bml0IHNpemU6ICAgICAgICAgIDIwNDgg
Ynl0ZXMKPiBDaGFyYWN0ZXIgZGV2aWNlIG1ham9yL21pbm9yOiAgICAgICAgICAgIDI0NjowCj4g
UHJlc2VudCB2b2x1bWVzOiAgICAgICAgICAgICAgICAgICAgICAgICAwLCAxLCAyCj4gCj4gVm9s
dW1lIElEOiAgIDAgKG9uIHViaTApCj4gVHlwZTogICAgICAgIGR5bmFtaWMKPiBBbGlnbm1lbnQ6
ICAgMQo+IFNpemU6ICAgICAgICAyNjc2IExFQnMgKDMzOTc4Nzc3NiBieXRlcywgMzI0LjAgTWlC
KQo+IFN0YXRlOiAgICAgICBPSwo+IE5hbWU6ICAgICAgICByZnMyCj4gQ2hhcmFjdGVyIGRldmlj
ZSBtYWpvci9taW5vcjogMjQ2OjEKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IFZvbHVtZSBJRDogICAxIChvbiB1YmkwKQo+IFR5cGU6ICAgICAgICBkeW5hbWljCj4gQWxp
Z25tZW50OiAgIDEKPiBTaXplOiAgICAgICAgMjY3NiBMRUJzICgzMzk3ODc3NzYgYnl0ZXMsIDMy
NC4wIE1pQikKPiBTdGF0ZTogICAgICAgT0sKPiBOYW1lOiAgICAgICAgcmZzMwo+IENoYXJhY3Rl
ciBkZXZpY2UgbWFqb3IvbWlub3I6IDI0NjoyCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBWb2x1bWUgSUQ6ICAgMiAob24gdWJpMCkKPiBUeXBlOiAgICAgICAgZHluYW1p
Ywo+IEFsaWdubWVudDogICAxCj4gU2l6ZTogICAgICAgIDI2NzQgTEVCcyAoMzM5NTMzODI0IGJ5
dGVzLCAzMjMuOCBNaUIpCj4gU3RhdGU6ICAgICAgIE9LCj4gTmFtZTogICAgICAgIGhvbWUKPiBD
aGFyYWN0ZXIgZGV2aWNlIG1ham9yL21pbm9yOiAyNDY6Mwo+IAo+IAo+IEkgYWxyZWFkeSBkZWJ1
Z2dlZCB0aGUgdWJpZnMga2VybmVsIG1vZHVsZSB0byBsb2NhdGUgd2hlcmUgZXhhY3RseSB0aGUg
Cj4gZXJyb3IgaXMgcmV0dXJuZWQsIGFuZCB0aGUgY2FsbCBjaGFpbiBpczoKPiAKPiB1Ymlmc19t
b3VudCAtPiB1Ymlmc19maWxsX3N1cGVyIC0+IG1vdW50X3ViaWZzIC0+IHViaWZzX21vdW50X29y
cGhhbnMg4oaSIAo+IGtpbGxfb3JwaGFucyAtPiBkb19raWxsX29ycGhhbnMgLT4gdWJpZnNfdG5j
X2xvb2t1cCAtPiB1Ymlmc190bmNfbG9jYXRlCj4gCj4gVGhlIHViaWZzX3RuY19sb2NhdGUgZnVu
Y3Rpb24gZmFpbHMgd2l0aCAtRU5PRU5UIGJlY2F1c2UgdGhlIAo+IHViaWZzX2xvb2t1cF9sZXZl
bDAgZnVuY3Rpb24gcmV0dXJucyAwLgo+IAo+IElmIEkgcGF0Y2ggdGhlIG1vdW50X3ViaWZzIGZ1
bmN0aW9uIHRvIGNhbGwgdWJpZnNfbW91bnRfb3JwaGFucyB3aXRoIAo+IHplcm8gZm9yIHRoZSB1
bmNsZWFuIHBhcmFtZXRlciAoaW5zdGVhZCBvZiB0aGUgdmFsdWUgb2YgCj4gYy0+bmVlZF9yZWNv
dmVyeSksIHRoZW4gdGhlIG1vdW50aW5nIHN1Y2NlZWRzLiBBZnRlcndhcmRzLCB3aGVuIAo+IHJl
Ym9vdGluZyBvbmNlIG1vcmUgd2l0aCB0aGUgb3JpZ2luYWwgdW5wYXRjaGVkIGtlcm5lbCwgdGhl
IGZpbGUgc3lzdGVtIAo+IGFwcGVhcnMgdG8gYmUgZml4ZWQgYWdhaW4sIGFuZCBtb3VudGluZyBz
dWNjZWVkcy4KPiAKPiBJJ20gbm90IHJlYWxseSBzdXJlIHdoYXQncyBnb2luZyBvbiB1bmRlciB0
aGUgaG9vZCwgYnV0IGl0IGxvb2tzIGxpa2UgYSAKPiBwcm9ibGVtIHdpdGggdGhlIGhhbmRsaW5n
IG9mIHRoZSBvcnBoYW4gZmlsZXMuIFdpdGggdGhpcyBrbm93bGVkZ2UsIHdlIAo+IGFyZSBub3cg
YWJsZSB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0gcmVsaWFibGUsIGJ5IGRvaW5nIGEgcG93ZXIg
Y3V0IAo+IHdoaWxlIHJ1bm5pbmcgdGhlIGF0dGFjaGVkIHNjcmlwdC4gVGhlIHNjcmlwdHMgY3Jl
YXRlcyBtYW55IGZpbGVzIGluIGEgCj4gbG9vcCwga2VlcHMgdGhlbSBhbGwgb3BlbiBhbmQgcmVt
b3ZlcyB0aGVtIGFnYWluLiBXaXRoIHRoaXMgYXBwcm9hY2ggd2UgCj4gaGl0IHRoZSBwcm9ibGVt
IGFib3V0IG9uY2UgZXZlcnkgdHdvIGF0dGVtcHRzLgo+IAo+IFRoZSBwcm9ibGVtIGFwcGVhcmVk
IGZvciB0aGUgZmlyc3QgdGltZSBhZnRlciB3ZSBzd2l0Y2hlZCBmcm9tIGtlcm5lbCAKPiB2NC43
IHRvIHY1LjMuIEkgdHJpZWQgd2l0aCB2NS40IGFuZCBtYXN0ZXIgdG9vLCBpbiBjYXNlIHdlIGFy
ZSBoaXR0aW5nIGEgCj4gcHJvYmxlbSB0aGF0IGlzIGFscmVhZHkgZml4ZWQsIGJ1dCB0aGV5IHNo
b3cgdGhlIHNhbWUgcHJvYmxlbS4gQWZ0ZXIgCj4gZG9pbmcgc29tZSBiaXNlY3RpbmcsIHRoaXMg
Y29tbWl0IGFwcGVhcnMgdG8gaGF2ZSBpbnRyb2R1Y2VkIHRoZSBwcm9ibGVtOgo+IAo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC9jb21taXQvZnMvdWJpZnMvb3JwaGFuLmM/aWQ9ZWUxNDM4Y2U1ZGM0ZDY3ZGQ4ZGQxZmY1
MTU4MzEyMmE2MWY1YmQ5ZQo+IAo+IEhvdyBjYW4gd2UgZml4IHRoaXM/CgpKdXN0IGFkZGluZyBS
aWNoYXJkIGludG8gdGhlIGxvb3AsIGhlIGlzIG5vdCBhdmFpbGFibGUgcmlnaHQgbm93IGJ1dAp3
aWxsIHByb2JhYmx5IGJlIGludGVyZXN0ZWQgYnkgdGhpcyBpc3N1ZS4gT24gbXkgc2lkZSwgSSBo
YXZlIG5vIGNsdWUgOikKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
