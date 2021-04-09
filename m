Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44082C43460
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 08:00:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C140961182
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 08:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C140961182
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oGJd7qg4+/1De+wlCUAnex5UyAag7fO8xkkWwIlf0i8=; b=BYw7wqfAFQPdLHCFz4nv2lt5b
	FotnDoGuw90sjZEUUhM20fK9sktjVcviARVbs9zTsmykmS0U0BOYNHjMSYggX8SLyvmCs6eBdy1Vo
	n8qXO8ZLGPjoUiJLsESIy2eQG+2OL7yHTd4ZFRqHcUiOenqoXKXV32lsbDKvTU0DJVaAsjxZUu+ry
	l4L5G7/M19wU73fC2lOh0k2Ea9dW3dmca+Vub7Q/wJW/8IODU/v5nVnQ6aqioR9k5xDekR6Ru8SN3
	lUJBSlB2BWOpSZszR+YLGhRmW2ThIjUJ2jz9rI1dULntqqVSy7X6yVIE3xQmAqj5uoOY0eIhZfwdo
	8R0vwub7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUm3D-00AWxE-AW; Fri, 09 Apr 2021 07:59:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUm2R-00AWlb-5c
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 07:58:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5EB61FF80E;
 Fri,  9 Apr 2021 07:58:44 +0000 (UTC)
Date: Fri, 9 Apr 2021 09:58:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Luo Meng <luomeng12@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: remove unneeded return statment in
 mtdswap_write_marker()
Message-ID: <20210409095843.13750145@xps13>
In-Reply-To: <20210409075622.2111788-1-luomeng12@huawei.com>
References: <20210409075622.2111788-1-luomeng12@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_085848_560906_EE70D833 
X-CRM114-Status: GOOD (  16.41  )
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

SGkgTHVvLAoKTHVvIE1lbmcgPGx1b21lbmcxMkBodWF3ZWkuY29tPiB3cm90ZSBvbiBGcmksIDkg
QXByIDIwMjEgMTU6NTY6MjIgKzA4MDA6Cgo+IEl0IHNob3VsZCBiZSBpbXBvc3NpYmxlICdyZXQg
IT0wJyBhbmQgJ29wcy5vb2JyZXRsZW4gIT0gb3BzLm9vYmxlbicsCgpXaHkgZG8geW91IHNheSBp
dCdzIGltcG9zc2libGU/Cgo+IFNvIHJlbW92ZSB0aGUgdW5uZWVkZWQgcmV0dXJuIHN0YXRtZW50
Lgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdW8gTWVuZyA8bHVvbWVuZzEyQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvbXRkL210ZHN3YXAuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHN3YXAu
YyBiL2RyaXZlcnMvbXRkL210ZHN3YXAuYwo+IGluZGV4IDc5NWRlYzQ0ODNjMi4uMTJiYWNiNGFl
OWRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHN3YXAuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL210ZHN3YXAuYwo+IEBAIC0zOTgsMTIgKzM5OCwxMCBAQCBzdGF0aWMgaW50IG10ZHN3YXBf
d3JpdGVfbWFya2VyKHN0cnVjdCBtdGRzd2FwX2RldiAqZCwgc3RydWN0IHN3YXBfZWIgKmViLAo+
ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+IC0JaWYgKG9wcy5vb2JyZXRsZW4gIT0gb3BzLm9v
Ymxlbikgewo+ICsJaWYgKG9wcy5vb2JyZXRsZW4gIT0gb3BzLm9vYmxlbikKPiAgCQlkZXZfd2Fy
bihkLT5kZXYsICJTaG9ydCBPT0Igd3JpdGUgZm9yIGJsb2NrIGF0ICUwOGxseDogIgo+ICAJCQki
JXpkIG5vdCAlemRcbiIsCj4gIAkJCW9mZnNldCwgb3BzLm9vYnJldGxlbiwgb3BzLm9vYmxlbik7
CgpXaHkgZG8geW91IGtlZXAgdGhlIGNvbmRpdGlvbiBpZiBpdCdzIGltcG9zc2libGU/CldoeSB3
b3VsZCB5b3Uga2VlcCB0aGUgZGV2X3dhcm4gYW5kIHJldHVybiAwPwoKPiAtCQlyZXR1cm4gcmV0
Owo+IC0JfQo+ICAKPiAgCXJldHVybiAwOwo+ICB9CgpJIHRoaW5rIHRoaXMgcGF0Y2ggY2FuIGJl
IHNhZmVseSBkaXNjYXJkZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
