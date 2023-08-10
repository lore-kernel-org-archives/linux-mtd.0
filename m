Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BD9C04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1udfCboq5cCtJe1+b6YVEUFggslmr0WZsTJcwJBexFk=; b=WUqHvsNnok3gY7
	4l8IlPIyJXdUzJ84zGm1VXdMUOyJEjGvcSzE3mC1kyKFDGtR2OrcZFbtj9O3ZbSxeFA9gXQL7PH42
	Ce3ckxQAMk3xdWwlK9BqRFw/+yUsY9qG2sAwyNTRjn4TzIlZV0LbnIq0zGe20Rl6smQn876OC2Hn4
	WbuXfsoLXn0+BpO9H7DRAul+jP0SMoMj/jlzhtRlOPCod5ZpDnVRDsCq5Lc/A5S2Reh/bHxMS9pRF
	YpB9jOqYIH6jcFobxrECkZQqqKldmHWuw7l0JMQIT4iBiRVulZmjpsOAuacRlwv4cK5J5fCtbhndC
	OLDGSQNhSyezWL3D4NLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8Ay-0088ed-23;
	Thu, 10 Aug 2023 16:06:16 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8As-0088cE-0p;
	Thu, 10 Aug 2023 16:06:10 +0000
Date: Thu, 10 Aug 2023 09:06:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
	Stephan Wurm <stephan.wurm@a-eberle.de>, stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Oliver Neukum <oliver@neukum.org>, Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/7] ubi: block: Refactor sg list processing for highmem
Message-ID: <ZNUK8nWnUYB6B4Kg@infradead.org>
References: <20230810160019.16977-1-richard@nod.at>
 <20230810160019.16977-2-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810160019.16977-2-richard@nod.at>
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

On Thu, Aug 10, 2023 at 06:00:12PM +0200, Richard Weinberger wrote:
> Currently sg_virt() is used while filling the sg list from LEB data.
> This approach cannot work with highmem.
> 
> Refactor ubi_eba_read_leb_sg() to use kmap_atomic() for sg list
> access.
> Since kmap_atomic() disables preempt a bounce buffer is needed.
> kmap_local_page() is not used to allow easy backporting of this patch
> to older kernels.
> 
> The followup patches in this series will switch to kmap_sg()
> and we can remove our own helper and the bounce buffer.

Please just use kmap_local and avoid the bounce buffering.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
