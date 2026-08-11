Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C54C5B574
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BPf2J7047TFUtsL0XzioMzL9xmJnpMzLXUPwJte2jU=; b=bK2truTXsZL4ZJ
	4eiJsTXb4iHY4rJIOxc0h+juoV2oCiFM1iW+iVzLr1BjXIKvql4AArobCGPjt9FtMIunFRMQuPIpl
	nmoediDELCKx7VsmNgiW58Vt0sU5D4Wkn19JvsrVqnoOlL7fiEYEa97YFZoukrjOrpZKLmRmafpP9
	R0CGp53Var7JS82kkcFpyKE22RfV11QMFQszeuct08Gc5963F4LcgfBjexezu5f6pv9jnYrHazY4W
	2FR0RBks08kmv8jJlwzRV24VH4JN/Y8Z45IMidgVjYBxpRB1p+TmZQsEW2zOeA7S44LEHwpqT3RnE
	4qd0/clmZns6p358uYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthHP-0000000DYXM-2O2c;
	Tue, 11 Aug 2026 07:52:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthHM-0000000DYWq-0knk
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 07:52:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE53F4E411A7;
	Tue, 11 Aug 2026 07:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79ABE6033C;
	Tue, 11 Aug 2026 07:52:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B394811C4BB84;
	Tue, 11 Aug 2026 09:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786434719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9m+69fxSpkmLtG1XURvJx7NNXdH6H9xc6VvQtA5327s=;
	b=juMa5yewo0CY0D84o5QuEiBCVQbi5D93oMVwf/usMazHXYll8Ly6D/PnWXrn/Gc0Hr7Kdx
	TuRnmpHUT771AigGRxwUs6rnKcOumEjAlz4Dm8oTCC+rOif+82MMlncTHqZt90jPuc7LSY
	Cz8vO8CuplzK9qVfe9B0bZKJELzEqedMxMZxf+rcAKlO3+rRq8WnS3OZ+t32lGUhOQR+o5
	nuiv+7vrf+E+RvEhDsU4scZ12duK3IfYxVAHrJN2TxfVogs2boOWouZ6/EkoMBq2U9fkcg
	CJXh6f0D30eB5uJuUtVUf8CxJWw6LOop0qxhYaiBJvc6PGXmKgn6aKMt66r/sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  jianhao.xu@seu.edu.cn
Subject: Re: [PATCH v2] mtd: spi-nor: scope the exclusive RWW lock
In-Reply-To: <20260811041349.333176-1-runyu.xiao@seu.edu.cn> (Runyu Xiao's
	message of "Tue, 11 Aug 2026 12:13:49 +0800")
References: <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
	<20260811041349.333176-1-runyu.xiao@seu.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 11 Aug 2026 09:51:52 +0200
Message-ID: <87tsp1p013.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_005208_717625_B6710068 
X-CRM114-Status: UNSURE (   8.11  )
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

T24gMTEvMDgvMjAyNiBhdCAxMjoxMzo0OSArMDgsIFJ1bnl1IFhpYW8gPHJ1bnl1LnhpYW9Ac2V1
LmVkdS5jbj4gd3JvdGU6Cgo+IHNwaV9ub3Jfcnd3X3N0YXJ0X2V4Y2x1c2l2ZSgpIGlzIHVzZWQg
YXMgdGhlIHdhaXRfZXZlbnRfa2lsbGFibGUoKQo+IGNvbmRpdGlvbiBmb3IgUldXIGFjY2Vzcy4g
V2hlbiBSV1cgaXMgYnVzeSwgaXQgY2FuIHJldHVybiBmYWxzZSB3aGlsZQo+IHN0aWxsIGhvbGRp
bmcgbm9yLT5sb2NrLCB3aGljaCBibG9ja3Mgc3BpX25vcl9yd3dfZW5kX2V4Y2x1c2l2ZSgpIGZy
b20KPiBjbGVhcmluZyB0aGUgUldXIHN0YXRlLgo+Cj4gVXNlIGd1YXJkKG11dGV4KSBoZXJlIHNv
IG5vci0+bG9jayBpcyByZWxlYXNlZCBiZWZvcmUgdGhlIGNvbmRpdGlvbgo+IHJldHVybnMsIHdo
aWxlIHRoZSBzdGF0ZSBmbGFncyBzdGlsbCBoYW5kIG9mZiBvd25lcnNoaXAgdG8gdGhlIGNhbGxl
ci4KPiBUaGlzIGtlZXBzIHRoZSBtdXRleCBzY29wZSBhbGlnbmVkIHdpdGggdGhlIG90aGVyIFJX
VyBzdGFydCBoZWxwZXJzLgoKVGhlIGRpZmYgaXMgbm93IGNvcnJlY3QsIGJ1dCB0aGUgY29tbWl0
IGxvZyBpcyBzdGlsbCBtaXNzaW5nIHRoZQpwb2ludC4gVGhlcmUgaGFzIGJlZW4gYSB0cmFuc2xh
dGlvbiBmcm9tIHJhdyBtdXRleGVzIGludG8gc2NvcGVkCmhlbHBlcnMsIHRoaXMgdHJhbnNsYXRp
b24gbWlzc2VkIG9uZSBzcG90LiBUaGlzIHNob3VsZCBiZSB0aGUgY29yZSBvZgp5b3VyIGNvbW1p
dCBsb2cuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
