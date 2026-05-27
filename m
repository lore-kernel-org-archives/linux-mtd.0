Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE1CD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDG0rLZdQFaDrZ0Y/UBUeqUo8ZFgGYhemxgPxGhyLfo=; b=q8HEBDmshsCu8D
	SD0r1D4ROIw8jymFQA9Q4KAQ4uUZlqqj15VmKTQ2ThBcTXr6WfuXJ62CQoDWR5oylsEQyLQHCF5kt
	q9hRBptjEgLEel9rQzw7s1RwBN9qzVaVNtk9haGZc555wwjEX9HFVqLDwIOu3fVNZ+UEyenq30XqX
	nugBl72fax6/XhCkAN8wXMHhqRhiqzOrWI0+RKOSHt7on7uUn4/Rrw+aGQU8a2N5rnTTsUZI+xXJJ
	bZqzXXv2t954GSVLg3M2xOBrz6mt4mvpNiMI0ArjWqXrqR3R0PzXtWuEhwBQRF6EDGOPQTTPpXYmk
	7D4kyyU2a9i3SrFRKzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAHv-00000003bcT-0Zch;
	Wed, 27 May 2026 09:10:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAHp-00000003baz-2OgV
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:10:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 316D11A36E8;
	Wed, 27 May 2026 09:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1AF3601A1;
	Wed, 27 May 2026 09:10:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53E0010888BA2;
	Wed, 27 May 2026 11:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779873047; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Kn5ek8m5SLf/9jOedgJ4k0VlYp3m2eYak7kE4f8UeA=;
	b=HyiFN1u7e5cW49UJjE0d8bCVY2QSLyQ0u0paNb50vN6Rw2s5ORI/g5XyVV2aBPRBZuJXBs
	lxEBS37v5ZlUEX5lMFQMZW1pLrKAz9qjScz4BixAC/0UXCOuWRoQEknsxiAj3oN6UjHlfv
	XmdQypMQrN3Pnm+iC/JWxQv0uHWeEr0V6meG7BFrc+JizB1BF/NA8ps+ts2s8W1R0wxgLQ
	U6OWENZl21z0O9w/NEqyKnj9/wTXvs7Hi1stw5y5yDc0lSEwjg7bcNee0t4nSnyfYBpCWT
	0ZrvhzJUK14/22Ag3A2BOyu/Oyh3Om/M4515eMLB8CavAu2Jfyz6behIcJrggg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linusw@kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525220440.94639-1-rosenp@gmail.com>
References: <20260525220440.94639-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: embed nand_controller into
 qcom_nand_controller
Message-Id: <177987304626.3986809.7144873679247622798.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:10:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_021049_740986_4B3037DC 
X-CRM114-Status: UNSURE (   5.87  )
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

T24gTW9uLCAyNSBNYXkgMjAyNiAxNTowNDo0MCAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
VGhlIHFjb21fbmFuZF9jb250cm9sbGVyIGhhZCBhIHN0cnVjdCBuYW5kX2NvbnRyb2xsZXIgKmNv
bnRyb2xsZXIKPiBwb2ludGVyIHRoYXQgd2FzIGFzc2lnbmVkIHRvIChzdHJ1Y3QgbmFuZF9jb250
cm9sbGVyICopJm5hbmRjWzFdLAo+IHdpdGggdGhlIGFsbG9jYXRpb24gb3ZlcnNpemVkIGJ5IHNp
emVvZigqY29udHJvbGxlcikgdG8gbWFrZSByb29tLgo+IGdldF9xY29tX25hbmRfY29udHJvbGxl
cigpIHRoZW4gd2Fsa2VkIGJhY2t3YXJkcyBmcm9tIGNoaXAtPmNvbnRyb2xsZXIKPiB1c2luZyBz
aXplb2YoKS1iYXNlZCBhcml0aG1ldGljIHRvIHJlY292ZXIgdGhlIGVuY2xvc2luZyBuYW5kYy4K
PiAKPiBFbWJlZCB0aGUgbmFuZF9jb250cm9sbGVyIGRpcmVjdGx5IGludG8gcWNvbV9uYW5kX2Nv
bnRyb2xsZXIgYW5kIHVzZQo+IGNvbnRhaW5lcl9vZigpIGluIGdldF9xY29tX25hbmRfY29udHJv
bGxlcigpLiBUaGUgaGVhZGVyIG5vdyBuZWVkcwo+IHRoZSBmdWxsIHJhd25hbmQuaCBkZWZpbml0
aW9uIHJhdGhlciB0aGFuIGEgZm9yd2FyZCBkZWNsYXJhdGlvbi4KPiAKPiBbLi4uXQoKQXBwbGll
ZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogcWNvbTogZW1iZWQg
bmFuZF9jb250cm9sbGVyIGludG8gcWNvbV9uYW5kX2NvbnRyb2xsZXIKICAgICAgY29tbWl0OiA3
ZmJkYmM3ZDAyOGEyMGE3OGI3ZDI4YTk1MTBhMjE2Yzc2YjVmYmZkCgpQYXRjaGUocykgc2hvdWxk
IGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5l
eHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCBy
ZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
