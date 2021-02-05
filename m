Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F46FC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C31264F6C
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C31264F6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LpgUJ8abes2+wBbxCOm87ivEHBhfH8lfLTExqgT9TyU=; b=xJH0Zz6nUdnxqLobhfv+0xdU/
	7GqyfafK/6exTB4g6ZiM95E4IFqS+7YSq5GFuM0uhNcNvYuUvZXqyuSe2jfT/19ske8F141uQy90x
	2ksiryXuKGgVZAtsbnuV9+U8vuHBO3TVzCcyDuklZdzHYrXvuuzlit1qZUfVe69vNoyZ8pjKzdvy8
	0vWB4yB8Nzpq17YyPT6Gn2idNoY5+wgqjl2pbXaQOEOyFMR2H930MJ6hO4kDYMyTuViU4g8X/GGHd
	YUvUY6Yy/TqXjUFrsMZ5aAnAsuWttze7CUclQU8iAcCHmjfQx5jpqljp9kvVMu6MAa+8Yp9bBNqmU
	ueiaMl8RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8181-0008Ec-1h; Fri, 05 Feb 2021 13:26:29 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l817x-0008Dr-Mj
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:26:26 +0000
X-Originating-IP: 90.89.227.234
Received: from xps13 (lfbn-tou-1-1424-234.w90-89.abo.wanadoo.fr
 [90.89.227.234]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3CD6D6000B;
 Fri,  5 Feb 2021 13:26:19 +0000 (UTC)
Date: Fri, 5 Feb 2021 14:26:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] drivers: mtd: Better word replace a not so good word in
 the file mtd_blkdevs.c
Message-ID: <20210205142618.116852a0@xps13>
In-Reply-To: <20210205124151.1386271-1-unixbhaskar@gmail.com>
References: <20210205124151.1386271-1-unixbhaskar@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_082625_870169_5429F138 
X-CRM114-Status: GOOD (  14.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, rdunlap@infradead.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQmhhc2thciwKCkJoYXNrYXIgQ2hvd2RodXJ5IDx1bml4Ymhhc2thckBnbWFpbC5jb20+IHdy
b3RlIG9uIEZyaSwgIDUgRmViIDIwMjEKMTg6MTE6NTEgKzA1MzA6Cgo+IHMvZnVja2luZy9pbnZp
dGUvCj4gCj4gCj4gU2lnbmVkLW9mZi1ieTogQmhhc2thciBDaG93ZGh1cnkgPHVuaXhiaGFza2Fy
QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgYi9kcml2ZXJzL210ZC9tdGRfYmxrZGV2
cy5jCj4gaW5kZXggZmI4ZTEyZDU5MGExLi43NTZhMDk5NWU0NzQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMK
PiBAQCAtNTIzLDcgKzUyMyw3IEBAIGludCByZWdpc3Rlcl9tdGRfYmxrdHJhbnMoc3RydWN0IG10
ZF9ibGt0cmFuc19vcHMgKnRyKQo+ICAJaW50IHJldDsKPiAKPiAgCS8qIFJlZ2lzdGVyIHRoZSBu
b3RpZmllciBpZi93aGVuIHRoZSBmaXJzdCBkZXZpY2UgdHlwZSBpcwo+IC0JICAgcmVnaXN0ZXJl
ZCwgdG8gcHJldmVudCB0aGUgbGluay9pbml0IG9yZGVyaW5nIGZyb20gZnVja2luZwo+ICsJICAg
cmVnaXN0ZXJlZCwgdG8gcHJldmVudCB0aGUgbGluay9pbml0IG9yZGVyaW5nIGZyb20gaW52aXRl
Cj4gIAkgICB1cyBvdmVyLiAqLwoKaW52aXRlIHVzIG92ZXI/CgpJJ20gbm90IGEgbmF0aXZlIEVu
Z2xpc2ggc3BlYWtlciBidXQgdGhpcyBkb2VzIG5vdCBicmluZyBhbnkgdmFsdWUgdG8KbXkgZWFy
cy4gV29yc2UsIEkgZG9uJ3QgZXZlbiBnZXQgdGhlIHBvaW50LiBCZXR0ZXIgcmV3cml0ZSB0aGUg
Y29tbWVudAplbnRpcmVseSB0aGFuIGp1c3Qgc3dhcHBpbmcgImZ1Y2tpbmciIHdpdGggYSByYW5k
b20gd29yZCwgbm8/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
