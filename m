Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B32C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 14:18:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67362208C9
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 14:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cb8fcHU3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RaUV8Xn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67362208C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uIyHpGN1X5o21kBGE0g41uWKxzvOgnWLPs7c9rWmgpU=; b=Cb8fcHU3vZT2mfrV8kFU9xkak
	2hqHy0EJa++D9cuVUnVvhR+5vt7CvSsKHCBc3h+YISxIip58QZqtDbiDa/HL+ayy9KcxC9C0mGOCz
	bwbQ/9rsyWmG8wFKk+KgopTAOKg13CVBnBYliB1h3LNm3jqw0Ndopa2kGOhDQ12ntJ5Atw+xHnkNs
	v+OEhuHv8QLlAW3kdFsYSrA1JFAbswV+2UuyoBCmy6fTxq8riyydRAah1Ic4TtM/sH2gln/6fx0Wt
	CwQ91QOgQwrClSmBKH2QlrDU5Y5wR11EgEsOY5yphCiFfZMWrSO1NjLYtYZy4JJRuYK9LjktW/ljZ
	io3V0+SfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jopAL-0005BT-Cj; Fri, 26 Jun 2020 14:17:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jopAJ-0005BG-TO
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 14:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=gpDlanCsM35F6uaK2Jt5GWUiALXcTakLG1gm5TWgPM8=; b=RaUV8Xn+juUgU53E6q/aLbPlua
 3BaFglZfan+pB2vGeA4MHy7LL0xugCipeVhyHwKyuuIKYf/Bq05otiY0CU5fRI3zMY/kR0/zRwM0H
 dIdT14MBjYHoSWCSC+9ZNBqgdyyCIvZc8TKXnxuuA0AmJcLPk11B+mKfzzuxQZTDZyX5bJoD6pVus
 hoT3xMkrkJecG76NTbXzJnm+exVeJbIEAuEkMX0gC4ichHq10HOyubBG/okZJOovQNpkDhrKlaKMW
 aDd44ZqttPM438SmD6ck3VxmwbXkFVm2AMPNasG6AuRTFBOWGvzhSeymSXQ0mddazVIXMrxShdl9+
 OXXGH+bw==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jopA7-0000XX-DX
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 14:17:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C739462468EB;
 Fri, 26 Jun 2020 16:16:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pf8pbhUAms7i; Fri, 26 Jun 2020 16:16:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 53AA162468EC;
 Fri, 26 Jun 2020 16:16:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SXk340Zv7gUk; Fri, 26 Jun 2020 16:16:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 32DEF62468EB;
 Fri, 26 Jun 2020 16:16:51 +0200 (CEST)
