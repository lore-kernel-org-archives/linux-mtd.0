Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A54C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r36+7jBXR+uSy8BYS6s1k8Y7bMUWtbGRqqeGqaPcivo=; b=e3p3XQGy4CLuux
	TSkRUBu1eYGqk7f8CiLmyw+oP2bDvSHiJPT+KhC5flCbcxX4JdLzYhOXg80wtSqut+/QFo0s7UONB
	5wwYVUuw7bJfpFISGTtJ1yiMJvL397MwNG97KFjNg+ZlNBW0IZiCDXRYcd5AL+YLHPA/Fsgc4I6P5
	m2QMMuXP4H3lVy/wjKGcWDB9Yfu4b0VkALjQoUPwPdYGT/E2UJHk0OJmw3WACtCQ1CRkjGh9L0C93
	UQY6KoqLLcYpmFnYm3jKMmL3peLQzHF+xMz+lROdzcUcCCFT5P9ayrGpqcnDnvvnWp2Rqfjwa6z3R
	6rBvBbPSV+M77Ne/RxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHV5-0000000HTDv-1GPu;
	Fri, 12 Apr 2024 14:03:31 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHUx-0000000HTCZ-009L
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 14:03:29 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7F2AD3E6;
	Fri, 12 Apr 2024 16:03:21 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 12 Apr 2024 16:03:21 +0200
Message-Id: <D0I77YRZ2H9K.3P77J7WK3UTZ7@kernel.org>
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-4-mwalle@kernel.org>
 <14726a74-d54a-432d-a547-3b07ac97d413@linaro.org>
In-Reply-To: <14726a74-d54a-432d-a547-3b07ac97d413@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_070323_200663_38A3C17F 
X-CRM114-Status: UNSURE (   7.70  )
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

On Fri Apr 12, 2024 at 4:00 PM CEST, Tudor Ambarus wrote:
>
>
> On 4/12/24 14:44, Michael Walle wrote:
> > The evervision FRAM devices are the only user of the NO_FR flag. Drop
> > the global flag and instead use a manufacturer fixup for the evervision
> > flashes to drop the fast read support.
> > 
>
> Don't we want to get rid of FRAMs from SPI NOR? Why the dance then?

Yes, but it isn't that easy. There are (three?) in-tree users of
these chips. But we can already move all the special handling out of
the core.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
