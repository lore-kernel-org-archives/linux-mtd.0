Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AEFC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2BlH0jvxauD3sYC7u7oi3tnGYw8tT+aCT3qE0pK1CQ=; b=nO9bEjS82k6YMp
	AEG5yoqyN9AYmyOU72hQbaCK1Sdgp9sYdq8c/biX3fG9kwV2D0FplbKEvCN4wgbks/98JRhz/xj+r
	NfONmnjuOaiLMnVHBTMOJITj/hBmtDxCN/lcTxDHsIhHUDl+IqqMjZaXbNI+MhnvCMeJob0awwEWa
	EjlKyXNnDBJvV2y/ieDIncy9B/q5GP/rlFO5MPMgRjBKaJQ4HJoFTylXLP9hhj4xjQrDln+aLUbnk
	JOZFNJAKYniqds/S/3/mlRpvHwF96TiPWMh4sSav7JH3/gXcGtruaefmSNH96nlrBjxNcMvu1oAnA
	0nDpoAnX6Ai5lmNKSc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjAn-005EpW-6i; Tue, 18 Oct 2022 09:46:09 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjAh-005EoB-9t
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:46:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 247C7E0010;
	Tue, 18 Oct 2022 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666086358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pS0a7NLTAVtCUU5qXkKelogy8H6f0tCHqv8SAAyPqTM=;
	b=pGgfGSIhPx4M6dnDOmPbf7BofuhBf2pEKBXyxGW9/dBMIExUm4el9ro+NpJBQqBd9u2zp1
	vcdFJUrdt36vWiOROlDSOsW0pfus12KPmATbk+54ayFwoXytY2Pycm373g8raQ10/FBdzy
	TUxt1UVl/bVLl2SnI1K2t2oxOw983nebLQC+F/KdE8hW+38KfVqv33adpVi6cdP5PhWMr4
	ntL9U7Hv39mrxWQy2xPnGL/4XrbxjC4i0B0TKJNEILunRVp49yHJj5xI/+5d4jcRV60BDE
	ll+YD1cq/GPGDPNiJMVL4ME2EOQDbJuI4HGCDkmKWR3Skw8H+HbOD9KDU9FSrw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	stable@vger.kernel.org,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] mtd: parsers: bcm47xxpart: Fix halfblock reads
Date: Tue, 18 Oct 2022 11:45:55 +0200
Message-Id: <20221018094555.542511-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018091129.280026-1-linus.walleij@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'05e258c6ec669d6d18c494ea03d35962d6f5b545'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_024603_548588_2A118E37 
X-CRM114-Status: GOOD (  12.08  )
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

T24gVHVlLCAyMDIyLTEwLTE4IGF0IDA5OjExOjI5IFVUQywgTGludXMgV2FsbGVpaiB3cm90ZToK
PiBUaGVyZSBpcyBzb21lIGNvZGUgaW4gdGhlIHBhcnNlciB0aGF0IHRyaWVzIHRvIHJlYWQgMHg4
MDAwCj4gYnl0ZXMgaW50byBhIGJsb2NrIHRvICJyZWFkIGluIHRoZSBtaWRkbGUiIG9mIHRoZSBi
bG9jay4gV2VsbAo+IHRoYXQgb25seSB3b3JrcyBpZiB0aGUgYmxvY2sgaXMgYWxzbyAweDEwMDAw
IGJ5dGVzIGFsbCB0aGUgdGltZSwKPiBlbHNlIHdlIGdldCB0aGVzZSBwYXJzZSBlcnJvcnMgYXMg
d2UgcmVhY2ggdGhlIGVuZCBvZiB0aGUgZmxhc2g6Cj4gCj4gc3BpLW5vciBzcGkwLjA6IG14MjVs
MTYwNmUgKDIwNDggS2J5dGVzKQo+IG10ZF9yZWFkIGVycm9yIHdoaWxlIHBhcnNpbmcgKG9mZnNl
dDogMHgyMDAwMDApOiAtMjIKPiBtdGRfcmVhZCBlcnJvciB3aGlsZSBwYXJzaW5nIChvZmZzZXQ6
IDB4MjAxMDAwKTogLTIyCj4gKC4uLikKPiAKPiBGaXggdGhlIGNvZGUgdG8gZG8gd2hhdCBJIHRo
aW5rIHdhcyBpbnRlbmRlZC4KPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVz
OiBmMDUwMWU4MWZiYWEgKCJtdGQ6IGJjbTQ3eHhwYXJ0OiBhbHRlcm5hdGl2ZSBNQUdJQyBmb3Ig
Ym9hcmRfZGF0YSBwYXJ0aXRpb24iKQo+IENjOiBSYWZhxYIgTWnFgmVja2kgPHphamVjNUBnbWFp
bC5jb20+Cj4gQ2M6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkFw
cGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bXRkL2xpbnV4LmdpdCBtdGQvZml4ZXMsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
