Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3788C48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6u7MkKWwBovM6N6rfzakMCBpcYLHJx/Vc+AnajWualA=; b=0wCcPzY7lPqerL
	4ra+T7Xafdb8g9uZJkFbSxCpCAMMLBdK5GT6Gj39twke96X3FTZETbyWhatkJCvPj4BdQ46sJEykp
	hSUu5VSBcjydT/2IX+cLSXikvfFVRZXJDLmc4OJu41jlJNN905NO5CKNQZJGckXMr7EPSJhvloVFQ
	OFQJy+h4/CdQP1IziedyEsWIwAHOnBO6FDt2YUqLBlVbBEpdWdogRiJqFspUdXIAI1r0rvhuWLzw8
	sz8A8xKshg5AhuMX0d3ocFcvrl5bD/njI0PK60X5Kg5YowisWbVsjl1ySTh8C9RhmgBAePWTuI9e9
	ihMW3XkZy6/hgAY9jMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzvX-00000003b9k-0YOG;
	Mon, 05 Feb 2024 14:26:27 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzvU-00000003b8r-06Y6
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:26:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6979B1C0003;
	Mon,  5 Feb 2024 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AC/wHsk6r4rKaMrstkPBqCLcLZEO4rQpDW0EikvYx9k=;
	b=DkEy8pIrVKpoDETj4JXr2udeYFAihq+1wyevfSnhx/SxD9NjAt/666dYSA7SmUZwlm79lt
	XXLvcPZIDDN01E3IaNzjsXfFEaMfLeiYYui9tVKiI/0dXg48yCf/fGotnSErOZPl4j2QGq
	HIZ9Mgiug1DjtjkSTrb0DKCa4Ha/gGvEUx3AOTihMimSL/Q+Tj4hi8K87C3We0f9FEvf5X
	di2NqWMOaR2xIAc8xYXazAelkTNid2FbHw2pJxk+nyhjbBXoPMzjAoJDpfobSC19aBh3fK
	pBbnj29eOlvk3m9oSJYto12B3tvsjtEFWFRZ1dB76hD8fjHFGmWUWR8WmetDwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Takahiro.Kuwano@infineon.com
Subject: Re: [PATCH] mtd: flashchip: explicitly include <linux/wait.h>
Date: Mon,  5 Feb 2024 15:26:20 +0100
Message-Id: <20240205142620.390286-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205100955.149755-1-tudor.ambarus@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'18af7e357033f1a1cee50db2663ef982b4a2226e'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_062624_226718_92F505C0 
X-CRM114-Status: UNSURE (   9.44  )
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

T24gTW9uLCAyMDI0LTAyLTA1IGF0IDEwOjA5OjU1IFVUQywgVHVkb3IgQW1iYXJ1cyB3cm90ZToK
PiBXaGlsZSByZXZpZXdpbmcgdGhlIGh5cGVyYnVzIHNmZHAgcHJvcG9zYWwgdGhlIGZvbGxvd2lu
ZyBwcm9ibGVtIHdhcwo+IG5vdGljZWQ6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5j
bHVkZS9saW51eC9tdGQvZ2VuX3Byb2JlLmg6MTAsCj4gICAgICAgICAgICAgICAgICBmcm9tIGRy
aXZlcnMvbXRkL2h5cGVyYnVzL2h5cGVyYnVzLXNmZHAuYzo2Ogo+IC4vaW5jbHVkZS9saW51eC9t
dGQvZmxhc2hjaGlwLmg6Nzc6OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHdhaXRfcXVl
dWVfaGVhZF904oCZCj4gICAgNzcgfCAgICAgICAgIHdhaXRfcXVldWVfaGVhZF90IHdxOyAvKiBX
YWl0IG9uIGhlcmUgd2hlbiB3ZSdyZSB3YWl0aW5nIGZvciB0aGUgY2hpcAo+ICAgICAgIHwgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fgo+IAo+IEl0IGlzIGdvb2QgcHJhY3RpY2UgdG8gZGlyZWN0
bHkgaW5jbHVkZSBhbGwgaGVhZGVycyB1c2VkLCBpdCBhdm9pZHMKPiBpbXBsaWNpdCBkZXBlbmRl
bmNpZXMgYW5kIHNwdXJpb3VzIGJyZWFrYWdlIGlmIHNvbWVvbmUgcmVhcnJhbmdlcwo+IGhlYWRl
cnMgYW5kIGNhdXNlcyB0aGUgaW1wbGljaXQgaW5jbHVkZSB0byB2YW5pc2guCj4gCj4gRXhwbGlj
aXRseSBpbmNsdWRlIDxsaW51eC93YWl0Lmg+IGluIGluY2x1ZGUvbGludXgvbXRkL2ZsYXNoY2hp
cC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFy
by5vcmc+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
