Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8973C10F07
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZ3mKIxFbtlq6qpavzxn9PhKU40HfgMK/c+mzR1spIE=; b=B9NUqDtSMASjY1Wd3EN8ogdplc
	mM4D8l8NaH58nGswt1Rf5sZiOCZArhbDiPI5FqfyIghtEhsJkkRBTKf2l8BVJPBD0AiAVwz1PQJkn
	CXnl70TV60Qu+rH7sO0l1YqpGuNPDXEd4OnQEQL8m0PWxyF2U6Du1tODKRJZyf85eiERiUCPq1FsS
	FWivySJHVh9MaD1RcFcKef1ecxq+RoyZrRa5geeCapo0I7qAEir7X0RSSJx8k+jOxxTsqF/QnZy26
	0d406yBzSdrnQL/hfFkyyFvJfvM+OJ0nisuGmcutmbAo2hRELp9wwLjgJ+xsYEYezgR7eVTThHFfw
	mQpOhGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdt5-004fVc-1w;
	Mon, 11 Dec 2023 10:51:47 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdt2-004fTn-1D
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 10:51:46 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8BBF850B;
	Mon, 11 Dec 2023 11:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702291902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ET+prpoUVIlxmpVtzL9P7a8PaduEWz7E+1UHWNsQgAA=;
	b=aWK+OLj4zkpvu56xtST1xpM0sefiqPW80DhIWV/0z67dTzkLOzBoCSNscC9MCI4X1nTkK2
	zUhWqg7JFRf0K28mnmyJZdHTTH+ck2B1mzuzcqMKYyehejsRyxJvJuzljCvxvmI9EBiEP2
	fAvdG8Z51WnWtzchQ3flGyHQ3FEl/VYg/e9T0AxaUE1m77zKT6iUjMdSscZrkGlNN4CHNE
	l5IK4L5WGNM0XdXfpjBwwvyIdXP8p9xnlFenOjGNduhLfpZVzdYTATTI5BEm+zXnP7Gw8T
	g1ev6mDifk4xnoQ8hDzo8UMG9SX7zPvMMfn4frpGV8ftyqIrdoRhztmsD0EhdA==
MIME-Version: 1.0
Date: Mon, 11 Dec 2023 11:51:42 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
In-Reply-To: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
Message-ID: <f015ef75d6bb0a9f8edba37b40affb60@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_025144_803951_16222D6C 
X-CRM114-Status: UNSURE (   5.01  )
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

> Some flashes contains 8D_8D_8D information in SFDP but did not enter
> octal DTR mode if conditions are not satisfied.

What exactly are these conditions? Rather than "abort" the octal mode,
the flash shouldn't have that capability in the first place.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
