Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19649C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yp2+0cukW7Cb0I7NrFgozRlpRvzQS25sahN4SOPMR8A=; b=rcsUOtX8947/rb
	A2ZvefdN2OqiayYeaW4kUQJsG4ycpNi/cSAMLjM5zP8aF4b4Gi/+Z7xTLVUAQOBjELUDTafg3zJ7U
	e/xXlFT5aCJXp9lBoPD6mLYIscB7G2HZsigF4UQxG1+LVdM0ii4EGqJtBCnvC8S0awTk8NLkyU12h
	ff2JRmpVfpdIgQepqODZZKAcpCzDGYWFokFz5XCHiiNfug2ytUbgCz7H6m7iteg+m+hLdYsUoCQkp
	jLw2UlBGKhcDEuzs3pXeWUUGAjfb2VycWU/ZmHN11Jtg++Husm5xjOWwkRf8TZQ6BGPfhcvL1XVl7
	p43oNxZ0MvPSJ0X5oZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8pK-00G0tx-Hj; Fri, 03 Dec 2021 13:42:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8ob-00G0hX-Fd; Fri, 03 Dec 2021 13:41:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4F7CC240011;
 Fri,  3 Dec 2021 13:41:24 +0000 (UTC)
Date: Fri, 3 Dec 2021 14:41:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Anders Roxell <anders.roxell@linaro.org>, Christoph Hellwig
 <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, sean@geanix.com, Geert
 Uytterhoeven <geert+renesas@glider.be>, Linux-Next Mailing List
 <linux-next@vger.kernel.org>, linux-mtd@lists.infradead.org, open list
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Daniel =?UTF-8?B?RMOtYXo=?=
 <daniel.diaz@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-block <linux-block@vger.kernel.org>
Subject: Re: [next] WARNING: CPU: 2 PID: 66 at kernel/locking/rwsem.c:1298
 __up_read
Message-ID: <20211203144123.16c49eb4@xps13>
In-Reply-To: <20211202141958.638f224b@collabora.com>
References: <CA+G9fYuupqqemLbgoVL2kYL4d2AtZLBo1xcshWWae7gX5Ln-iA@mail.gmail.com>
 <CADYN=9KeKhZ-OSbx1QHKYfXu+p-nXVjubbay1sXd_g75LLSZRg@mail.gmail.com>
 <20211202141958.638f224b@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_054129_710853_872BE104 
X-CRM114-Status: GOOD (  19.85  )
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

