Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33D8C10F0B
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 06:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E3EC2184B
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 06:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kmRkj5an"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E3EC2184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y//84EoFAbePTqCBkOIWYbs6Lrz2A6WQMNA2Tx/v/1I=; b=kmRkj5and8/jy/
	iV3hCj6FhAncOaU6DqilRwJ0XnXvFlicbqUnVp3Tj0Y3k+v8cArt+6KY7zr+a3wh4ovhKciflWe59
	lEHS3AyrsxRq0GSiyhZMlKgurkPk2Q/aIxTjp1R7LjvUWSKm0TDJUX5Bs/q5hf/s3FYYkOlkAexr2
	pD55S2S190DUUfxKIG55ycqPYk5KJYKrW5D/2/xaPQTUytfxURNsf1fb5nn5qY+sUjav1Z/OkjTNm
	RXG8jLk0WLYaYbbQDOMpkkpCI0Yyxqmp+rCyo/mtnrId0FuXiY6onnm2aWqQUPKkB7Blnuc1+Npvy
	orTfcJWS/UYTdjQ4oFww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH0rp-0005jf-S4; Thu, 18 Apr 2019 06:49:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH0rf-0005da-W1; Thu, 18 Apr 2019 06:49:45 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5FDE540002;
 Thu, 18 Apr 2019 06:49:30 +0000 (UTC)
Date: Thu, 18 Apr 2019 08:49:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: ams-delta: Drop board specific
 partition info
Message-ID: <20190418084929.7ac2cb67@xps13>
In-Reply-To: <3638685.4RdFRBT8kZ@z50>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <20190324223344.24590-1-jmkrzyszt@gmail.com>
 <20190417114010.774693cf@xps13> <3638685.4RdFRBT8kZ@z50>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_234944_180716_AE89F346 
X-CRM114-Status: GOOD (  18.26  )
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
Cc: linux-omap@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmFudXN6LAoKSmFudXN6IEtyenlzenRvZmlrIDxqbWtyenlzenRAZ21haWwuY29tPiB3cm90
ZSBvbiBUaHUsIDE4IEFwciAyMDE5CjAxOjA5OjU5ICswMjAwOgoKPiBIaSBBYXJvLCBUb255LAo+
IAo+IE9uIFdlZG5lc2RheSwgQXByaWwgMTcsIDIwMTkgMTE6NDA6MTAgQU0gQ0VTVCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+ID4gSGkgSmFudXN6LAo+ID4gCj4gPiBKYW51c3ogS3J6eXN6dG9maWsg
PGpta3J6eXN6dEBnbWFpbC5jb20+IHdyb3RlIG9uIFN1biwgMjQgTWFyIDIwMTkKPiA+IDIzOjMz
OjQ0ICswMTAwOgo+ID4gICAKPiA+ID4gQWZ0ZXIgcmVjZW50IG1vZGlmaWNhdGlvbnMsIG9ubHkg
YSBoYXJkY29kZWQgcGFydGl0aW9uIGluZm8gbWFrZXMKPiA+ID4gdGhlIGRyaXZlciBkZXZpY2Ug
c3BlY2lmaWMuICBPdGhlciB0aGFuIHRoYXQsIHRoZSBkcml2ZXIgdXNlcyBHUElPCj4gPiA+IGV4
Y2x1c2l2ZWx5IGFuZCBjYW4gYmUgdXNlZCBvbiBhbnkgaGFyZHdhcmUuCj4gPiA+IAo+ID4gPiBE
cm9wIHRoZSBwYXJ0aXRpb24gaW5mbyBhbmQgdXNlIE1URCBwYXJ0aXRpb24gcGFyc2VyIHdpdGgg
ZGVmYXVsdCBsaXN0Cj4gPiA+IG9mIHBhcnNlciBuYW1lcyBpbnN0ZWFkLiAgRm9yIHRoZSBPRiBw
YXJzZXIgdG8gd29yayBjb3JyZWN0bHksIHBhc3MKPiA+ID4gZGV2aWNlIG9mX25vZGUgdG8gbXRk
Lgo+ID4gPiAKPiA+ID4gQW1zdHJhZCBEZWx0YSB1c2VycyBzaG91bGQgYXBwZW5kIHRoZSBmb2xs
b3dpbmcgcGFydGl0aW9uIGluZm8gdG8gdGhlaXIKPiA+ID4ga2VybmVsIGNvbW1hbmQgbGluZSwg
cG9zc2libHkgYnkgZW1iZWRkaW5nIGl0IGluIENPTkZJR19DTURMSU5FOgo+ID4gPiAKPiA+ID4g
bXRkcGFydHM9YW1zLWRlbHRhLW5hbmQ6MzU4NGsoS2VybmVsKSwyNTZrKHUtYm9vdCksMjU2ayh1
LWJvb3RfcGFyYW1zKSxcCj4gPiA+IDI1NmsoQW1zdHJhZF9MRFIpLDI3bShGaWxlX3N5c3RlbSks
NzY4ayhQQkxfcmVzZXJ2ZWQpLgo+ID4gPiAKPiA+ID4gRm9yIHRoZWlyIGNvbnZlbmllbmNlLCBD
T05GSUdfTVREX0NNRExJTkVfUEFSVFMgc3ltYm9sIGlzIHNlbGVjdGVkCj4gPiA+IGF1dG9tYXRp
Y2FsbHkgZnJvbSB0aGF0IGJvYXJkIEtjb25maWcgaWYgdGhpcyBOQU5EIGRyaXZlciBpcyBhbHNv
Cj4gPiA+IHNlbGVjdGVkLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFudXN6IEtyenlz
enRvZmlrIDxqbWtyenlzenRAZ21haWwuY29tPgo+ID4gPiBDYzogVG9ueSBMaW5kZ3JlbiA8dG9u
eUBhdG9taWRlLmNvbT4KPiA+ID4gLS0tICAKPiA+IAo+ID4gRllJIEkgYW0gb2theSB3aXRoIHRo
ZSBjaGFuZ2UgYnV0IEkgYW0gd2FpdGluZyBmb3IgYWNrcyBiZWZvcmUgYXBwbHlpbmcKPiA+IGl0
LiAgCj4gCj4gTWF5IHdlIGhhdmUgYW4gYWNrIGZyb20geW91Pwo+IAo+IElmIHN0aWxsIG5vdCBj
b252aW5jZWQgd2l0aCBteSBjbGFyaWZpY2F0aW9ucywgSSBjYW4gYWRkIGEgY29tbWVudCB0byBo
ZWxwIHRleHQgCj4gaW4gS2NvbmZpZywgZWl0aGVyIHNxdWFzaGVkIG9yIGluIGEgZm9sbG93IHVw
IHBhdGNoLCBvbiB0aGUgcmVxdWlyZW1lbnQgb2YgCj4gYXBwZW5kaW5nIG10ZHBhcnRzIHBhcmFt
ZXRlciB0byBjb21tYW5kIGxpbmUuICBXaGF0IGRvIHlvdSB0aGluaz8KCkluIHRoZSBzYW1lIHBh
dGNoIEkgZ3Vlc3MgdGhhdCB3b3VsZCBiZSBmaW5lLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
