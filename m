Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325DFC433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 22:13:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41472076C
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 22:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhFvca+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41472076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qR/yJwGkVso8oF/ecj5d5Q4J7rtdZLBkJ2IcVJOTaCc=; b=nhFvca+9yHl2S9
	k2dOUUZ+77y9GiHy5QYgGFo3+MsiXpMPLT6l6l3CSGHMfD5Izh8RDtQlZRfyaSF7SmjbjIhH44E8m
	x/dG3sOseEX8gDC5+azPbfwK9lhTNV0ecoMsalB5++a7lQTU47sVhes6osWakz69DMs/tuEn/3j7T
	Mb0pEXN+5WXt5nMECyiHttgziavzDwiqwRIUPL9tSUYOAQz7yHiDvcez0lLGaDanpQI/8yNAQz0Ow
	FiBeQcCprqmBg4LDHP399tlGS8WNQlG9t5VFIOe0mu6uittouW9t2ZyWbSvCy+42xoOZ6o50g+wv5
	xq37wHcASHe9xZVjfBHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcysB-0001gs-5k; Sun, 24 May 2020 22:13:35 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcys9-0001gZ-1Y
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 22:13:34 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0B62E20007;
 Sun, 24 May 2020 22:13:29 +0000 (UTC)
Date: Mon, 25 May 2020 00:13:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 17/17] mtd: rawnand: nandsim: Reorganize
 ns_cleanup_module()
Message-ID: <20200525001328.6b52da1f@xps13>
In-Reply-To: <CAFLxGvzU2ESxZ74cve9w=CLBY2v95MMMJqzOFEmCAhVHYF5VvA@mail.gmail.com>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-18-miquel.raynal@bootlin.com>
 <CAFLxGvzU2ESxZ74cve9w=CLBY2v95MMMJqzOFEmCAhVHYF5VvA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_151333_219158_1081AA1B 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, dedekind@infradead.org,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZC53ZWluYmVyZ2VyQGdtYWls
LmNvbT4gd3JvdGUgb24gU3VuLCAyNCBNYXkKMjAyMCAyMzozNzoxMyArMDIwMDoKCj4gT24gU2F0
LCBNYXkgOSwgMjAyMCBhdCA5OjE5IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+ID4gICAgICAgICBuc19kZWJ1Z2ZzX3JlbW92ZShucyk7Cj4gPiAt
ICAgICAgIG5zX2ZyZWUobnMpOyAgICAvKiBGcmVlIG5hbmRzaW0gcHJpdmF0ZSByZXNvdXJjZXMg
Ki8KPiA+IC0gICAgICAgbmFuZF9yZWxlYXNlKGNoaXApOyAvKiBVbnJlZ2lzdGVyIGRyaXZlciAq
Lwo+ID4gLSAgICAgICBrZnJlZShucyk7ICAgICAgICAvKiBGcmVlIG90aGVyIHN0cnVjdHVyZXMg
Ki8KPiA+IC0gICAgICAgbnNfZnJlZV9saXN0cygpOwo+ID4gKyAgICAgICBXQVJOX09OKG10ZF9k
ZXZpY2VfdW5yZWdpc3Rlcihuc210ZCkpOwo+ID4gKyAgICAgICBuc19mcmVlKG5zKTsKPiA+ICsg
ICAgICAga2ZyZWUoZXJhc2VfYmxvY2tfd2Vhcik7Cj4gPiArICAgICAgIG5hbmRfY2xlYW51cChj
aGlwKTsKPiA+ICsgICAgICAgbGlzdF9mb3JfZWFjaF9zYWZlKHBvcywgbiwgJmdyYXZlX3BhZ2Vz
KSB7Cj4gPiArICAgICAgICAgICAgICAga2ZyZWUobGlzdF9lbnRyeShwb3MsIHN0cnVjdCBncmF2
ZV9wYWdlLCBsaXN0KSk7Cj4gPiArICAgICAgICAgICAgICAgbGlzdF9kZWwocG9zKTsgIAo+IAo+
IEFyZSB5b3Ugc3VyZSB5b3UgY2FuIHVzZSBwb3MgYWZ0ZXIgZnJlZWluZyB0aGUgZW50cnk/Cj4g
U21lbGxzIGxpa2UgdXNlIGFmdGVyIGZyZWUuCj4gCgpNbW1taCwgSSBzaG91bGQgcHJvYmFibHkg
aW52ZXJ0IHRob3NlIHR3byBsaW5lcywgZmlyc3QgY2FsbCBsaXN0X2RlbCgpCmFuZCB0aGVuIGNh
bGwga2ZyZWUoKSBvbiBsaXN0X2VudHJ5KCkuCgpUaGFua3MgZm9yIG5vdGljaW5nIQpNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
