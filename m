Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC27BCDD1D6
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=b/2uAZDF5tH3fokBdZPJgorddTgZRTm+f1RFdXesPPo=; b=1W0cFJ0QBV5ianrIY2KrUGlRkx
	LanG3+Pqx6Kloij6Gib+AiKAHaF9fU525tgjAqI2ejihpw5NvTohXa2Bm3yLtY5AN1eN2mkVCgc6x
	DxTApXkaYDMqjt2bKFa+5Hj2SxrFVBPlb+Z0CIVpDOKfDYbZ9iyTRzbrenAU/QzCCfFJUwsMmDgqI
	VBR3yDagJjdLLheIdLwzo1NqEPyqAheplliQoc9YkcYKn8k9o8wr9SDG0krxR6Az+mnChSZpSINfR
	6eR9Useazh7+ZrSRWYqsY5yBf+53q7684eIwae3hzJTjVzwouuyCR/Fsd0JidqfN98VRK91JDLdTi
	/TyOcrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svMTT-00000000glG-30KJ;
	Mon, 30 Sep 2024 19:54:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMTD-00000000ghC-0Byx
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 19:54:26 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 665C463CF3E8;
	Mon, 30 Sep 2024 21:54:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id PkYbUnff558D; Mon, 30 Sep 2024 21:54:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CFEF963CF3E7;
	Mon, 30 Sep 2024 21:54:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GHvTMUPSlfO9; Mon, 30 Sep 2024 21:54:07 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9286964CD87E;
	Mon, 30 Sep 2024 21:54:07 +0200 (CEST)
Date: Mon, 30 Sep 2024 21:54:07 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, robh <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, John Crispin <john@phrozen.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1249604143.124110.1727726047386.JavaMail.zimbra@nod.at>
In-Reply-To: <Zvr-hOM2DfveaqeC@makrotopia.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org> <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org> <251386789.117942.1727612762462.JavaMail.zimbra@nod.at> <ed98871a-b41a-9755-4eed-18ad9e00869c@huawei.com> <364911897.123906.1727721820227.JavaMail.zimbra@nod.at> <Zvr-hOM2DfveaqeC@makrotopia.org>
Subject: Re: [PATCH RFC 2/2] mtd: ubi: add support for protecting critical
 volumes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF130 (Linux)/8.8.12_GA_3809)
Thread-Topic: add support for protecting critical volumes
Thread-Index: aeGJjhImZZ32HQn7G/dgrummX5ojmQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_125411_248136_4D6FBC04 
X-CRM114-Status: GOOD (  13.01  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPj4gbGlrZSBhIHViaXJtdm9sIC4uLiAtLWkta25vdy13aGF0
LWltLWRvaW5nLgo+IAo+IFRydWUsIGVuZm9yY2VtZW50IGRvZXNuJ3QgbmVlZCB0byBoYXBwZW4g
aW4ga2VybmVsICh0aG91Z2ggSSB0aGluayBpdCdzCj4gbmljZXIsIGJ1dCByZWFsbHkganVzdCBh
IG1hdHRlciBvZiB0YXN0ZSwgSSBndWVzcykuIHViaS10b29scyB3b3VsZCBzdGlsbAo+IG5lZWQg
dG8gYmUgYWJsZSB0byByZWNvZ25pemUgY3JpdGljYWwgdm9sdW1lcyBzb21laG93LCBhbmQgdGhh
dCBjb3VsZCBiZQo+IGRvbmUgYnkgY2hlY2tpbmcgaWYgdGhlICd2b2x1bWUtaXMtY3JpdGljYWwn
IHByb3BlcnR5IGlzIHByZXNlbnQgaW4KPiAvc3lzL2NsYXNzL3ViaS91YmkqXyovb2Zfbm9kZS8K
CkV4YWN0bHkuCkkgYWxzbyBkb24ndCBtaW5kIGFkZGluZyBhIGluLW1lbW9yeSAndm9sdW1lLWlz
LWNyaXRpY2FsJyBwcm9wZXJ0eSB0bwpVQkkgZGlyZWN0bHkuIEknbSBqdXN0IGEgbGl0dGxlIGhl
c2l0YXRlZCB0byBjaGFuZ2UgdGhlIFVBUEkgb3IgdGhlIG9uLWRpc2sKZGF0YSBzdHJ1Y3R1cmVz
IGZvciB0aGlzIGZlYXR1cmVzLgogCj4gSWYgeW91IHByZWZlciBnb2luZyBkb3duIHRoYXQgcm9h
ZCBpbnN0ZWFkIEkgd2lsbCB3b3JrIG9uIHBhdGNoZXMgZm9yCj4gZ2l0LmluZnJhZGVhZC5vcmcv
bXRkLXV0aWxzLmdpdCBpbnN0ZWFkLgoKWWVzLiBXaGVuIGRvbmUgaW4gdXNlcnNwYWNlLCBpdCdz
IGFsc28gbXVjaCBlYXNpZXIgdG8gb2ZmZXIgdGhlIC0taS1rbm93LXdoYXQtaW0tZG9pbmcKZmxh
ZyB0byBzdGlsbCByZW1vdmUgYSBjcml0aWNhbCB2b2x1bWUuCk5vIG5lZWQgdG8gdG91Y2ggVUFQ
SS4KClpoaWhhbyBDaGVuZywgd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBhcHByb2FjaD8K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
