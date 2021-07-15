Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9AAC636C9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 23:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445D0613DC
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 23:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445D0613DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8F8fs8IOa0qmYVTGxFt5E4sbdGqjSbsy9EZgfhfAEeo=; b=w4D7RDO2vO+U/P
	kvtTADR7tbfcX/ksDReZQUDqSEWhuUfzg3KScL2s1eBZUAxHHgsY1arIHmK8ZsStzwtCap4cV71L6
	DI6LLEhgyyXRFUl9RQZBincBai+Ik/W5paSTMfX+XYVxrORZquCbka8Iq/4k0PELS8GG3f8TqRIt9
	FIvtnJPVgqk92qLEz1hjw1wIb/TcUAP9Dls94TIEDgIJnyxi7FWa2pVaavaA+BB91S1saTOd7P26U
	VAjA19RUkTOfdchep8YzTmD/PdbO+Mra4PEjL1OdiTURA9ss5wlo+mAHsiigMcKDzXxhywbfm4Xr+
	owixXLolnUmIQkJ2ZJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4ANE-002bZX-75; Thu, 15 Jul 2021 23:02:32 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ANA-002bYH-Ta
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 23:02:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DBADB1C0008;
 Thu, 15 Jul 2021 23:02:25 +0000 (UTC)
Date: Fri, 16 Jul 2021 01:02:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <David.Woodhouse@intel.com>,
 <Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linfeilong@huawei.com>
Subject: Re: [PATCH] mtd: fix size in mtd_info_user to support 64-bit
Message-ID: <20210716010224.44582046@xps13>
In-Reply-To: <20210708131359.21591-1-linmiaohe@huawei.com>
References: <20210708131359.21591-1-linmiaohe@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_160229_141487_1EEBCAB2 
X-CRM114-Status: GOOD (  16.33  )
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

SGkgTWlhb2hlLAoKTWlhb2hlIExpbiA8bGlubWlhb2hlQGh1YXdlaS5jb20+IHdyb3RlIG9uIFRo
dSwgOCBKdWwgMjAyMSAyMToxMzo1OQorMDgwMDoKCj4gRnJvbTogRmVpbG9uZyBMaW4gPGxpbmZl
aWxvbmdAaHVhd2VpLmNvbT4KPiAKPiBUaGUgc2l6ZSBpbiBzdHJ1Y3QgbXRkX2luZm9fdXNlciBp
cyAzMi1iaXQsIHdoaWNoIHdpbGwgY2F1c2UgZXJyb3JzCj4gd2hlbiBvYnRhaW5pbmcgdGhlIHNp
emUgb2YgbGFyZ2UtY2FwYWNpdHkgTVREIGRldmljZXMsIHN1Y2ggYXMgVExDCj4gTkFORCBGTEFT
SC0yMDQ4R2IuCgpCZXNpZGVzIHRoZSBmYWN0IHRoYXQgc3VjaCBkZXZpY2VzIGFyZSBmYXIgZnJv
bSBiZWluZyBzdXBwb3J0ZWQgYnkgdGhlCkxpbnV4IGtlcm5lbCwgdGhpcyBjaGFuZ2Ugd291bGQg
YmFzaWNhbGx5IGJyZWFrIHVzZXJzcGFjZSwgaXQgY2Fubm90CmVudGVyIGFzLWlzLi4uCgo+IEZp
eGVzOiA2OTQyM2Q5OWZjMTggKCJbTVREXSB1cGRhdGUgaW50ZXJuYWwgQVBJIHRvIHN1cHBvcnQg
NjQtYml0IGRldmljZSBzaXplIikKPiBTaWduZWQtb2ZmLWJ5OiBGZWlsb25nIExpbiA8bGluZmVp
bG9uZ0BodWF3ZWkuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oIGIvaW5jbHVkZS91YXBpL210
ZC9tdGQtYWJpLmgKPiBpbmRleCBiODY5OTkwYzJkYjIuLmVmZTBiNTNiMTBjMSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9tdGQv
bXRkLWFiaS5oCj4gQEAgLTEyOCw3ICsxMjgsNyBAQCBzdHJ1Y3QgbXRkX3dyaXRlX3JlcSB7Cj4g
IHN0cnVjdCBtdGRfaW5mb191c2VyIHsKPiAgCV9fdTggdHlwZTsKPiAgCV9fdTMyIGZsYWdzOwo+
IC0JX191MzIgc2l6ZTsJLyogVG90YWwgc2l6ZSBvZiB0aGUgTVREICovCj4gKwlfX3U2NCBzaXpl
OwkvKiBUb3RhbCBzaXplIG9mIHRoZSBNVEQgKi8KPiAgCV9fdTMyIGVyYXNlc2l6ZTsKPiAgCV9f
dTMyIHdyaXRlc2l6ZTsKPiAgCV9fdTMyIG9vYnNpemU7CS8qIEFtb3VudCBvZiBPT0IgZGF0YSBw
ZXIgYmxvY2sgKGUuZy4gMTYpICovCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
