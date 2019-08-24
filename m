Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA78C3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 10:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A622146E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 10:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WG93u4Bp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A622146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVBdlIIk3YWCE0TY42lALBAmW9/gVgm321GbaaH8P70=; b=WG93u4Bp7lhd7P
	3czB9VgKLoLWOoy41Z9JiWzaZJNOdwbdEpVkmGxS92TjakKYw6lGtfulEAM57F7ievMKiyhvk6TFP
	AJUk8I+VnPu/MsfcGOsrmXb6D6uPNloQ96v7GbKW61aDZplKrSkleLclwL8xn3DA5TM8T4SyKwLfe
	oqBqAQZ1qzHA2e8CosVtDdBaqU8/ib9nv1eTxX8Nm0C7pcV4w6Ql+nIsm/qTBsWjNXS80v3NdE3A1
	mshyvuRO8ByWlHpNc4ADYNx0Nj+uxmdZ7/E8l0go6MBLcU/NNlLW8OkPMa7ge/JnRbLo8wtL+BGD/
	cCzLQF8bcY5EfN7PCyVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Tas-0000Vr-S0; Sat, 24 Aug 2019 10:48:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Tap-0000VA-FW
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 10:48:25 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3D5FC1BF203;
 Sat, 24 Aug 2019 10:48:09 +0000 (UTC)
Date: Sat, 24 Aug 2019 12:48:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mtd: hyperbus: fix dependency and build error
Message-ID: <20190824124807.393f125d@xps13>
In-Reply-To: <9b1b4ab1-681f-0ef9-7b5c-b6545f7464d2@infradead.org>
References: <9b1b4ab1-681f-0ef9-7b5c-b6545f7464d2@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_034823_665847_B8F6CB8C 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlnbmVzaCwKClJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZSBv
biBUdWUsIDEzIEF1ZyAyMDE5IDE2OjAzOjEzCi0wNzAwOgoKPiBGcm9tOiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiAKPiBsaWIvZGV2cmVzLmMsIHdoaWNoIGltcGxlbWVu
dHMgZGV2bV9pb3JlbWFwX3Jlc291cmNlKCksIGlzIG9ubHkgYnVpbHQKPiB3aGVuIENPTkZJR19I
QVNfSU9NRU0gaXMgc2V0L2VuYWJsZWQsIHNvIE1URF9IWVBFUkJVUyBzaG91bGQgZGVwZW5kCj4g
b24gSEFTX0lPTUVNLiAgRml4ZXMgYSBidWlsZCBlcnJvciBhbmQgYSBLY29uZmlnIHdhcm5pbmcg
KGFzIHNlZW4gb24KPiBVTUwgYnVpbGRzKToKPiAKPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVw
ZW5kZW5jaWVzIGRldGVjdGVkIGZvciBNVERfQ09NUExFWF9NQVBQSU5HUwo+ICAgRGVwZW5kcyBv
biBbbl06IE1URCBbPW1dICYmIEhBU19JT01FTSBbPW5dCj4gICBTZWxlY3RlZCBieSBbbV06Cj4g
ICAtIE1URF9IWVBFUkJVUyBbPW1dICYmIE1URCBbPW1dCj4gCj4gRVJST1I6ICJkZXZtX2lvcmVt
YXBfcmVzb3VyY2UiIFtkcml2ZXJzL210ZC9oeXBlcmJ1cy9oeXBlcmJ1cy1jb3JlLmtvXSB1bmRl
ZmluZWQhCj4gCj4gRml4ZXM6IGRjYzdkMzQ0NmEwZiAoIm10ZDogQWRkIHN1cHBvcnQgZm9yIEh5
cGVyQnVzIG1lbW9yeSBkZXZpY2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJk
dW5sYXBAaW5mcmFkZWFkLm9yZz4KPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJA
dGkuY29tPgo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+
IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IENjOiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IC0tLQoKVGhpcyBwYXRjaCBsb29rcyBsaWtlIGEg
Z29vZCBjYW5kaWRhdGUgZm9yIGZpeGVzLCBzaGFsbCBJIHNlbmQgYSBmaXhlcwpQUiBuZXh0IHdl
ZWsgd2l0aCBpdD8gKEFja2VkLWJ5IHdpc2hlZCkKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
