Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71C4C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O76HXwVyZ+U9YjLZh8QsoncGDarsK7DVkxCQRNejpw8=; b=L9ZklncQqImWaC
	xzSSKaSxXDQyQfUenB9aw0JuM7vAO5L/qDnYhOzsovvbVtKp9RZk6yg6tmDTPVCozwhO5pFuGRKhJ
	Iln28l0b9ERfPnuM9PwhIvVtD44vv5Lhda3LZk02co+U8qxBjPldMQ1RT3oJk4GvI0HpMWcXLmAn2
	JH76asmjkye0Xf1C8cqHJDCXSmHEplkmnXBhzbuj3WWqrf0mx7ikJk7XtMLGp/GC2jEAuN76G3xLO
	hljlR2bJgYhnxvYwlsK2zzlHET1pyLjDG8UfHfmW/wHZrOpInyuKkDtf/AJty+19cK0aYHuXRp2cZ
	9cE1nr7EK0dQkdG/Cuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7X5I-00000004G3N-16NM;
	Thu, 16 May 2024 09:07:32 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7X5E-00000004G07-2j31
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 09:07:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4FC7C000A;
	Thu, 16 May 2024 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715850442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66SENGMqaDHlCsPgbNPoyUl3vdEGsvp/c5zKx0PVYH4=;
	b=aDc4WqbTgvaLfWWniVvqWaCbgnvVexgpA7L3uoUQGVWyQAETYbRdQTqHSH3M4H3ggbiCxg
	jJTws45K7VdITVwVNqk8ZzC3CmiP/wDYSIhumqTa0o+/lgHW0iyoMU92Z4XNGlIv0qZwmB
	HQUJu2//PmRUNq0JhLlCDFniDRf1e0BK4kn/0pB/zKq3+4nNZhduHyg2i7UaGvwkQwBvwl
	lPg+usVe9bB6WHN7VdYU2RLtroymVy28eOyQ8LSXVxtgMjMxqijEcHvnKrZa7Vkie0YL5D
	f2oRqjbP86I9sRwNw/TdS3c0A+FyuPPnTxCwWOh5VQWMd6JHRoTSY/hYIBoV/g==
Date: Thu, 16 May 2024 11:07:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.10
Message-ID: <20240516110721.322ce1fd@xps-13>
In-Reply-To: <20240516105321.7f9a4c3a@xps-13>
References: <20240516105321.7f9a4c3a@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_020728_837385_54259DC5 
X-CRM114-Status: UNSURE (   5.27  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gVGh1LCAxNiBNYXkgMjAyNCAxMDo1
MzoyMSArMDIwMDoKCj4gSGVsbG8sCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCA0Y2VjZTc2NDk2NTAyMGMyMmNmZjc2NjViMThhMDEyMDA2MzU5MDk1Ogo+IAo+ICAgTGlu
dXggNi45LXJjMSAoMjAyNC0wMy0yNCAxNDoxMDowNSAtMDcwMCkKPiAKPiBhcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbmFuZC9mb3ItNi4xMAoK
TWVyZ2VkIGludG8gbXRkL25leHQuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
