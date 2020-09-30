Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523D9C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 21:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C2320759
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 21:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ARWpmg4v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kB0qqgz2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C2320759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6RSVB2g18OZKJ2G3AHPE0/JVXfOYaR0B1Uy/gbtfWqU=; b=ARWpmg4vxqSxwsJ6ciEZKThjYf
	+13Mf/MwKS8BXQSdymE9G9TjjHdutvPFsDBjaB7j3UwVu7srN4aQ6grZOUhvvFqaKBjH7YFfrJTzk
	Xo8lRMJR0jZCM53RcKLZx49DqWEd7/ji5dGI5rS8KrkcoOC5HLGlr+Y3DH0WVH/9zHF0FsoloNFaE
	YUzDji5Yv9hWX3kGSXXf8b9WrPZ5lfJrUZKktBvys7dixX5utFy5Uz53whGJenWg4SwDxHfPxAUQW
	2Euj1OLWnfqtUxn/rndw9lF15jMiKFP/bv0qIjAQGdK2epCa66KW+/oFXbL9sloDDWVtAFsSNaDs5
	NyfPvYvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNjFP-0006oB-Ib; Wed, 30 Sep 2020 21:02:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNjFM-0006nB-OG
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 21:02:45 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A2162071E;
 Wed, 30 Sep 2020 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601499761;
 bh=hEW2lfnz94TX8YvGzA25neEhx4sqLqPCJj+osYv0f84=;
 h=Date:From:To:Cc:Subject:From;
 b=kB0qqgz2Qg5kqmagsLjOnmi5VS9A0KdFC8OuKPMCmSb2lPxu2++Ex4nxbEuKwSUnM
 wIn6zAXZkNhnq6dfT7ziW+s9r4bjatfxBsm+TUVSRjvk0De9MdnqQkidBm6zy/HFp1
 QH7/bokmJ01Sqi/yNifloTTQduQJ4nzPjOkHBiIg=
Date: Wed, 30 Sep 2020 16:08:24 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
Message-ID: <20200930210824.GA12277@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_170244_943053_78534D4B 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUgaGF2aW5nCmEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQpzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCnN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBvZiBhIGZs
ZXhpYmxlLWFycmF5IG1lbWJlcgppbnN0ZWFkIG9mIGEgb25lLWVsZW1lbnQgYXJyYXkuIEFsc28s
IG1ha2UgdXNlIG9mIHRoZSBzdHJ1Y3Rfc2l6ZSgpCmhlbHBlciB0byBjYWxjdWxhdGUgdGhlIHNp
emUgb2YgdGhlIGFsbG9jYXRpb24gZm9yIF9uYW5kXy4gSW4gb3JkZXIKdG8ga2VlcCB0aGUgY29k
ZSBhcyBtYWludGFpbmFibGUgYXMgcG9zc2libGUgYW5kIHRvIGtlZXAgX2NzXyBhcyBhbgphcnJh
eSwgYWRkIGEgbmV3IG1hY3JvIENTX04gdG8gYWlkIGluIHRoZSBhbGxvY2F0aW9uIHNpemUgY2Fs
Y3VsYXRpb24sCmluIGNhc2UgdGhlcmUgaXMgYSBuZWVkIGZvciBtb3JlIENoaXAgU2VsZWN0IElE
cyBpbiB0aGUgZnV0dXJlLiBJbiB0aGUKbWVhbnRpbWUsIHRoZSBtYWNybyBpcyBzZXQgdG8gMS4g
VGhpcyBhbHNvIGF2b2lkcyBoYXZpbmcgdG8gdXNlIGEgbWFnaWMKbnVtYmVyICcxJyBhcyB0aGUg
bGFzdCBhcmd1bWVudCBmb3Igc3RydWN0X3NpemUoKS4KClsxXSBodHRwczovL2VuLndpa2lwZWRp
YS5vcmcvd2lraS9GbGV4aWJsZV9hcnJheV9tZW1iZXIKWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvdjUuOS1yYzEvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjemVyby1sZW5ndGgt
YW5kLW9uZS1lbGVtZW50LWFycmF5cwoKQnVpbGQtdGVzdGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC81Zjc0
NzNjMC5WdjRoNnl6WFNnYTkwUDA0JTI1bGtwQGludGVsLmNvbS8KU2lnbmVkLW9mZi1ieTogR3Vz
dGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3RlZ3JhX25hbmQuYyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3RlZ3JhX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYwpp
bmRleCBmYmY2NzcyMmEwNDkuLjQzYjgzNTlkY2Q4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvdGVncmFfbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25h
bmQuYwpAQCAtMTYzLDYgKzE2Myw5IEBACiAJCQkJSFdTVEFUVVNfUkJTWV9NQVNLKE5BTkRfU1RB
VFVTX1JFQURZKSB8IFwKIAkJCQlIV1NUQVRVU19SQlNZX1ZBTFVFKE5BTkRfU1RBVFVTX1JFQURZ
KSkKIAorLyogTnVtYmVyIG9mIENoaXAgU2VsZWN0cy4gQ3VycmVudGx5LCBvbmx5IG9uZS4gKi8K
KyNkZWZpbmUgQ1NfTgkJCTEKKwogc3RydWN0IHRlZ3JhX25hbmRfY29udHJvbGxlciB7CiAJc3Ry
dWN0IG5hbmRfY29udHJvbGxlciBjb250cm9sbGVyOwogCXN0cnVjdCBkZXZpY2UgKmRldjsKQEAg
LTE4Myw3ICsxODYsNyBAQCBzdHJ1Y3QgdGVncmFfbmFuZF9jaGlwIHsKIAl1MzIgY29uZmlnOwog
CXUzMiBjb25maWdfZWNjOwogCXUzMiBiY2hfY29uZmlnOwotCWludCBjc1sxXTsKKwlpbnQgY3Nb
XTsKIH07CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHRlZ3JhX25hbmRfY29udHJvbGxlciAqCkBA
IC0xMDg2LDE0ICsxMDg5LDE0IEBAIHN0YXRpYyBpbnQgdGVncmFfbmFuZF9jaGlwc19pbml0KHN0
cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JLyogUmV0cmlldmUg
Q1MgaWQsIGN1cnJlbnRseSBvbmx5IHNpbmdsZSBkaWUgTkFORCBzdXBwb3J0ZWQgKi8KKwkvKiBS
ZXRyaWV2ZSBDUyBpZCwgY3VycmVudGx5IG9ubHkgc2luZ2xlLWRpZSBOQU5EIHN1cHBvcnRlZCAq
LwogCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wX25hbmQsICJyZWciLCAmY3MpOwogCWlm
IChyZXQpIHsKIAkJZGV2X2VycihkZXYsICJjb3VsZCBub3QgcmV0cmlldmUgcmVnIHByb3BlcnR5
OiAlZFxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQluYW5kID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpuYW5kKSwgR0ZQX0tFUk5FTCk7CisJbmFuZCA9IGRldm1fa3phbGxvYyhk
ZXYsIHN0cnVjdF9zaXplKG5hbmQsIGNzLCBDU19OKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFuYW5k
KQogCQlyZXR1cm4gLUVOT01FTTsKIAotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
