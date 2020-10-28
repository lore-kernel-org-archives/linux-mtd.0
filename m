Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6579AC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:22:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA090246A9
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xs/1736J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA090246A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DhQ/Op466f5I9cx/WU5zdblf0ihe5V4qgAOvFWuMrEY=; b=Xs/1736JNkhHNPyco4/qAWPba
	w+tNv67e6WYVGiVWOh768K6Ml33RB+IWl+BbBgHzO4JXUovn7AheRLH4/d7anzhdpgKx1I2qeYpOJ
	WTPG5CUZC6nRQW2HeoFtTVKlbF5PKJ5mb9NBA2mGlTYSjZHSwxh36YEwa5Rq2yk+84gB64FCUYYjc
	zQSaGVH8/W5cDdaQxjyf3iAT/JOV7gXX7+S8rK4febg6ddP3Tjh2TYRal52DGL0iZcjdBzyvoZ00o
	NKH9Mc5qIi2zFRDliuUX2b+DUYdrif5JBUY+uj8w7oSNFOQHtyZZlRkCPv2/bVqgzPFo0WH3QQnRM
	Pz0F9GZ5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXia4-00075G-RU; Wed, 28 Oct 2020 10:21:24 +0000
Received: from mslow2.mail.gandi.net ([217.70.178.242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXia1-00073q-7C
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 10:21:22 +0000
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 80D273B26E4
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2020 10:04:00 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0BC631BF21A;
 Wed, 28 Oct 2020 10:03:19 +0000 (UTC)
Date: Wed, 28 Oct 2020 11:03:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sergei Antonov <saproj@gmail.com>
Subject: Re: [PATCH] mtd: meson: fix meson_nfc_dma_buffer_release() arguments
Message-ID: <20201028110318.134be5f8@xps13>
In-Reply-To: <20201028094940.11765-1-saproj@gmail.com>
References: <20201028094940.11765-1-saproj@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_062121_370549_D33E8A28 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: liang.yang@amlogic.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, jianxin.pan@amlogic.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VyZ2VpLAoKU2VyZ2VpIEFudG9ub3YgPHNhcHJvakBnbWFpbC5jb20+IHdyb3RlIG9uIFdl
ZCwgMjggT2N0IDIwMjAgMTI6NDk6NDAKKzAzMDA6Cgo+IEFyZ3VtZW50cyAnaW5mb2xlbicgYW5k
ICdkYXRhbGVuJyB0byBtZXNvbl9uZmNfZG1hX2J1ZmZlcl9yZWxlYXNlKCkgd2VyZSBtaXhlZCB1
cC4KPiAKPiBGaXhlczogOGZhZTg1NmM1MzUwMCAoIm10ZDogcmF3bmFuZDogbWVzb246IGFkZCBz
dXBwb3J0IGZvciBBbWxvZ2ljIE5BTkQgZmxhc2ggY29udHJvbGxlciIpCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZWkgQW50b25vdiA8c2Fwcm9qQGdt
YWlsLmNvbT4KClRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4gTmV4dCB0aW1lIHlvdSBzZW5k
IGEgbmV3IGl0ZXJhdGlvbiBvZiBhCnBhdGNoLCBwbGVhc2UgdXNlIFtQQVRDSCB2Ml0gaW4gdGhl
IHN1YmplY3QgcHJlZml4IGFuZCBhbHNvIGFkZCBhCmNoYW5nZWxvZyBiZWxvdyB0aGUgdGhyZWUg
ZGFzaGVzLgoKKHlvdXIgb3RoZXIgcGF0Y2ggdG8gZml4IHRoZSBzdHlsZSBpcyBzdGlsbCB3ZWxj
b21lKQoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gaW5kZXggNDhlNmRhYzk2YmU2Li5hNzZhZmVhNmVhNzcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gQEAgLTUxMCw3ICs1MTAsNyBAQCBz
dGF0aWMgaW50IG1lc29uX25mY19kbWFfYnVmZmVyX3NldHVwKHN0cnVjdCBuYW5kX2NoaXAgKm5h
bmQsIHZvaWQgKmRhdGFidWYsCj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIG1lc29uX25mY19kbWFf
YnVmZmVyX3JlbGVhc2Uoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiAtCQkJCQkgaW50IGluZm9s
ZW4sIGludCBkYXRhbGVuLAo+ICsJCQkJCSBpbnQgZGF0YWxlbiwgaW50IGluZm9sZW4sCj4gIAkJ
CQkJIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKPiAgewo+ICAJc3RydWN0IG1lc29uX25m
YyAqbmZjID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKG5hbmQpOwoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
