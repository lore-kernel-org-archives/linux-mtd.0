Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3F3C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Oct 2022 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOy9iDoEsHHFTsBJsapPlOiS2KV2BFA4v25yF52YNHo=; b=UIbPYYjWxd/kXt
	zphrjffH41eoLdOpZcKCAmPPwwlnUUtcL9c8j/lwSG+uAt8MyJsA30uLwLvIx11Qipz7sOFw7D8zg
	lGYduJKqfKklnrN3FsOQmJTmBGfVlIyrhXH36iP2dtUFzMD4/ZLXLCDEHSGFNygWpExyRiGGcocQF
	sgjlFKcJCPsz4XgK1omFmeJrJwBMEMD1qRTPjo38OV4iHG1a5I2cHXgMolLvbNmMqATB4cF2xBPwS
	yDA40cH+bMW4J3A5g/oTNO+8EZIzmdr+paRTcCSYwAK3eDLHodct4rVi4AR9xSirNPsNVIp8rZbLi
	dqcE3NLGMKBWxM1ENrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojd8s-00GgRW-Jc; Sat, 15 Oct 2022 09:07:38 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojd8p-00GgQL-SH
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2022 09:07:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96B19240005;
	Sat, 15 Oct 2022 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665824847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uilEODdv3PazkYXihcKS3EbN59FUcP/gU7kmYw1f/YQ=;
	b=TZWfRro9s4S64w92ossm9qh6lF0kyqWmPdLZiTpbuGX4gnF5utaNQpMpVU4TE94ocyFNjs
	BzLoKD9ya22hnZeidvXsmzwGLckFIyZEMOmIZ4unMWgZnufvSEEHiPhH/0AFNi7mjsbDnK
	4auovfBelhhIYl6dpMZ0C3BqHFYJF7oJGDdwla2mJixSUt0NqWNixs9LvWYmF3SSotWRb0
	n2LEJSNhadx0j+glpbsO/ewLTWN3w42/HAwwl5rsSgL+F+cAxZ8d3jYc9NKXje7eAJjcIA
	yhUPqaCznM3+udkxF5ssSrEez7yhUtLljCGyhTWgrrtKwu5GREijHZhC+roS2w==
Date: Sat, 15 Oct 2022 11:07:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: yexingchen116@gmail.com
Cc: richard@nod.at, vigneshr@ti.com, wsa+renesas@sang-engineering.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, ye xingchen
 <ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] mtd: replace strcmp with sysfs_streq
Message-ID: <20221015110724.5c535807@xps-13>
In-Reply-To: <20221008074643.308969-1-ye.xingchen@zte.com.cn>
References: <20221008074643.308969-1-ye.xingchen@zte.com.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_020736_115181_B61EE350 
X-CRM114-Status: GOOD (  15.06  )
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

SGkgeWV4aW5nY2hlbjExNkBnbWFpbC5jb20sCgp5ZXhpbmdjaGVuMTE2QGdtYWlsLmNvbSB3cm90
ZSBvbiBTYXQsICA4IE9jdCAyMDIyIDA3OjQ2OjQzICswMDAwOgoKPiBGcm9tOiB5ZSB4aW5nY2hl
biA8eWUueGluZ2NoZW5AenRlLmNvbS5jbj4KPiAKPiBSZXBsYWNlIHRoZSBvcGVuLWNvZGUgd2l0
aCBzeXNmc19zdHJlcSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IHllIHhpbmdjaGVuIDx5ZS54aW5n
Y2hlbkB6dGUuY29tLmNuPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMKPiBi
L2RyaXZlcnMvbXRkL3BhcnNlcnMvY21kbGluZXBhcnQuYwo+IGluZGV4IGIzNDg1NmRlZjgxNi4u
NmE0MDFlMGIxYjk1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvY21kbGluZXBh
cnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvY21kbGluZXBhcnQuYwo+IEBAIC0xNTQs
NyArMTU0LDcgQEAgc3RhdGljIHN0cnVjdCBtdGRfcGFydGl0aW9uICogbmV3cGFydChjaGFyICpz
LAo+ICAJfQo+ICAKPiAgCS8qIGlmIHNsYyBpcyBmb3VuZCB1c2UgZW11bGF0ZWQgU0xDIG1vZGUg
b24gdGhpcyBwYXJ0aXRpb24qLwo+IC0JaWYgKCFzdHJuY21wKHMsICJzbGMiLCAzKSkgewo+ICsJ
aWYgKHN5c2ZzX3N0cmVxKHMsICJzbGMiKSkgewoKSSdtIHNvcnJ5IGJ1dCwgd2h5IHRoaXMgd291
bGQgYmUgYSB1c2UgZm9yIHN5c2ZzX3N0cmVxPyBUaGUgcG9pbnQgb2YKdGhpcyBoZWxwZXIgaXMg
dG8gY29uc2lkZXIgIlxuIiBudWxsLCB3aGljaCBpcyBub3QgcmVsZXZhbnQgaGVyZS4gT3IgZG8K
SSBtaXNzIHNvbWV0aGluZz8KCj4gIAkJYWRkX2ZsYWdzIHw9IE1URF9TTENfT05fTUxDX0VNVUxB
VElPTjsKPiAgCQlzICs9IDM7Cj4gIAl9CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
