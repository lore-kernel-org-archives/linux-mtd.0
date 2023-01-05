Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7C7C3DA7D
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A1WLXOypMN3SP1a3l3sJgT6qMqsv8cX0LSXQlu2ZX7M=; b=idjcEH4HLtzfnf
	pzLvLQ7f/mnuCITwPQqbOGnuJ489df5fzUu7fpGXek7uQ4Ho51jkV2grOpaaY10Jw34qIAakqa4pT
	CvMI+oabhh2/6coD5xV8m8F1U1MG8AgM+yoMFV/2DUQOxQuzlNKdZaOkC0nxRFis9az9Bb0Btqya7
	o4z1ki0ncujgkMV5OtTPFwJcLjf4ZGrj0IPXt2MctfMoSOySEw/vifYlptpPXtwiErd1r2dFttQ0q
	9Yy05SjD4BbR6wAKd4PpcnscEjINhAUOzMp3nZdWkcBKk8LKld8oS32l7vcpBB2ghfs5JuA5u3WEs
	JDPM5OQG2g1hAUfnBCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXKi-00Eq7o-71; Thu, 05 Jan 2023 20:59:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUku-00DQhT-Gn
	for linux-mtd@bombadil.infradead.org; Thu, 05 Jan 2023 18:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LAL0/IayIgHxNewz9183Y2TDsRxPByZPnKRkw1Ug9HU=; b=f/MzVNdj+Vt3dyq5CD2Agnpz6V
	TR5XVSIm6IRO2lyB8OAnM61MGLYF1aR+vpimdgsMGXbr4CvlibUQhtDLJXsfBTzht8sz5Tw+tJUSw
	g9M7XhhZVbCj82h9cw5zY4FMlVPvVm+wtU8qKXiGe4EeHPS/88oCB/pRggEp7l5D3Z/fjku133D42
	1WZKDxxVoZ+JkvWpmdaIsZWW8X21yu8Vp9d/ZAoWM3d6scG2vBJnPRLdvKhkRR7kMbaHXjhRXe1zr
	F5MkCj603a3rNWYOvI3Wl0voPzGwl+x/dyUQmDjtgTmbsQU4LJiHpNCvhi6zljw/JsZHgunt+8lMd
	cYquWZPA==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTea-001VKG-0x
	for linux-mtd@lists.infradead.org;
	Thu, 05 Jan 2023 17:03:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5D11C40011;
	Thu,  5 Jan 2023 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672938217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LAL0/IayIgHxNewz9183Y2TDsRxPByZPnKRkw1Ug9HU=;
	b=Wecb+oC06xu+pxXIMipJkfLEpJ/65uG+JuLeenvytEZdLPkKPYjDMjc5HnsT0/qr75fFUI
	zIcu1cYDYM+3K9fEXqzhCvcvSQ4uU+RcZYWd3oaa+eXeQnpAB65K72b+RRnn48iv0QvWX1
	6zsQSp/0BPu6a1KFPyjIy57f5dAwIurBilrWgNbd2Yhjx7uxu8wrlNKMRB8ZlPai33o01K
	dTKjOnjKIBp3cIG/69AUIhk/1hdQqHHAOUg0APW1DeKAWo7uIDw0ZtMMrhhU0x56ozO1IT
	6JbYj5g1zUemvkNgje3bVcjUR5OtCjguzqadJdRSY8OS1guvzy4SWnWqCoKCbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] mtd: rawnand: Sequential page reads
Date: Thu,  5 Jan 2023 18:03:30 +0100
Message-Id: <20230105170333.586044-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170344_642770_5FFB5E5F 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

V2hlbiByZWFkaW5nIHNlcXVlbnRpYWwgcGFnZXMsIHRoZSBuZXh0IHBhZ2UgY2FuIGJlIGxvYWRl
ZCBpbiBjYWNoZQp3aXRob3V0IHRoZSBuZWVkIGZvciBhIGZ1bGwgbmV3IFJFQUQgb3BlcmF0aW9u
IGN5Y2xlLiBXZSBjYW4gdGhlbgppbXByb3ZlIHRocm91Z2hwdXQgYSBsaXR0bGUgYml0IGluIHRo
aXMgY2FzZS4KCkluIG9yZGVyIHRvIHN1cHBvcnQgdGhlIGZlYXR1cmUgd2UgY2FuIHNwbGl0IHRo
ZSBzZXJpZXMgaW50byB0d28gc3RlcHM6CiogbWFrZSBpdCBwb3NzaWJsZSB0byBjaGVjayBpZiBh
biBvcGVyYXRpb24gaXMgcG9zc2libGUgaW4gYWR2YW5jZQoqIGNoZWNrIGlmIHNlcXVlbnRpYWwg
cGFnZSByZWFkcyAoY2FjaGUgcmVhZHMpIGFyZSBzdXBwb3J0ZWQgYW5kIGlmIHllcywKICB1c2Ug
dGhlbSBvbiByZWxldmFudCBvcGVyYXRpb25zIHJhdGhlciB0aGFuIHJlZ3VsYXIgcmVhZHMuCgpD
b250cm9sbGVycyBub3QgbGV2ZXJhZ2luZyB0aGUgY29yZSdzIGhlbHBlcnMgbWlnaHQgbm90IGJl
bmVmaXQgZnJvbQp0aGlzIGFkZGl0aW9uLgoKVGhhbmtzLApNaXF1w6hsCgpKYWltZUxpYW8gKDEp
OgogIG10ZDogcmF3bmFuZDogU3VwcG9ydCBmb3Igc2VxdWVudGlhbCBjYWNoZSByZWFkcwoKTWlx
dWVsIFJheW5hbCAoMik6CiAgbXRkOiByYXduYW5kOiBDaGVjayB0aGUgZGF0YSBvbmx5IHJlYWQg
cGF0dGVybiBvbmx5IG9uY2UKICBtdGQ6IHJhd25hbmQ6IFByZXBhcmUgdGhlIGxhdGUgYWRkaXRp
b24gb2Ygc3VwcG9ydGVkIG9wZXJhdGlvbiBjaGVja3MKCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2Jhc2UuYyAgfCAxNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2plZGVjLmMgfCAgIDMgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfb25maS5jICB8ICAgMyArLQogaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAg
IHwgIDE3ICsrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
