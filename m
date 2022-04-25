Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4F2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxi0o/ZnYcxEYoNsRgrEzkRI2ydHJGTtxELHQuQjQ4c=; b=H7lvMg2lPGnEby
	WuWWBq8wgHu9DjIgLWw7yzMmQvVM/3vPza0HcodllyVe1CPhMMb1WMpl5p6VrkKgbHv6speF+pzkk
	RO/4Q7xhnG4hvrxlxJluCE0Dz0MvLWl8LMlY2utsYma/wM81aHN0Pfvfw+3U/+7JvU6xizocpG1Y2
	JfkGPflPZrlOodov4Wn8QUHFiTqg6ANuofHuXjMKUjaXwKAkhYucviQ4ZYCW0l1lx57bqyD878AYA
	e40pGCQVrIoQGnVDZVCTOj4MYxotesbhWEZrc5k6V94vdwlLVkcEmGGCh3SG7fA81aZaF4zcjfgho
	TQn4+tOEHrV01pKJGEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niuIK-008mhl-Cn; Mon, 25 Apr 2022 08:42:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niuIH-008mfd-A0
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 08:42:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63031C000D;
 Mon, 25 Apr 2022 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650876122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deyfR/jFFfSBZAa0aePAr9OXuLMhTGf/khYat66l9nE=;
 b=B1oL6rmENQ72/SO9FbFEtrSqvb0mn0UOX1/nlYSe+iAiItjxoRxrTLNwejSIBrY8ThjN6b
 2wF9/5bhzFLCdlT3vp0GyhUrZlUp24Dusz4zHo3F3tCqFWfy4vnWI9fsZt5ArERQm1otKf
 DbVpDwimXO45kxpzB2/FEqH7GBQL7Gy/PiiYGKU9hogp5iy1bqkdmJvWYeHARX7QrKplHI
 9bqP/GRx0c+7a1SSfKcf1hfLgFDjktn/I4fpB4VupT1DEay2KDy2eONAA+i9omibGWB0Ou
 wd9QLAf7P2BJGGyq33+EKNyehQ/vY7iWeLj1IXXNzI60fpiCFIY3wBJIfAKSVw==
Date: Mon, 25 Apr 2022 10:42:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: mtdoops: Add timestamp to the dumped oops
 header.
Message-ID: <20220425104201.173e65fa@xps13>
In-Reply-To: <20220421234244.2172003-1-jmeurin@google.com>
References: <20220415001321.252848-1-jmeurin@google.com>
 <20220421234244.2172003-1-jmeurin@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_014205_548182_A0D672BC 
X-CRM114-Status: GOOD (  12.92  )
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

Hi Jean-Marc,

jmeurin@google.com wrote on Thu, 21 Apr 2022 16:42:41 -0700:

> The current header consists of 2 32-bit values which makes it difficult
> and error prone to expand. This creates a structure for the header.
> 
> Some oops only have time relative to boot, this adds an absolute timestamp.
> 
> Changelog since v3:
>   Fix the printk format for sizeof to %zu.
> 
> Changelog since v2:
> - Add a timestamp to the header.
> 
> Changelog since v1:
> - Create a header structure to simplify code.
> - Patches in series.
> - Patch prefix.
> 
> Jean-Marc Eurin (3):
>   mtd: mtdoops: Fix the size of the header read buffer.
>   mtd: mtdoops: Create a header structure for the saved mtdoops.
>   mtd: mtdoops: Add a timestamp to the mtdoops header.

Looks like the last patch was not sent to the list?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
