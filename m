Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A7EC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A41F02051A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="isEuxW6p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A41F02051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bc/CKgEYpg5MACeahDMdQfmf0eIVRSSBKqwmCy4wgos=; b=isEuxW6pX1OQ/+
	OCriLHEOsesLb8Z1LIQypV6aRYVORafKeqmij7C5oji7xluYKw7WwiXDVzVG5UVOKD9yq/D26CDlA
	dh8tIGXywwnHOxXVRDGbqLZikKd0tUwP0+RMAoyKorI4DeS8XCZooCbtKt0zwQ6JgocD84H3ZYRJa
	zWT6cCHBGJgOVW0iGNfdNOxU5r3+8kOoqbvFSNQ/H1xve236GaonndC2nmTizfzewqG4oU9Xdwj85
	uRaP2yH4q1lJkwunIEqqyrxnzD+5JnJRf1fwTq0bZ/k6EV0M04/eaBU8XOYyvHvYh1gBJiwixRptm
	HsiT1JtPtiYGFR2xAn4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBGxm-0005hL-5o; Mon, 09 Mar 2020 11:52:50 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBGxj-0005ga-Na
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 11:52:49 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4492A1C0013;
 Mon,  9 Mar 2020 11:52:40 +0000 (UTC)
Date: Mon, 9 Mar 2020 12:52:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: Re: [PATCH v3 0/2] mtd: spinand: toshiba: Support for new Kioxia
 Serial NAND
Message-ID: <20200309125239.39879af3@xps13>
In-Reply-To: <cover.1583371913.git.ytc-mb-yfuruyama7@kioxia.com>
References: <cover.1583371913.git.ytc-mb-yfuruyama7@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_045247_903995_206A7A72 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29t
PiB3cm90ZSBvbiBGcmksICA2IE1hcgoyMDIwIDEyOjA4OjIxICswOTAwOgoKPiBGaXJzdCBwYXRj
aCBpcyB0byByZW5hbWUgZnVuY3Rpb24gbmFtZSBiZWNhc2Ugb2YgYWRkIG5ldyBkZXZpY2UuCj4g
U2Vjb25kIHBhdGNoIGlzIHRvIHN1cHByb3QgZm9yIG5ldyBkZXZpY2UuCj4gCj4gWW9zaGlvIEZ1
cnV5YW1hICgyKToKPiAgIG10ZDogc3BpbmFuZDogdG9zaGliYTogUmVuYW1lIGZ1bmN0aW9uIG5h
bWUgdG8gY2hhbmdlIHN1ZmZpeCBhbmQKPiAgICAgcHJlZml4ICg4R2JpdCkKPiAgIG10ZDogc3Bp
bmFuZDogdG9zaGliYTogU3VwcG9ydCBmb3IgbmV3IEtpb3hpYSBTZXJpYWwgTkFORAo+IAo+ICBk
cml2ZXJzL210ZC9uYW5kL3NwaS90b3NoaWJhLmMgfCAxNzMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzMCBpbnNlcnRpb25zKCsp
LCA0MyBkZWxldGlvbnMoLSkKPiAKClBsZWFzZSBiZSBjYXJlZnVsIHdoZW4gc2VuZGluZyB5b3Vy
IHNlcmllczogSSByZWNlaXZlZCB0aGUgY292ZXIKbGV0dGVyLCB0aGVuIHR3aWNlIHBhdGNoIDIv
MiB0aGVuIHBhdGNoIDEvMi4KCkFsc28sIEkgY2Fubm90IGFwcGx5IHRoaXMgc2VyaWVzIGFzLWlz
LCBwbGVhc2UgcmViYXNlIG9uIHRvcCBvZiB0aGUKbGFzdCAtcmMuCgpJJ2xsIGFwcGx5IHRoZXNl
IHBhdGNoZXMgYXMgc29vbiBhcyB5b3UgcmVzZW5kLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
