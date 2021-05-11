Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DACDC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 12:25:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A2061919
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 12:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60A2061919
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EYA4VoV+yz4k0fSZvvT6PIt6PTWSwSvtbgc68BX7vkA=; b=WiL62LYLfsXqZgBd7+Kcb5MZS
	mGWtt8/Ks2ENLzlxsjfOwJS0gclpnuQI6YrgYokhTdDAKlRhysUDnXdFQcuAR6WwhV8L4OVjzdcw6
	XAk9e542eQJEJA+o8rcZNaEF/ksaoPtF55Kkpbhtjlr57atZyYzwKW+s0O18KnZ8AqKlVeB1f6aEr
	VnH2Wb0moy/h2yqWf17/8iSJzWGodex96a3+mtuZFiDai2kisDvvZAPsMNSsWVkirkSRCsp2+SOYY
	3/Vfnhuf1NoirPb9/aHp/Poz1OQ/F5K+KumqnZ85oYcwZAx+N/DHMmrP8USetKr/acVgaIMj6eJgj
	dJWFJsqSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRRG-00HMxt-IB; Tue, 11 May 2021 12:24:38 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgO90-00Gdad-BX
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 08:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=vqtdwZZ6jICg7HK3uro65+AMnqut71M3Fqw92oxhYrI=; b=VGKIrIT/GuG36syB77j0to9pfr
 ym08gT810jn6hTjqs9OpsujMkcJS4wRxKJhwJ06FqdZKwYXqVOFs4ytYTEvZN4I8awkL7oU15vUoS
 Hyn39o9HljaylDxqS10XTfkcnz2ARcIcIWR7vLZeDdzSeOKKNKmSEI+Ql8hUaMjxu+1Q6/if4EeGs
 8NXm6EQhq2q74U32rn59b0EdMt0v1GrLwsPRvlLuAaGSv1nUDXXLH0ObsvTsKWotxADpJ8D5vNrWJ
 vrA9tj75WFO8vP0yMEv6x0N3DMRbybAdXJyXxHagDKu9/2GuJp4sIk3ZZuEBLL5QtZ37W/a1Psci2
 +xcPbw2A==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgO8v-009PZc-UW
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 08:53:31 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B0AE32000D;
 Tue, 11 May 2021 08:53:20 +0000 (UTC)
Date: Tue, 11 May 2021 10:53:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YouChing Lin <ycllin@mxic.com.tw>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, juliensu@mxic.com.tw
Subject: Re: [PATCH 0/2] Fix double counting of S/W ECC engines' ECC stat
Message-ID: <20210511105319.0c077fd5@xps13>
In-Reply-To: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>
References: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_015330_282722_C0382016 
X-CRM114-Status: GOOD (  22.73  )
/bin/ln: failed to access
 'reaver_cache/texts/20210511_015330_282722_C0382016': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_015330_282722_C0382016 
X-CRM114-Status: GOOD (  18.98  )
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

