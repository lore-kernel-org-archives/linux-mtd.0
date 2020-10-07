Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255AFC4363D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 13:03:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ABC6206F4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 13:03:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Js+fBv0Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ABC6206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UtvYbehv7QW/aO2aQXSlkc0OqLv+8ClFXP9A3lix5AQ=; b=Js+fBv0Y5Ship3PXYAp69DyQ0
	QAWk50EwHix1uBxgW3ezt6MYR9WszSN/cH2263K3jyXzFOSSawNCL1YYRurmYLSLojweXY2ulGbAu
	vQ9qH8yd8ZAP7VfqWlbcPLB5a54prBh4oKLfEc9M03nUT7e+ZTS4rgbiPeJakfhYtRg4m87AVdOJ0
	BPWUKLq8OoFqsJf8tbKXPO39kRULXiHe3TMCjiYsyrOqTb+dZ7ZGs8lou04phJKWYkWyRX2NR2V3D
	NJa1qJfUsV5iOaQExz+yjDGEdQ9B4OybMvg5vCfDcq4VGvkfT9jK2w0E2Tj9/XbOs8amUBWZLH4iT
	AG9NOc+SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ963-0006vc-KD; Wed, 07 Oct 2020 13:03:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ960-0006ty-3C
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 13:03:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9125429BA7E;
 Wed,  7 Oct 2020 14:03:01 +0100 (BST)
Date: Wed, 7 Oct 2020 15:02:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH v3] mtd: sunxi-nand: add dma support for allwinner h3 -
 review changes
Message-ID: <20201007150258.00baf8c7@collabora.com>
In-Reply-To: <1690133500.668948.1602004808077.JavaMail.zimbra@robart.cc>
References: <1203329103.515411.1601900419875.JavaMail.zimbra@robart.cc>
 <20201005150912.65619ca2@collabora.com>
 <1690133500.668948.1602004808077.JavaMail.zimbra@robart.cc>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_090304_231911_D626FBBA 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>, bbrezillon@kernel.org,
 linux-mtd@lists.infradead.org, maxime@cerno.tech, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 6 Oct 2020 19:20:08 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> hi Boris,
> 
> thanks for the fast review,
> applied the suggested changes and answered your question,
> please take a look if its okay

Please submit a new patch with a proper commit message instead of
replying to the existing thread and pasting the new version at the end.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
