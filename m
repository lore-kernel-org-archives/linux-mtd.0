Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE77FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 06:27:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2713360ED8
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 06:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2713360ED8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Cc:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqy924Ky0auqPKY1a9yPFf2uYeXbEFwx798UI/Sy4LY=; b=NFHNQyzOfpzf2Y
	hCpCY33DLN4gAaHL0UplMnV5h82Mr/n0QcUzcxPQxlgDsCDStpIPaBnzwS8aodj105hRWaEmoRt/y
	qTipmx1GLGh8xZHWQy0wCriZgNRMcGXSmUkUdsh0/jZsua3xDrAvL5sILgskOQPb2UlRboyge7sFq
	D+yamB9TLlSoOtUj6XEdVYlG+PYO5P2CWyfh3VcAWjGIY2svoqdB3y86X4B4L8Pk1TPGUWrOVjQFC
	ORcdt6VY9++sxPeCzDU4xvy8bxi3FYrMrfh6VrbWeKzMsqWvm8w5OS2EwKkcUIRQ1hezuYjIWN6NO
	IDqciO78dN+GVLmda/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN85i-00HQcK-Jn; Mon, 06 Sep 2021 06:26:50 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN85g-00HQah-2N
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 06:26:49 +0000
Date: Mon, 06 Sep 2021 06:26:39 +0000
Authentication-Results: mail-4316.protonmail.ch; dkim=none
To: Diego Ismirlian <dismirlian@gmail.com>, linux-mtd@lists.infradead.org
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH] Add ubiscan utility
Message-ID: <f0f90cb8-de9e-24e4-64ed-46f2f6ac732c@sigma-star.at>
In-Reply-To: <20210817003802.3076-1-dismirlian@gmail.com>
References: <20210817003802.3076-1-dismirlian@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_232648_365162_A85E8B44 
X-CRM114-Status: UNSURE (   2.66  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

this does sound like a useful utility to me. Sorry to leave you hanging there,
I was also hoping to maybe get some other feedback as well before applying it.

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
