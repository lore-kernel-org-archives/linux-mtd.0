Return-Path: <SRS0=9k8X=RF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEEFC43381
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Mar 2019 14:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ADBC20836
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Mar 2019 14:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RbiUqEwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ADBC20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIl2ZOqn9hmGri2bEFxryt7rDFTd4AiAuJ9IsMup0vM=; b=RbiUqEwe9KDXW7
	rCuCoHr/6v3o+je5Md64qC9pvOMkHYBBraBXTAR11TVwWdwwHcMdh4bSWtMIVHT7C35XHtAwE1uAH
	2izrHHTlg6iF/OaE4jhXjhlFo8WuePKqFTHngaIHnvUYi3fFx8mFspYLPYPuD0NTtnUXNlKOzMQdY
	DZUwRoXsvl6if4wFMgZ6iqxoJZAeDJ/xpOqY2HKNcdgyCYod8bkL/84SQT/eP2rWIUC/mmauZ1PS/
	byikkW9FM115JGuCgbwp0cvznBE+nyHxjHveAIqrNbxebutSCc0VTO1p4J+LmIE5VN4s+Efgejlri
	7UR/Tl18UsVZQ9woTPYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h05w8-00081W-OU; Sat, 02 Mar 2019 14:48:24 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h05vw-0007v9-5Y; Sat, 02 Mar 2019 14:48:14 +0000
X-Originating-IP: 77.154.225.176
Received: from xps13 (176.225.154.77.rev.sfr.net [77.154.225.176])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1A9D2E0008;
 Sat,  2 Mar 2019 14:47:54 +0000 (UTC)
Date: Sat, 2 Mar 2019 15:47:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v3] mtd: rawnand: Mark expected switch fall-throughs
Message-ID: <20190302154752.4e05d010@xps13>
In-Reply-To: <91f56f21-48da-1f0a-4018-e080905aca0d@embeddedor.com>
References: <20190208174930.GA12962@embeddedor>
 <1a9e7d7e-6743-4932-a1b6-528ae7e5643a@embeddedor.com>
 <2354894.fi12vfZcmb@blindfold>
 <91f56f21-48da-1f0a-4018-e080905aca0d@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190302_064812_357671_E9FDD062 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Kees Cook <keescook@chromium.org>, Wan ZongShun <mcuos.com@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gRnJpLCAxIE1hciAyMDE5CjE4OjMzOjEzIC0wNjAwOgoKPiBPbiAzLzEvMTkg
NDozOSBQTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+ID4gQW0gRnJlaXRhZywgMS4gTcOk
cnogMjAxOSwgMjI6Mzg6MTggQ0VUIHNjaHJpZWIgR3VzdGF2byBBLiBSLiBTaWx2YTogIAo+ID4+
IEhpIGFsbCwKPiA+Pgo+ID4+IEZyaWVuZGx5IHBpbmc6Cj4gPj4KPiA+PiBXaG8gY2FuIHRha2Ug
dGhpcywgcGxlYXNlPyAgCj4gPiAKPiA+IC9tZSBwb2ludHMgdG8gTWlxdWVsLiA6KQoKWXVwIQoK
PiA+ICAgCj4gCj4gVGhhbmtzLCBSaWNoYXJkLgo+IAo+IEhvcGVmdWxseSwgTWlxdWVsIHdpbGwg
dGFrZSB0aGlzIGZvciA1LjEuIDopCgpOby4gVGhlIHRpbWluZyBvbiB5b3VyIHNpZGUgd2FzIHJp
Z2h0IGJ1dCBJIHdhcyBsYXRlIHRvIHNlbmQgdGhlIFBSIGFuZApJIGNob29zZSBub3QgdG8gdGFr
ZSB0aGlzIG9uZSBpbiBhIGh1cnJ5IGFsdGhvdWdoIHlvdSBhZGRyZXNzZWQgb25seQp0cml2aWFs
IGNhc2VzIGFuZCBsZWZ0IGFzaWRlIHRoZSBvbmVzIHdoaWNoIHdlcmUgbW9yZSBsaWtlbHkgdG8K
aW50cm9kdWNlIGJ1Z3MuIE5ldmVydGhlbGVzcywgSSBwbGFuIHRvIHF1ZXVlIGl0IGZvciA1LjIu
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
