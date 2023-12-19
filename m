Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B6C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjADJeNPBTTtJGfU8UfwBeU8UJbBcB12Gcu6tKQm7qU=; b=wCtR97mO2rpj+6b4DzEgf65olc
	ZxnLP6KxsNEwJ1TsF5cRonU1TdFBniVxvGo43AwzUPiyI/TJzGT2s0cw1Tyh6c4bIxTeRs3ty/b69
	btBXyOTEIak7aUPL+WG2HQSN1s5fi2BgNzdS4k6VJRqRs3o1h1lY6ShAi2SyET6sbWcvZT+uI3tuC
	g8ANiAsw3BB15m3Bttilkluf4lEwyJJyMjX+iSkrZwGKOAcydXGGHmPZEIYUm1Yagm/BuweWTlxJ5
	XcsU5qmGoBjq0C0YAAXR3AGXfI3AXJs5Wvzil00WMMA3B6blp7O505LmO+63ZEiqQPVE08qxT+jcV
	H6KGtkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZ9i-00E0kW-2M;
	Tue, 19 Dec 2023 12:25:02 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZ9e-00E0jD-2L;
	Tue, 19 Dec 2023 12:25:00 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id DF01B4FB;
	Tue, 19 Dec 2023 13:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702988696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zo1bvGMOlMzlZUMlT7LD46uyFfN2T/tY+yhbado4I8M=;
	b=He1O7DllNLSQCRI6CEHrhhtQSLhUBhTSPm0+zqz/PciEb+AoKUZzy8JBzd6YwXkpsIpRBW
	TTpAv/wll81uuH6JEE+lo8Y0DbtGW5cmDy7vAFEnODr4qkMiHZ6m/IVyXhVVJsv8YCG7sK
	P839Gt7qOK/P3jzj1VE8v13HxpoF/pUjGJ9icNVTEQtdh7uoCz0X0GQpVI5OQFqoubRwZB
	TpNtpiouXWABbvCy+Fdmx4Q53WvK4oNc8G50LqR/e0+4UYLJZ/D4OmQVQ3CIb2yt5VKDAZ
	EK+N28j4deO+ku/qEPnzUc+J5QYeAvxbHpoMmSXQD2mP1CPVB5BdrTshtB1+uQ==
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 13:24:56 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>
Subject: Re: [PATCH v6.8 1/2] nvmem: layouts: refactor .add_cells() callback
 arguments
In-Reply-To: <20231219120104.3422-1-zajec5@gmail.com>
References: <20231219120104.3422-1-zajec5@gmail.com>
Message-ID: <dad4bd72d2d133b86385859a6978a72a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_042458_917392_BE5CAF75 
X-CRM114-Status: GOOD (  11.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gU2ltcGx5IHBh
c3Mgd2hvbGUgInN0cnVjdCBudm1lbV9sYXlvdXQiIGluc3RlYWQgb2Ygc2luZ2xlIHZhcmlhYmxl
cy4KPiBUaGVyZSBpcyBub3RoaW5nIGluICJzdHJ1Y3QgbnZtZW1fbGF5b3V0IiB0aGF0IHdlIGhh
dmUgdG8gaGlkZSBmcm9tCj4gbGF5b3V0IGRyaXZlcnMuIFRoZXkgYWxzbyBhY2Nlc3MgaXQgZHVy
aW5nIC5wcm9iZSgpIGFuZCAucmVtb3ZlKCkuCj4gCj4gVGhhbmtzIHRvIHRoaXMgY2hhbmdlOgo+
IAo+IDEuIEFQSSBnZXRzIG1vcmUgY29uc2lzdGVudAo+ICAgIEFsbCBsYXlvdXRzIGRyaXZlcnMg
Y2FsbGJhY2tzIGdldCB0aGUgc2FtZSBhcmd1bWVudAo+IAo+IDIuIExheW91dHMgZ2V0IGNvcnJl
Y3QgZGV2aWNlCj4gICAgQmVmb3JlIHRoaXMgY2hhbmdlIE5WTUVNIGNvcmUgY29kZSB3YXMgcGFz
c2luZyBOVk1FTSBkZXZpY2UgaW5zdGVhZAo+ICAgIG9mIGxheW91dCBkZXZpY2UuIFRoYXQgcmVz
dWx0ZWQgaW46Cj4gICAgKiBDb25mdXNpbmcgcHJpbnRzCj4gICAgKiBDYWxsaW5nIGRldm1fKigp
IGhlbHBlcnMgb24gd3JvbmcgZGV2aWNlCj4gICAgKiBIZWxwZXJzIGxpa2Ugb2ZfZGV2aWNlX2dl
dF9tYXRjaF9kYXRhKCkgZGVyZWZlcmVuY2luZyBOVUxMcwo+IAo+IDMuIEl0IGdldHMgcG9zc2li
bGUgdG8gZ2V0IG1hdGNoIGRhdGEKPiAgICBGaXJzdCBvZiBhbGwgbnZtZW1fbGF5b3V0X2dldF9t
YXRjaF9kYXRhKCkgcmVxdWlyZXMgcGFzc2luZyAic3RydWN0Cj4gICAgbnZtZW1fbGF5b3V0IiB3
aGljaCAuYWRkX2NlbGxzKCkgY2FsbGJhY2sgZGlkbid0IGhhdmUgYmVmb3JlIHRoaXMuIAo+IEl0
Cj4gICAgZG9lc24ndCBtYXR0ZXIgbXVjaCBhcyBpdCdzIHJhdGhlciB1c2VsZXNzIG5vdyBhbnl3
YXkgKGFuZCB3aWxsIGJlCj4gICAgZHJvcHBlZCkuCj4gICAgV2hhdCdzIG1vcmUgaW1wb3J0YW50
IGhvd2V2ZXIgaXMgdGhhdCBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBjYW4KPiAgICBiZSB1
c2VkIG5vdyB0aGFua3MgdG8gb3duaW5nIGEgcHJvcGVyIGRldmljZSBwb2ludGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCkxHVE0sClJl
dmlld2VkLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
