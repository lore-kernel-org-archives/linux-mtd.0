Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB5AC53200
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wySdx4jCKH5ZkqX5QtbGs6mfIs4fUwwqYy5AUGfuRDQ=; b=LBshjwLB6YTjMc
	zUeNCOm3bbbrT8xS0ckmw9xMSUo2Y7XJTbmCgD2QMbnzh/2VRheWASc6ZUaNtVl6eupgGFez30U5K
	CU85MTerz0NT5RtB50X7Tm1zTNszqSewDjNKQ2f0V//kNxZPvb/kykIsQv2MlpoIiNEreyk9fmbwm
	WzhoBYPecoojqVsE153gJ2rJ6Cq4/G8NlJUyKyabcbuK/8Hokdw7fQyPXR+c7mDqVab/JHSRhrCMC
	+VZI+utmRDjvl1qUzisxddjPTMcP7qqaPEFBfhmtTEnPPgJgduLW656kWLKdeUGV5uThzHF1TVuRJ
	HGrU7PDROoyX1a21C6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woznL-00000007Fca-18n5;
	Wed, 29 Jul 2026 08:37:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woznI-00000007FbO-0Ccp
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jul 2026 08:37:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7533E1A12EF;
	Wed, 29 Jul 2026 08:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32D1D603BD;
	Wed, 29 Jul 2026 08:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B4A311C14AEC;
	Wed, 29 Jul 2026 10:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785314256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3IodyGZnKFDzuvbdxVK4kJdIEEZdA2esA+7XyrcqlQc=;
	b=1udvPhs6aNcVxCQqVyU9adFATlbxxyUh3QjebezaE5ZaGB+JI6R4idpk7gkb6SGrOGVJkq
	0rHo91gMwyByUgLSGNnTapOMMylQxmuiR8+FfE60mwEm4+d6CzbBqYB7EtLRMbjNwM/TdN
	guYBfRWWKwrN/BpbLwgqZWDj74J2RPj5j9dmyHkWHTtsOgs6HYlaYScRb9m/o7RvOny9oh
	bpzq/0+dzEqgxVxaLRRvlJT/msfheh2c4DJq/ByvLVeYRkB0ldtDTpAXWlfKWXmUjwGn1d
	e59XAO/iBN5zl3pNeY9YeeufrKb7v172iP1AQz+4YBAIUlGXT3bgsAN8Uy/nAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v6 05/17] spi: spi-mem: add execute_tuning callback and
 spi_mem_execute_tuning()
In-Reply-To: <20260723110219.3180747-6-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 23 Jul 2026 16:32:07 +0530")
References: <20260723110219.3180747-1-s-k6@ti.com>
	<20260723110219.3180747-6-s-k6@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 29 Jul 2026 10:37:31 +0200
Message-ID: <87qzkmmbsk.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_013740_227048_7913FC59 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gU2FudGhvc2gsCgpPbiAyMy8wNy8yMDI2IGF0IDE2OjMyOjA3ICswNTMwLCBTYW50aG9z
aCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IEFkZCBhbiBleGVjdXRlX3R1bmluZyBj
YWxsYmFjayB0byBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29wcy4gVGhlCj4gY2FsbGJhY2sg
cmVjZWl2ZXMgYSBtYW5kYXRvcnkgcmVhZCBvcCB0ZW1wbGF0ZSBhbmQgYW4gb3B0aW9uYWwgd3Jp
dGUgb3AKPiB0ZW1wbGF0ZS4gT24gc3VjY2VzcyB0aGUgY29udHJvbGxlciBzZXRzIG9wLT5tYXhf
ZnJlcSBpbiBlYWNoIHByb3ZpZGVkCj4gdGVtcGxhdGUgdG8gdGhlIHZhbGlkYXRlZCBjbG9jayBy
YXRlLgo+Cj4gQWRkIHRoZSBjb3JyZXNwb25kaW5nIHNwaV9tZW1fZXhlY3V0ZV90dW5pbmcoKSB3
cmFwcGVyIHRoYXQgY2hlY2tzIGZvcgo+IGNhbGxiYWNrIGF2YWlsYWJpbGl0eSBhbmQgcmV0dXJu
cyAtRU9QTk9UU1VQUCB3aGVuIHRoZSBjb250cm9sbGVyIGhhcwo+IG5vdCBpbXBsZW1lbnRlZCBp
dCwgYWxsb3dpbmcgY2FsbGVycyB0byBoYW5kbGUgY29udHJvbGxlcnMgdGhhdCBkbyBub3QKPiBz
dXBwb3J0IHR1bmluZyBncmFjZWZ1bGx5Lgo+Cj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3Vt
YXIgSyA8cy1rNkB0aS5jb20+CgpTYXNoaWtvIGZvdW5kIHR3byBpc3N1ZXMgd2hpY2ggSSB0aGlu
ayBhcmUgZWFzeSB5ZXQgd29ydGggZml4aW5nOgoKLSBbSGlnaF0gc3BpX21lbV9leGVjdXRlX3R1
bmluZygpIGRpcmVjdGx5IGludm9rZXMgdGhlIGNvbnRyb2xsZXIgY2FsbGJhY2sgd2l0aG91dCBh
Y3F1aXJpbmcgdGhlIFNQSSBidXMgbG9ja3Mgb3IgZW5zdXJpbmcgdGhlIGNvbnRyb2xsZXIgaXMg
cG93ZXJlZCBvbi4KLSBbSGlnaF0gc3BpX21lbV9leGVjdXRlX3R1bmluZygpIGRvZXMgbm90IGNo
ZWNrIGlmIHRoZSBTUEkgZGV2aWNlIGlzIHVzaW5nIGEgR1BJTyBjaGlwIHNlbGVjdCBiZWZvcmUg
aW52b2tpbmcgdGhlIGhhcmR3YXJlIHR1bmluZyBjYWxsYmFjay4KCkNhbiB5b3UgcGxlYXNlIGhh
dmUgYSBsb29rPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
