Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E889C5ACB3
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJqJazuqTd8xsZmMAnAlWNew6JsF5ulR77RmyCGgRag=; b=hD6VTpr3Lu9cq1h7eaGTLlOrNy
	6F9IZcxClRzHiSCh2A1QCRU2WdPV5VkQIP5C3g7MOwMzy4BaP6kDwWbO9zgd3HLswsh4oP05jGKyT
	jgdYcFBSuGzONzQhCU47N2shgNLiRGxjeAiwvcfJXVrW8egkx7tmB/2zGVnvWRCt98fAo7lmI/gGB
	FusAaeQmdpfP/Y7+ZIz4osBKmu5XifGrhPOfoUtEbXHku6AifrskmzCT3eMng3U0lliE8gUJYsZFu
	XVwO+WgI0EqpUbcu8Q7WowI0gMf8DcnDGQ5dkJ1kqvU0QwVWxT6I4+borRdL7GBBqspzotyjQwuQF
	LdQWv/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5M89-00G0OJ-0t;
	Tue, 21 Nov 2023 08:29:13 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5M86-00G0Mb-0N
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 08:29:11 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 656E1FF;
	Tue, 21 Nov 2023 09:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700555342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7AwP/IcHD1ZnQiqAThTA+Tjsjcl8a22awaPubY0YFE=;
	b=JDoPIcIZdxvg53cVrS2t0u775oinmfNKY0J7xELgZo2bgg45RnIo0aspkagjD5vjtVcj25
	jS4BJ+ya1kQp0Fy3IMq9OOv8eJXtIHSy0gwUTHqKl8d034LCf4UY0+jXxbcrDFyxnFEeia
	NbznFyXsv0CmG+X4z4aJe+e63LqDiL1IFyugkVjN14/wtESu5BBa50dEsNmIjxY9beTGaZ
	VG/Xfs4tuZWd6wznvEO4lYnapkpxLM6Uplqxnw23CNjPGFOmBX1nShAyMdvHyolBcaEBNH
	xlwI8iWQPt30GlaCloCN471BpW+QXLTJ0oTbxtUj78zJn4ZjAlm1m0USnmel+w==
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 09:29:02 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 0/6] Add octal DTR support for Macronix flash
In-Reply-To: <CAAQoYRnRxFjBq7afwHOWi_EbCjdrpLPL6dR2WMs-HC2TdsByAQ@mail.gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <bdcaa357da0d1d3861831761b428dee9@walle.cc>
 <CAAQoYRkMjq6R+6ZpyW0upDz0ScBQQd00gCx=BcS-_K9nypnUCQ@mail.gmail.com>
 <1e36423d84074b8056985a08737a7768@walle.cc>
 <CAAQoYRnRxFjBq7afwHOWi_EbCjdrpLPL6dR2WMs-HC2TdsByAQ@mail.gmail.com>
Message-ID: <5ec9ea53184695ed43716eec97d76e37@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_002910_632576_98C603AF 
X-CRM114-Status: UNSURE (   6.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Do you mean that I need to patch dtr_swab16 support for spi-mxic.c as 
> well?

Yes. Otherwise, this code wouldn't be used at all.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
