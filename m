Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1BAC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 08:15:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD13206C1
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 08:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zuHwGKxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAD13206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YfKjh2usQNTOv7RnPsTx4Qt6XZzwKPqx5UPxlFxLwkM=; b=zuHwGKxL4sWXzZFdx7/8XA7RQ
	LoidSK+OW1yGclT5FKpBj8fhUy43tNxEd+gE2giZUZIgPExtLapv1oBjGTrgRanLaUczukvdd8U3b
	ctHu7SPXaXitb0jB3eoWsSncsHT7IhAfEiiSTVyKeX7shBZ4aUZ0+Gq5hNRheyS88UyRXNr6ZWdkk
	xiA7GZml2JAQw9wNrko+VSXPYeU76FW8lflAEOavK9RnVVP9Fjhhp/6RCHYtgDwacjPYucmgWNdsa
	oCFhzE6CJHlNhru20z1dkg/iY6ESFRg9OMUiWjuJJDJUpJfQssAR9DpAhVhsQf8EHmk/JkHPleVu3
	Co+7hBpBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNAn0-0000HO-R9; Tue, 29 Sep 2020 08:15:10 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNAmy-0000GJ-14
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 08:15:09 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BE0831C000E;
 Tue, 29 Sep 2020 08:15:04 +0000 (UTC)
Date: Tue, 29 Sep 2020 10:15:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v13 17/20] mtd: rawnand: Use the ECC framework OOB layouts
Message-ID: <20200929101501.18495d8b@xps13>
In-Reply-To: <3339465.iIbC2pHGDl@z50>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-18-miquel.raynal@bootlin.com>
 <3339465.iIbC2pHGDl@z50>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_041508_160280_82D6BA0D 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmFudXN6LAoKSmFudXN6IEtyenlzenRvZmlrIDxqbWtyenlzenRAZ21haWwuY29tPiB3cm90
ZSBvbiBTdW4sIDIwIFNlcCAyMDIwCjE0OjIxOjQ0ICswMjAwOgoKPiBPbiBUaHVyc2RheSwgQXVn
dXN0IDI3LCAyMDIwIDEwOjUyOjA1IEEuTS4gQ0VTVCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4g
Tm8gbmVlZCB0byBoYXZlIG91ciBvd24gaW4gdGhlIHJhdyBOQU5EIGNvcmUuICAKPiAKPiBIaSBN
aXF1ZWwsCj4gCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBmb3IgbWUsIGF0
IGxlYXN0IG9uIGFtcy1kZWx0YSB3aGljaCBzZXRzIAo+IG5hbmRfY2hpcC0+ZWNjLmVuZ2luZV90
eXBlIHRvIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQgYW5kIAo+IG5hbmRfY2hpcC5lY2MtPmFs
Z28gdG8gTkFORF9FQ0NfQUxHT19IQU1NSU5HLiAgTm8gcmVsYXRlZCBrZXJuZWwgbWVzc2FnZXMg
Cj4gY291bGQgYmUgb2JzZXJ2ZWQsIGJ1dCBuYW5kZHVtcCBmYWlscyB3aXRoICJwcmVhZDogTnVt
ZXJpY2FsIHJlc3VsdCBvdXQgb2YgCj4gcmFuZ2UiIGZvciBtZS4KClRoYW5rcyBmb3IgdGhlIHJl
cG9ydCBhbmQgc29ycnkgZm9yIHRoZSBkZWxheSEKCj4gVGhlIEVDQyBmcmFtZXdvcmsgT09CIGxh
eW91dHMgcmVmZXIgdG8gbmFuZF9kZXZpY2UtPmVjYy5jdHgudG90YWwgd2hpY2ggbm8gCj4gZHJp
dmVyIG5vciBFQ0MgZW5naW5lIGluaXRpYWxpemVzIHNvIGZhciwgd2hpbGUgdGhlIG9sZCBsYXlv
dXRzIHVzZWQgdG8gcmVmZXIgCj4gdG8gbmFuZF9jaGlwLT5lY2MudG90YWwsIHN0aWxsIGluaXRp
YWxpemVkIGJ5IG5hbmRfc2Nhbl90YWlsKCkuICBJcyB0aGVyZSBhbnkgCj4gd29yayBpbiBwcm9n
cmVzcyB3aGljaCB3aWxsIGFkZHJlc3MgdGhlIGlzc3VlIChpbml0aWFsaXphdGlvbiBvZiAKPiBu
YW5kX2RldmljZS0+ZWNjLmN0eC50b3RhbCBhdCBsZWFzdCk/CgpJbmRlZWQsIHRoZXJlIGFyZSBt
b3JlIGNoYW5nZXMgY29taW5nIGFuZCB0aGUgdXBkYXRlIG9mIGVjYy5jdHgudG90YWwKd2FzIGRv
bmUgaW4gYW4gdXBjb21pbmcgcGF0Y2guIEl0IG1ha2VzIHNlbnNlIHRvIHVwZGF0ZSB0aGlzIGVu
dHJ5IHdoZW4Kc3dpdGNoaW5nIHRvIHRoZSAiZ2VuZXJpYyIgbGF5b3V0cywgc28gSSBtb3ZlZCB0
aGUgbGluZSBpbiB0aGlzIHBhdGNoLgoKSSBqdXN0IHVwZGF0ZWQgbmFuZC9uZXh0LCBwbGVhc2Ug
dGVsbCBtZSBpZiBpdCBmaXhlZCB5b3VyIHNldHVwPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
