Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41A2D73E80
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 18:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKiwMU1XsJDPwbkwRfSK8pV3xHJHAi9dB3AGT0hlFXQ=; b=OKuYjWGDHIS4Ki
	9peHPNGWFtoYGexeTYapfQw6K9h1pTH7nsLkx0KEXk8O130FWIw6GBpcpVWefTq0oeC3jz+87CQMN
	eCiYtdosUtBmt7SXO2YuA/fZncKcpGSulRf9GNTNvcOGXlyYl+muk1JZihXyIfDszH+2gIryJy70h
	klb8QDCHu+KmByKjkFpEPihZWumxx6rwBixSTGil4mx8A3z82bz9BR7tROcjiVXvqupNRCAMGIVTV
	Xv6VN9kql9Z0e86NrgaeCgJIj+b+2BTYvCmFvcuhT4ThFtOrPBKINgnuQxJd7t+AFWsLIMF/I05ob
	DmZ+BJt6W9ympU87/NAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWus-00000000WZV-3hZ7;
	Thu, 29 Jan 2026 18:38:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWuq-00000000WYm-23z9
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 18:38:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F1A41A2B11;
	Thu, 29 Jan 2026 18:38:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3655D60746;
	Thu, 29 Jan 2026 18:38:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C38B119A880F;
	Thu, 29 Jan 2026 19:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769711929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RgHO2pkUFSgU4t4TLGPUHZGx0S+toOfJKk5R7JzVOLQ=;
	b=rVP9e3X6fXoClBPXCPhoP7BSYBOtTcPNHLgyBvFkcaicQTSZ0X0uowXMx/DwvhujyBREpm
	fM5v7tqFldp6J7Cn93HyKBwUnqXk4BrKLsUg5K87idhTveUn7IRgN/EUjdO8WkmSqaEG6i
	vex6a/y9FF6tTS7uRdHB3gOZsiYfRlRCJRK6bW9JmBnuRLtuNHhD29JcU7NZNdmnrihzEz
	+ndD/0mw6cMsrLB3WRoRxXWJfOyKCb67+fpOoCvWfkXPrOXjezr4+bgZcou+qTXRpuRhVS
	u4X4sGxLpGazqSh7p6CemlnAPcdR429XWDjVSOL4odcVglWaaiSeYmLT5tH59A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,  Junhao Xie
 <bigfoot@radxa.com>,  Konrad Dybcio <konradybcio@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <njrzcyhdkohsmnlisdzu25b6obqotjjrzlrs42jhq5bhlz6qco@mdk5blghdqbc>
	(Bjorn Andersson's message of "Wed, 28 Jan 2026 14:31:33 -0600")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
	<875x8ln7tk.fsf@bootlin.com>
	<njrzcyhdkohsmnlisdzu25b6obqotjjrzlrs42jhq5bhlz6qco@mdk5blghdqbc>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 19:38:44 +0100
Message-ID: <87fr7ol0wb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_103852_665134_49D7D361 
X-CRM114-Status: GOOD (  16.39  )
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

SGVsbG8gQmpvcm4sCgo+PiBJZiBJIG1heSwgSSBldmVuIHNraXBwZWQgdGhlIG1haWwgZW50aXJl
bHkgYmVjYXVzZSBpdCB3YXMgbm90IGFib3V0IG10ZAo+PiBpbiB0aGUgZW5kLiBUaGVyZSBpcyBh
IHNpbmdsZSBiaWcgcGF0Y2ggbGFiZWxsZWQgImZpcm13YXJlOiBxY29tOiIuIEkKPj4gYmVsaWV2
ZSB0aGUgc2VyaWVzIHdvdWxkIGJldHRlciBiZSBzcGxpdCBpbiBzbWFsbGVyIGNodW5rcy4gVHlw
aWNhbGx5Cj4+IG9uZSBmb3IgdGhlIHN0b3JhZ2Ugc3VwcG9ydCBhbmQgYW5vdGhlciBvbmUgZm9y
IHRoZSBmaXJtd2FyZSBwYXJ0LCBhdAo+PiBsZWFzdC4KPj4gCj4KPiBUaGUgZmlybXdhcmUgcGF0
Y2ggYWRkcyB3cmFwcGVycyBmb3IgdGhlIHNlY3VyZSB3b3JsZCBpbnRlcmZhY2UsIHdoaWNoCj4g
d2l0aG91dCB0aGUgTVREIGRyaXZlciB3aWxsIGxhY2sgY29uc3VtZXJzIG9mIHRoZSBBUEkgLSBp
LmUuIEknZCBwcmVmZXIKPiBub3QgdG8gcGljayB0aGF0IHBhcnQsIG9yIHBhcnRzIHRoZXJlb2Ys
IGFsb25lLgoKWWVzLCBJIHVuZGVyc3RhbmQuCgo+IFNvIEkgdGhpbmsgaXQgZG9lcyBtYWtlIHNl
bnNlIHRvIGludHJvZHVjZSB0aGUgdHdvIHBhcnRzIHRvZ2V0aGVyIGluIG9uZQo+IHNlcmllcyAo
aWYgeW91IGhhdmUgYW55IHJlcXVlc3RzIGZvciBzcGxpdHRpbmcgdGhlIE1URCBwYXRjaCB1cCBp
biBhbnkKPiB3YXkgSSBoYXZlIG5vIG9iamVjdGlvbnMpLgo+Cj4gVGhpcyBsZWF2ZXMgdXMgd2l0
aCB0aGUgcHJhY3RpY2FsIHByb2JsZW0gb2YgZ2V0dGluZyBpdCBtZXJnZWQsIHdoaWNoIEkKPiBi
ZWxpZXZlIHdvdWxkIGJlc3QgYmUgaGFuZGxlZCBieSBtZSBwaWNraW5nIHRoZSBmaXJtd2FyZSBw
YXRjaCBhbmQKPiBzaGFyaW5nIHRoaXMgaW4gYW4gaW1tdXRhYmxlIGJyYW5jaCB3aXRoIHlvdSwg
b25jZSB3ZSdyZSBoYXBweSB3aXRoIHRoZQo+IHNldCAod2hpY2ggd29uJ3QgYmUgZm9yIDYuMjAp
LgoKV29ya3MgZm9yIG1lIQoKSSdsbCBzZW5kIGEgbWlub3IgcmV2aWV3IHdpdGggYSBjb3VwbGUg
b2YgY29tbWVudHMsIGJ1dCB3ZSBjYW4gYXBwbHkKdGhpcyBjbG9zZSBhZnRlciBuZXh0IC1yYzEs
IGlmIHlvdSBhcmUgZ29vZCB3aXRoIHRoZSBmdyBwYXJ0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
