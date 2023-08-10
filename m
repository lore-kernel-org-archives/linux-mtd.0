Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE382C04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDIOPFnfGqHuDapw/dGpWELRZhDFjGmPA+ldfZIU0VU=; b=E6w4XPM/SZLiUp
	O6qaVPeHRK7Nvqjq36bVGfvsJ5CyciImwzY1a9wEVoLGXgCuKO4+uBSTokIkEsOrax8pOb8KBv2vh
	K+eIGZ/7L4HFkvp9oqG6wFTMiI4zYErYpBjlvmTYwK66+0Zk7D8t7lE7KZsmVugsu+RcFB/wVKC/t
	tbdQZMsuP7xC9aZ1OrKNJndtbPEXwE1k4nduzmI0rU2J90MwuaR2JntQ8hqybk4t1ZQ/7DkGLwHkF
	NH97jU7nmPKPjjrNLXvCNI3j2/woWg99ysy07MZlYFtHWLf6pcLjE3HG9CyO2eH4sLaZ/NB+KKFvF
	cdBbigwX6f1QD9Pu7YxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8Po-008AvZ-0q;
	Thu, 10 Aug 2023 16:21:36 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8Pl-008AuS-1j;
	Thu, 10 Aug 2023 16:21:33 +0000
Date: Thu, 10 Aug 2023 09:21:33 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Stephan Wurm <stephan.wurm@a-eberle.de>,
	stable <stable@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Oliver Neukum <oliver@neukum.org>, Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	James Bottomley <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-scsi <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 1/7] ubi: block: Refactor sg list processing for highmem
Message-ID: <ZNUOjQVivR/5pFKE@infradead.org>
References: <20230810160019.16977-1-richard@nod.at>
 <20230810160019.16977-2-richard@nod.at>
 <ZNUK8nWnUYB6B4Kg@infradead.org>
 <298860961.5257332.1691684136772.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <298860961.5257332.1691684136772.JavaMail.zimbra@nod.at>
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

On Thu, Aug 10, 2023 at 06:15:36PM +0200, Richard Weinberger wrote:
> >> The followup patches in this series will switch to kmap_sg()
> >> and we can remove our own helper and the bounce buffer.
> > 
> > Please just use kmap_local and avoid the bounce buffering.
> 
> Patch 6 does this.

But why add the bounce buffering first if you can avoid it from the
very beginning by just using kmap_local instead of adding a new
caller for the deprecate kmap_atomic?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
