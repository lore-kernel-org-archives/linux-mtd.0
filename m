Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1508EC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMByqmlNoTxyWfYFy220Uq2En0SxDcdRmVPY1C9RBtQ=; b=rEaKDWAvCVT/pM
	kAmIWULbl5eGgb3eRibQr7F41NsJ21/tORBf1LVwsfZuE9wwmwkqmqnWdweiwtnmSmA0GqX8tk57d
	V9L75wJGImE7PHZejz1GhHc79jjY6ZxhXMLrQAFylM4+Tnics90/pia7SRB4JGc2GUxEyvsPq88P/
	bB64/OvnTngk1u/OhbqSw8iNl7RyKBcaLTs9FlbmYQ3eZq8TDF1aJg5aLTlw+oRJgLSEGttTXy6va
	WLoO52mYLfPB9jh6ITVjFnjAShWfqMUDOQIAlXP14Jkh0e5OGxuHFvaZH0e16a81x0kANg8LtnTQO
	BLA6ucps3FYGu1G1z8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHzl-0023dW-Ac; Thu, 09 Jun 2022 13:14:41 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvd-0020wc-P8
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:10:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 61FBF40002;
	Thu,  9 Jun 2022 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXXb6P9Cvl1Zw0pt22LdE638pd3NE17nBJYMk4WRUpQ=;
	b=hq7VmEw3j/yIDUeup7m471TiSKlOzA2mlV5ZB2IjEsMBVyRSRy5nezwp7rwoma8nmsp0jC
	WYfDmg70dhurrG05jWfEuBhIIQwbMev9XxYiSRtWdGI7jzFdTb0JG1gecrPgqE895Y2t+h
	rU4ru4yMyjam2qD44gyxEER3yVd6M74hKMoYA/DVbzw8zt6jFrsV7YsSobXHMLi/vPkgtA
	2dxcgzf/MEmUzzyp/kyzPgfFcQBQU35vKWh5dIUtDBk0By4ZTZIfI3ViIEYuLM3oLfp4ir
	H2Hkan5nLKW5zmpO29afrG1HGwPuvLWlqFmhZnp6ndMdsG0IUz8WaJjMalpZ8g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtdchar: prevent integer overflow in a safety check
Date: Thu,  9 Jun 2022 15:10:22 +0200
Message-Id: <20220609131022.293516-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516070601.11428-2-kernel@kempniu.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a1eda864c04cf24ea1130334963c6199318f6f95'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_061026_020340_74C73540 
X-CRM114-Status: GOOD (  15.90  )
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

T24gTW9uLCAyMDIyLTA1LTE2IGF0IDA3OjA2OjAwIFVUQywgPT91dGYtOD9iP1RXbGphR0hGZ2lC
THhKbHdhV1hGaEE9PT89IHdyb3RlOgo+IENvbW1pdCA2NDIwYWMwYWY5NWQgKCJtdGRjaGFyOiBw
cmV2ZW50IHVuYm91bmRlZCBhbGxvY2F0aW9uIGluIE1FTVdSSVRFCj4gaW9jdGwiKSBhZGRlZCBh
IHNhZmV0eSBjaGVjayB0byBtdGRjaGFyX3dyaXRlX2lvY3RsKCkgd2hpY2ggYXR0ZW1wdHMgdG8K
PiBlbnN1cmUgdGhhdCB0aGUgd3JpdGUgcmVxdWVzdCBzZW50IGJ5IHVzZXIgc3BhY2UgZG9lcyBu
b3QgZXh0ZW5kIGJleW9uZAo+IHRoZSBNVEQgZGV2aWNlJ3Mgc2l6ZS4gIEhvd2V2ZXIsIHRoYXQg
Y2hlY2sgY29udGFpbnMgYW4gYWRkaXRpb24gb2YgdHdvCj4gc3RydWN0IG10ZF93cml0ZV9yZXEg
ZmllbGRzLCAnc3RhcnQnIGFuZCAnbGVuJywgYm90aCBvZiB3aGljaCBhcmUgdTY0Cj4gdmFyaWFi
bGVzLiAgVGhlIHJlc3VsdCBvZiB0aGF0IGFkZGl0aW9uIGNhbiBvdmVyZmxvdywgYWxsb3dpbmcg
dGhlCj4gc2FmZXR5IGNoZWNrIHRvIGJlIGJ5cGFzc2VkLgo+IAo+IFRoZSBhcmd1YWJseSBzaW1w
bGVzdCBmaXggLSBjaGFuZ2luZyB0aGUgZGF0YSB0eXBlcyBvZiB0aGUgcmVsZXZhbnQKPiBzdHJ1
Y3QgbXRkX3dyaXRlX3JlcSBmaWVsZHMgLSBpcyBub3QgZmVhc2libGUgYXMgaXQgd291bGQgYnJl
YWsgdXNlcgo+IHNwYWNlLgo+IAo+IEZpeCBieSBtYWtpbmcgbXRkY2hhcl93cml0ZV9pb2N0bCgp
IHRydW5jYXRlIHRoZSB2YWx1ZSBwcm92aWRlZCBieSB1c2VyCj4gc3BhY2UgaW4gdGhlICdsZW4n
IGZpZWxkIG9mIHN0cnVjdCBtdGRfd3JpdGVfcmVxLCBzbyB0aGF0IG9ubHkgdGhlIGxvd2VyCj4g
MzIgYml0cyBvZiB0aGF0IGZpZWxkIGFyZSB1c2VkLCBwcmV2ZW50aW5nIHRoZSBvdmVyZmxvdy4K
PiAKPiBXaGlsZSB0aGUgJ29vYmxlbicgZmllbGQgb2Ygc3RydWN0IG10ZF93cml0ZV9yZXEgaXMg
bm90IGN1cnJlbnRseSB1c2VkCj4gaW4gYW55IHNpbWlsYXJseSBmbGF3ZWQgc2FmZXR5IGNoZWNr
LCBhbHNvIHRydW5jYXRlIGl0IHRvIDMyIGJpdHMsIGZvcgo+IGNvbnNpc3RlbmN5IHdpdGggdGhl
ICdsZW4nIGZpZWxkIGFuZCB3aXRoIG90aGVyIE1URCByb3V0aW5lcyBoYW5kbGluZwo+IE9PQiBk
YXRhLgo+IAo+IFVwZGF0ZSBpbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCBhY2NvcmRpbmdseS4K
PiAKPiBTdWdnZXN0ZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4g
U2lnbmVkLW9mZi1ieTogTWljaGHFgiBLxJlwaWXFhCA8a2VybmVsQGtlbXBuaXUucGw+CgpBcHBs
aWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210
ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
