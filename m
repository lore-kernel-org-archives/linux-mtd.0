Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBABC3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RjyhL/l/J81COxXqWWfZ6rKdiAcdGtOlAvA1VkF+1Rs=; b=qqYiSKhhoTKd7DhJxn92eFGHxL
	TaXJhpYctxdYW0F8TMsjak21ApfMuu5EnWOaz33YftnEjbpejLMBJK564I3Npbsw/dERnfi3cFZZt
	dyUabIeQ+WFM0IOOU50PQ3hv6+l+F3KDYAr9acH6LDs9xUkMzWYPhjd9h2n/Q32wQjAV4g4fnWV28
	S+PwS2kIZwmvvh/v4OutgiCluRiao70ybsWsQaTheS1CvcntsUGElFdbV3Eoseu+YirOcI03h4eIb
	ojVRxg2SlMzHjDaHFs8dkRgVajfGg+P1bYOnOwwWDGNFxN+aj9MH48Jr0NNQU6Kqz6r8dNGPgo0S6
	+4n4Mr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVM4-00000009vj9-3g2t;
	Mon, 12 May 2025 15:46:12 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUzw-00000009rRk-1hjp
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 15:23:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 597E5294730;
	Mon, 12 May 2025 17:23:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ahisx6RyHIWl; Mon, 12 May 2025 17:23:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E64F3298562;
	Mon, 12 May 2025 17:23:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XhBcJvTwNc9D; Mon, 12 May 2025 17:23:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C669F294730;
	Mon, 12 May 2025 17:23:16 +0200 (CEST)
Date: Mon, 12 May 2025 17:23:16 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at>
In-Reply-To: <87r00ugcat.fsf@bootlin.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu> <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu> <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at> <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu> <87r00ugcat.fsf@bootlin.com>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF138 (Linux)/8.8.12_GA_3809)
Thread-Topic: Verify written data in paranoid mode
Thread-Index: 3qRrT5QGF7Kng0yuxs4zby6CU3+jIA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_082320_584866_6A5AACD4 
X-CRM114-Status: GOOD (  11.22  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBUaGUgcHJvYmxlbSB3ZSBfaGF2ZV8gdGhvdWdo
IGhhcHBlbnMgdG8gYmUgYSBiaXQgZGlmZmVyZW50OiBoZXJlIHdlIGFyZQo+PiBibHVyc2VkIHdp
dGggYSBzeXN0ZW0gdGhhdCBjb3JydXB0cyBkYXRhIGF0IGEgbm90aWNlYWJsZQo+PiBwcm9iYWJp
bGl0eS4gQnV0IHRoZSBtb2RlbCBpcyB0aGUgc2FtZTogYSBzdG9jaGFzdGljIHByb2Nlc3MgaW50
cm9kdWNpbmcKPj4gYml0IGVycm9ycyBvbiB3cml0ZS4gQnV0IEkgc2luY2VyZWx5IGhvcGUgbm8g
b25lIGVsc2UgaGFzIHRoaXMgcHJvYmxlbSwKPj4gYW5kIHRoaXMgaXMgKm5vdCogdGhlIHByaW1h
cnkgYWltIG9mIHRoaXMgcGF0Y2g7IGl0IGp1c3QgaGFwcGVucyB0bwo+PiBzb2x2ZSBvdXIgaXNz
dWUgYXMgd2VsbC4gQnV0IEkgaW50ZW5kIGl0IHRvIGJlIHVzZWZ1bCBmb3IgdGhlIGxhcmdlcgo+
PiBMaW51eCBjb21tdW5pdHksIHRodXMgdGhlIHByaW1hcnkgZ29hbCBpcyB0byBzb2x2ZSB0aGUg
Zmlyc3QgaXNzdWUuCj4gCj4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gdGhlcmUgYnV0
IEkgZG9uJ3QgZGlzbGlrZSB0aGlzIGlkZWEKPiBiZWNhdXNlIGl0IG1pZ2h0IGFsc28gaGVscCB0
cm91Ymxlc2hvb3RpbmcgZXJyb3JzIHNvbWV0aW1lcy4gSXQgaXMgdmVyeQo+IGhhcmQgdG8gdW5k
ZXJzdGFuZCBpc3N1ZXMgd2hpY2ggaGFwcGVuIHRvIGJlIGRpc2NvdmVyZWQgd2F5IGFmdGVyIHRo
ZXkKPiBoYXZlIGJlZW4gZ2VuZXJhdGVkICh0eXBpY2FsbHkgZHVyaW5nIGEgcmVhZCwgd2F5IGxh
dGVyIHRoYW4gYSAiZmF1bHR5Igo+IHdyaXRlKS4gSGF2aW5nIHRoaXMgcGFyYW5vaWQgb3B0aW9u
IHdvdWxkIGdpdmUgYSBtb3JlIHN5bmNocm9ub3VzCj4gYXBwcm9hY2ggd2hpY2ggaXMgZWFzaWVy
IHRvIHdvcmsgd2l0aCBzb21ldGltZXMuCgpVQkkgb2ZmZXJzIHRoaXMgYWxyZWFkeSwgdGhlcmUg
aXMgYSB3cml0ZSBzZWxmLWNoZWNrIGFzIHBhcnQgb2YgdGhlIGlvCmNoZWNrcyB0aGF0IGNhbiBi
ZSBlbmFibGVkCnZpYSBkZWJ1Z2ZzIHBlciBVQkkgZGV2aWNlLgpTbyBmb3IgdHJvdWJsZXNob290
aW5nIHRoaXMgc2hvdWxkIGJlIGdvb2QgZW5vdWdoLgpUaGVyZSBpcyByb29tIGZvciBpbXByb3Zl
bWVudCwgdGhvdWdoLiBDdXJyZW50bHkgaXQgdXNlcyB2bWFsbG9jKCkuCgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
