Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0665C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B266205CB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O93hCn0O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSs0Frfy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B266205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2k8U1AkKt5uSCqYbBdamtpGjAw8CCFsNF4UBQgaoHuw=; b=O93hCn0OffDC8Q
	OBztvuQii4SVKd3MCDmKR8e2sfGKOQcl4eEzQGZM8sIHnpzRG56yuy6DTDj5oEoZ+kviY2DeYORJt
	MCdhTqtAQ3TAqbG3RqvGHMdLIWv26yIe19e+PIswx3VyxJ/RHUPPGrYlUxkeDUOlDo8ynKeZm9Bkh
	KMygLqvTJ8POQsGhKZOebL5BMz1tZ8FQT4fFwO124KEfQilsfRdUawt6xxKNNGC2Vn1m53tY3hSkF
	qUJ/plJJYiqRPWLDngapsPXPUhYmkRFNYXDVo7k9Z//kN5xHyBaeXCvHGXnu0vBcxAzOwqrI/cA+5
	KjuivAXUtiHRPJsu2PrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJJO-0005lV-QP; Thu, 28 May 2020 14:15:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJJL-0004YK-Iw
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 14:15:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id r7so11404931wro.1
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2020 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47OATELzdatA1HggQw3A54kP6MuolUXcSmh78zyfPRA=;
 b=JSs0Frfy4Zpy9TRTpQojoYjtuRJ3DHViQmWtiRbFxhQVKOt+1z5Rohk+YN37hav4l3
 RULlQX+tTLjgBI39buU3w9qzH6eI9DG28rTgs2uVGMLXOB3U53SgaLlbqqZyeyydeB4O
 LdNxgofLdtUzZYMB/nYE0pUDOiOUzIj+n1wRVP/cm79I3aJpCkDB5oK4QOgHJWulI4fH
 aLgN2Irs3NSKEvJC7kERtTTPqj9m9scgRBOmO0En2yDQ62xtbyJUCpkmR1IFYxIZhyB7
 W9IPUWC9io+3zgbtkEiLcHXxy3VCwqCJl+vWY4wYGhPLVVLw00snMYOh/8fVC1x4wVP3
 c0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47OATELzdatA1HggQw3A54kP6MuolUXcSmh78zyfPRA=;
 b=tSCpZplWtyQo3jsh7ZAWkc8YvSizTFvhEi/RwtUAhlajg9wtE26p2bkQ0P5T/fqHBC
 9nmviJlNCJUEhnGXV51+PeZ6tzF069lvntzpgLPRez8QeZKxmJ8swl3BvAX6eo7ZRQ4y
 XCMy22aHdvLsfOlhlyC9ER74GTcgaDJ76E+n/jxY9uexb5nlG6QMKa0M5QiBn4UYPNPt
 vWjcs7uM/+SxypVa23pu0ppjQHncXn2Nlt+F1PzGiyu0DJ3UC1aNFXavf9BVPDP0UxyP
 HXBjOueua1p99kgDPW7o3WNjhP/3IsafvlYDQg5ZKMLFLd65M/sqParHGOIJSrZZ4PGn
 g7Rw==
X-Gm-Message-State: AOAM530mveYbmUFPyJAQfeL12KSg4U7jbXxpaTDtd9EpS0sPn5MydUGw
 Eha1pvoCWjujvp1w4r3AcqE=
X-Google-Smtp-Source: ABdhPJyRO0Kiu8RuqwMd9+u4dh+G55xc4yUP8AZCimdZgxNnKU/DdIE8r/D5kk/gQwWgJ0b1zpmNvQ==
X-Received: by 2002:a5d:4d89:: with SMTP id b9mr4059264wru.210.1590675304940; 
 Thu, 28 May 2020 07:15:04 -0700 (PDT)
Received: from ubuntu-laptop.micron.com ([165.225.203.62])
 by smtp.googlemail.com with ESMTPSA id r11sm6257982wre.25.2020.05.28.07.15.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 May 2020 07:15:04 -0700 (PDT)
Message-ID: <829d76189beff5a50ddc56123d22bff3aa6a3378.camel@gmail.com>
Subject: Re: [PATCH v6 0/5] Micron SLC NAND filling block
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, vigneshr@ti.com, s.hauer@pengutronix.de, 
 boris.brezillon@collabora.com, derosier@gmail.com, Richard Weinberger
 <richard@nod.at>
Date: Thu, 28 May 2020 16:14:52 +0200
In-Reply-To: <20200525121814.31934-1-huobean@gmail.com>
References: <20200525121814.31934-1-huobean@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_071507_641634_62EF61EC 
X-CRM114-Status: GOOD (  10.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

hi, Richard


On Mon, 2020-05-25 at 14:18 +0200, Bean Huo wrote:
> After submission of patch V1 [1] and V2 [2], we stopped its update
> since we get
> stuck in the solution on how to avoid the power-loss issue in case
> power-cut
> hits the block filling. In the v1 and v2, to avoid this issue, we
> always damaged
> page0, page1, this's based on the hypothesis that NAND FS is UBIFS.
> This
> FS-specifical code is unacceptable in the MTD layer. Also, it cannot
> cover all
> NAND based file system. Based on the current discussion, seems that
> re-write all
> first 15 page from page0 is a satisfactory solution.

This patch has overwrite page0~page14, damage EC and VID header boths.
I know this is safe for UBIFS, even fastmap is enabled (you fixed this
in (ubi: fastmap: Correctly handle interrupted erasures in EBA)).
Now, how about jffs2? 


Thanks,
Bean


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