SGkgWW91Q2hpbmcsCgpZb3VDaGluZyBMaW4gPHljbGxpbkBteGljLmNvbS50dz4gd3JvdGUgb24g
VHVlLCAxMSBNYXkgMjAyMSAwOTo0MDozMworMDgwMDoKCj4gSGVsbG8sCj4gCj4gVGhpcyBzZXJp
ZXMgZml4IHRoZSBkb3VibGUgY291bnRpbmcgb2YgUy9XIEVDQyBlbmdpbmVzJyBFQ0Mgc3RhdCAK
PiAKPiBJZiB5b3UgdXNlIFNQSS1OQU5EIHdpdGggU1ctRUNDIGVuZ2luZSwgdGhlIEVDQyByZWxh
dGVkIHN0YXRpc3RpY3MKPiAoZWNjX3N0YXRzLmZhaWxlZCAmIGVjY19zdGF0cy5jb3JyZWN0ZWQp
IHdpbGwgYmUgZG91YmxlZCwgYmVjYXVzZQo+IHRob3NlIG51bWJlcnMgd2lsbCBiZSBkb3VibGUt
Y291bnRlZCBpbiBlY2Mtc3ctW2JjaC9oYW1taW5nXS5jIGFuZAo+IGRyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYy4KPiAgICAgCj4gVGhpcyBjYW4gYmUgZm91bmQgYnkgdXNpbmcgbmFuZHRlc3Qv
bmFuZGJpdGVycnMgdmFsaWRhdGlvbi4KCkdvb2QgY2F0Y2ghCgpIb3dldmVyIEkgZG9uJ3QgdGhp
bmsgdGhlIGN1cnJlbnQgZml4IGlzIHZhbGlkIGJlY2F1c2UgdGhlc2UgZW5naW5lcwphcmUgbWVh
bnQgdG8gYmUgdXNlZCBieSB0aGUgcmF3IE5BTkQgY29yZSBhcyB3ZWxsLCBJIHByb3Bvc2Ugc29t
ZXRoaW5nCmxpa2UgdGhlIGJlbG93LCBjYW4geW91IHBsZWFzZSB0ZWxsIG1lIGlmIGl0IHdvcmtz
IGFzIGV4cGVjdGVkPyAobm90CmV2ZW4gYnVpbGQgdGVzdGVkKQoKVGhhbmtzLApNaXF1w6hsCgoK
LS0tLTg8LS0tLQoKQXV0aG9yOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgpEYXRlOiAgIFR1ZSBNYXkgMTEgMTA6NDE6NTYgMjAyMSArMDIwMAoKICAgIG10ZDogc3Bp
bmFuZDogRml4IGRvdWJsZSBjb3VudGluZyBvZiBFQ0Mgc3RhdHMKICAgIAogICAgSW4gdGhlIHJh
dyBOQU5EIHdvcmxkLCBFQ0MgZW5naW5lcyBpbmNyZW1lbnQgZWNjX3N0YXRzIGFuZCB0aGUgZmlu
YWwKICAgIGNhbGxlciBpcyByZXNwb25zaWJsZSBmb3IgcmV0dXJuaW5nIC1FQkFETVNHIGlmIHRo
ZSB2ZXJpZmljYXRpb24KICAgIGZhaWxlZC4KICAgIAogICAgSW4gdGhlIFNQSS1OQU5EIHdvcmxk
IGl0IHdhcyBhIGJpdCBkaWZmZXJlbnQgdW50aWwgbm93IGJlY2F1c2UgdGhlcmUgd2FzCiAgICBv
bmx5IG9uZSBwb3NzaWJsZSBFQ0MgZW5naW5lOiB0aGUgb24tZGllIG9uZS4gSW5kZWVkLCB0aGUK
ICAgIHNwaW5hbmRfbXRkX3JlYWQoKSBjYWxsIHdhcyBpbmNyZW1lbnRpbmcgdGhlIGVjY19zdGF0
cyBjb3VudGVycwogICAgZGVwZW5kaW5nIG9uIHRoZSBvdXRjb21lIG9mIHNwaW5hbmRfY2hlY2tf
ZWNjX3N0YXR1cygpIGRpcmVjdGx5LgogICAgCiAgICBTbyBub3cgbGV0J3Mgc3BsaXQgdGhlIGxv
Z2ljIGxpa2UgdGhpczoKICAgIC0gc3BpbmFuZF9jaGVja19lY2Nfc3RhdHVzKCkgaXMgc3BlY2lm
aWMgdG8gdGhlIFNQSS1OQU5EIG9uLWRpZSBlbmdpbmUKICAgICAgYW5kIGlzIGtlcHQgdmVyeSBz
aW1wbGU6IGl0IGp1c3QgcmV0dXJucyB0aGUgRUNDIHN0YXR1cyAoYm9udXMgcG9pbnQ6CiAgICAg
IHRoZSBjb250ZW50IG9mIHRoaXMgaGVscGVyIGNhbiBiZSBvdmVybG9hZGVkKS4KICAgIC0gc3Bp
bmFuZF9vbmRpZV9lY2NfZmluaXNoX2lvX3JlcSgpIGlzIHRoZSBjYWxsZXIgb2YKICAgICAgc3Bp
bmFuZF9jaGVja19lY2Nfc3RhdHVzKCkgYW5kIHdpbGwgaW5jcmVtZW50IHRoZSBjb3VudGVycyBh
bmQKICAgICAgZXZlbnR1YWxseSByZXR1cm4gLUVCQURNU0cuCiAgICAtIHNwaW5hbmRfbXRkX3Jl
YWQoKSBpcyBub3QgdGllZCB0byB0aGUgb24tZGllIEVDQyBpbXBsZW1lbnRhdGlvbiBhbmQKICAg
ICAgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIHJlc3VsdHMgY29taW5nIGZyb20gb3RoZXIgRUND
IGVuZ2luZXM6IGl0IGhhcwogICAgICB0aGUgcmVzcG9uc2liaWxpdHkgb2YgcmV0dXJuaW5nIHRo
ZSBtYXhpbXVtIG51bWJlciBvZiBiaXRmbGlwcyB3aGljaAogICAgICBoYXBwZW5lZCBkdXJpbmcg
dGhlIGVudGlyZSBvcGVyYXRpb24gYXMgdGhpcyBpcyB0aGUgb25seSBoZWxwZXIgdGhhdAogICAg
ICBpcyBhd2FyZSB0aGF0IHNldmVyYWwgcGFnZXMgbWF5IGJlIHJlYWQgaW4gYSByb3cuCiAgICAK
ICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCmluZGV4IDYxZDkzMmMxYjcxOC4uZGYxMzRjNjE4NTNlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvY29yZS5jCkBAIC0yOTAsNiArMjkwLDggQEAgc3RhdGljIGludCBzcGluYW5kX29uZGll
X2VjY19maW5pc2hfaW9fcmVxKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwKIHsKICAgICAgICBz
dHJ1Y3Qgc3BpbmFuZF9vbmRpZV9lY2NfY29uZiAqZW5naW5lX2NvbmYgPSBuYW5kLT5lY2MuY3R4
LnByaXY7CiAgICAgICAgc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0gbmFuZF90b19z
cGluYW5kKG5hbmQpOworICAgICAgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gc3BpbmFuZF90b19t
dGQoc3BpbmFuZCk7CisgICAgICAgaW50IHJldDsKIAogICAgICAgIGlmIChyZXEtPm1vZGUgPT0g
TVREX09QU19SQVcpCiAgICAgICAgICAgICAgICByZXR1cm4gMDsKQEAgLTI5OSw3ICszMDEsMTMg
QEAgc3RhdGljIGludCBzcGluYW5kX29uZGllX2VjY19maW5pc2hfaW9fcmVxKHN0cnVjdCBuYW5k
X2RldmljZSAqbmFuZCwKICAgICAgICAgICAgICAgIHJldHVybiAwOwogCiAgICAgICAgLyogRmlu
aXNoIGEgcGFnZSB3cml0ZTogY2hlY2sgdGhlIHN0YXR1cywgcmVwb3J0IGVycm9ycy9iaXRmbGlw
cyAqLwotICAgICAgIHJldHVybiBzcGluYW5kX2NoZWNrX2VjY19zdGF0dXMoc3BpbmFuZCwgZW5n
aW5lX2NvbmYtPnN0YXR1cyk7CisgICAgICAgcmV0ID0gc3BpbmFuZF9jaGVja19lY2Nfc3RhdHVz
KHNwaW5hbmQsIGVuZ2luZV9jb25mLT5zdGF0dXMpOworICAgICAgIGlmIChyZXQgPT0gLUVCQURN
U0cpCisgICAgICAgICAgICAgICBtdGQtPmVjY19zdGF0cy5mYWlsZWQrKzsKKyAgICAgICBlbHNl
IGlmIChyZXQgPiAwKQorICAgICAgICAgICAgICAgbXRkLT5lY2Nfc3RhdHMuY29ycmVjdGVkICs9
IHJldDsKKworICAgICAgIHJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgbmFuZF9lY2Nf
ZW5naW5lX29wcyBzcGluYW5kX29uZGllX2VjY19lbmdpbmVfb3BzID0gewpAQCAtNjIwLDEzICs2
MjgsMTAgQEAgc3RhdGljIGludCBzcGluYW5kX210ZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LCBsb2ZmX3QgZnJvbSwKICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwICYmIHJldCAhPSAtRUJB
RE1TRykKICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAKLSAgICAgICAgICAgICAgIGlm
IChyZXQgPT0gLUVCQURNU0cpIHsKKyAgICAgICAgICAgICAgIGlmIChyZXQgPT0gLUVCQURNU0cp
CiAgICAgICAgICAgICAgICAgICAgICAgIGVjY19mYWlsZWQgPSB0cnVlOwotICAgICAgICAgICAg
ICAgICAgICAgICBtdGQtPmVjY19zdGF0cy5mYWlsZWQrKzsKLSAgICAgICAgICAgICAgIH0gZWxz
ZSB7Ci0gICAgICAgICAgICAgICAgICAgICAgIG10ZC0+ZWNjX3N0YXRzLmNvcnJlY3RlZCArPSBy
ZXQ7CisgICAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAgICAgICAgICAgIG1heF9iaXRm
bGlwcyA9IG1heF90KHVuc2lnbmVkIGludCwgbWF4X2JpdGZsaXBzLCByZXQpOwotICAgICAgICAg
ICAgICAgfQogCiAgICAgICAgICAgICAgICByZXQgPSAwOwogICAgICAgICAgICAgICAgb3BzLT5y
ZXRsZW4gKz0gaXRlci5yZXEuZGF0YWxlbjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
