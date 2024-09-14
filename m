Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7521C021A3
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Sep 2024 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SE8Kg5QcYFAyTMRgV+x/+KerYBrDQNFySUUpwwCHuag=; b=u2V8B6DIwdPGIU
	/3PivvP1/MXfEvKpMRUd9Gz4usAiS0xM+BZHtlQvjL9VdI5yApLDzWKIIx/Pz7SgzN5uZZ7Z4H8Yz
	vkdDZlUI0CcYRWyFpGLj6ZBOgainy2OTx+PymUwRrLtdyAMEbymwahMfrFDCNW5z3eKjhkVDZ36Es
	q/q5+GMQQxWEWa5zsj5z8H983sM0DGf/zyNeLa1cpopkcHlhJ+KRyGUy7o0GV4rQMj2BhZFYJ6tem
	IzVitUF21HlvXdj6K53e03FeeSbbpXyTngK298gHVBf4vUyPAdq+hYEOnru4zdIPpjtcZPhAHGAV5
	1z71hOWYpgDBsjdhQRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spVGM-00000000uGq-08uj;
	Sat, 14 Sep 2024 16:04:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spVGI-00000000uGM-2kjm
	for linux-mtd@lists.infradead.org;
	Sat, 14 Sep 2024 16:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAA9EA401FE;
	Sat, 14 Sep 2024 16:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6D0C4CEC0;
	Sat, 14 Sep 2024 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726329877;
	bh=bfUeGEvh7a1mIkuFwXR30AywZ3mo3kUOfstEEHfrUTQ=;
	h=From:To:Cc:Subject:Date:From;
	b=vJEmwNFXeLmibIARLRFTfN+HLzGdIuo+1f/grz0K0pFHsWvmef/ULvNXCha1j4HH4
	 uB8P8usDI+Mh4OjRBNk1LF1FvwTWupB72UImzjW3KVV4OnGADo5B8HqJWwKLxGA9Qm
	 jUlRCy9QjlrXEre+opPBLuprGUpyHNyPEcGWJLhZRNAGGgrD5kyUYcqeg5/eUG9htd
	 TADPSaKAu/SJ3H6kSKXZelFQmF2h40l5kV8CDkPj07i21rCw7s6t+ccKlmm+kPbqRD
	 t+rQAWPwYVkeRgZgNW6gM8MBsnT8G/stRL0bT+02PPSF+7OwRhqBV0xetAhYBsQUMk
	 t51K8B8+HL5Tw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org
Subject: [GIT PULL v2] mtd: spi-nor: changes for v6.12
Date: Sat, 14 Sep 2024 18:04:35 +0200
Message-ID: <mafs0o74q9q7g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_090438_782756_4C812286 
X-CRM114-Status: GOOD (  10.06  )
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

SGkgTWlxdWVsLAoKSSBoYXZlIHJlYmFzZWQgbXkgYnJhbmNoIG9udG8gdjYuMTEtcmMxIGFuZCBm
b3JjZSBwdXNoZWQgdGhlIGJyYW5jaCBhbmQKdGFnLiBIZXJlIGlzIHRoZSB1cGRhdGVkIHZlcnNp
b24gb2YgdGhlIHB1bGwgcmVxdWVzdC4KClJlZ2FyZHMsClByYXR5dXNoIFlhZGF2CgpUaGUgZm9s
bG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDg0MDAyOTFlMjg5ZWU2YjJiZjk3NzlmZjFjODNh
MjkxNTAxZjAxN2I6CgogIExpbnV4IDYuMTEtcmMxICgyMDI0LTA3LTI4IDE0OjE5OjU1IC0wNzAw
KQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9z
cGktbm9yL2Zvci02LjEyCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYWM1YmZhOTY4
YjYwZmJhNDA5OTQyYWI1OTRhZDk4NDc5YjRlMTIyMzoKCiAgbXRkOiBzcGktbm9yOiBmaXggZmxh
c2ggcHJvYmluZyAoMjAyNC0wOS0xNCAxNzo1NjozMSArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU1BJIE5PUiBj
aGFuZ2VzIGZvciA2LjEyCgpOb3RhYmxlIGNoYW5nZXM6CgotIEFkZCBXcml0ZSBQcm90ZWN0IHN1
cHBvcnQgZm9yIE4yNVEwNjRBLgoKLSBOZXcgZmxhc2ggc3VwcG9ydCBmb3IgWmV0dGEgWkQyNVEx
MjhDIGFuZCBTcGFuc2lvbiBTMjhIUzI1NlQuCgotIEZpeCBhIE5VTEwgZGVyZWZlcmVuY2UgaW4g
cHJvYmUgcGF0aCBmb3IgZmxhc2hlcyB3aXRob3V0IGEgbmFtZS4gVGhlCiAgcHJvYmUgcGF0aCB0
cmllcyB0byBhY2Nlc3MgdGhlIG5hbWUgd2l0aG91dCBjaGVja2luZyBpdHMgZXhpc3RlbmNlCiAg
Zmlyc3QuIFMyOEhTMjU2VCBpcyB0aGUgZmlyc3QgZmxhc2ggdG8gZGVmaW5lIGl0cyBlbnRyeSB3
aXRob3V0IGEKICBuYW1lLCB1bmNvdmVyaW5nIHRoaXMgaXNzdWUuCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJyaWFuIE5v
cnJpcyAoMSk6CiAgICAgIG10ZDogc3BpLW5vcjogbWljcm9uLXN0OiBBZGQgbjI1cTA2NGEgV1Ag
c3VwcG9ydAoKQ3PDs2vDoXMsIEJlbmNlICgxKToKICAgICAgbXRkOiBzcGktbm9yOiBzc3Q6IEZh
Y3RvciBvdXQgY29tbW9uIHdyaXRlIG9wZXJhdGlvbiB0byBgc3N0X25vcl93cml0ZV9kYXRhKClg
CgpNaWNoYWVsIFdhbGxlICgyKToKICAgICAgbXRkOiBzcGktbm9yOiB3aW5ib25kOiBhZGQgWmV0
dGEgWkQyNVExMjhDIHN1cHBvcnQKICAgICAgbXRkOiBzcGktbm9yOiBmaXggZmxhc2ggcHJvYmlu
ZwoKVGFrYWhpcm8gS3V3YW5vICgxKToKICAgICAgbXRkOiBzcGktbm9yOiBzcGFuc2lvbjogQWRk
IHN1cHBvcnQgZm9yIFMyOEhTMjU2VAoKIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICAgICAg
fCAgMyArKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMgfCAgMiArKwogZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jICB8ICA0ICsrKysKIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
c3N0LmMgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IGRyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jICAgfCAyNiArKysrKysrKysrKysrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMo
LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
