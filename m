Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45B6C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7HWpVjD3IG9t+uid7S/EOIP9dHMHs2zA3jWMqPcbAk=; b=blxuiLlkY5gl4s
	6IrSHl/WcMB0ZeOYPHGcP8kK/lOO0fY+RDHretu4ypjYicQQ2noY9cT6jTXEK4wcLHslwrZzyOBYG
	LLDDZDXoFDlfLWlEv2So3U229YJxheqMItDzJ0nBaPWir5yn0/yGkziZDkJbTGhGVzWrI2zWPqQBg
	NcpygSxJuskUhbHixDNaqExLSWhylTX5EcbJxfTI7NVUVw/LXc8KYrLP9q7aG491oZGSv2ViaydjL
	ohiW4JMrDXyUbTGq3yTBrNm7i0r7dMQy36ayTffcTMjoKnoN8+7MKHomIEi+bWoe1A8rm8kCu8x9O
	BUHMtEgOcwzVMzg9M6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBexd-0018GJ-WE; Sun, 23 Jan 2022 15:39:22 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBery-0016hM-VO
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:33:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8E515200005;
 Sun, 23 Jan 2022 15:33:27 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:33:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Joern Engel
 <joern@lazybastard.org>, yangerkun <yangerkun@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] mtd: phram: Prevent divide by zero bug in phram_setup()
Message-ID: <20220123163326.5ea97476@xps13>
In-Reply-To: <20220123152256.529296-1-miquel.raynal@bootlin.com>
References: <20220121115505.GI1978@kadam>
 <20220123152256.529296-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073331_210508_C2649616 
X-CRM114-Status: GOOD (  13.58  )
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


miquel.raynal@bootlin.com wrote on Sun, 23 Jan 2022 16:22:56 +0100:

> On Fri, 2022-01-21 at 11:55:05 UTC, Dan Carpenter wrote:
> > The problem is that "erasesize" is a uint64_t type so it might be
> > non-zero but the lower 32 bits are zero so when it's truncated,
> > "(uint32_t)erasesize", then that value is zero. This leads to a
> > divide by zero bug.
> > 
> > Avoid the bug by delaying the divide until after we have validated
> > that "erasesize" is non-zero and within the uint32_t range.
> > 
> > Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Pushed on mtd/fixes, actually.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
