Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3268E8FDDA
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DdGTPGwlzhCbAEeE5PxhrS8V0uyW3w6IkByqnGLYnk=; b=beMKA1FO6iZQXh
	T8XdDRqqJ3X4q7VQdhuy3MtbTPG/U0wMabov1y1CeM4+66tHZT0axz9EMX86DIXupY0q3jiZscnON
	Fx3JnA8ssyrP/zLGNK8NL2AC6ewDQbAJE+SHGqxf0R/HFr912jsW+bM7zybUn/Ub+7vcCmFUIXSML
	0QJbukkKvW4dSk7oZ5x3rVDIaNPe9UNNdgEwVg3LnIMQBY0jM5hzXeCZ63E0wL0ix4Cj6UrM2IGcS
	DjRL2nApEw65/rIXjiLY2dEkrVKkBAFQcizW7crkKjlPNCwtI1frBYBOHhflFR0HhTVz5uciCd6h8
	uP3meBiUNZChWugEZ8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxP8-00GsbB-0m;
	Wed, 04 Oct 2023 08:38:50 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxP4-00GsWX-1o
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 08:38:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D38C91C000C;
	Wed,  4 Oct 2023 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696408718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6vgCBkt7rW6blUu1BRqn5QGF+LC8IbkSHwOstsKy8w=;
	b=LWZkD/RBtnwEywsU/t8tZrcz14kV0e12XCLbqEmjuXpkSc2LgIeIK4diCZURxdXwmcbaW1
	M1HahH1WKOInNglBAmEDeg+QKBNPzUdPyNI/RShOu0CVNH91L+EOmZ6OtaoaFYNQlzlB1m
	UHiEFhlSAxEFy6UBeFToqs4DB1gHbQFWfFwvL0SNSYJQj93PSgBrZBB+jn4aWZ9zdBJXOz
	2MNN8Rt+KbC2xBwRBV2iWNaiidV15XYpsmbO6f7O07VM0FuIkyRtbLwaEQ7ixGeAIvg8Yk
	YGMXplJoT9/QWmKbaupUVZnmsPSekjA/v98uXKIrHGfCjeGQv3lTo3Srwkcpfg==
Date: Wed, 4 Oct 2023 10:38:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v2] mtd: nand: add support for ts72xx
Message-ID: <20231004103835.55cccdc6@xps-13>
In-Reply-To: <20231004082223.12762-1-nikita.shubin@maquefel.me>
References: <20231004082223.12762-1-nikita.shubin@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_013846_910424_EEF203CB 
X-CRM114-Status: UNSURE (   9.92  )
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

SGkgTmlraXRhLAoKbmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZSB3cm90ZSBvbiBXZWQsICA0IE9j
dCAyMDIzIDExOjIyOjIzICswMzAwOgoKPiBUZWNobm9sb2dpYyBTeXN0ZW1zIGhhcyBpdCdzIG93
biBuYW5kIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb24gaW4gQ1BMRC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPgo+IC0tLQo+IENo
YW5nZWxvZyB2MjoKPiAtIGRyb3BwZWQgY2hlY2sgZm9yIFJFQURDQUNIRQo+IC0gcmVvcmRlcmVk
IE1ha2VmaWxlCj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIw
MjMwOTI2MTMyNzI1LjVkNTcwZTFiQHhwcy0xMy9ULyNtZDdlNWU5NDRhNmEwOGUyNGY0ZjFlMjAw
NjhhNDlmOTQ3OTRhYjk0NQo+IC0tLQoKWy4uLl0KCj4gK3N0YXRpYyBpbnQgdHM3Mnh4X25hbmRf
ZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICsJCQkgICAgICAgY29uc3Qgc3RydWN0
IG5hbmRfb3BlcmF0aW9uICpvcCwgYm9vbCBjaGVja19vbmx5KQo+ICt7Cj4gKwl1bnNpZ25lZCBp
bnQgaTsKPiArCWludCByZXQ7Cj4gKwoKTWlzc2luZzoKCglpZiAoY2hlY2tfb25seSkKCQlyZXR1
cm4gMDsKCkxHVE0gb3RoZXJ3aXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
