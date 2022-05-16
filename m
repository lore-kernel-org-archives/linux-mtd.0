Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC400C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MM3O9Mwq14r8BEk3JWgP8rTJgqvvhdlMfucQ6vqJokQ=; b=K+ocXS6xD3MO0K
	Zoxl5PqqxhVKwuvTb7CLClGIZv7Ags+/JcL9Fuyg9TgIbl2ksNhZfMmcEZI6cUZjOqH0HkQ6OKZlL
	udAZCdjqzTJcU2Q3gWjnmEYfmhS7in31rCYW6bwS2Fs64Ap+/deymSbQWv9IazJb4nPEBw2vmrgnw
	6/UA2nnmQofr54nbYzq4QI7V1IBxNrt8ghEbE7Gbs0e6NdfUNRJeeIKzNdjLDmOx0FthOfkdJP50K
	jubjyaiFPWngWaTfgpOslL+ONIBWOaOsDTUmQUczKVJS30nCY3m6DKqSkfDTOveHcPFS2Vk9NjzUi
	15E+70jrWXopkqhveqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdpH-0097S1-6m; Mon, 16 May 2022 16:44:07 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdp5-0097Im-OK
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 16:43:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7FBB7240007;
 Mon, 16 May 2022 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652719431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKC2n8siaU3/m8tasFcxJwqALcqLnpcBpiJpKXLsFnY=;
 b=LJKjhlCNv/6SLWNzKJbI8MOcEldHlSz24SX5QSvzlGevtWd6vdTvBou5qZVoCqnAKWm/OT
 bV50TUXCGYQYd8g1kLGEgDAP7nJXxLH9yutuAS6A1b1oddUg+6ap+M/LgXJDZAeOMPywHZ
 aMIKdpI3GouO3qpi+OCaVIxm23MMt/3CU9OB2lPQOjTK7at9diypdLBq8yeqNp49SzRvvH
 cxAi8yMOxCdW130g2JZGhtkLmCCj9aGnVPGrTL1Aw67Qo9FWQo8+zl3Aub2Bd6WlHxksFl
 EqRFRPlS+d8nHBVKjV1bEQn2JLpqlzXZP4cCe2TgUpPzQFhFjZo0aF19LGp8Tg==
Date: Mon, 16 May 2022 18:43:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH -next v2] mtd: st_spi_fsm: add missing
 clk_disable_unprepare() in stfsm_remove()
Message-ID: <20220516184348.77f5b39d@xps-13>
In-Reply-To: <20220516092911.953066-1-yangyingliang@huawei.com>
References: <20220516092911.953066-1-yangyingliang@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_094356_020005_BB269838 
X-CRM114-Status: GOOD (  13.59  )
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

SGkgWWFuZywKCnlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbSB3cm90ZSBvbiBNb24sIDE2IE1heSAy
MDIyIDE3OjI5OjExICswODAwOgoKPiBDbG9jayBzb3VyY2UgaXMgcHJlcGFyZWQgYW5kIGVuYWJs
ZWQgYnkgY2xrX3ByZXBhcmVfZW5hYmxlKCkKPiBpbiBwcm9iZSBmdW5jdGlvbiwgYnV0IG5vdCBk
aXNhYmxlZCBvciB1bnByZXBhcmVkIGluIHJlbW92ZQo+IGZ1bmN0aW9uLgo+IAoKQXBwbGllZCB0
byBtdGQvbmV4dCwgdGhhbmtzIQoKPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8eWFu
Z3lpbmdsaWFuZ0BodWF3ZWkuY29tPgo+IC0tLQo+IHYyOgo+ICAgbWFrZSB0aGUgY29tbWl0IG1l
c3NhZ2UgYW5kIHRpdGxlIG1vcmUgcHJvcGVyLgo+IC0tLQo+ICBkcml2ZXJzL210ZC9kZXZpY2Vz
L3N0X3NwaV9mc20uYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyBiL2RyaXZl
cnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCj4gaW5kZXggOTgzOTk5YzAyMGQ2Li5kMzM3N2Ix
MGZjMGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwo+IEBAIC0yMTI2LDYgKzIxMjYs
OCBAQCBzdGF0aWMgaW50IHN0ZnNtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICB7Cj4gIAlzdHJ1Y3Qgc3Rmc20gKmZzbSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
Owo+ICAKPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShmc20tPmNsayk7Cj4gKwo+ICAJcmV0dXJu
IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigmZnNtLT5tdGQpOwo+ICB9Cj4gIAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
