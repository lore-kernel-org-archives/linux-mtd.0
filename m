Return-Path: <SRS0=3D+l=5R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55F5C43331
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 07:42:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C37620772
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 07:42:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ssioEi7b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C37620772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMi1gFnMbwkXX4dbS9qVdt9aJ3TFSxEbWOYclVtp4wk=; b=ssioEi7bCYeOiB
	GvT7Xa9mmjMWIYXrXoN+sS0VgSh39BpFOxwgVd7IjOBbDdy/veKTsMYqSoZwtnPhI+kiJCxSZ5hkf
	ywCiSsy/bdZTtbRQpI3CVwY69XaSvCQ6tYnTK+oCY0z3o5KaqsFNKHdnd3n2FUru4oOahc6RPWQHh
	bl061KB6vFp4yZytkmzFSyvdXC/COT2DutckwYAK3x9lsV+MoYvXOa8qrHR/RrdS6T+pmBzc+PXyl
	oSvaIAcnEXKrz+4BktW5sfc2o9wdrNDKN/pewfMLAOBp+lOD6AidYf0Tl+TyGlKp3zCqrPaiRiVb9
	20uUFelzil5Q6YzGXWkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJY0e-0001V2-UZ; Wed, 01 Apr 2020 07:42:00 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJY0Z-0001U6-Ln
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2020 07:41:57 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6EDC9C000B;
 Wed,  1 Apr 2020 07:41:49 +0000 (UTC)
Date: Wed, 1 Apr 2020 09:41:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200401094148.1786d48a@xps13>
In-Reply-To: <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
 <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com>
 <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_004155_845554_1E631817 
X-CRM114-Status: GOOD (  15.90  )
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgcm9uLAoKcm9uIG1pbm5pY2ggPHJtaW5uaWNoQGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAz
MCBNYXIgMjAyMCAwODo1MzoyMgotMDcwMDoKCj4gT24gTW9uLCBNYXIgMzAsIDIwMjAgYXQgMTI6
MjcgQU0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToK
PiAKPiA+IFdvdWxkIGl0IGJlIGhhcmQgdG8gc3VwcG9ydCBhbiBleHRyYSAnOicgYWZ0ZXIgdGhl
IE1URCBkZXZpY2UgbmFtZT8KPiA+IFRoaXMgd2F5IHdvdWxkIHdvdWxkIGFsbG93IGFueXRoaW5n
IGluc2lkZSB0aGUgb3B0aW9uYWwgJygnICcpJyBidXQKPiA+IHdvdWxkIGtlZXAgdGhlIHRyYWls
aW5nICc6Jy4KPiA+Cj4gPiB0b1RheToKPiA+ICAgICAgICAgbXRkcGFydHM9bmFtZTpwYXJ0MSxw
YXJ0Mgo+ID4KPiA+IFNvOgo+ID4gICAgICAgICBtdGRwYXJ0cz0oMDAwMDowMDoxZi41KToyNTE2
NTgyNChCSU9TKSwtKHNxdWFzaGZzKSAgCj4gCj4gCj4gSSB0aG91Z2h0IGFib3V0IHRoYXQgJzon
IHRvby4gSXQgZG9lcyBhZGQgYSBiaXQgbW9yZSB0byB0aGUgY29kZSwgYW5kCj4gYSBiaXQgbW9y
ZSBpbiB0aGUgd2F5IG9mIGVycm9yIGNhc2VzLiBJIGFsd2F5cyB3b3JyeSwgd2hlbiBjb2RlIGlz
Cj4gZ29pbmcgaW50byBmbGFzaCwKPiBhYm91dCBlcnJvcnMgd2hlcmUgc29tZXRoaW5nIGxvb2tz
IGNsb3NlIHRvIHJpZ2h0IGJ1dCBpcyB3cm9uZy4gKHNheXMKPiB0aGUgcGVyc29uIHdobyBqdXN0
IHR5cGVkIGl0IGluc3RlYWQgb2YgaXMgYSBmZXcgdGltZXMgOi0pCj4gCj4gV2hhdCBpZiB3ZSBk
aWQgdGhpczoKPiBtdGRwYXJ0cz1bMDAwMDowMDoxZi41XTI1MTY1ODI0KEJJT1MpLC0oc3F1YXNo
ZnMpCj4gCj4gSXMgdGhlICJdIiAnZW5vdWdoIGRpZmZlcmVudCcgdGhhdCB3ZSBkbyBub3QgbmVl
ZCB0aGUgJzonPwo+IAo+IEkga2luZCBvZiBsaWtlIHRoZSBbXSBiZXR0ZXIgYW55d2F5IGFzIGl0
IG1ha2VzIHRoZSBtdGRpZCBzdGFuZCBvdXQgYQo+IGJpdCBtb3JlIGZyb20gdGhlIHBhcnQgbmFt
ZXM/IEJ1dCBpcyBpdCBlbm91Z2ggdGhhdCB3ZSBkb24ndCBuZWVkIHRoZQo+ICc6Jz8gV291bGQg
eW91IHN0aWxsIHByZWZlciB0aGUgKCkgYXMgb3Bwb3NlZCB0byB0aGUgW10/CgpJIGxpa2UgdGhl
IFtdIGFzIHdlbGwsIG1heWJlIG1vcmUgdGhhbiAoKSBiZWNhdXNlIGF0IGxlYXN0IGl0IGRvZXMg
bm90CmNvbmZsaWN0IHdpdGggdGhlIHBhcnRpdGlvbiBuYW1lcy4gQnV0IEkgcmVhbGx5IHByZWZl
ciBrZWVwaW5nIHRoZSA6IGlmCnRoZSBjb2RlIGlzIHN0aWxsIHJlYWRhYmxlLgoKSXQgaXMgbXVj
aCBlYXNpZXIgdG8gZXhwbGFpbiB0byBwZW9wbGUgOiAiaWYgeW91IGhhdmUgYSA6IGluIHRoZSBu
YW1lLAplbmNsb3NlIGl0IHdpdGggW10iLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
