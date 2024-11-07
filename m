Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE95BD5D674
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdRNlmjxf2nu+jcomT6OCNFLCh9k5W3jGnlD337ccRI=; b=klOLaYrmwImXAf
	bA99BvN5kz/twQzGFmxiY+uMtNsZXMXdhACj7t1odyS+Gu5SkOXxKzOZhoAb01DQsp02FupeCHszL
	VlY2s/RNb/ine0kTPZ/J3MaAPJmLVaHqSpnjcncYaslkrPneDF3wV7gsi4v1pZw1kLdjRR6lzxBuN
	T6atCJJDA4WbUA99eBMgZh68SFVU290uQt/CJFKYMdq9zLwYC3iXlaebEjQjIDHGinBQAk38ORQym
	qKa4EIOc2trtuyuakv/Tl/JhyY4n827QzcKHgDa+uQRbo1ybxcXUhOkbxngocCjrHs8yXjEe7rarD
	DB6HYDK3VU5XNxZfTx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96qf-00000007tLY-3utM;
	Thu, 07 Nov 2024 18:03:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96oI-00000007sqN-1jZY
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 18:00:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A14E5C48C0;
	Thu,  7 Nov 2024 18:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D47FC4CECC;
	Thu,  7 Nov 2024 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731002445;
	bh=/DC9HL02bjlwGh6SD2ghissMjoxebsvomr6ylS/2bx8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f+9MZL1aAbhC4pbKK2/eRBGcFLno8p6YLBrcPxk1eg7otXkR/xE+vGjlQbDnhynyx
	 7KEwKVu6aY+7gOJgzD/rmcPa/t2nJo9AoMWubzR1JE24zzxoHrtsXOG4ze216ZleQ/
	 9nmhJKC6h/Ugw9N/rxMhMW4Rvrz9tE1UnU8YYxVDGLhGfb2K1S3LMgekfA3x3N83w6
	 /5csqzcnmHuy0tQUOXZUq036+6QNdXy0zGI2MWEXMbBH1SJgUmx3lO3wa9f7cORr78
	 wXhaP8W9qlTB5ZwtBMjlwGvM81aYooLy977j4RAXJMq1bl130GihjylEK5KtcvYB72
	 XJz4ImfCYueow==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  mwalle@kernel.org,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: winbond: add "w/ and w/o SFDP" comment
In-Reply-To: <20241029080049.96679-1-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Tue, 29 Oct 2024 08:00:49 +0000")
References: <20241029080049.96679-1-tudor.ambarus@linaro.org>
Date: Thu, 07 Nov 2024 18:00:43 +0000
Message-ID: <mafs04j4i9b5g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_100046_511835_FDA03FF6 
X-CRM114-Status: UNSURE (   8.03  )
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

On Tue, Oct 29 2024, Tudor Ambarus wrote:

> Commit d35df77707bf ("mtd: spi-nor: winbond: fix w25q128 regression")
> upstream fixed a regression for flavors of 0xef4018 flash that don't
> define SFDP tables. Add a comment on the flash definition highlighting
> that there are flavors of flashes with and without SFDP support.
> It spares developers searching the entire git log for when we'll better
> handle these cases.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
