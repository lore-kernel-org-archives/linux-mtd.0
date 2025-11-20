Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2FACF855C
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yaJMmGEH1Fr/p8Q3FZe6licaTJGZO4QdZpyIu8MnHU=; b=mBIAPSuqpqSB5L
	3ttHTVetwE65ceANOneA9Uu8K5T6njgJLEvKChAluYzEgJvYBOXcyF5XglJaUurg+OtOgCE22Jhy7
	m0gSgn9/5R+LD6nbZdcqE4Xfdl4OD6s3qf2xKcX/zMVXDzkGiH653XcHndkyZWtiYUxFYfLd16Kzc
	bdzNTrlPWPHWGrsEFG9wbqOmAH1TGk8fBBhWV8q05FI5vPAggxvnfhf2i0CzSmMVz2ZWr3tYtfM0q
	ZGbU1hFBzEXNZDY32AaltU79Kuvkoguxiik4tbJg4SDmVYOuEcje9X+c4UgeY2BOye4yXMFVjYQGK
	s/H1Hj0bKvc3Rj+RbDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0WL-00000006O31-41u3;
	Thu, 20 Nov 2025 09:00:05 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0WI-00000006O2C-2lGC
	for linux-mtd@lists.infradead.org;
	Thu, 20 Nov 2025 09:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763629198; x=1764233998;
	i=markus.stockhausen@gmx.de;
	bh=x28jivCSA65zkOjWhyRF0MM9QqVRBdraPbl3SGP7x3Y=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CrwSzp/fuvzHu9LZ1FWd+1bBbLDM2wzjU0YptAtsbPUK2FOOkRaBRDLu2A1Z5Xej
	 vBo3/QgdrqvcaX6PYn6pCw3d0iA6WhcJF+Eq9hyTc9t8/CVuFYbJcFjgs5aArCFry
	 n5WvnnjjzU8GwBkvkuvqDO0Em4CXufqqkMWu7o9r2IHXJvBXIKo8hR2wXnq1h5FQo
	 q9BuTRZrV/hZ1+xYp9J9ZlzYSwYoOJlK3Au+xJu15CuT/90PbfJoWNARLfFnJUH42
	 7FSiva9Tzkp5rijrLnxqNvxwdfLjc9VeIUuE+yJ+laXn3wc0xVDWdilHAiDKDJCYE
	 mOAXUtW8HYwa3Hv/8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXyP-1veNYf2Vjj-00SooK; Thu, 20
 Nov 2025 09:59:58 +0100
From: <markus.stockhausen@gmx.de>
To: "'Miquel Raynal'" <miquel.raynal@bootlin.com>,
	"'Richard Weinberger'" <richard@nod.at>,
	"'Vignesh Raghavendra'" <vigneshr@ti.com>,
	"'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	"'Pratyush Yadav'" <pratyush@kernel.org>,
	"'Michael Walle'" <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: "'Thomas Petazzoni'" <thomas.petazzoni@bootlin.com>,
	"'kernel test robot'" <lkp@intel.com>
References: <20251119193357.127469-1-miquel.raynal@bootlin.com>
In-Reply-To: <20251119193357.127469-1-miquel.raynal@bootlin.com>
Subject: AW: [PATCH] mtd: nand: realtek-ecc: Fix Kconfig dependencies
Date: Thu, 20 Nov 2025 09:59:55 +0100
Message-ID: <011a01dc59fc$0c3b5d40$24b217c0$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF5wGWAXc5d+Yd4JcxAiJt5z/eJfLXAdung
Content-Language: de
X-Provags-ID: V03:K1:N86W91dDTY6EXIvr936rNsVtOV7/SDfRewqrz6j0dqT6ra/sxKF
 lEqsI0F1LlkcBPDHA8pwKMwP4HNtZcO7nQtX7438YFpxOL9JivBcZcmH3LpSm3zYHy4ONVo
 uANJhFCEAtkVxah2v7W8jD5zvFiHhaEzXNYJylaxXwtqLsSqK1GiTxgEbxnm4TjThPKG+Z1
 +f2bA+yo3vdwIe7dIB5rQ==
UI-OutboundReport: notjunk:1;M01:P0:wF7G7CrUigI=;rhkU89tOougkNgJQpWj/WoY+o+S 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_010002_993754_4F6F552B 
X-CRM114-Status: UNSURE (   8.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

> Von: Miquel Raynal <miquel.raynal@bootlin.com> 
> Gesendet: Mittwoch, 19. November 2025 20:34
> 
> The driver uses DMA but does not mark it as a prerequisite in
> Kconfig. As it is also defined with COMPILE_TEST, autobuilders complain
> about certain symbols not being available when linking on architectures
> without DMA support (?) like sh.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
https://lore.kernel.org/oe-kbuild-all/202511071114.8WeW2GZK-lkp@intel.com
> Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
...
> -        depends on HAS_IOMEM
> +        depends on HAS_IOMEM && HAS_DMA

Thanks fort he fix.

Markus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
