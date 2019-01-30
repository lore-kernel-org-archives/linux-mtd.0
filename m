Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABD5C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB0020882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fhv/rjhI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t5KOt/1V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB0020882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J863v45KJQD0b5Hss4hiHqRlgSNtKbijd5ltAjEMVWw=; b=Fhv/rjhI6e77n2
	sXnQkHNwmI/H2HCIzEpWnC/13/Na6bat4XhinFdglEtapAWZbIHscpDb6XuWb4MCajQ9ZxOfZQ+Bw
	GiAg4/Wr4vOz9JnnoASCS0XQTvTbpMYIxy8qifOzHaYEZqMAFGS8q7cyC6OeUY/En3AG6vqX3lFH5
	S5DxQ0RuqT3kbnI+cndoaF8Bo39k0DBJvUoiVQo5P7z5SvQ2lSYqVUbqhKSwSs+iV5MA8GkjIOiZS
	WDsjSLnEYy+/FH95Qk3hmd8a5TzvIJPzn0P9aUr7cPkBsb/IT9RDeKNhRe58tz7JHrJZ4buz39pY+
	aeH6fCfZ8B/ionoUdSEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gomHv-0002pd-PH; Wed, 30 Jan 2019 09:36:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gomHt-0002e6-OB
 for linux-mtd@bombadil.infradead.org; Wed, 30 Jan 2019 09:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Km9W4QAq/7LVE7XaQjbseyHQ5fo7EbaIUJfnY//61Tc=; b=t5KOt/1V5hmThGDkBtvCuaAScj
 DeVH7w8Tmz7oMMTDNs3DTYo5dAcpeeBEwJVWRq/b0LuIAxGL0nZED6KDlnt4CO5MIsXA9vzDGkvjw
 R+86POSjURMONin6pTVe5LtJsmYXnx3sR3Vh83+oZoZB3s0Z7aTmQVlpkiZDGIwmbq/ABOiKKKYRt
 wcuywLcuWrofSeFZrlVre+iSocU4svGdE3by63ZScNdtB9lO7NytFp9vAyJP3H/mLS6oQo6Vy78aD
 rpfwP++Z5KxSXVctDB+D+F0vcWjGyy/XhourtL/vwc8KETYZSmnBCMjcgbu7VtQ6u1luQQcNoaZif
 KeeFRKig==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gom3r-0005Rn-Qn
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 09:21:37 +0000
Received: from xps13 (aaubervilliers-681-1-27-226.w90-88.abo.wanadoo.fr
 [90.88.147.226]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9DDE3100015;
 Wed, 30 Jan 2019 09:21:09 +0000 (UTC)
Date: Wed, 30 Jan 2019 10:21:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add the IRC channel to the MTD entry
Message-ID: <20190130102108.4fe9a58d@xps13>
In-Reply-To: <20190130085845.6790-1-bbrezillon@kernel.org>
References: <20190130085845.6790-1-bbrezillon@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_092135_896212_8472FF9D 
X-CRM114-Status: GOOD (  17.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gV2VkLCAzMCBKYW4gMjAxOQowOTo1ODo0NSArMDEwMDoKCj4gVGhlICNtdGQgY2hhbm5lbCAo
b24gT0ZUQyBzZXJ2ZXJzKSBpcyBiZWluZyB1c2VkIHRvIGRpc2N1c3MgTVREIHJlbGF0ZWQKPiB0
b3BpY3MuIEFkZCBpdCB0byB0aGUgTVREIGVudHJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlz
IEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDUxMDI5YTQyNWRiZS4uN2IzOWJhNDYz
ODRhIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAt
OTgwNSw2ICs5ODA1LDcgQEAgTToJUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4K
PiAgTDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAgVzoJaHR0cDovL3d3dy5saW51
eC1tdGQuaW5mcmFkZWFkLm9yZy8KPiAgUToJaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXgtbXRkL2xpc3QvCj4gK0M6CWlyYzovL2lyYy5vZnRjLm5ldC9tdGQKPiAgVDoJ
Z2l0IGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL2xpbnV4LW10ZC5naXQgbWFzdGVyCj4gIFQ6CWdp
dCBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1tdGQuZ2l0IG10ZC9uZXh0Cj4gIFM6CU1h
aW50YWluZWQKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
