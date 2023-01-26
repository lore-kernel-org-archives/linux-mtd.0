Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAE4C54E94
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RkT3g+9V0wf8upbafwq2IVkOvaZJ66r24DgFF+8XEzA=; b=NmnzD/RXrypHhEfvFhq6UlT+Cj
	WkfqDSHOojdGXmJAFX/OR9sPV44SXAZ4bCnLPH+/IWebtqS4b1lPr3Qzn5aMrlIKcrKzX3/Gej5uM
	qS0vTLKx5QTuNmvZv/vc/l9GhmOlIZ6d2Mh3+fNUJGznSgJLsC1LJNrYksxpVGwqcweNodlIAZ3bm
	NE+heqUBORvAdFdJMMpmHgNVvPh35gysEFCJnY8A63et7dM53CU1mQWKjyIUizcaMndLJ/aQg+9/i
	G+0i5FOEtviIT974RDilyFkWMttPF0ZkTxFP/PjMlAk60D9PciK8wPJf8eOQ1DGWIDWM5KyiD2Itk
	L3dBJFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3eB-00BJnW-Mr; Thu, 26 Jan 2023 14:54:39 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3Xe-00BGzz-9s
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 14:47:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0CFDC61989E8;
	Thu, 26 Jan 2023 15:47:49 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Gz02A5QIcJay; Thu, 26 Jan 2023 15:47:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 61AF961989E9;
	Thu, 26 Jan 2023 15:47:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VU29quxVAgsI; Thu, 26 Jan 2023 15:47:48 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3CB0C61989E8;
	Thu, 26 Jan 2023 15:47:48 +0100 (CET)
Date: Thu, 26 Jan 2023 15:47:48 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <494427061.65066.1674744468129.JavaMail.zimbra@nod.at>
In-Reply-To: <20230112161540.1392231-1-hch@lst.de>
References: <20230112161540.1392231-1-hch@lst.de>
Subject: Re: [PATCH] ubi: block: set BLK_MQ_F_BLOCKING
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: set BLK_MQ_F_BLOCKING
Thread-Index: EecUOwrHMA/LjYGWl65eJLPIU+Qsig==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_064754_565067_3D1E20D3 
X-CRM114-Status: UNSURE (   4.31  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRp
LmNvbT4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+
IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAxMi4gSmFudWFyIDIwMjMgMTc6MTU6NDAKPiBCZXRyZWZm
OiBbUEFUQ0hdIHViaTogYmxvY2s6IHNldCBCTEtfTVFfRl9CTE9DS0lORwoKPiBTZXQgQkxLX01R
X0ZfQkxPQ0tJTkcgc28gdGhhdCB0aGUgYmxvY2sgbGF5ZXIgYWx3YXlzIGNhbGxzIC0+cXVldWVf
cnEKPiBmcm9tIHByb2Nlc3MgY29udGV4dCBhbmQgZHJvcCB0aGUgZHJpdmVyIGludGVybmFsIHdv
cmtxdWV1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KClBhdGNoIGxvb2tzIGdvb2QsIGl0IHdpbGwgYmUgcGFydCBvZiB0aGUgdXBjb21pbmcgbWVy
Z2Ugd2luZG93LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
