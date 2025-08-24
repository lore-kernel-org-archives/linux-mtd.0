Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EDDCA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyoGIJito8TMwiLfZtYG8vsmtV+ECkMfOjxFFoPI82I=; b=QXhAfB0jOFxmAd
	SnR2uFuFvHFuxQgYg55SF4aPwAmMSvCJa5ELz3crYti99zLwvpk20iFVUpRVkINlmInBS6dBNEgMn
	BAvFItMXRCr3ZD/SqjrSURPgqyoucESvS2eVpEVn7B0qLd89VzpWlE5kV7HEMUB9PO7Y805WbzZtS
	oGs2dbwHYRluNN08b+d5gRGRsisCC8BSeKj6T9Wf4OFc/WQp/OCBJ0sNHZrQnV1TVMxWiarxDE1iB
	uo0oVDuXF9aN1n+WVpaQ8vLZWbli5bErvLVcHvW0ih46o7ZoL47uPDNH58UOsGiXspkA9dp2+Ykh8
	4ezq30f04TvZt/0SFgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqE7i-00000006NLO-0SFB;
	Sun, 24 Aug 2025 17:03:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqE7f-00000006NL1-0UfA
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 17:03:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B2E01A0DA4;
	Sun, 24 Aug 2025 17:03:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 558BB605F1;
	Sun, 24 Aug 2025 17:03:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9145F1C228A5B;
	Sun, 24 Aug 2025 19:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756054990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HzrQ8UsauV0uUlBYYQNKljD4+gLMnEGKsLGyhjx5bAE=;
	b=2QYZ761sM6UEzTwDs7IDwJ1Mhr0mMkKFYPkGknyM6LPizE1YHI2TEhcVYBPBlHRTbwspo5
	j0ypVgVv0Jv974DCPhBwnI337qtdAFX/8FvCZWCYRy+AKPVoMdAmrxxTwHSPTI7TfucYGi
	oMx5z/qpOCYEXcWSNO5CLDufO36f6MCz5JZvgtTIkuoxhqNoZNOqFBZLhrd9XIEz6rC6oL
	fFuNyF3jm7jitetwI+KSz4Xb3lYvjk4KtJz6J3ERyswHNkTpe2KhEULFRwcCxMCe5Fuhv3
	HlMCJzMOG40NdhBM6H+RIxCxVrDrc5X3CagXUQXyEOQm3I8gaM+uU5bZJkqX6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  richard@nod.at,  vigneshr@ti.com,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  p-mantena@ti.com,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  a-dutta@ti.com,  u-kumar1@ti.com,  praneeth@ti.com
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk> (Mark
	Brown's message of "Wed, 13 Aug 2025 21:26:06 +0100")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com>
	<6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 19:02:56 +0200
Message-ID: <87cy8khcu7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_100315_290210_57CA8534 
X-CRM114-Status: GOOD (  11.98  )
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

SGVsbG8sCgpPbiAxMy8wOC8yMDI1IGF0IDIxOjI2OjA2ICswMSwgTWFyayBCcm93biA8YnJvb25p
ZUBrZXJuZWwub3JnPiB3cm90ZToKCj4gT24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMDE6MDI6MTBB
TSArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyB3cm90ZToKPj4gRnJvbTogUHJhdHl1c2ggWWFkYXYg
PHByYXR5dXNoQGtlcm5lbC5vcmc+Cj4+IAo+PiBTb21lIGNvbnRyb2xsZXJzIGxpa2UgdGhlIENh
ZGVuY2UgT1NQSSBjb250cm9sbGVyIG5lZWQgdG8gcGVyZm9ybSBhCj4+IHR1bmluZyBzZXF1ZW5j
ZSB0byBvcGVyYXRlIGF0IGhpZ2ggZGF0YSByYXRlcy4gVHVuaW5nIGlzIG5lZWRzIHRvIGhhcHBl
bgo+PiBvbmNlIHRoZSBkZXZpY2UgaXMgc3dpdGNoZWQgdG8gYXBwcm9wcmlhdGUgbW9kZSAoc2F5
IDhTLThTLThTIG9yCj4+IDhELThELThEKS4gQWRkIGEgaG9vayB0aGF0IHNwaS1tZW0gY2xpZW50
IGRldmljZXMgY2FuIGNhbGwgaW4gb3JkZXIgdG8gdHVuZQo+PiB0aGUgY29udHJvbGxlciB0byBv
cGVyYXRlIGluIGEgZ2l2ZW4gbW9kZSBhbmQgZGF0YSByYXRlLgo+PiAKPj4gVGhpcyBpcyBzb21l
d2hhdCBzaW1pbGFyIHRvIGVNTUMvU0QgdHVuaW5nIGZvciBoaWdoZXIgc3BlZWQgbW9kZXMgbGlr
ZQo+PiBIUzIwMCwgYnV0IHRoZXJlIGlzbid0IGEgc3RhbmRhcmQgc3BlY2lmaWNhdGlvbiBhcm91
bmQgdGhlIHNhbWUgdGhvdWdoLgo+Cj4gU2hvdWxkIHdlIGhhdmUgc29tZXRoaW5nIHRoYXQgYmxv
Y2tzIHRoZXNlIHR1bmluZyByZXF1aXJlZCBtb2RlcyB3aXRob3V0Cj4gdGhlIGFwcHJvcHJpYXRl
IHR1bmluZywgYW5kL29yIGFsbG93cyBkaXNjb3Zlcnkgb2Ygd2hpY2ggbW9kZXMgcmVxdWlyZQo+
IHRoaXMgdHVuaW5nPyAgVGhpcyBhbGwgZmVlbHMgdmVyeSBsYW5kbWluZWlzaCAtIGNsaWVudCBk
cml2ZXJzIGp1c3QgaGF2ZQo+IHRvIGtub3cgd2hlbiB0dW5pbmcgaXMgcmVxdWlyZWQuCgpUaGUg
bWF4aW11bSBidXMgZnJlcXVlbmN5IHdpbGwgdGVsbCB3aGV0aGVyIHR1bmluZyBpcyByZWxldmFu
dCBvciBub3QgSQpndWVzcy4KCkluIHRoZSBjYXNlIG9mIHRoZSBDYWRlbmNlIGNvbnRyb2xsZXIs
IHRoZSBidXMgc3BlZWQgaXMga2V5IHRvIGRldGVybWluZQp3aGV0aGVyIGNhbGlicmF0aW9uIHNo
b3VsZCBoYXBwZW4gb3Igbm90IGJlY2F1c2Ugd2hlbiBQSFkgY2FsaWJyYXRpb24gaXMKZW5hYmxl
ZCwgdGhlIFNQSSBidXMgZnJlcXVlbmN5IGlzIGVxdWFsIHRvIHRoZSBjb250cm9sbGVyIGNsb2Nr
IHJhdGUKKHByZS1zY2FsZXJzIGFyZSBieXBhc3NlZCkuCgpTbyB0aGUgY3JpdGVyaWEgZm9yIGVu
YWJsaW5nIGNhbGlicmF0aW9uIGlzOgoKICAgbWF4IFNQSSBidXMgZnJlcSA+PSAgbWluIGNvbnRy
b2xsZXIgY2xvY2sgcmF0ZQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
