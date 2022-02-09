Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D93C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEP9H6DyLRJjuD6m6pg/LDuOJXbbleMjapRWWx7wzwk=; b=X2tGKyj5gklzxn
	DmExPUqaDRPQOeBWyzGXghJH/KyAQrBeSO624HiVIP6FLJ0EJPb5QrxF7STGzbQF1aJl5QAcr9sn0
	ounHx3Aay+/oWhA4XtvvvgGX85NpyA9EPaW1fNo/6axqI5/3psewt7/w2h0v/KDrHlGINQFEHdln7
	SqOzw/8OtdMIgydeFyMyhEdVxPL4Sif5Ytvy/wIfkWpmZ+k7oe713vfxLpWSINx6e/JBq7dmRml53
	Tg8tjLILdBpacTK//uWzuZL+R+lB9YGeIo57DidwM6zc6+nFiYeUkBWVhDSzOMyX0jquE7U6YSXcB
	Ls2ZiggLBe53tixlqrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHhwX-00GZZC-Je; Wed, 09 Feb 2022 08:03:13 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHhwT-00GZXO-VF
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 08:03:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 447D540013;
 Wed,  9 Feb 2022 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644393785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kA7zyjjd/UqaeOL0y3OaVUdPRii6jxTKcWJ8icBD3Jc=;
 b=VcpR0WbO4Txvr6QJ94SdrWy+TAxMDUnNi9jUO5NtGxfzQpV2u3X3KUjrXQEXlHY8ybgigm
 QpKS/Sz7hsrBrcCxlAt4VxB01eHFNvI/E9SxcIocc9C/sNrOC+n5Sq/RYT5VgxacI80mdP
 qLNxmgro5fTRyyH3Zw0HJg7RWglNVx/6XxmqeIu5mtGc22CFgqcG7ZE9+FjoVCOWQ59IDM
 GAh2+I92rvJMWD6D8w76geG2NS3fXHpCq0mjbWIz5zVNkUiPfcHglE7UUSiydpYnsJexAJ
 /oAp8tzdlgtZL6qD23Q0dqqGlQgrj4LcC/3cEIoSlMxJ49WY6SFxnyB98hQRqQ==
Date: Wed, 9 Feb 2022 09:03:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
 mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Roger Quadros
 <rogerq@kernel.org>, linux-mtd@lists.infradead.org, Uwe =?UTF-8?B?S2xl?=
 =?UTF-8?B?aW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Subject: Re: mmotm 2022-02-08-15-31 uploaded (drivers/mtd/nand/raw/Kconfig)
Message-ID: <20220209090300.43241711@xps13>
In-Reply-To: <b18fc937-9cc2-bb7b-fb58-3ba2555371c7@infradead.org>
References: <20220208233156.E2CA6C004E1@smtp.kernel.org>
 <b18fc937-9cc2-bb7b-fb58-3ba2555371c7@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_000310_205788_A1C1DA52 
X-CRM114-Status: GOOD (  17.51  )
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

SGkgUmFuZHksCgpyZHVubGFwQGluZnJhZGVhZC5vcmcgd3JvdGUgb24gVHVlLCA4IEZlYiAyMDIy
IDIyOjMwOjIzIC0wODAwOgoKPiBPbiAyLzgvMjIgMTU6MzEsIEFuZHJldyBNb3J0b24gd3JvdGU6
Cj4gPiBUaGUgbW0tb2YtdGhlLW1vbWVudCBzbmFwc2hvdCAyMDIyLTAyLTA4LTE1LTMxIGhhcyBi
ZWVuIHVwbG9hZGVkIHRvCj4gPiAKPiA+ICAgIGh0dHBzOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0v
bW1vdG0vCj4gPiAKPiA+IG1tb3RtLXJlYWRtZS50eHQgc2F5cwo+ID4gCj4gPiBSRUFETUUgZm9y
IG1tLW9mLXRoZS1tb21lbnQ6Cj4gPiAKPiA+IGh0dHBzOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0v
bW1vdG0vCj4gPiAKPiA+IFRoaXMgaXMgYSBzbmFwc2hvdCBvZiBteSAtbW0gcGF0Y2ggcXVldWUu
ICBVcGxvYWRlZCBhdCByYW5kb20gaG9wZWZ1bGx5Cj4gPiBtb3JlIHRoYW4gb25jZSBhIHdlZWsu
Cj4gPiAKPiA+IFlvdSB3aWxsIG5lZWQgcXVpbHQgdG8gYXBwbHkgdGhlc2UgcGF0Y2hlcyB0byB0
aGUgbGF0ZXN0IExpbnVzIHJlbGVhc2UgKDUueAo+ID4gb3IgNS54LXJjWSkuICBUaGUgc2VyaWVz
IGZpbGUgaXMgaW4gYnJva2VuLW91dC50YXIuZ3ogYW5kIGlzIGR1cGxpY2F0ZWQgaW4KPiA+IGh0
dHBzOi8vb3psYWJzLm9yZy9+YWtwbS9tbW90bS9zZXJpZXMKPiA+IAo+ID4gVGhlIGZpbGUgYnJv
a2VuLW91dC50YXIuZ3ogY29udGFpbnMgdHdvIGRhdGVzdGFtcCBmaWxlczogLkRBVEUgYW5kCj4g
PiAuREFURS15eXl5LW1tLWRkLWhoLW1tLXNzLiAgQm90aCBjb250YWluIHRoZSBzdHJpbmcgeXl5
eS1tbS1kZC1oaC1tbS1zcywKPiA+IGZvbGxvd2VkIGJ5IHRoZSBiYXNlIGtlcm5lbCB2ZXJzaW9u
IGFnYWluc3Qgd2hpY2ggdGhpcyBwYXRjaCBzZXJpZXMgaXMgdG8KPiA+IGJlIGFwcGxpZWQuICAK
PiAKPiBvbiBpMzg2Ogo+IAo+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0
ZWN0ZWQgZm9yIE9NQVBfR1BNQwo+ICAgRGVwZW5kcyBvbiBbbl06IE1FTU9SWSBbPXldICYmIE9G
X0FERFJFU1MgWz1uXQo+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ICAgLSBNVERfTkFORF9PTUFQMiBb
PXldICYmIE1URCBbPXldICYmIE1URF9SQVdfTkFORCBbPXldICYmIChBUkNIX09NQVAyUExVUyB8
fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwgQ09NUElMRV9URVNUIFs9eV0pICYmIEhBU19J
T01FTSBbPXldCj4gCj4gCj4gRnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuCgorIFV3
ZSwgKyBLMyBwZW9wbGUgKyBLcnp5c3p0b2YKClV3ZSBhbHJlYWR5IHJhaXNlZCB0aGUgaXNzdWUs
IGFuZCB0aGlzIHdhcyBwcm9wb3NlZDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10
ZC8yMDIyMDEyNzEwNTY1Mi4xMDYzNjI0LTEtbWlxdWVsLnJheW5hbEBib290bGluLmNvbS9ULwoK
TWF5YmUgd2Ugc2hvdWxkIGhhdmUgYWRkZWQgSzMgcGVvcGxlIGluIENjIGJ1dCB0aGVpciBNQUlO
VEFJTkVSUyBlbnRyeQppcyBpbmNvbXBsZXRlIHNvIGdldF9tYWludGFpbmVycy5wbCBkaWQgbm90
IGltbWVkaWF0ZWx5IGZvdW5kIHRoZW0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
