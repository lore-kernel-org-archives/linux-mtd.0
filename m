Return-Path: <SRS0=x2+d=ZK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2794CC432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 19:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F330320885
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 19:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kp87RbEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F330320885
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9zLrcvoC+/1JKz1fGv4R+xeMTBwT6Bpktmz2DoGjKk=; b=kp87RbEocF6+Gw
	h8TySszEOH7YLZLO23WQj7uiMY6rtzdNJcNULm89d1GxQ7/dpTYXbaQIOk84tyA1O15CToe8xngxg
	rW5kEla12XX8gm2PhG0shFfimAmhtEYg0ho4584HpUq4B1WhHTR9LHnXvx/eUuU1QEFtzh0Bm+/tb
	mN83jIEjKJZdoqNHnXM9jfkpKohA/i+c7wv0shUTwoSOIeVsyVhlQzgFcIvYgBvU7I2KTf1F8KR7W
	8uS9BAPuSLJWM+gfp/5O9blWv0LuWQtdiZcBd55XSfnwjSslUjpl6WDU89n0IEc0L/YK2ZtUaO/tG
	GavMGc+OAgTNBy6FOqNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWmcL-0004DV-6b; Mon, 18 Nov 2019 19:23:21 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWmcI-0004Cq-Rj
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2019 19:23:20 +0000
X-Originating-IP: 90.38.106.182
Received: from xps13 (atoulouse-659-1-107-182.w90-38.abo.wanadoo.fr
 [90.38.106.182]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 593ED40008;
 Mon, 18 Nov 2019 19:22:58 +0000 (UTC)
Date: Mon, 18 Nov 2019 20:22:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] {tty: serial, nand: onenand}: samsung: rename to fix
 build warning
Message-ID: <20191118202257.6cfd1a7e@xps13>
In-Reply-To: <1505628642.90849.1574081270290.JavaMail.zimbra@nod.at>
References: <20191117202435.28127-1-sudipm.mukherjee@gmail.com>
 <20191118114657.GA228826@kroah.com>
 <1505628642.90849.1574081270290.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_112319_034245_1DEFCF5D 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGUgb24gTW9u
LCAxOCBOb3YgMjAxOSAxMzo0Nzo1MAorMDEwMCAoQ0VUKToKCj4gLS0tLS0gVXJzcHLDvG5nbGlj
aGUgTWFpbCAtLS0tLQo+ID4+IEkgd2FzIG5vdCBzdXJlIGlmIHRoaXMgc2hvdWxkIGhhdmUgYmVl
biB0d28gZGlmZmVyZW50IHBhdGNoLCBidXQgc2luY2UKPiA+PiB0aGlzIHdpbGwgYmUgZml4aW5n
IHRoZSBzYW1lIHByb2JsZW0gc28gaXQgc2VlbXMgaXRzIGJldHRlciB0byBoYXZlIHRoZW0KPiA+
PiBpbiBhIHNpbmdsZSBwYXRjaC4KPiA+PiAKPiA+PiAgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPj4gIGRyaXZlcnMvbXRkL25h
bmQvb25lbmFuZC97c2Ftc3VuZy5jID0+IHNhbXN1bmdfbXRkLmN9IHwgMAo+ID4+ICBkcml2ZXJz
L3R0eS9zZXJpYWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+
PiAgZHJpdmVycy90dHkvc2VyaWFsL3tzYW1zdW5nLmMgPT4gc2Ftc3VuZ190dHkuY30gICAgICAg
fCAwCj4gPj4gIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4+ICByZW5hbWUgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3tzYW1zdW5nLmMgPT4gc2Ft
c3VuZ19tdGQuY30gKDEwMCUpCj4gPj4gIHJlbmFtZSBkcml2ZXJzL3R0eS9zZXJpYWwve3NhbXN1
bmcuYyA9PiBzYW1zdW5nX3R0eS5jfSAoMTAwJSkgIAo+ID4gCj4gPiBJIGNhbiB0YWtlIHRoaXMg
aW4gdGhlIHR0eSB0cmVlIGlmIHRoZSBtdGQgbWFpbnRhaW5lciBnaXZlcyBhbiBhY2sgZm9yCj4g
PiBpdC4uLiAgCj4gCj4gQWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+CgpJZiBpdCBpcyBub3QgdG9vIGxhdGUsIEkgYW0gbm90IGEgYmlnIGZhbiBvZiB0aGUgbmV3
IG5hbWluZyB3aGljaCBpcwpyYXRoZXIgbm90IGRlc2NyaXB0aXZlLiBGaWxlcyBpbiB0aGUgb25l
bmFuZCBzdWJkaXJlY3RvcnkgYXJlOgoqIG9uZW5hbmRfPHNvbWV0aGluZz4uYyBmb3IgdGhlIGJh
c2UgZmlsZXMKKiA8dmVuZG9yPi5jIGZvciB0aGUgdmVuZG9ycyBmaWxlcyAoY3VycmVudGx5OiBv
bWFwMi5jIGFuZCBzYW1zdW5nLmMpLgoKV2hhdCBhYm91dCBkb2luZyB0aGUgTVREIGNoYW5nZXMg
aW4gYSBzaW5nbGUgcGF0Y2ggYW5kIHJlbmFtaW5nIGJvdGgKdmVuZG9yIGRyaXZlcnMgKGZvciB0
aGUgc2FtZSByZWFzb24pOiBvbmVuYW5kX29tYXAyLmMgYW5kCm9uZW5hbmRfc2Ftc3VuZy5jPyBJ
IGtub3cgaXQgbWFrZXMgZ2l0IGJsYW1pbmcgbW9yZSBkaWZmaWN1bHQgdGhvdWdoLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
