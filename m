Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591FFECE579
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xocOV3YjkvPuchNHsqpKE+ml+nT62KP2wI4uXUWxeKg=; b=lPnrh4T1fvh48A
	LQOToLrt5zzwnqrq6GAH2w5bAuAV8Tatre+MihbfB3RdU66qBagYUNZOA1Kg8tpTiJKoEXE9ZVpE3
	EFOS+NJT8o2CAnVHSOih7VGHtaKDJ5ImFUCTj7iVD0OqksfPABX3j8JBfJ12DrQExqXGoEk+/BlaB
	3CZBIXtAx9g+7WOxO8+tFgPlEHPLHRGlyLJhEOL9eDfuWuGHLJvk26j9tXFiqP1PH+asu/dtoYGmL
	vZkostKQGfsKYQ2j3TZdEBwbM8FFb/xAXeIbyXxfx812OFI+61ELECbyxiBP1v2a7l2NTntBG3AF3
	lTrYvvBP0Ot9mUVT1W+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb2x-00000001OXv-2p95;
	Mon, 09 Sep 2024 09:50:59 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb1x-00000001OJt-0rD7
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:50:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E39A60004;
	Mon,  9 Sep 2024 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725875393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WGSfmjP2xpkg9kRW5SbVOyZniCqkxswImo1NnnS+ve8=;
	b=GdmvvxhnbXhVuPkYO7n179XVJp7AbyHe8ARxaB9MFEmiuv0He1KV7+s4eR8nN5poH/Pqbv
	G8oRLw1kcLxNNqI/+HTJH2usCsBO6aqQUtpIfch36TlTno0TZN3rb/eiln5vFTcNJ5IOyx
	KvdUmn/QCstJE/OUH9tyZmmMxau/Er6iFShK2kds9JZzoubHtzxiEODcN4URT1ko7xcLO/
	hAt1Kq14aY3TnyOO//hdPfnQmECNAokNOXbt8o/p08JT3YJIeyICLXw/bFCtvHh0FrZUZE
	g7IS3JlxRdYYUkURGlA/kUfMvuFpdB02g7rPa62+wPJHvGa4E6ftaJ0Dz/sSRQ==
Date: Mon, 9 Sep 2024 11:49:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 05/18] mtd: tests: Include <linux/prandom.h> instead of
 <linux/random.h>
Message-ID: <20240909114952.580d0c20@xps-13>
In-Reply-To: <CAFULd4ZwEcv-KZSpoQznMvd2wZBqAvqvr_JzK7fboR_Ec6721g@mail.gmail.com>
References: <20240905122020.872466-6-ubizjak@gmail.com>
	<20240906151021.736425-1-miquel.raynal@bootlin.com>
	<CAFULd4ZwEcv-KZSpoQznMvd2wZBqAvqvr_JzK7fboR_Ec6721g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_024957_885596_3A2B30E3 
X-CRM114-Status: GOOD (  14.49  )
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

SGkgVXJvcywKCnViaXpqYWtAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgNiBTZXAgMjAyNCAxNzo1
ODozOSArMDIwMDoKCj4gT24gRnJpLCBTZXAgNiwgMjAyNCBhdCA1OjEw4oCvUE0gTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCAy
MDI0LTA5LTA1IGF0IDEyOjE3OjEzIFVUQywgVXJvcyBCaXpqYWsgd3JvdGU6ICAKPiA+ID4gVXNh
Z2Ugb2YgcHNldWRvLXJhbmRvbSBmdW5jdGlvbnMgcmVxdWlyZXMgaW5jbHVzaW9uIG9mCj4gPiA+
IDxsaW51eC9wcmFuZG9tLmg+IGhlYWRlciBpbnN0ZWFkIG9mIDxsaW51eC9yYW5kb20uaD4uCj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFVyb3MgQml6amFrIDx1Yml6amFrQGdtYWlsLmNvbT4K
PiA+ID4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+
IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+ID4gPiBDYzogVmlnbmVz
aCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+ID4gPiBDYzogbGludXgtbXRkQGxpc3Rz
LmluZnJhZGVhZC5vcmcgIAo+ID4KPiA+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtz
LiAgCj4gCj4gTWlxdWVsLCBpcyBpdCBwb3NzaWJsZSB0byBqdXN0IEFDSyB0aGUgcGF0Y2ggZm9y
IG5vdz8gVGhlIHNlcmllcwo+IHRvdWNoZXMgbWFueSBwYXJ0cyBvZiB0aGUga2VybmVsLCBzbyBJ
IGd1ZXNzIGl0IGlzIGJlc3QgdG8gaGFydmVzdAo+IEFja2VkLWJ5OnMgaW4gdGhpcyBzdGFnZSBv
ZiBkZXZlbG9wbWVudCBhbmQgY29tbWl0IGFsbCB0aGUgcGF0Y2hlcwo+IHNvbWUgdGltZSBhZnRl
ciB0aGUgbWVyZ2Ugd2luZG93LiBUaGlzIHdpbGwgYXZvaWQgbWVyZ2UgY29uZmxpY3RzIHdpdGgK
PiB0aGUgc2VyaWVzLgoKQ2hhbmdpbmcgYW4gaW5jbHVkZSB3aXRoIGEgbW9yZSBzcGVjaWZpYyBp
bmNsdWRlIGRpZG4ndCBsb29rIGxpa2UgYQpkYW5nZXJvdXMgY2hhbmdlLCBidXQgSSdtIGZpbmUg
ZHJvcHBpbmcgdGhlIHBhdGNoLiBQbGVhc2UgbWVudGlvbiBpdApuZXh0IHRpbWUsIGJlY2F1c2Ug
SSBkaWRuJ3Qgc2VlIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
