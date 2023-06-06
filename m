Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A404BC7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S9mejIOqKyCtPj10LwmIL4ORhFhK0tWIxWF90KUu4a4=; b=4iuGjUH8KUZjQBon9xcUQbmIIX
	JeH2uLSnNrHCChFvT+TGj8sjG0Sl+8L68F1rjLoT4mhGlfakQnF00zZ+xehe1+Z9F5zXJ6UZI3hBe
	H0VHl/fK8Bhr5pmiM+eIm6Mk8XOXGKXNz8fr6XOnQRvJLsQWIDveG+iwgL0K3S3h/bTwwdsbnOmyI
	OUfE3NsZw2aejpL7K1dXIQsBZYdMFuqZj0IAVXXDrnBfgma30qOS5DVN6GRXBheVfVWAxmVN1SQL4
	QlbHePmQEmp6X2jdR7K/XhJj8Ozot2khMo73X1yiED9/sYp+8xl90/rnpL3bgwTz0qpuTFkbDu45S
	tHHoXWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6WwQ-001swf-38;
	Tue, 06 Jun 2023 13:41:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6WwM-001svQ-0g
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 13:41:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EF2F863CC135;
	Tue,  6 Jun 2023 15:41:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id yUPaWGUO_djX; Tue,  6 Jun 2023 15:41:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8965763CC138;
	Tue,  6 Jun 2023 15:41:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vJ6ehldXma3o; Tue,  6 Jun 2023 15:41:31 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6BB2563CC135;
	Tue,  6 Jun 2023 15:41:31 +0200 (CEST)
Date: Tue, 6 Jun 2023 15:41:31 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Message-ID: <1054147209.3687907.1686058891249.JavaMail.zimbra@nod.at>
In-Reply-To: <ZH8na21G0W8kmY5r@casper.infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org> <20230605165029.2908304-5-willy@infradead.org> <2059298337.3685966.1686001020185.JavaMail.zimbra@nod.at> <ZH6mixCMHce1S+vK@casper.infradead.org> <406990820.3686390.1686032035024.JavaMail.zimbra@nod.at> <ZH8na21G0W8kmY5r@casper.infradead.org>
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Convert do_writepage() to take a folio
Thread-Index: uaaF+94KwZnkY/U9Z1Qd/Y/azzBDWw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_064138_443573_9F8704A0 
X-CRM114-Status: GOOD (  10.74  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hdHRoZXcgV2lsY294IiA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBPbiBUdWUsIEp1biAwNiwgMjAyMyBhdCAwODoxMzo1NUFN
ICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IE1hdHRoZXcsCj4+IAo+PiAtLS0t
LSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+ID4gVm9uOiAiTWF0dGhldyBXaWxjb3giIDx3
aWxseUBpbmZyYWRlYWQub3JnPgo+PiA+IGxlbiBpcyBmb2xpb19zaXplKCksIHdoaWNoIGlzIG5v
dCAwLgo+PiA+IAo+PiA+ICAgICAgICBsZW4gPSBvZmZzZXRfaW5fZm9saW8oZm9saW8sIGlfc2l6
ZSk7Cj4+IAo+PiBvZmZzZXRfaW5fZm9saW8oZm9saW8sIGlfc2l6ZSkgY2FuIGdpdmUgMC4KPiAK
PiBPaCEgIFRoZXJlIGlzIGEgYnVnLCBiZWNhdXNlIGl0IHNob3VsZG4ndCBnZXQgaGVyZSEKPiAK
PiAgICAgICAgLyogSXMgdGhlIGZvbGlvIGZ1bGx5IGluc2lkZSBpX3NpemU/ICovCj4gICAgICAg
IGlmIChmb2xpb19wb3MoZm9saW8pICsgbGVuIDwgaV9zaXplKSB7Cj4gCj4gc2hvdWxkIGJlOgo+
IAo+ICAgICAgICAvKiBJcyB0aGUgZm9saW8gZnVsbHkgaW5zaWRlIGlfc2l6ZT8gKi8KPiAgICAg
ICAgaWYgKGZvbGlvX3Bvcyhmb2xpbykgKyBsZW4gPD0gaV9zaXplKSB7Cj4gCj4gcmlnaHQ/ICBD
b25zaWRlciBhIGZpbGUgd2l0aCBpX3NpemUgNDA5Ni4gIGl0cyBzaW5nbGUtcGFnZSBmb2xpbyB3
aWxsCj4gaGF2ZSBhIHBvcyBvZiAwIGFuZCBhIGxlbmd0aCBvZiA0MDk2LiAgc28gaXQgc2hvdWxk
IGJlIHdyaXR0ZW4gYmFjayBieQo+IHRoZSBmaXJzdCBjYWxsIHRvIGRvX3dyaXRlcGFnZSgpLCBu
b3QgdGhlIGNhc2Ugd2hlcmUgdGhlIGZvbGlvIHN0cmFkZGxlcwo+IGlfc2l6ZS4KCkluZGVlZC4K
V2l0aCB0aGF0IGNoYW5nZSBJIGFncmVlIHRoYXQgZG9fd3JpdGVwYWdlKCkgY2Fubm90IGdldCBj
YWxsZWQgd2l0aCB6ZXJvIGxlbi4KSSdsbCBydW4gbW9yZSB0ZXN0cywgc28gZmFyIGFsbCBpcyBu
aWNlIGFuIHNoaW55LiA6LSkKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
