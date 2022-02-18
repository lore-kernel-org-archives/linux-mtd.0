Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F391BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF/KZC7gSP42nEqKhJK8KhgmapLd2qHj+uFWIvyojDQ=; b=AO1UbQs28q/B7w
	CBn9bc2JklYuU+OIG+WPFNBDg37d9YcwN7rXdNUm4av2iEUvTZvY7yIvM1L7ZynEaC/oPxI1oH9sC
	Wp4Rphr6M1qL50YcX4houSaKzDXpAVUF46SZHyi6rd++3devi6Bl2Iq2ECDraE5BqsDGKLgXj0A7M
	L1xJkcCMLvQkJGmUQqjS9wdUUsd+2MWNzIFfCaWEO7Td5pqGMYICjU1uQ9GT047Jjz4TrZx+3j6BJ
	wkqNCawJUpWRqfc5r0XWn6B6oXOe7KO3ouQIyJDeqvoPp7l41OjffiWTy4IkKKgq6taPxgYgMB+dc
	fUjjNS5OWm2VfGfeKcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Wb-00EfWT-D2; Fri, 18 Feb 2022 13:42:17 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3Dl-00EXH5-VN
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 13:22:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3FC0120005;
 Fri, 18 Feb 2022 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645190565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJEWhVniuoP8Wv8IPEKZ0mxt7FVUl58XIp244xy2duY=;
 b=LzULFzHXsRRMF/aaeUa6mektFIhZ/f4dORt1x78hcfXZk8QMj48BuH8gh7qoyc6wfcHThY
 zhrt5FC4FAdBUMV3YeI9NOiNpSXdyoWP2+MPZ8TcIosg1qGrBg7UOYgDgQ+qg4yvRYpBth
 v+8+KxvTRGdZLKZYke3qEFEeqdJwnss38RIEmQDMkmPltaoPB6hegkO0F3oynxVYfL8OOX
 yHnsv9FKWxmRQLWLJwBMH/z8ewDRHmiRRyICIAikcrZLlGFK9bR4ZtIHZhqUdAHGOE6wgI
 Dquwt5s2PGZTUWEYb3u3Wuggoi3NK9KEHevrLyJG5F1cByqvFwD2YNNtRkbxOQ==
Date: Fri, 18 Feb 2022 14:22:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <robh+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <p.yadav@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
 <chenshumin86@sina.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtd: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Message-ID: <20220218142241.7a86aebb@xps13>
In-Reply-To: <20220217144755.270679-5-christophe.kerello@foss.st.com>
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-5-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_052250_294320_DC0F1CA8 
X-CRM114-Status: GOOD (  15.46  )
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

SGkgU3Jpbml2YXMsCgpjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20gd3JvdGUgb24gVGh1
LCAxNyBGZWIgMjAyMiAxNTo0Nzo1NSArMDEwMDoKCj4gV3AtZ3Bpb3MgcHJvcGVydHkgY2FuIGJl
IHVzZWQgb24gTlZNRU0gbm9kZXMgYW5kIHRoZSBzYW1lIHByb3BlcnR5IGNhbgo+IGJlIGFsc28g
dXNlZCBvbiBNVEQgTkFORCBub2Rlcy4gSW4gY2FzZSBvZiB0aGUgd3AtZ3Bpb3MgcHJvcGVydHkg
aXMKPiBkZWZpbmVkIGF0IE5BTkQgbGV2ZWwgbm9kZSwgdGhlIEdQSU8gbWFuYWdlbWVudCBpcyBk
b25lIGF0IE5BTkQgZHJpdmVyCj4gbGV2ZWwuIFdyaXRlIHByb3RlY3QgaXMgZGlzYWJsZWQgd2hl
biB0aGUgZHJpdmVyIGlzIHByb2JlZCBvciByZXN1bWVkCj4gYW5kIGlzIGVuYWJsZWQgd2hlbiB0
aGUgZHJpdmVyIGlzIHJlbGVhc2VkIG9yIHN1c3BlbmRlZC4KPiAKPiBXaGVuIG5vIHBhcnRpdGlv
bnMgYXJlIGRlZmluZWQgaW4gdGhlIE5BTkQgRFQgbm9kZSwgdGhlbiB0aGUgTkFORCBEVCBub2Rl
Cj4gd2lsbCBiZSBwYXNzZWQgdG8gTlZNRU0gZnJhbWV3b3JrLiBJZiB3cC1ncGlvcyBwcm9wZXJ0
eSBpcyBkZWZpbmVkIGluCj4gdGhpcyBub2RlLCB0aGUgR1BJTyByZXNvdXJjZSBpcyB0YWtlbiB0
d2ljZSBhbmQgdGhlIE5BTkQgY29udHJvbGxlcgo+IGRyaXZlciBmYWlscyB0byBwcm9iZS4KPiAK
PiBBIG5ldyBCb29sZWFuIGZsYWcgbmFtZWQgaWdub3JlX3dwIGhhcyBiZWVuIGFkZGVkIGluIG52
bWVtX2NvbmZpZy4KPiBJbiBjYXNlIGlnbm9yZV93cCBpcyBzZXQsIGl0IG1lYW5zIHRoYXQgdGhl
IEdQSU8gaXMgaGFuZGxlZCBieSB0aGUKPiBwcm92aWRlci4gTGV0cyBzZXQgdGhpcyBmbGFnIGlu
IE1URCBsYXllciB0byBhdm9pZCB0aGUgY29uZmxpY3Qgb24KPiB3cF9ncGlvcyBwcm9wZXJ0eS4K
PiAKPiBGaXhlczogMmExMjdkYTQ2MWE5ICgibnZtZW06IGFkZCBzdXBwb3J0IGZvciB0aGUgd3Jp
dGUtcHJvdGVjdCBwaW4iKQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hy
aXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
CgpZb3UgY2FuIHRha2UgcGF0Y2hlcyAzIGFuZCA0IHRocm91Z2ggdGhlIG52bWVtIHRyZWUuCgpB
Y2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