Date: Fri, 26 Jun 2020 16:16:51 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Torben Hohn <torben.hohn@linutronix.de>
Message-ID: <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
In-Reply-To: <20200626112907.13201-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: PdmYS94N9shv2Yye8tGprCFti6n6Kw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_151703_995881_74C8170E 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 tglx <tglx@linutronix.de>, david <david@sigma-star.at>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VG9yYmVuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRvcmJlbiBI
b2huIiA8dG9yYmVuLmhvaG5AbGludXRyb25peC5kZT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4KPiBDQzogImJpZ2Vhc3kiIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+LCAidGdseCIg
PHRnbHhAbGludXRyb25peC5kZT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZz4sICJTYXNjaGEKPiBIYXVlciIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gR2Vz
ZW5kZXQ6IEZyZWl0YWcsIDI2LiBKdW5pIDIwMjAgMTM6Mjk6MDMKPiBCZXRyZWZmOiBbUEFUQ0gg
djIgMC80XSB1Ymlmczogc3VwcG9ydCBhdXRoZW50aWNhdGlvbiB3aXRob3V0IGhtYWMKCj4gVGhp
cyBQUSBhZGRzIHN1cHBvcnQgZm9yIHViaWZzIGF1dGhlbnRpY2F0aW9uIHdpdGhvdXQgSE1BQywK
PiB3aGljaCBvYnZpb3VzbHkgb25seSB3b3JrcyBmb3IgYSByZWFkLW9ubHkgbW91bnQuCj4gCj4g
dWJpYmxvY2sgYW5kIGRtLXZlcml0eSBhcmUgbm90IHN1cHBvcnRlZCBieSB1LWJvb3QsIGFuZAo+
IHRoZSBrZXJuZWwgb24gdGhlIHRhcmdldCBpcyBsb2FkZWQgYnkgdS1ib290IG91dCBvZiB0aGUg
UkZTLgo+IAo+IFRoaXMgaXMgYSBmaXJzdCB0cnkgdG8gaW1wbGVtZW50IHRoaXMuCj4gSXQgYm9v
dHMgZmluZSwgYW5kIHRoZSBXQVJOX09OIGlzIG5vdCB0cmlnZ2VyZWQuCj4gCj4gSSBwbGFuIHRv
IHVwZGF0ZSB0aGUgZG9jcyBhbHNvLCBidXQgaSB3b3VsZCBsaWtlIHRvIGhhdmUKPiBzb21lIHBv
c2l0aXZlIGNvbW1lbnRzIG9uIHRoaXMgYmVmb3JlLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4g
Cj4gLSBhcHBseSBjb21tZW50cyBmcm9tIFNhc2NoYSBhbiByZXZlcnQgdGhlCj4gIHViaWZzX2F1
dGhpY2F0ZWRfKHJlYWR8d3JpdGUpIHN0dWZmLgo+ICBVc2UgdWJpZnNfYXNzZXJ0KGMsICFjLT5y
b19tb3VudCkgaW5zdGVhZC4KPiAtIFByZXZlbnQgcmVtb3VudCBydywgd2hlbiBobWFjLWxlc3Mg
YXV0aGVudGljYXRpb24gaXMgdXNlZAo+IC0gYWRkIG1pc3NpbmcgY2hlY2ssIGZvciBybyBtb2Rl
LCB3aGVuIG5vIGF1dGhfa2V5X25hbWUgaXMgc3BlY2lmaWVkLgoKSSBkaWRuJ3QgZGlnIGRlZXAg
aW50byB0aGUgY29kZSBzbyBmYXIsIEknbSBzdGlsbCBjaGVja2luZyB0aGUgY29uY2VwdC4KCllv
dXIgYXBwcm9hY2ggd29ya3Mgb25seSBvbiBwcmlzdGluZSBvZmZsaW5lIHNpZ25lZCBpbWFnZXMg
ZnJvbSBta2ZzLnViaWZzLgpTbywgaWYgc29tZWJvZHkgZG9lcyB0aGlzLCBpdCB3b24ndCB3b3Jr
OgoKJCBrZXljdGwgcGFkZCBsb2dvbiB1YmlmczphdXRoZnMgQHMgPCBzZWNyZXQua2V5IAokIG1v
dW50IC10IHViaWZzIC9kZXYvdWJpMF8wIC9tbnQvIC1vIGF1dGhfaGFzaF9uYW1lPXNoYTI1Nixh
dXRoX2tleT11YmlmczphdXRoZnMKCi4uLiBjaGFuZ2UgdGhlIGZzIC4uLgoKJCB1bW91bnQgL21u
dAokIG1vdW50IC10IHViaWZzIC9kZXYvdWJpMF8wIC9tbnQvIC1vIGF1dGhfaGFzaF9uYW1lPXNo
YTI1NixybwoKVGhlIHJvIG1vdW50IHdpbGwgZmFpbCBiZWNhdXNlIFVCSUZTIGlzIG5vIGxvbmdl
ciBhYmxlIHRvIHZlcmlmeSB0aGUgc3VwZXIgYmxvY2sKdXNpbmcgdGhlIHN5c3RlbSBrZXkgcmlu
Zy4gSXQgd2FzIG92ZXJ3cml0dGVuIGJ5IHRoZXkgdWJpZnM6YXV0aGZzIGtleS4KCkEgcG9zc2li
bGUgc29sdXRpb24gaXMga2VlcGluZyBhIGNvcHkgb2YgdGhlIG9mZmxpbmUgc2lnbiBrZXkgZm9y
ZXZlciBpbiB0aGUgZnMuCkJ1dCBJJ20gbm90IHN1cmUgd2hldGhlciB0aGlzIGlzIHdpc2UuCgpU
aGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
