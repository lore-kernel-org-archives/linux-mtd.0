Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525C606A336
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i7vX8ep2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rMRfk8bt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ShuaI1hL1M4WvUU32JJK8p9fLUQDfy6Bi0qdlFNI0Qc=; b=i7vX8ep2q7LAY0BcCJTqgry+xy
	TMBHW1UVUhE8AtlFHke+4s+LYbYu06/oEpLNC5M6N5lOOUmLGNwlgMuJPe/kRRYbz0prUBz6CfWv0
	dM7eEq9N+ZKAoAa0oA2PXzC+wFe7nN5MDWLRiJW88PJ49GjHmEqD2o1MBNSdq/FyzOop7PgSO8oXl
	of4Ej3fUVAye8uofdkZW7WJN4O5gDrD8wviWnxfpiE11COhedywJbO08ej+uI1cvGeoj4QZyvXPTM
	l/uDImjReQ9Mvx0Z3E2sIg/UlqBlGOlh3gDRERm/QN19hoFsedV/UL+EvOyuCMbLXQJ6CSDyVRP7U
	wlZTcYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz1n-000000038EK-3IDT;
	Mon, 16 Nov 2026 15:53:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz1l-000000038DT-0tqG
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 15:53:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B982E4E41601;
	Mon, 16 Nov 2026 15:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 827E46023F;
	Mon, 16 Nov 2026 15:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C4E311BC0D9C;
	Mon, 16 Nov 2026 16:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794844428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LhVqyBGBI3lxfifcbc5k6tX9f39LY4M/qAUI7NNmN+Y=;
	b=rMRfk8btuLVcUhPl7tEuJgZEz2wURlRw9ayb5gDWGKqKjx/gXe4mGGAMXr+XXlz9m5yim3
	RKOWpSIO6bTptoz6hApVQKhwaxE7Lgrx5W3OwmeltO2LxhOHkgT/SSRWuSOf3ljZ2kBL5K
	h8OCDHRfiXMKUZXisjmIw9CoE0bSZQu/TtDYw7qsOGBnQLwnG11Ouf/onx1jmT7PZueQf3
	lGx2+cq4Siz5ChSzcyqJja+k5Qj4OGnivyXbqpBR973AXRVcUNdZznmK7UVkyTQiN0Uf06
	Z5lDYaZoPwyusCyChwAc6OSX1gR6ApWnGL46elAGdLyMLESGgUTtdBj4Bfp9OQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-bot@kernel.org,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor
 Ambarus <tudor.ambarus@linaro.org>,  Richard Weinberger <richard@nod.at>,
  Kyungmin Park <kyungmin.park@samsung.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Han Xu <han.xu@nxp.com>,  Keguang Zhang
 <keguang.zhang@gmail.com>,  Vladimir Zapolskiy <vz@mleia.com>,  Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Rosen Penev <rosenp@gmail.com>,  Frank Li
 <Frank.Li@nxp.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Rob Herring
 <robh@kernel.org>,  Alok Tiwari <alok.a.tiwari@oracle.com>,  Chen Ni
 <nichen@iscas.ac.cn>,  Runyu Xiao <runyu.xiao@seu.edu.cn>,  Hemanth Selam
 <hemanth.selam@gmail.com>,  Pengpeng Hou <pengpeng@iscas.ac.cn>,  Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,  Triet Hoang
 <triet.hoang.dev@gmail.com>,  open list: HYPERBUS SUPPORT
 <linux-mtd@lists.infradead.org>;,  FREESCALE GPMI NAND DRIVER
 <imx@lists.linux.dev>,  moderated list: ARM/STM32 ARCHITECTURE
 <linux-stm32@st-md-mailman.stormreply.com>,
  sashiko-reviews@lists.linux.dev,  vkoul@kernel.org,  Frank.Li@kernel.org;
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
In-Reply-To: <avslAXoa_LSuFNrP@SMW015318> (Frank Li's message of "Mon, 16 Nov
	2026 09:45:05 -0600")
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
	<sashiko-outbox-193928@kernel.org> <87wlqcrg0u.fsf@bootlin.com>
	<avslAXoa_LSuFNrP@SMW015318>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 16:53:32 +0100
Message-ID: <874idgrcw3.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_075353_426757_37C2ED29 
X-CRM114-Status: GOOD (  11.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 at 09:45:05 -06, Frank Li <Frank.li@oss.nxp.com> wrote:

> On Mon, Nov 16, 2026 at 03:45:53PM +0100, Miquel Raynal wrote:
>> Hello Frank!
>>
>> On 02/11/2026 at 18:21:00 GMT, sashiko-bot@kernel.org wrote:
>>
>> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> > - [High] mtd: implicit declaration of dmaengine_desc_set_callback()
>> > breaks build
>>
>> Should this land after DMA core changes have been merged? I have too
>> many patches in my inbox atm, so I will drop this one, please re-send it
>> whenever it can be applied and I will happily take it (with the commit
>> log fixed).
>
> Sashiko should be wrong. dmaengine_desc_set_callback() already in
> v7.4-rc1.

Ok, I put it in the queue then.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
