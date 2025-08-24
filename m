Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB217CA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 19:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIPgk9D7p32vG9a7XzfYgBcXuPKxN42GsBB5KLkjGhU=; b=QQ9NboZR0bbZWL
	tXd7/1YMH0JQxWr4JIfMomR211NOX1BVj0wJmkYse1ry1olZFfAwmnyRKdJit5fYMGXiofD7zR0zh
	kSh0KkbrThTHcb9TBAEsYd9Q4gcOIf+uZxzxbs3TSrTByhR6ScRTf4Ze4ONWJE29aEb169erJ9yEm
	oK8T/r63uO3Ua84Bio+FcmlihAXxDsEN+7zzSzun2HvotlDE6+SanZszgRj0qqVO5dltTum4yVu5J
	DSC+WJz+q+FrijRa8J3P/Tlo7t9JuGgpbxzqsJRSFaHtjtxcviVdx/MZ4QpQCq2mT4VR9cNfZk0Tb
	ICqzCz82JgDhlc21hgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGCx-00000006UEX-1Ydo;
	Sun, 24 Aug 2025 19:16:51 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGCu-00000006UDl-1svI
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 19:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756063000; x=1756667800;
	i=markus.stockhausen@gmx.de;
	bh=oh35S33fifoCkDTI36DSTJ4j5b3XkUIrQagi8M62D5Q=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Nm7lHLZJdSyKmFbRTJIc59QxFhlLZpp0cK2xx60u0BQ0OWUFrqvZq4gbRy2QaF2Z
	 eCZYpQpnykzx0LtFl7+03AUHkdRuoEGhjFz3TFVo93Rt/OGgsSru59NGHmBQ8tOvi
	 3xvhe2rhmtAMrYBMEK7vaerxi/fUPqfSPKQWPrzs5KkxF5EMQDgUHZm+e/ZU8NbLs
	 UhGQ2PwRgdacdC5kAcA6S0P++dI40Q5xxZwv5UgO/geX/cgCn4lCe7LcV174AqoK3
	 alwgjPg+KdqLcpFjNkoSiee2xZGJ6ozTXYHA/VrddOFrolKkMYUX9Ol51jddjTK9D
	 rn4mX3dZURYMrcBlKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOREi-1vAZ2U2QbG-00Mhu6; Sun, 24
 Aug 2025 21:16:40 +0200
From: <markus.stockhausen@gmx.de>
To: "'Miquel Raynal'" <miquel.raynal@bootlin.com>
Cc: <richard@nod.at>,
	<vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>
References: <20250818092725.1977105-1-markus.stockhausen@gmx.de>	<20250818092725.1977105-3-markus.stockhausen@gmx.de> <87ldn8hddb.fsf@bootlin.com>
In-Reply-To: <87ldn8hddb.fsf@bootlin.com>
Subject: AW: [PATCH 2/2] mtd: nand: realtek-ecc: Add Realtek external ECC engine support
Date: Sun, 24 Aug 2025 21:16:39 +0200
Message-ID: <015a01dc152b$9e90a990$dbb1fcb0$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: de
Thread-Index: AQGg9q9wwdYxEtp5Vu5DmMZHogtrQAD14+0rAvBks3u0yTGgQA==
X-Provags-ID: V03:K1:xdHl5kj24rYfvN1hWBvWQMnqamK5lLu2o2WZGQN/zUof0q2honJ
 J/iPmfy6RK8iCPG1vqtvnHNlI/3l0/pijw0PvkSnhpYt+4BJZmD3QF2r/nRp+rAFpNc2GNq
 DVkmpDQa9x0qIN/20mSEyFrZo8vwUYgalXjQewn056oe8/CPAQSxrfSiOD4VCPbRX0iAxfL
 J6vf71ruN0IwejzRYcJyA==
UI-OutboundReport: notjunk:1;M01:P0:qXrYcxy6X4k=;LGvhqalOP7x6A9nPYBhzk0PXRH1 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 X3sx0WvJ2mNQuxsoaIg5C6wKbvNu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_121648_780997_38ACDF1E 
X-CRM114-Status: GOOD (  14.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> Von: Miquel Raynal <miquel.raynal@bootlin.com> 
> Gesendet: Sonntag, 24. August 2025 18:51
> ...
> +/*
> + * The Realtek ECC engine has two operation modes.
> + *
> + * - BCH6 : Generate 10 ECC bytes from 512 data bytes plus 6 tag bytes
> + * - BCH12: Generate 20 ECC bytes from 512 data bytes plus 6 tag bytes
>
> What is a tag? I believe it is Realtek wording and we need to find a
> more generic translation.

I have no real idea. They simply call it "tag". To be more precise

- tag (lowercase): means 6 oob bytes for one 512 byte block
- syndrome: means 10 ECC bytes for one 512 byte block.
- TAG (uppercase): means 16 oob bytes (tag+syndrome)

Even the register is named ECDTAR (ECC Controller DMA TAG 
address register). For me tag (lowercase) is simply additional 
input data that can contain arbitrary content. It can be used
for extended/auxiliary/meta data or simply padding I assume.

Looking at the data on my devices I see that tags are always 
filled with 0xff. So it seems as this gets populated after erasing
data and is never overwritten afterwards.

What naming do you advise?

> > +	oobregion->offset = ctx->steps * RTL_ECC_TAG_SIZE + section * ctx->parity_size;
> > +	oobregion->length = ctx->parity_size;
>
> Please reserve 2 bytes for BBM.
>
> For me it looks like you have a bit free section and a bit ECC
> section. If that simplifies your life, you can just return a single
> section for both.

The first two "tag" bytes seem to be designated for BBM according
to my information. Will adapt the first oob region offset/size.

Do I need to declare the BBM area somehow additionally?

Thanks for the other feedback. Will implement that in v2.

Markus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
