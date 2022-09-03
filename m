Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ACDECAAD5
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Sep 2022 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nk25rsxHJ+zkIkXeGWHO07V+ndbfGpWnhkzWsCqr4s=; b=1dTqhNWuRyRoXh
	JvKQDEYHqa0qc2kbsIKpWyITSAE+UhdPmcCi3Mm4JunjSi1ksj4OMnH/iLTgxpVpjBlrygapw0JMw
	PlbzhMsr1qrxV0ggCgBHeBgeKZ2ueP3oQ2v7s91H/6xI1EdlYivF5Hnj8+7UUa4cowE9305vdGb/X
	poag0s/4+qU52hnlRsxr2dEZYzP4uy1WlIBHcO/JiU2baXhre63IBMBI3zeTJcTJVxfYlca1IVs7g
	1YeZW2KZDoF8OvXuWh7bz6CHlI3sKoR94cHXaKMKpAUNTBKDWBBYaNhgOgRhrTphVV6tVjD8mOnAv
	2TwBO9i/E659+KfBHfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUYS4-00HKNm-1I; Sat, 03 Sep 2022 19:05:08 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUYS0-00HKDu-VO
	for linux-mtd@lists.infradead.org; Sat, 03 Sep 2022 19:05:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4D181240002;
	Sat,  3 Sep 2022 19:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662231898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRSqR1ruQyE4MRuP6dAFwatwvofglcsxkbjIYnnnrR0=;
	b=OK1IfdUf57Lx3w72qdpVP81/ueK8BptN2FDHhaw0uF9YYVdFJfoU25O/uFrE9MNJ2Lg7cj
	Zj0z+5UTZ5HpS2/hquYbusiAp29FYn/BPabE7UL1OO/Lr11uorQ3+bbnsVetwKBISE4NJ6
	5okK3wj83VBY9XnHOrvkVh21E7euP8cFIJKTY5HSnh3JUd3MmoIveX0TVKpSCleFPZ+XWm
	fGg3YlflOUKaVqX/5CwY0kSZl/XG7acIJnTQRGzz1OpcrspuBs4SPLAuRH94y48D3nnYav
	1XWmaroz1l2qd40YaS3zFWp+9GQxzmdITnxHmSyPaOf68CXenZxIeFbbdNTAdw==
Date: Sat, 3 Sep 2022 21:04:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Roger
 Quadros <rogerq@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Cai
 Huoqing <cai.huoqing@linux.dev>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Colin Ian King <colin.king@intel.com>, open
 list <linux-kernel@vger.kernel.org>, William Zhang
 <william.zhang@broadcom.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: brcmnand: Glue driver Kconfig entries
Message-ID: <20220903210453.0bf8734b@xps-13>
In-Reply-To: <cdde4e0a-dfd7-51d7-0800-7ac124c34ff7@gmail.com>
References: <20220711222323.4048197-1-f.fainelli@gmail.com>
	<6008ef46-ccdb-ea01-f9fb-4f8fceed2d29@gmail.com>
	<cdde4e0a-dfd7-51d7-0800-7ac124c34ff7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_120505_212421_C49E68AB 
X-CRM114-Status: GOOD (  15.02  )
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

SGVsbG8gRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIFNhdCwgMyBTZXAg
MjAyMiAxMTo0MjowNyAtMDcwMDoKCj4gT24gOC80LzIwMjIgMTA6NTUgQU0sIEZsb3JpYW4gRmFp
bmVsbGkgd3JvdGU6Cj4gPiBPbiA3LzExLzIyIDE1OjIzLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3Rl
OiAgCj4gPj4gSGkgYWxsLAo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWxsb3dzIGZvciBh
IGZpbmVyIGNvbnRyb2wgb3ZlciB0aGUgQlJDTU5BTkQgZHJpdmVyCj4gPj4gZ2x1ZSBkcml2ZXIg
c2VsZWN0aW9uIHN1Y2ggdGhhdCBpdCBkZWZhdWx0cyB0byB0aGUgdmFyaW91cyBwbGF0Zm9ybXMK
PiA+PiBlbmFibGVkIGluIHRoZSBjb25maWd1cmF0aW9uIGZpbGUuICAKPiA+IAo+ID4gTWlxdWVs
IGFyZSB5b3UgYWJsZSB0byByZXZpZXcgYW5kIGFwcGx5IHRob3NlIHBhdGNoZXMgaWYgc2F0aXNm
YWN0b3J5PyBUaGFua3MhICAKPiAKPiBQaW5nPwoKU29ycnkgZm9yIHRoZSBkZWxheSwgSSB3YXMg
b2ZmIGZvciBhbG1vc3QgYWxsIEp1bHkvQXVndXN0LCBJIG5lZWQgdG8Kc3luYyB3aXRoIFJpY2hh
cmQgYW5kIHN0YXJ0IGNhdGNoaW5nIHVwLiBJJ2xsIGRvIG15IGJlc3QgYnV0IHdpdGgKTFBDL0VM
Qy1FIGFwcHJvYWNoaW5nLCBJJ20gZmFyIGZyb20gY2xvc2UgdG8gaGF2ZSBlbm91Z2ggc3BhcmUg
dGltZSEgQXQKdGhlIGxhdGVzdCwgSSB3aWxsIHNldHRsZSB0aGUgc2l0dWF0aW9uIHJpZ2h0IGFm
dGVyIHRob3NlIGNvbmZlcmVuY2VzLiAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
