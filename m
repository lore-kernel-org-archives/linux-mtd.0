Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4344FC54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4MTliYQdqVUzNP9XLOlV/SvA1z1LZJRCD8t6YDSyVU=; b=rPs+h9ulAHuxis
	p4gdMwVTpVSWrkNmLaRNopBZWeUnxJQwD2CcHa+Aqk4/tOIxE00O20Oa9b3Dx2CWW0/6cCsNbpCN7
	g4PBoH3uBE/dUUULgvTJ2theqr6rhbvkKyaLfMjnaijw6AH5EKYD3UGqgpPsf5+3m3Ra2Qv+y0BU6
	1YxmTQ/pE/X/Qs0WnYBiM7UfmhfxMQTHxe8dUzayfgfPTtTNYMLhzVEpnAJVLkPi5PBju5zM1sQC/
	tXQXIp/TcItSEP/ebrkXl4+/srkOIK8XWIfgnx2nbizgR6P/aiRzwOXMFNcWTiHRm/ILebYm0Eg94
	nlAVFmc6Jfj0dfvkkBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJG0-00CjxK-O1; Mon, 19 Sep 2022 16:04:28 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJFT-00Cjmd-Cg
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:03:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DF6E760010;
	Mon, 19 Sep 2022 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663603431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnOoRxmwYhSpaB0jR89REFkLchcSk/gvAm6USd9rNko=;
	b=YH1pjxhfXejKy3Spd45V9Eb0rqxArJQZnFqKKmDDdivcCH4kdD+3UJCeWNHKDu5V5XOaMC
	VUC5Ni/f76dbiRswmCfphgd80tLZPyYCCLDcjUgIcSu96J8rxiewOcQWxBw+Ru9/l6Iquf
	s6v5PE3LwbVrm4E+zqNHe7gPsH3H5dIk/Y6guLGVbqoAyxUSlDpcNwhmYWs8AQ5EQVHdZ3
	bMTLZlF0l8QEuFyOrfs3S4+pDp1LHp6zw0PKQSxPqS2Gjx7zW8ZgAGgxy+ksecrctI2SK8
	P7rArPjwClH6hl/RixXuex+9KHPpMEqnJUFEvlM83WmRDXv36xB946IC4l3+QQ==
Date: Mon, 19 Sep 2022 18:03:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Deming Wang <wangdeming@inspur.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: Fix spelling typo in comment
Message-ID: <20220919180349.6af1befb@xps-13>
In-Reply-To: <20220906134204.4119-1-wangdeming@inspur.com>
References: <20220906134204.4119-1-wangdeming@inspur.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_090355_747997_D74F6104 
X-CRM114-Status: GOOD (  15.73  )
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

SGkgRGVtaW5nLAoKd2FuZ2RlbWluZ0BpbnNwdXIuY29tIHdyb3RlIG9uIFR1ZSwgNiBTZXAgMjAy
MiAwOTo0MjowNCAtMDQwMDoKCj4gTW9kaWZ5IHRoZSBtYXhpdW11bSB0byBtYXhpbXVtCj4gCj4g
U2lnbmVkLW9mZi1ieTogRGVtaW5nIFdhbmcgPHdhbmdkZW1pbmdAaW5zcHVyLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcwNi5jIHwgMyAr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200
NzA2LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200NzA2LmMK
PiBpbmRleCA4YmIxN2M1YTY2YzMuLjI3NmM1MjkwMTRkNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200NzA2LmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200NzA2LmMKPiBAQCAtMTQsNyArMTQs
OCBAQAo+ICAjaW5jbHVkZSA8bGludXgvYmNtYS9iY21hLmg+Cj4gIAo+ICAvKiBCcm9hZGNvbSB1
c2VzIDEnMDAwJzAwMCBidXQgaXQgc2VlbXMgdG8gYmUgdG9vIG1hbnkuIFRlc3RzIG9uIFdORFI0
NTAwIGhhcwo+IC0gKiBzaG93biB+MTAwMCByZXRyaWVzIGFzIG1heGl1bXVtLiAqLwo+ICsgKiBz
aG93biB+MTAwMCByZXRyaWVzIGFzIG1heGltdW0uCj4gKyAqLwo+ICAjZGVmaW5lIE5GTEFTSF9S
RUFEWV9SRVRSSUVTCQkxMDAwMAo+ICAKPiAgI2RlZmluZSBORkxBU0hfU0VDVE9SX1NJWkUJCTUx
Mgo+IAo+IGJhc2UtY29tbWl0OiA4NDAxMjZlMzZlOGZmMjcyY2I2MzE1ODY0NjQzM2ZhMTMyNDUz
M2Q5CgpUaGFua3MgZm9yIHRoZSBwYXRjaCBidXQgdGhlcmUgaXMgYW4gaWRlbnRpY2FsIGNvbW1p
dCByZWNlaXZlZCBvbmUgZGF5CmJlZm9yZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
