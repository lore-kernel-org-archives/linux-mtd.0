Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57312C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 22:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WrmRvYIKn31DN+GnNhqQsI2F8paI3uDqtJ0bTfm5Idg=; b=BZtx+xEwHiPXjvhApSX7iTaWdW
	bQr182BxH82gPBTcaL6rxvuiP5mboFDNrrHvNBb9g+CxjKZyAPbCTZbXPxJnyEN537jph+jbSGhSC
	rIMYOrAvFeSeRTmZFphAl42jRFZ6poxgF3LGxkIgBND92NaAnZCsogfFD3iNeU++H1j7x17UXpiPv
	xP6pPQ2LKftTl/IUYxVh0lEOR31HVGdwS/tToCOwqyUt9r2F85kJjHebpKzxdR28o53iD+fG1Jux4
	DdzOrfVReTJaByypFunDugmTVYsdM3YCeOpOO+7RVrITN2oY9dUt7wkYGqBq1PkuSss9CFMknDEqv
	jwRQm1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUbgv-00EOKH-Vi; Wed, 16 Mar 2022 22:00:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUbgt-00EOJ5-0L
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 22:00:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 741E76081104;
 Wed, 16 Mar 2022 23:00:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SdOFjOGIOYjO; Wed, 16 Mar 2022 23:00:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8F5366081107;
 Wed, 16 Mar 2022 23:00:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Z-NKGvmhIHbB; Wed, 16 Mar 2022 23:00:12 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6C6776081104;
 Wed, 16 Mar 2022 23:00:12 +0100 (CET)
Date: Wed, 16 Mar 2022 23:00:12 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: libaokun <libaokun1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 yukuai3 <yukuai3@huawei.com>, chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <157336576.152785.1647468012272.JavaMail.zimbra@nod.at>
In-Reply-To: <dc55e8b3-7d22-6024-374d-4ed126e18c42@huawei.com>
References: <20220215040736.2839939-1-libaokun1@huawei.com>
 <dc55e8b3-7d22-6024-374d-4ed126e18c42@huawei.com>
Subject: Re: [PATCH -next] ubifs: rename_whiteout: correct old_dir size
 computing
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: rename_whiteout: correct old_dir size computing
Thread-Index: qEsEa6jzfGu0qBp13jytxNkZcU+ggw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_150023_204775_B8393A8D 
X-CRM114-Status: UNSURE (   7.75  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImxpYmFva3VuIiA8bGliYW9r
dW4xQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAibGludXgt
bXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIgo+IDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+IENDOiAieXVrdWFpMyIgPHl1a3VhaTNAaHVh
d2VpLmNvbT4sICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJsaWJh
b2t1biIgPGxpYmFva3VuMUBodWF3ZWkuY29tPgo+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAxMC4g
TcOkcnogMjAyMiAwOTozMjo1Nwo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggLW5leHRdIHViaWZzOiBy
ZW5hbWVfd2hpdGVvdXQ6IGNvcnJlY3Qgb2xkX2RpciBzaXplIGNvbXB1dGluZwoKPiBBIGdlbnRs
ZSBwaW5nLCBzb3JyeSBmb3IgdGhlIG5vaXNlLgoKSSBoYXZlIHRvIHNheSBzb3JyeSBmb3IgdGhl
IGRheS4KVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIHdpdGggbWUuCiAKPiAKPiDlnKggMjAyMi8y
LzE1IDEyOjA3LCBCYW9rdW4gTGkg5YaZ6YGTOgo+PiBXaGVuIHJlbmFtaW5nIHRoZSB3aGl0ZW91
dCBmaWxlLCB0aGUgb2xkIHdoaXRlb3V0IGZpbGUgaXMgbm90IGRlbGV0ZWQuCj4+IFRoZXJlZm9y
ZSwgd2UgYWRkIHRoZSBvbGQgZGVudHJ5IHNpemUgdG8gdGhlIG9sZCBkaXIgbGlrZSBYRlMuCj4+
IE90aGVyd2lzZSwgYW4gZXJyb3IgbWF5IGJlIHJlcG9ydGVkIGR1ZSB0byBgZnNja2ktPmNhbGNf
c3ogIT0gZnNja2ktPnNpemVgCj4+IGluIGNoZWNrX2luZGVzLgo+Pgo+PiBGaXhlczogOWUwYTFm
ZmY4ZGI1NmVhICgidWJpZnM6IEltcGxlbWVudCBSRU5BTUVfV0hJVEVPVVQiKQo+PiBSZXBvcnRl
ZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogQmFva3VuIExpIDxsaWJhb2t1bjFAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZnMvdWJp
ZnMvZGlyLmMgfCAzICsrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2Rpci5jIGIvZnMvdWJpZnMvZGlyLmMKPj4gaW5kZXgg
YWUwODJhMGJlMmEzLi44NjE1MTg4OTU0OGUgMTAwNjQ0Cj4+IC0tLSBhL2ZzL3ViaWZzL2Rpci5j
Cj4+ICsrKyBiL2ZzL3ViaWZzL2Rpci5jCj4+IEBAIC0xNDAyLDYgKzE0MDIsOSBAQCBzdGF0aWMg
aW50IGRvX3JlbmFtZShzdHJ1Y3QgaW5vZGUgKm9sZF9kaXIsIHN0cnVjdCBkZW50cnkKPj4gKm9s
ZF9kZW50cnksCj4+ICAgCQkJaXB1dCh3aGl0ZW91dCk7Cj4+ICAgCQkJZ290byBvdXRfcmVsZWFz
ZTsKPj4gICAJCX0KPj4gKwo+PiArCQkvKiBBZGQgdGhlIG9sZF9kZW50cnkgc2l6ZSB0byB0aGUg
b2xkX2RpciBzaXplLiAqLwo+PiArCQlvbGRfc3ogLT0gQ0FMQ19ERU5UX1NJWkUoZm5hbWVfbGVu
KCZvbGRfbm0pKTsKClNvIHlvdSBiYXNpY2FsbHkgcmVzZXQgb2xkX3N6IGJhY2sgdG8gMD8KClRo
YW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
