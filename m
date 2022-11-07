Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C4C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qm6gIyLMQY6uDBR7DFTXRRHNK67/qOKDM5rzR10lX2Q=; b=XvtrzWTTxlzf/j
	SsNepXo31OHxvs4fiHORdS6aRO8FeXUb201Hoz1QZl9Tw3fF2sylb453wcU9b5b+ud80QHvsLDwNx
	DgJjc0ptb1nze/Q6tPC+oYjQFjLyIf/MpLwG363+Ym/Ff76iKVdd65EoyUgLqFKMWyi99Coktm8IZ
	ObVcgtn6Q28j1A2I1L5lcxi/alGNlOgOXeczvQnKTeO4OIz93fdT8QrYyEVlCa6qDIoMFXIKEKQAJ
	/lnrTceOv+fVIOJiG5OiSx1yjEjy5XZjIU2NRpp/jnTQn6cRsRnBpt2u1xpaIklTgkVlDYhqljV5Q
	Qvv/xyq72tHr78qHSOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os55m-00GEYt-46; Mon, 07 Nov 2022 16:35:22 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4te-00G924-Em
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:22:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5484BFF80B;
	Mon,  7 Nov 2022 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PndAaPKemHvlm2tLxb20P+WzuvGUnNrFNVEmOkXku6c=;
	b=feg9F5/mvBOx7RbnKmvlvp3aWIduN9dXsALMILBj6ARS8InNYVxk6SHpSmZ8PZmj3QLn7y
	otFym7bEXiLIIR2/RABX0Ma547l+4JgG+4vshtWeF3C1hv2hTEters5AzVeorrGXxqi+2v
	UCH7YYuCFCMENRKRM8f5E29+9CkK+FJE4RYZS5slQNHYRV2JQ5yMNWHGn1dC9AMhK5YOch
	0vLvKHG14gnHXLr+tMERMvtjdt1jYhqd/87pnO5kPswM6Vm1JWulQYUYPoOhT1JsJcSuow
	DpcYN+WCF9LQfyLQxW08DUsnadEjOaoWO+AXOwpTITFMR1IFTfD7lRLLoPz7lQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized variable bug
Date: Mon,  7 Nov 2022 17:22:42 +0100
Message-Id: <20221107162242.49236-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y1gCALFWXYYwqV1P@kili>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6c0a15a3dc6b45156c5b9568c8308e3f0d802af0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082250_715884_4F793179 
X-CRM114-Status: UNSURE (   7.19  )
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

T24gVHVlLCAyMDIyLTEwLTI1IGF0IDE1OjM0OjI0IFVUQywgRGFuIENhcnBlbnRlciB3cm90ZToK
PiBPbiA2NCBiaXQgc3lzdGVtcywgdGhlIGhpZ2hlc3QgMzIgYml0cyBvZiB0aGUgIm9mZnNldCIg
dmFyaWFibGUgYXJlCj4gbm90IGluaXRpYWxpemVkLiAgQWxzbyB0aGUgZXhpc3RpbmcgY29kZSBp
cyBub3QgZW5kaWFuIHNhZmUgKGl0IHdpbGwKPiBmYWlsIG9uIGJpZyBlbmRpYW4gc3lzdGVtcyku
ICBDaGFuZ2UgdGhlIHR5cGUgb2YgIm9mZnNldCIgdG8gYSB1MzIuCj4gCj4gRml4ZXM6IGFlYzRk
NWY1ZmZkMCAoIm10ZDogcGFyc2VyczogYWRkIFRQLUxpbmsgU2FmZUxvYWRlciBwYXJ0aXRpb25z
IHRhYmxlIHBhcnNlciIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPgo+IEFja2VkLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
