Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79974C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 15:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE5461215
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 15:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BE5461215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6UDHv+CwIEBsyFSvva56AVIOKnBCs6qsdeQTtvuiEg=; b=OHVXhMwiOz9mUs
	gT9uuLq29+8M5uVP6xUyYMWGUitd+mX2HvNotBBTpaJeqwQDwH9UkJO0NKQZTyHhN7XMtoVmfp7Z6
	Wdfw1Dj4HiJhx9nggau5h0QLmMg4eTw1d3/j55ZenMCYA51wI1Sbr0Q+tn/AobKS6i/oBjfgPvpih
	rl11GpK8dbzcxNEgOS+yA2v5U8VwlCPNy6kt095Mpf3GM8isGRZuFrt5Y+MbHKH7MQJhuGCNZkp9B
	zaHAN7hEVVi/0UJEUkAP74hGUU7Ruurk90GlbcV7T0zTDZYNW3AI+iezH95NFEsZ4GC9a4ZYOygbS
	vlQbmB2wsNfX5ALpegQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVErb-007jhM-IM; Tue, 28 Sep 2021 15:17:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVErZ-007jgx-3s
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 15:17:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D4646120D;
 Tue, 28 Sep 2021 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632842264;
 bh=JTwi0y+kGzO/CZQFpN6CoyMNwE8s4U+X9YE370SODyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nuGDTiTGeigNdFo4qIzHOcMMdtR32KzzLA4ngFhnH/jG5w38pw7dekM2nzypjlqBX
 mNMBQ4WZSu9BhYo1IVK442cRZPJKzlWDmELjZGdZPWJlkLS0g7r//iKfw7KgAdAaMu
 6oDhIhYSvQ/nxd/WswXpyJNDfr+Y7FAIiYQzbbmzh1JYw25kbMQukxfgvh44BrD8Di
 m+RCXOke6e6N1gElMPUy0YCYfaUXnTIiB3/uIHLPmCARWg0OhtbMY5rPcpBGw3jhnj
 lHZSk7sRRV+HOntWX/cuD1ZccdGn2/B+Iv/2tD9fVET9F9icIIND/+/YT8u6M7ScM/
 Ufv+7FmNFXo2w==
Date: Tue, 28 Sep 2021 20:47:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 0/3] Add support for page scope read
Message-ID: <20210928151737.GA12183@thinkpad>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_081745_199950_31308ADF 
X-CRM114-Status: GOOD (  14.49  )
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

Hi,

On Wed, Sep 15, 2021 at 03:27:28PM +0530, Md Sadre Alam wrote:
> These series of patches to support page scope read.
> 
> In QPIC v1, SW is needed to write EXEC_CMD register
> for each Code word and collect any Status related to
> that CW before issueing EXEC_CMD for next CW.
> 
> Page scope command, currently supported only for read
> commands in bam mode, is truly a page mode command where
> SW is required to issue EXEC_CMD only once for a page.
> Controller HW takes care of Codeword specific details
> and automatically returns status associated with each
> CW to BAM pipe, dedicated for status deposition.
> 

This description doesn't clearly convey the intention of the patches. Please
take time to write the cover letter describing what the patches do and how
they solve a problem.

If possible, do mention the platform on which the patches were tested.

And please avoid using Qualcomm specific acronymns such as CW as it only makes
sense to limited amount of people who has access to technical documents.

Thanks,
Mani

> Md Sadre Alam (3):
>   mtd: rawnand: qcom: Add support for status pipe
>   mtd: rawnand: qcom: Add sg list to handle status pipe request
>   mtd: rawnand: qcom: Add support for page scope read
> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 125 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 119 insertions(+), 6 deletions(-)
> 
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