SGVsbG8sCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBUaHUsIDIgRGVj
IDIwMjEgMTQ6MTk6NTggKzAxMDA6Cgo+IE9uIFRodSwgMiBEZWMgMjAyMSAxMzoyODo0NiArMDEw
MAo+IEFuZGVycyBSb3hlbGwgPGFuZGVycy5yb3hlbGxAbGluYXJvLm9yZz4gd3JvdGU6Cj4gCj4g
PiBPbiBUdWUsIDMwIE5vdiAyMDIxIGF0IDE4OjAxLCBOYXJlc2ggS2FtYm9qdSA8bmFyZXNoLmth
bWJvanVAbGluYXJvLm9yZz4gd3JvdGU6ICAKPiA+ID4KPiA+ID4gW1BsZWFzZSBpZ25vcmUgdGhp
cyBlbWFpbCBpZiBpdCBpcyBhbHJlYWR5IHJlcG9ydGVkXQo+ID4gPgo+ID4gPiBSZWdyZXNzaW9u
IGZvdW5kIG9uIHFlbXVfYXJtNjQuCj4gPiA+IEZvbGxvd2luZyBrZXJuZWwgd2FybmluZ3MgcmVw
b3J0ZWQgb24gTGludXggbmV4dC0yMDIxMTEzMCB3aGlsZSBib290aW5nLiAgICAKPiA+IAo+ID4g
SSBiaXNlY3RlZCBkb3duIHRvIDFlYmUyZTVmOWQ2OCAoImJsb2NrOiByZW1vdmUgR0VOSERfRkxf
RVhUX0RFVlQiKQo+ID4gCj4gPiBhbmQgd2hlbiBJIHJldmVydGVkIDFlYmUyZTVmOWQ2OCAoImJs
b2NrOiByZW1vdmUgR0VOSERfRkxfRVhUX0RFVlQiKSBhbmQgdGhlCj4gPiAzIHJlbGVhdGVkIHBh
dGNoZXMgc28gcGF0Y2ggMWViZTJlNWY5ZDY4IHdhcyByZXZlcnRlZCBjbGVhbmx5IEkKPiA+IG1h
bmFnZWQgdG8gYm9vdCB3aXRob3V0Cj4gPiBhIHdhcm5pbmcuCj4gPiAKPiA+IFJlbGF0ZWQgcGF0
Y2hlcyBmcm9tIG5leHQtMjAyMTExMzA6Cj4gPiA5ZjE4ZGI1NzJjOTcgKCJibG9jazogZG9uJ3Qg
c2V0IEdFTkhEX0ZMX05PX1BBUlQgZm9yIGhpZGRlbiBnZW5kaXNrcyIpCj4gPiA0MzBjYzVkM2Fi
NGQgKCJibG9jazogY2xlYW51cCB0aGUgR0VOSERfRkxfKiBkZWZpbml0aW9ucyIpCj4gPiBhNDU2
MWY5ZmNjYzUgKCJzcjogc2V0IEdFTkhEX0ZMX1JFTU9WQUJMRSBlYXJsaWVyIikKPiA+IAo+ID4g
V2l0aCB0aGlzIHNhaWQsIGlmIEkgcmV2ZXJ0IDlkNmFiZDQ4OWU3MCAoIm10ZDogY29yZTogcHJv
dGVjdCBhY2Nlc3MKPiA+IHRvIE1URCBkZXZpY2VzIHdoaWxlIGluIHN1c3BlbmQiKQo+ID4gSSBk
aWRuJ3Qgc2VlIHRoZSB3YXJuaW5nIGVpdGhlci4gIAo+IAo+IEkgdGhpbmsgOWQ2YWJkNDg5ZTcw
ICgibXRkOiBjb3JlOiBwcm90ZWN0IGFjY2VzcyB0byBNVEQgZGV2aWNlcyB3aGlsZQo+IGluIHN1
c3BlbmQiKSBpcyBhdCBmYXVsdCBoZXJlLiBNaXF1ZWwsIHdvdWxkIHlvdSBtaW5kCj4gcmV2ZXJ0
aW5nL2Ryb3BwaW5nIHRoZSAibXRkOiBjb3JlOiBwcm90ZWN0IGFjY2VzcyB0byBtdGQgZGV2aWNl
cyB3aGlsZQo+IGluICBzdXNwZW5kIiBzZXJpZXM/CgpGWUkgSSd2ZSBqdXN0IGRyb3BwZWQgdGhl
IGVudGlyZSBzZXJpZXMuIFRoZSBjaGFuZ2Ugd2lsbCBwcm9iYWJseSBiZQplZmZlY3RpdmUgaW4g
bGludXgtbmV4dCBzdGFydGluZyBmcm9tIG5leHQgTW9uZGF5LgoKPiAKPiA+IAo+ID4gQW55IGlk
ZWEgd2hhdCBjYW4gYmUgd3JvbmcgaGVyZSBvciB3aGF0IGEgZml4IGNvdWxkIGJlPwo+ID4gCj4g
PiBPbmx5IGFwcGx5IHRoaXMgcGF0Y2ggZnJvbSBHZWVydAo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC9jMjZkZmRmOWNlNTZlOTJkMjM1MzBhMDlkYjM4NmIyODNlNjI4NDVkLjE2Mzgy
ODkyMDQuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlLwo+ID4gbWFrZXMgdGhlIHdhcm5pbmcg
Z28gYXdheSB0b28uCj4gPiAKPiA+IENoZWVycywKPiA+IEFuZGVycyAgCj4gCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
