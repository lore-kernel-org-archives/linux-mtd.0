Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2974FC02183
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 18:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Cp7NP2T9I8rqnJ8sGwJNwN6rGJTmGjZAct7+Wxw6I4=; b=pQUXu7QEFhhcni
	YuOAWbGrIsYikVfq+gE9g46donFrXnNQ2IHz6vFmsEh+VO/8xHH29M9WfNNfAA2JJuk/6HpFExbnF
	2mE+wLN7IXWgGqsyzf14oUVyTDSOA6fHfBFEXfit9fPO0EzH/vZkJ4jaPp3c/4we1Sui0HeAaso9V
	+PS+WQtWIZXVWHQQxKMaQxGOA8KDLshuT4ZCMM6DrlVVkfDeWojwhy9GCoe9hpAJ9Q2JY8tDk4KmJ
	PiGzszl3wCOxO77OxZF3ZDBykzT0bUK/+hHP4Z0ufRa7OYrZZT9xa8eOuWD5Ji04e07wNunKhU4le
	e1EHxpotOmW6dvxxPgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7ui-0000000CjKW-2Kmx;
	Wed, 15 Jan 2025 18:14:48 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7ug-0000000CjJj-37Yn
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 18:14:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D38B9C0003;
	Wed, 15 Jan 2025 18:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736964884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHeQwDSJMY5knJr437KGhOasUWyUGvFTI0geAXNMpiA=;
	b=fvbBU/FnuwMFsyKfX9c23Zv3EVBtExkYnFsbLkBA8tcRMJKlGiS45Kq0plqWTPfaXFQXJd
	YummSLwEden8y8CxHdcKdqmM1lXnARJh6QRSyJfXcuKSYhs7SziTxjFXiyB9jQBnsXT57Q
	QIVaOAg8ZxrKqmyKZgr4DEOZgz8DTVU6eLAsQk3Am1QXMQeuD1ryBgAA2G699ecYXE5mZi
	v7ir6AHQlkTrx0fotFmSk06iSw4jzDyj203fesFxY/zIoWi0QIznfbcIiSY7S+AkQKg+Gw
	iD+2ZGv8wEre7W2NrS+8dQTpfp5hLgW8+3udiPX7sBj001Lf3BG272bnhgezzw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Richard Weinberger <richard@nod.at>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: Use of_property_present() for
 non-boolean properties
In-Reply-To: <20250109182149.3971698-1-robh@kernel.org> (Rob Herring's message
	of "Thu, 9 Jan 2025 12:21:48 -0600")
References: <20250109182149.3971698-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 19:14:43 +0100
Message-ID: <87frlkndv0.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_101446_928827_03DCBC09 
X-CRM114-Status: UNSURE (   6.45  )
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

SGkgUm9iLAoKT24gMDkvMDEvMjAyNSBhdCAxMjoyMTo0OCAtMDYsICJSb2IgSGVycmluZyAoQXJt
KSIgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoZSB1c2Ugb2Ygb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKCkgZm9yIG5vbi1ib29sZWFuIHByb3BlcnRpZXMgaXMKPiBkZXByZWNhdGVkIGluIGZh
dm9yIG9mIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSB3aGVuIHRlc3RpbmcgZm9yIHByb3BlcnR5Cj4g
cHJlc2VuY2UuCgpUaGlzIHBhdGNoIGRpZCBub3QgYXBwbHkgYmVjYXVzZSBvZiBhbm90aGVyIHVu
cmVsYXRlZCBjaGFuZ2UgaW4gbXkgdHJlZQp0b3VjaGluZyB0aGUgcmV0dXJuIHBhdGhzIGluIHRo
aXMgZHJpdmVyLCBJIGZpeGVkIGl0IHdoaWxlIGFwcGx5aW5nLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
