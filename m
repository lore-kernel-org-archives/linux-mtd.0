Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030CACCFA16
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zeFVLpidzOCAeBRXOqzwi8WmXedBKI5O3foTOw1nlTg=; b=zrYSCZATq1dcjWf/IFb9b2Hx9P
	nrYMY/1jXYtN8A6hmXhOy4omNdfVzVtGYexfL4AhmkH/2MxpQcZGy4n26mscBGykyCrt8vqtQxXuL
	ULVH3Rkz7DyC8F6yykL/kKEZEUgt1kZ1vW2gFej34dh2ka5OjSIrcVF3BSu/vMtFYR6mF2tO4fRir
	lpW3rQQ+82WLZF+0yYDL3bJkJzN8V9+0LZbfjrgroHZzijwwFUy3cAfI5h1gfnGiAU9KqqvmwpPJ+
	UNHGOi7HZevtBOen5sp9A3tfmIXf7co0M+wk+VWxn+GNuXf0y0rfROa+vdQGFHrOiwK77SyPbYrsT
	N1CtxCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svLND-00000000XrV-1qsD;
	Mon, 30 Sep 2024 18:43:55 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svLN4-00000000XqN-1PKI
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 18:43:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4447664CD871;
	Mon, 30 Sep 2024 20:43:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Vt2OYhpY_iKE; Mon, 30 Sep 2024 20:43:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 807DA63CF3E7;
	Mon, 30 Sep 2024 20:43:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wo08-DoSlZS3; Mon, 30 Sep 2024 20:43:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5BA4264CD871;
	Mon, 30 Sep 2024 20:43:40 +0200 (CEST)
Date: Mon, 30 Sep 2024 20:43:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Daniel Golle <daniel@makrotopia.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, robh <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, John Crispin <john@phrozen.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <364911897.123906.1727721820227.JavaMail.zimbra@nod.at>
In-Reply-To: <ed98871a-b41a-9755-4eed-18ad9e00869c@huawei.com>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org> <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org> <251386789.117942.1727612762462.JavaMail.zimbra@nod.at> <ed98871a-b41a-9755-4eed-18ad9e00869c@huawei.com>
Subject: Re: [PATCH RFC 2/2] mtd: ubi: add support for protecting critical
 volumes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF130 (Linux)/8.8.12_GA_3809)
Thread-Topic: add support for protecting critical volumes
Thread-Index: lFqEN+m/q9e+j70Sp4sOBoOPT5+Uhg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_114346_536391_29D84EBA 
X-CRM114-Status: GOOD (  10.09  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+Pj4gVm9uOiAiRGFuaWVsIEdvbGxlIiA8ZGFuaWVsQG1h
a3JvdG9waWEub3JnPgo+Pj4gQWxsb3cgdGhlIGJvb3QgZmlybXdhcmUgdG8gZGVmaW5lIHZvbHVt
ZXMgd2hpY2ggYXJlIGNyaXRpY2FsIGZvciB0aGUKPj4+IHN5c3RlbSB0byBib290LCBzdWNoIGFz
IHRoZSBib290bG9hZGVyIGl0c2VsZiBpZiBzdG9yZWQgaW5zaWRlIGEgVUJJCj4+PiB2b2x1bWUu
IFByb3RlY3QgY3JpdGljYWwgdm9sdW1lcyBieSBwcmV2ZW50aW5nIHRoZSB1c2VyIGZyb20gcmVt
b3ZpbmcsCj4+PiByZXNpemluZyBvciB3cml0aW5nIHRvIHRoZW0sIGFuZCBhbHNvIHByZXZlbnQg
dGhlIFVCSSBkZXZpY2UgZnJvbQo+Pj4gYmVpbmcgZGV0YWNoZWQgaWYgYSBjcml0aWNhbCB2b2x1
bWUgaXMgcHJlc2VudC4KPj4gCj4+IEkgYWdyZWUgd2l0aCB0aGUgZG91YnRzIHJhaXNlZCBpbiBw
YXRjaCAxLzIsIGlmIHVzZXJzcGFjZSBpcyBzbyBob3N0aWxlCj4+IHRvIGRlbGV0ZSBzeXN0ZW0g
cGFydGl0aW9ucywgdGhlcmUgaXMgbGl0dGxlIGhvcGUuCj4+IEJ1dCBJJ20gc3RpbGwgb3BlbiBm
b3IgZGlzY3Vzc2lvbi4KPiAKPiBZZXMsIEkgYWdyZWUgdGhhdCBpdCBpcyBtZWFuaW5nZnVsIHRv
IHByZXZlbnQgdXNlciBmcm9tIG9wZXJhdGluZwo+IHZvbHVtZXMgYWNjaWRlbnRseS4gSG93IGFi
b3V0IGRvaW5nIHRoYXQgYnkgc29tZSBleGlzdGluZyBtZXRob2RzPyBFZy4KPiBzZWxpbnV4KERl
c2lnbiBzZXBvbGljeSBmb3IgaW9jdGwgY21kKS4KCkFub3RoZXIgdGhvdWdodCwgZG8gd2UgcmVh
bGx5IG5lZWQgdG8gZW5mb3JjZSB0aGlzIGluIGtlcm5lbCBzcGFjZT8KVGVhY2hpbmcgdWJpLXRv
b2xzIHRvIGJlIHN1cGVyIGNhcmVmdWwgd2l0aCBzb21lIHZvbHVtZXMgaXMgYWxzbyBhbiBvcHRp
b24uCgpsaWtlIGEgdWJpcm12b2wgLi4uIC0taS1rbm93LXdoYXQtaW0tZG9pbmcuCgpUaGFua3Ms
Ci8vcmljaGFyZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
