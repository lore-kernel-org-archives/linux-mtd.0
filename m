Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471E5C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:27:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6DA6162B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6DA6162B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=POEhyG0J9GuBfqwdDbx9aBrANgT2LjLrdpUMh+1qxTA=; b=IsXR1TVyHsLsnBkcbtCm3VG4Z
	vZOetVV9Lx9CoK3q2aOvET2qTWyWQ1OO0erDBEb8AE0HCFCNF/cfr+6sKFMW/rXif+0KttJkTD8rm
	5a5XDiFaXsg3XQwEloPqmQT9Lo0qy9vPDwDKPQmn8BJVgBe1HwwZdrDAfX99HfvskeIU4WMgaZDC0
	78eI70xZX1AuqyVSCtdvF5/F+yLFYihNkNQn9bjEnr3NqMK5AtTQF1QSWK87XaOqt9QBa9zDuBKf6
	tJeVwO89joXrITDcuhSDyGv2t3619RNWxSwIZrQuMdKNFjH6n7vuYiGaNI3H94RdDEHH/zoHQ8Id5
	T5onlkidQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg37c-00DvlI-Sh; Mon, 10 May 2021 10:26:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg33H-00Dv73-Pr
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=Z0omp1EvsJIgv/8gFPAtOX9dgtfOz8/nGAc5pExJo50=; b=dKxh056Yr6ATNylRMPPt97ytTo
 oKcvj9OaY4QQm4ybHYNA3JcFm2bgzbHa+rtDykU6xQxKPB2PR9NDiqFNNmpX0TxlU5GtTW7ddsLCB
 D2cVdlsUPkgkM18g56kc4ErJjWXVhHQLIBqyxCXJt/iHuzn5SYpt+IkuX57YqC2eyOHKwUSsML5tr
 J1vae5ibRaCrkXyh063GJuTRSYjOc2905cYsnoL6Ol9IFnasHWQwHe2/HC4J7etp4GLD+FqrSo4og
 w4tfyYm4NZ+qYb0yIeiEBNFLHrBSAQp5ze6k24Yi9l4uUd7fNn6MF2uXk+L5vAmGQdu9eSKtFcVTA
 INk1xp9A==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg33F-008WTo-0w
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:22:14 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 63400240003;
 Mon, 10 May 2021 10:22:08 +0000 (UTC)
Date: Mon, 10 May 2021 12:22:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dingsenjie@163.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dingsenjie <dingsenjie@yulong.com>
Subject: Re: [PATCH] mtd: devices: Remove superfluous "break"
Message-ID: <20210510122207.03a6154b@xps13>
In-Reply-To: <20210409030900.40296-1-dingsenjie@163.com>
References: <20210409030900.40296-1-dingsenjie@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_032213_221305_18E95BB5 
X-CRM114-Status: GOOD (  14.24  )
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

SGkgZGluZ3NlbmppZUAxNjMuY29tLAoKZGluZ3NlbmppZUAxNjMuY29tIHdyb3RlIG9uIEZyaSwg
IDkgQXByIDIwMjEgMTE6MDk6MDAgKzA4MDA6Cgo+IEZyb206IGRpbmdzZW5qaWUgPGRpbmdzZW5q
aWVAeXVsb25nLmNvbT4KPiAKPiBSZW1vdmUgc3VwZXJmbHVvdXMgImJyZWFrIiwgYXMgdGhlcmUg
aXMgYSAicmV0dXJuIiBiZWZvcmUgdGhlbS4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpdAoKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBkaW5nc2VuamllIDxkaW5nc2VuamllQHl1bG9uZy5jb20+CgogICAgICAgICAgICAgICAgICAg
ICAgXgpQbGVhc2UgdXNlIHlvdXIgcmVhbCBuYW1lIGhlcmUuCgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9kZXZpY2VzL21zMDItbnYuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL21zMDItbnYuYyBiL2RyaXZl
cnMvbXRkL2RldmljZXMvbXMwMi1udi5jCj4gaW5kZXggZmI0YTZhYS4uMDhmNzZmZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL21zMDItbnYuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L2RldmljZXMvbXMwMi1udi5jCj4gQEAgLTI4Niw3ICsyODYsNiBAQCBzdGF0aWMgaW50IF9faW5p
dCBtczAybnZfaW5pdCh2b2lkKQo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAgCQlyZXR1cm4g
LUVOT0RFVjsKPiAtCQlicmVhazsKPiAgCX0KPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlf
U0laRShtczAybnZfYWRkcnMpOyBpKyspCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
