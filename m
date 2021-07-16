Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE565C07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 09:49:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7549C613E3
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 09:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7549C613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4s+Bmo3gpwfhvzc1AuJ3GqVdwq6w9nxvOfJVnRaI0E=; b=QMrFmUA/Kfq2V3
	gTrHEPl/LH9ZWdyDQ4QhfLtJYUwiPhxOktNo0f7Lju+WUhfLl+b5fbPi694JhBZckVfS2VtZk1uHW
	z3mG4CSVT64cZx1kwMoNzXI8fFszNq6JgOtaYcLymXO2yC1CXy5xzDxP2ASVjqf1uUuJhQ56FR69I
	bmMGPzkfAj7naXn2GO3QGMvM3/LttjMquT983oo5V+L8EYw/l+ztUrfCFW4lfvSJEWPysDyvMPjA0
	KnARKk96yT9KoRnS9pdlU8L3YbECQaCCRJ4bUWkeOI8QRcT87wyKLUO4R7LvWWHChlg7UbtR6pWRa
	3S2VB+Z1BUUzBPJU4F5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4KS9-003zKI-1o; Fri, 16 Jul 2021 09:48:17 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4KS6-003zJU-B8
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 09:48:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id BC0D8100004;
 Fri, 16 Jul 2021 09:48:09 +0000 (UTC)
Date: Fri, 16 Jul 2021 11:48:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <David.Woodhouse@intel.com>,
 <Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linfeilong@huawei.com>
Subject: Re: [PATCH] mtd: fix size in mtd_info_user to support 64-bit
Message-ID: <20210716114808.246e92ba@xps13>
In-Reply-To: <95e3d455-ccb1-0e22-ee83-78dc6ad8aab1@huawei.com>
References: <20210708131359.21591-1-linmiaohe@huawei.com>
 <20210716010224.44582046@xps13>
 <95e3d455-ccb1-0e22-ee83-78dc6ad8aab1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_024814_564670_B830226E 
X-CRM114-Status: GOOD (  11.80  )
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

SGkgTWlhb2hlLAoKTWlhb2hlIExpbiA8bGlubWlhb2hlQGh1YXdlaS5jb20+IHdyb3RlIG9uIEZy
aSwgMTYgSnVsIDIwMjEgMDk6NDI6MTkKKzA4MDA6Cgo+IE9uIDIwMjEvNy8xNiA3OjAyLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgTWlhb2hlLAo+ID4gCj4gPiBNaWFvaGUgTGluIDxsaW5t
aWFvaGVAaHVhd2VpLmNvbT4gd3JvdGUgb24gVGh1LCA4IEp1bCAyMDIxIDIxOjEzOjU5Cj4gPiAr
MDgwMDoKPiA+ICAgCj4gPj4gRnJvbTogRmVpbG9uZyBMaW4gPGxpbmZlaWxvbmdAaHVhd2VpLmNv
bT4KPiA+Pgo+ID4+IFRoZSBzaXplIGluIHN0cnVjdCBtdGRfaW5mb191c2VyIGlzIDMyLWJpdCwg
d2hpY2ggd2lsbCBjYXVzZSBlcnJvcnMKPiA+PiB3aGVuIG9idGFpbmluZyB0aGUgc2l6ZSBvZiBs
YXJnZS1jYXBhY2l0eSBNVEQgZGV2aWNlcywgc3VjaCBhcyBUTEMKPiA+PiBOQU5EIEZMQVNILTIw
NDhHYi4gIAo+ID4gCj4gPiBCZXNpZGVzIHRoZSBmYWN0IHRoYXQgc3VjaCBkZXZpY2VzIGFyZSBm
YXIgZnJvbSBiZWluZyBzdXBwb3J0ZWQgYnkgdGhlCj4gPiBMaW51eCBrZXJuZWwsIHRoaXMgY2hh
bmdlIHdvdWxkIGJhc2ljYWxseSBicmVhayB1c2Vyc3BhY2UsIGl0IGNhbm5vdAo+ID4gZW50ZXIg
YXMtaXMuLi4KPiA+ICAgCj4gCj4gSSBzZWUuIE1hbnkgdGhhbmtzIGZvciB5b3VyIHJlcGx5ISBX
ZSdyZSB3b3JraW5nIHdpdGggdGhlc2UgbGFyZ2UtY2FwYWNpdHkKPiBNVEQgZGV2aWNlcyBub3cs
IGFueSBzdWdnZXN0aW9uIHRvIHdvcmsgYXJvdW5kIHRoaXM/CgpUaGUgb25seSB3YXkgaXMgdG8g
Y3JlYXRlIGEgc2Vjb25kIFVBUEkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
