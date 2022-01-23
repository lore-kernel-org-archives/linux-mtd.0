Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD0CC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iN/2w0LqWe4UClhKoatC4jXsGPfhnwHmlePa5bPoQpA=; b=B6QHAdHsD21KE2
	1Lbo7O/B8avXAnMDa9v+GN+/SGd12wy1+yaKq9yJsY/FTndZsSrmPYPT2xhEv+H+1TUojt4lNs3sK
	8giL07lbFYn/5sE5xj3aA7HG24S9LvkC3md/TJfxhSqzqX0hf0F8tGVfUb0PoPalm7T51xOnS7ryD
	x6JpU25thVEEqYYPTjdfJ9NMYUYR/fhWeVfx0noNVjthNeZYzzYqP5t78FnyyKiosZpjBA6DLqEQ4
	K63ZJy+dyns9xRKJ337rNClfmkWPZlmvHmaCfNCoGqif4kpKHuiX6O476oS97KPZ9t4W+FUe1iDnl
	rTJgo+GrOHz8qWnGjInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeu8-0017MJ-Vg; Sun, 23 Jan 2022 15:35:45 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBerC-0016Ot-6N
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:32:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 526A7FF802;
 Sun, 23 Jan 2022 15:32:39 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:32:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ansuel Smith <ansuelsmth@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: parsers: qcom: Fix kernel panic on skipped
 partition
Message-ID: <20220123163238.12eb2616@xps13>
In-Reply-To: <20220123152316.529559-1-miquel.raynal@bootlin.com>
References: <20220116032211.9728-1-ansuelsmth@gmail.com>
 <20220123152316.529559-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073242_450113_4CE2140A 
X-CRM114-Status: GOOD (  12.14  )
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


miquel.raynal@bootlin.com wrote on Sun, 23 Jan 2022 16:23:16 +0100:

> On Sun, 2022-01-16 at 03:22:10 UTC, Ansuel Smith wrote:
> > In the event of a skipped partition (case when the entry name is empty)
> > the kernel panics in the cleanup function as the name entry is NULL.
> > Rework the parser logic by first checking the real partition number and
> > then allocate the space and set the data for the valid partitions.
> > 
> > The logic was also fundamentally wrong as with a skipped partition, the
> > parts number returned was incorrect by not decreasing it for the skipped
> > partitions.
> > 
> > Fixes: 803eb12 ("mtd: parsers: Add Qcom SMEM parser")
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Both patches applied on mtd/fixes, actually.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
