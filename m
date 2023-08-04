Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0387C001DF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9760+2/tHN9IfVAzXtiGV/TEw06f5WOi7rjFz24arM=; b=jsoBmlBGl1Jjyb
	IGWeEDMU29G9g/wehSpZabXYjVKvU7xN5JpyQ0xsLH5zpTFqdpD+1k5iNJd5fDH/XmfvbYdOPDUOy
	12mPu79ptXi7raSxsPlvARNNZRNcRRwxT1G3qYyH/AMCwaBZ3oMs8v7k6dKAl1X7BiVjM1sOQ6xFI
	VzR3HxmnzpGyLfqgVPdNR13J1eP2ru4/WJxAssZGcwsqwJHAslIyr4b/NcIzr6ZEbAqoY1mlg6H35
	YgyEKuOijINyBRbRLgOm7gzzhhaZnylpDy/mbBOtNvH8nb4XCukfXScxuid1bwWL8lo3H4bo+jB/f
	fFCbEEzruSMUto4B5w3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRs5N-00C8EH-34;
	Fri, 04 Aug 2023 10:31:09 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRs5L-00C8Db-1q
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 10:31:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0DFDF68AA6; Fri,  4 Aug 2023 12:31:02 +0200 (CEST)
Date: Fri, 4 Aug 2023 12:31:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH 04/24] PM: hibernate: move finding the resume device
 out of software_resume
Message-ID: <20230804103101.GA23613@lst.de>
References: <20230531125535.676098-1-hch@lst.de> <20230531125535.676098-5-hch@lst.de> <2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_033107_751168_1BE40E2E 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good, thanks!

Reviewed-by: Christoph Hellwig <hch@lst.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
