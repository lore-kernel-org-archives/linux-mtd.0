Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D07C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ytqNAcC4LKmgvZ52w7SbCVD+cbxDkhJmeVajj6QDDA=; b=nUGQmdwaims0eO
	lMtiDGJjaKzwKIYq3XD99RpxDhJ1J8ohxMRCoUTXkc0Vgviks3TloMsaHTMZOYQbIAMIW09IjsDCI
	bmxz1TFR9YR8rqXCCKQgU6qCefJjKhAUHhA4vOfshq9Ky5tKZ8AluP6VaKdLSPFPt+nEbFCjQVfUJ
	916YHoMTRMdmkl/Tq4xcTj9CkSdJ6ibeiCFmG/CiwI78v3VJCtz+hkBqLhHKu7+BQoIWNnY7hjbZF
	tYJ8ivUeU5HntaNZbmnaOozapyhy04j6AKFGsLrz/onehroUM98P45lhc62TRnzBIBowRsibXLM1p
	4xTd6gNqqyluhg+x+gAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9sP-00Eie8-3D;
	Tue, 28 Mar 2023 14:00:42 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9sM-00Eibt-20
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 14:00:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 54AE61BF217;
	Tue, 28 Mar 2023 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680012029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pe8UkDisXrYYXdGuQJ+Czrio2NwMLtL21uYVzi/8p9Q=;
	b=O9lQOw4dpI7Y8EoYM1opImQ58RBCVbFz4qL8h9ADAWgvtcgOyKYCtOKRc48gErUlixj+NL
	o65hhGBWqBD9KheOkuD9TUcVOFApDEzn0hPFfWj+vOzEs71NQQvaN2B5p947ophQ/3hGMd
	hE1rHs+COdXJxY8NTW5zV/4lAkA2P8WjkWPqzlcqv+7yxFFo+sTVxtajCVP36LL0XULMM1
	LS/DKEHQERoWktRrEVGJ1utvOe6giYeDkcMf/vq8jdXqQCrWu5rfl+kFW9vJ61WFoyJgPM
	odrU621R43URI+lld63wnmsdlQpUBbjkMk55EVVz4P7raw7ZsWDt3DB3HJaKyw==
Date: Tue, 28 Mar 2023 16:00:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Bang Li <libang.linuxer@gmail.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtdblock: tolerate corrected bit-flips
Message-ID: <20230328160027.21b5b340@xps-13>
In-Reply-To: <1785377500.357636.1680009710991.JavaMail.zimbra@nod.at>
References: <20230323140350.69908-1-libang.linuxer@gmail.com>
	<20230328145848.5c7e4f14@xps-13>
	<1785377500.357636.1680009710991.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_070038_795874_CCB95D84 
X-CRM114-Status: GOOD (  13.38  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIFR1ZSwgMjggTWFyIDIwMjMgMTU6
MjE6NTAgKzAyMDAgKENFU1QpOgoKPiBIaSEKPiAKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWls
IC0tLS0tCj4gPiBsaWJhbmcubGludXhlckBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAyMyBNYXIg
MjAyMyAyMjowMzo1MCArMDgwMDoKPiA+ICAgCj4gPj4gbXRkX3JlYWQoKSBtYXkgcmV0dXJuIC1F
VUNMRUFOIGluIGNhc2Ugb2YgY29ycmVjdGVkIGJpdC1mbGlwcy5UaGlzCj4gPj4gcGFydGljdWxh
ciBjb25kaXRpb24gc2hvdWxkIG5vdCBiZSB0cmVhdGVkIGxpa2UgYW4gZXJyb3IuICAKPiA+IAo+
ID4gSSdtIGZpbmUgd2l0aCB0aGUgcGF0Y2gsIFJpY2hhcmQsIGFyZSB5b3Ugb2theSBhcyB3ZWxs
PyAgCj4gCj4gSG0geWVzLiBJIHNlZSB0aGUgYnVnLiBJIHRoaW5rIGl0IGJyb2tlIGFib3V0IDEw
IHllYXJzIGFnbwo+IGJ5IGU0N2Y2ODU4N2I4MiAoIm10ZDogY2hlY2sgZm9yIG1heF9iaXRmbGlw
cyBpbiBtdGRfcmVhZF9vb2IoKSIpLgo+IAo+IEluIHRoZSBlYXJseSBkYXkgSSdkIGV4cGVjdCBz
b21lb25lIHRvIGhpdCB0aGlzIGJ1ZyBidXQgSSBndWVzcwo+IG9uIHRoZSBsYXN0IDEwIHllYXJz
IG10ZGJsb2NrIGhhZCBubyByZWFsIHVzZXJzLgoKUmlnaHQuCgpXZWxsLCBhbnlob3cgSSBndWVz
cyB0aGlzIHBhdGNoIGRlc2VydmVzIGEgRml4ZXMvQ2M6IHN0YWJsZSAjIHYzLjcrCgpMaSwgY2Fu
IHlvdSBwbGVhc2UgcmUtc2VuZCB3aXRoIHRoZSBwcm9wZXIgdGFncz8gVGhhbmtzLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
