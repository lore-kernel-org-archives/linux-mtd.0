Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D540C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 08:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxhA/RYfiJortp8YdUj7rDo+fkWCwlqB8RX/C/f93J8=; b=OXIVYJ0nnfxDld
	ZpI82Daxxnut19DaqjgxecrT31bZOFRzOpK9wBq0sqliagGBZNdV/MfMFM+lA1Uxw8Plplanmjbap
	8MglqHrdoAKlZT27ouLKgv+2eqoT5kkH2elmnIIA7uf/RD7Ybt5Tkqp/HxL3nxnL+NPVv3UYpoL8u
	46hCqXHgO1w551fb27e9cj1G2UHPCDDyGI59X6NYenAA5UraglIfabIsIahX+iXyz0xvp4K/JIHAX
	lW2kLbAdbHAde3J8rmNye+A7lLK+scczN1StqB8hEV/LK8u7kRvVJAEAqrAsiJbbeAZxgQiz9kfgc
	lfGYffCzYdMY6XBJRhKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6I3-00Bu3N-0d; Mon, 06 Mar 2023 08:33:51 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6Hw-00BtxJ-SS
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 08:33:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AC4D31BF209;
	Mon,  6 Mar 2023 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678091619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcWfKaoaYJF0v6V/CLIllu4Udjau4ayfUZPBb67ggZU=;
	b=Lvs54cfBpYPuz2wbthklML07GL5D9Rqry14yl9XXygvd0sBnugBtwcwOLZl9FfKvnr6J0W
	rUiRj94xk/SILi48COHasuJLBB8KexQLwz0ZjkkixvfbTbD/ojEtkSgaUKt5wycuynSsnU
	CuOLaouV/i/sb5zCTQ1ZwSrTzqveB6/U4f1gD/TEmiX7xTztF7WzoPwTP+kcRM8LEnTRBr
	EJhEXOwoRcDpHdzmEPp0mewQnR6VbM1MXlhEtgWXik1Oq/HG1sMpbYnEGoNqCff3AfDAc9
	DhkyuNAbCrXiIfK0FVhR7sjFRq0jD+ZUqTCwnbELoCeysJAdyV8Wp53bGJdVCw==
Date: Mon, 6 Mar 2023 09:33:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Message-ID: <20230306093336.523832b0@xps-13>
In-Reply-To: <ZAWNtv0g6vmADGnb@kroah.com>
References: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
	<f60870dee13900252e0b13fb2f5f05b5@walle.cc>
	<ZAWNtv0g6vmADGnb@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_003345_122248_FE9A6D18 
X-CRM114-Status: GOOD (  20.27  )
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

SGkgR3JlZywKCmdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlIG9uIE1vbiwgNiBNYXIg
MjAyMyAwNzo1MjozOCArMDEwMDoKCj4gT24gV2VkLCBGZWIgMDgsIDIwMjMgYXQgMDU6MTU6NDFQ
TSArMDEwMCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiA+IEFtIDIwMjMtMDItMDggMTc6MDIsIHNj
aHJpZWIgR3JlZyBLcm9haC1IYXJ0bWFuOiAgCj4gPiA+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzX2xv
b2t1cCgpIHRoZSByZXN1bHQgbXVzdCBoYXZlIGRwdXQoKSBjYWxsZWQgb24gaXQsCj4gPiA+IG90
aGVyd2lzZSB0aGUgbWVtb3J5IHdpbGwgbGVhayBvdmVyIHRpbWUuICBUbyBzb2x2ZSB0aGlzLCBy
ZW1vdmUgdGhlCj4gPiA+IGxvb2t1cCBhbmQgY3JlYXRlIHRoZSBkaXJlY3Rvcnkgb24gdGhlIGZp
cnN0IGRldmljZSBmb3VuZCwgYW5kIHRoZW4KPiA+ID4gcmVtb3ZlIGl0IHdoZW4gdGhlIG1vZHVs
ZSBpcyB1bmxvYWRlZC4KPiA+ID4gCj4gPiA+IENjOiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJh
cnVzQG1pY3JvY2hpcC5jb20+Cj4gPiA+IENjOiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2Vy
bmVsLm9yZz4KPiA+ID4gQ2M6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4gPiA+
IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gPiBDYzog
UmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiA+ID4gQ2M6IFZpZ25lc2ggUmFn
aGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiA+ID4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+ICAKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgV2Fs
bGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4gPiAKPiA+IG9uZSBuaXQgYmVsb3cgSSBkaWRuJ3Qgbm90
aWNlIGVhcmxpZXIsIG5vIG5lZWQgdG8gc2VuZCBhIG5ldwo+ID4gcGF0Y2ggdmVyc2lvbiBqdXN0
IGZvciB0aGF0Lgo+ID4gCj4gPiAuLgo+ID4gICAKPiA+ID4gK3ZvaWQgc3BpX25vcl9kZWJ1Z2Zz
X3NodXRkb3duKHZvaWQpCj4gPiA+ICt7Cj4gPiA+ICsJaWYgKHJvb3RkaXIpCj4gPiA+ICsJCWRl
YnVnZnNfcmVtb3ZlKHJvb3RkaXIpOyAgCj4gPiAKPiA+IGRlYnVnZnNfcmVtb3ZlKCkgYWxyZWFk
eSBoYXMgYSBjaGVjayBmb3IgTlVMTC4KPiA+ICAgCj4gCj4gQWgsIGdvb2QgY2F0Y2gsIEkgbWVy
Z2VkIHRoaXMgaW4gd2hlbiBJIGFwcGxpZWQgaXQgdG8gbXkgdHJlZSwgdGhhbmtzIQoKQW55IHJl
YXNvbnMgd2h5IHlvdSBkaWQgYXBwbHkgdGhpcyBwYXRjaCB0byB5b3VyIHRyZWU/IEl0IGlzIGEg
c3BpLW5vcgpmaXgsIEkgd291bGQgaGF2ZSBleHBlY3RlZCBpdCB0byBnbyB0aHJvdWdoIG10ZC4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
