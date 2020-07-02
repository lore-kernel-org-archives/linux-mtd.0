Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F773C433DF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 16:22:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A5420720
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 16:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1LoXA+rA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A5420720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q2ay+VfjBEepJ+p6Q0cxTR/FF0ys/23kCZ0L8BCPdzY=; b=1LoXA+rA/E9xd/J7wgHWL55P2
	Us3shlDTEKwZjdfzIzafqdkAEzqnMv2VL/2FSeaoCHKpKH1pqC/vv658Cz6Uzsybt4bm9oBpzkZOi
	exTvUjnpeoHAE05W8NSqV9DNyNTTyFJmTWXtQpD/q2vicUhFHDUT+hQXiMLEdOs5Mjg4zA+peEDIL
	XLP4FPLDwrGfqJJaDep+r/b9QzFhPvfD4F77wsQdAhgJ9pVhzOQLFd04yy/TB8AINUfSIgc2t9zrJ
	BRbzU9iOObDEQlKCz+1nCpj5UdfeMW2I9FiZ2Kh2LXBcQy0JY6bZepbuHh8uC4+sI9vyWurHQskn+
	jURzE7AUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr1xn-0000cG-FL; Thu, 02 Jul 2020 16:21:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr0hp-0004nF-I6
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 15:00:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 659D1628A662;
 Thu,  2 Jul 2020 17:00:43 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Qm8Edhi-gzBr; Thu,  2 Jul 2020 17:00:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AD73A628A688;
 Thu,  2 Jul 2020 17:00:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id T2HMTipcFD3z; Thu,  2 Jul 2020 17:00:42 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8691F628A662;
 Thu,  2 Jul 2020 17:00:42 +0200 (CEST)
Date: Thu, 2 Jul 2020 17:00:42 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: tglx <tglx@linutronix.de>
Message-ID: <1142766008.83787.1593702042460.JavaMail.zimbra@nod.at>
In-Reply-To: <875zb6t1yf.fsf@nanos.tec.linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
 <20200629090734.GB17241@linutronix.de>
 <1031805083.71374.1593427612787.JavaMail.zimbra@nod.at>
 <875zb6t1yf.fsf@nanos.tec.linutronix.de>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: iA58bVoFNvdLpIHa7kQn+KVghLPu3A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_110053_779433_D81CC200 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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
 Sascha Hauer <s.hauer@pengutronix.de>, david <david@sigma-star.at>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInRnbHgiIDx0Z2x4QGxpbnV0
cm9uaXguZGU+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVG9yYmVuIEhvaG4i
IDx0b3JiZW4uaG9obkBsaW51dHJvbml4LmRlPgo+IENDOiAiYmlnZWFzeSIgPGJpZ2Vhc3lAbGlu
dXRyb25peC5kZT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4s
ICJTYXNjaGEgSGF1ZXIiCj4gPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+LCAiZGF2aWQiIDxkYXZp
ZEBzaWdtYS1zdGFyLmF0Pgo+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAyLiBKdWxpIDIwMjAgMTY6
NDA6MjQKPiBCZXRyZWZmOiBSZTogW1BBVENIIHYyIDAvNF0gdWJpZnM6IHN1cHBvcnQgYXV0aGVu
dGljYXRpb24gd2l0aG91dCBobWFjCgo+IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+IHdyaXRlczoKPj4gVGhlIHN1cGVyYmxvY2sgaXMgc2lnbmVkIGJ5IHRoZSBvZmZsaW5lIGtl
eS4gQXMgc29vbiB5b3Ugc3dpdGNoIHRvIHRoZSBuZXcga2V5Cj4+IHRoZSBzdXBlciBibG9jayBp
cyByZXdyaXR0ZW4gYW5kIGNhbiBubyBsb25nZXIgdmVyaWZpZWQgdGhpcyBrZXkuCj4+IEluc3Rl
YWQgb2YgcmV3cml0aW5nIHRoZSBpZGVhIHdhcyBrZWVwaW5nIGEgY29weS4KPj4KPj4gQW55d2F5
LCBsaWtlIHNhaWQgaW4gdGhlIG90aGVyIG1haWwsIEkgdGhpbmsgaWYgd2UgY2hhbmdlIHRoZSBm
ZWF0dXJlIHRvCj4+ICJrZWVwIG9mZmxpbmUgc2lnbiBrZXkgYW5kIGltcGx5IHJvIG1vdW50IiB0
aGluZ3Mgd2lsbCBiZSBtb3JlIHNtb290aCB3aXRoIGxlc3MKPj4gY29ybmVyCj4+IGNhc2VzLgo+
IAo+IEkgZG9uJ3QgdGhpbmsgc28uIFRoZSBkZXNpcmVkIG1vZGUgaXMgdG8gcHJldmVudCBSVyBt
b3VudHMgZm9yIGEgZmFjdG9yeQo+IHNpZ25lZCBpbWFnZSB3aGljaCBpbXBsaWVzIHRoZSBwcmV2
ZW50aW9uIG9mIHJld3JpdGluZyB0aGUgc3VwZXJibG9jay4KClRoaXMgaXMgZXhhY3RseSB3aGF0
IEknbSBhc2tpbmcgZm9yLgpLZWVwIHRoZSBmYWN0b3J5IHNpZ25lZCBzdXBlciBibG9jayBhbmQg
aW1wbHkgcmVhZC1vbmx5IG1vZGUuCiAgClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
