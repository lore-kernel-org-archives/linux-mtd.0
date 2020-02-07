Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C106C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 08:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F5620726
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 08:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJR4wffo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F5620726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zMm+n3hTQJBgYVfnOnn7b9/YtZAjrt6KPqvh9JoQzE=; b=JJR4wffo7gPmtb
	BBJJaCA4b/sUGEcUrQFitXD/3xUIMqlm2X+Q4vgeFswkaIOo7eMPHzw6QS5JygUF/bz5IpkjX3v5F
	eYgJtJC9zMqwM3CgZf+BjIxupPRijONhKrINUUmHb/12gk3CcCuDGkvaVI0cn3WY1SDqy6WEM3u2C
	R7VqHeCkNGQIFv0h5Pwgm0MCeF9NWN5NfqvdXMa2aPcC5n3QdrBkoPtxelYmluuIj6IkW+rMWix15
	Yh09buS+LTqMxqNuv8hXEZcBmH+9lFJxAGsL2k9SE2WMtrxWefnZEBvXIG184FmZm0zSEG2aWQrFb
	kjLUZ9SyQB3F2CV/Fpvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izz4M-0003SY-Dx; Fri, 07 Feb 2020 08:32:58 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izz4I-0003Rl-J9
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 08:32:56 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 26B381C0002;
 Fri,  7 Feb 2020 08:32:35 +0000 (UTC)
Date: Fri, 7 Feb 2020 09:32:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: Re: [PATCH v3] mtd: spinand: toshiba: Add comment about Kioxia ID
Message-ID: <20200207093234.56bd8cae@xps13>
In-Reply-To: <1581051561-7302-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
References: <1581051561-7302-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_003254_765205_5534883A 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29t
PiB3cm90ZSBvbiBGcmksICA3IEZlYgoyMDIwIDEzOjU5OjIxICswOTAwOgoKPiBBZGQgYSBjb21t
ZW50IGFib3ZlIE5BTkRfTUZSX1RPU0hJQkEgYW5kIFNQSU5BTkRfTUZSX1RPU0hJQkEgZGVmaW5p
dGlvbnMKPiB0aGF0IFRvc2hpYmEgYW5kIEtpb3hpYSBJRCBhcmUgdGhlIHNhbWUuCj4gU2luY2Ug
aXRzIGluZGVwZW5kZW5jZSBmcm9tIFRvc2hpYmEgR3JvdXAsIFRvc2hpYmEgbWVtb3J5IENvIGhh
cyBiZWNvbWUKPiBLaW94aWEgQ28uCj4gCj4gU2lnbmVkLW9mZi1ieTogWW9zaGlvIEZ1cnV5YW1h
IDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29tPgoKSnVzdCBhcyBhbiBGWUkgZm9yIHlvdXIg
bmV4dCBzdWJtaXNzaW9uLCBiZWxvdyB0aGUgdGhyZWUgZGFzaGVzIHlvdQpzaG91bGQgYWRkIGEg
Y2hhbmdlbG9nLCBhIHNtYWxsIHBhcmFncmFwaCBkZXNjcmliaW5nIHdoYXQgY2hhbmdlZApiZXR3
ZWVuIHRoZSB2ZXJzaW9ucy4KCk5vIG5lZWQgdG8gcmVzZW5kIGp1c3QgZm9yIHRoaXMsIEkgaGF2
ZSBpdCBpbiBtaW5kLgoKSSdtIGZpbmUgd2l0aCB0aGUgcGF0Y2ggYW5kIHdpbGwgYXBwbHkgaXQg
c29vbi4KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oIHwgMSArCj4g
IGRyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hpYmEuYyAgIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2ludGVybmFscy5oIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmgKPiBpbmRleCBj
YmE2ZmU3Li45ZDBjYWFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVy
bmFscy5oCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmgKPiBAQCAtMzAs
NiArMzAsNyBAQAo+ICAjZGVmaW5lIE5BTkRfTUZSX1NBTVNVTkcJMHhlYwo+ICAjZGVmaW5lIE5B
TkRfTUZSX1NBTkRJU0sJMHg0NQo+ICAjZGVmaW5lIE5BTkRfTUZSX1NUTUlDUk8JMHgyMAo+ICsv
KiBLaW94aWEgaXMgbmV3IG5hbWUgb2YgVG9zaGliYSBtZW1vcnkuICovCj4gICNkZWZpbmUgTkFO
RF9NRlJfVE9TSElCQQkweDk4Cj4gICNkZWZpbmUgTkFORF9NRlJfV0lOQk9ORAkweGVmCj4gIAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS90b3NoaWJhLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS90b3NoaWJhLmMKPiBpbmRleCAwZGI1ZWU0Li44MzNlOGY2IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hpYmEuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL3Rvc2hpYmEuYwo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9r
ZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L210ZC9zcGluYW5kLmg+Cj4gIAo+ICsvKiBLaW94
aWEgaXMgbmV3IG5hbWUgb2YgVG9zaGliYSBtZW1vcnkuICovCj4gICNkZWZpbmUgU1BJTkFORF9N
RlJfVE9TSElCQQkJMHg5OAo+ICAjZGVmaW5lIFRPU0hfU1RBVFVTX0VDQ19IQVNfQklURkxJUFNf
VAkoMyA8PCA0KQo+ICAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
