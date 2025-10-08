Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3BECCA472
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN3oaSmkIDmmIi/8Fs+POeiOK9Ul+2o4iiq+gSQ9qU8=; b=Bps/COwnWkWmyd
	mhByavco9MUG68fL1noaTVw7IUrhUs3hVFhcsvt/s847fDbVF5/G/ET6oQ/ERJs/tmE7HS/vqNewA
	YFhBOe+ILKlq09yu+M0I9tsqavlzm0H2DPysGe/IYyR/VGtfmJgxozkr4lTngyh+j1sJmcsCsyZVq
	JvLbDrx1K6bVT7ZkCAiDFny6NGoiYyxdn8WOUdYU1IQSAhRTd+YiH10LDIrmXAw7H75NMxT5H+5Y9
	NOfyybuybdP/a0lNWf0JzgU6+DeFpkgeA3TXxfF1zC6PGiVFI8YkEI30jwSMe9v8sarnY88nS+0Cw
	pDZ7XJwRkPZyK433l+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TjL-00000003siF-48LH;
	Wed, 08 Oct 2025 12:57:19 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TjI-00000003sgD-3Aup
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 12:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759928232; x=1760533032;
	i=markus.stockhausen@gmx.de;
	bh=TZYECAzCU//y8fHPnQEqzOqZd71Qa9jEqx0FqizI2ag=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AW7X+6LAg7v9/gvXa32pRoiMf3FMi8dhmL+NsgdAWJWDHUgHrW4/HBMJIfBf+4qc
	 lzjE2h07Hb66Q/dmpeB3/bv23eN6oh0HQHXhnJDt0fb2ociddsXFnNo4uySG8glIO
	 DKz8AeT1KchSpv0LRWpWEbB6dRYie0aLZKkE7q5aj3iz9BpNP7EUc7WDgteYl93EJ
	 x1kxLpB8i6ahWVtl0UCdjQWMWQ1o97u4zZpyg6PSy6BaLaxA6FWVHJ3/AxfB+UCAJ
	 I8JL9GP3SLgNGE2cNWZyiev1n90SXx7CZSpWGig5eblFKDKPXYR7RKEt+P9QIHfQ4
	 rKlt2RSgXfMN3Mn3AA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbG2-1uE5tO0UYI-00rmcw; Wed, 08
 Oct 2025 14:57:12 +0200
From: <markus.stockhausen@gmx.de>
To: "'Geert Uytterhoeven'" <geert@linux-m68k.org>
Cc: <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	"'Miquel Raynal'" <miquel.raynal@bootlin.com>,
	"'Richard Weinberger'" <richard@nod.at>,
	"'Vignesh Raghavendra'" <vigneshr@ti.com>
References: <5109cd228940c246d2e1ef4ff01799315601c285.1759916792.git.geert@linux-m68k.org>
In-Reply-To: <5109cd228940c246d2e1ef4ff01799315601c285.1759916792.git.geert@linux-m68k.org>
Subject: AW: [PATCH] mtd: nand: MTD_NAND_ECC_REALTEK should depend on HAS_DMA
Date: Wed, 8 Oct 2025 14:57:10 +0200
Message-ID: <01f801dc3853$104b8ce0$30e2a6a0$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIurcoF9dmmHYkV0dqod4IoKyN3PrQTSl/A
Content-Language: de
X-Provags-ID: V03:K1:tJH117jAJwxVcCJq4r4YhJLbSkbuC6PYU5DLzAjvyh1ns94eV10
 9NiCUnX85PUzEC+GmqE6fnBMiT/68uK0dXoOlXubwzg7iy/txwakR83p3+aXiTa62hQMmkt
 LWGdkWWAbLrhlNKSMrRd9BpyW8JpMGHPcl++RcCl5+dNZOvvwkC8nXm0OZeunDZt302n9go
 lqEFGlBpWIN3/85luftZQ==
UI-OutboundReport: notjunk:1;M01:P0:0hm3QNEAByw=;/m+6jicCpYux4at5eGqu1sodr7j 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_055717_093585_99E9BE6B 
X-CRM114-Status: UNSURE (   7.58  )
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

> Von: Geert Uytterhoeven <geert@linux-m68k.org> 
> Gesendet: Mittwoch, 8. Oktober 2025 11:47
>
> If CONFIG_NO_DMA=y:
>
>     ERROR: modpost: "dma_free_pages" [drivers/mtd/nand/ecc-realtek.ko]
undefined!
>     ERROR: modpost: "dma_alloc_pages" [drivers/mtd/nand/ecc-realtek.ko]
undefined!
>
> The driver cannot function without DMA, hence fix this by adding a
> dependency on HAS_DMA.
>
> Fixes: 3148d0e5b1c5733d ("mtd: nand: realtek-ecc: Add Realtek external ECC
engine support")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thank you.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
