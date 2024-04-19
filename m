Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C085C04FF6
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7BAubyCTPZwPcABZcloLp5n4yvIFJhbC2l++pdTrcc=; b=4CSTsvFjqLRlrc
	FTViSINFsHU8OXp8ImlwnCQtymWuOAiyldwaCx15a/CeAHsEbEIjB5vP9Gx4W2mW1l6nBYIRkP7kh
	rXAZk/9A05DGYbjFL6pnHHVywoiofQJxS+b3jf6S1JXy4NI8P8LCiLP6CZCkJVbVi6DP8meNVZsN2
	kKRMuW3WRxOzMnf/Z8HuRQw8EWZO37Bif1A1fff6v86vKBg92ct6thnKuAQN/jOEOTW8P4jWAsFp0
	MCGMyN/z8UHF+tJyoMCjIsN3yROZhwxnrb92hM87lW8cBuSibKWsu+Qkq679/X7g1e50HgyApFR3W
	jqwOB5LGxxCjo3T2UxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxsls-00000006dZj-1WEr;
	Fri, 19 Apr 2024 18:15:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxsln-00000006dWp-39fH
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 18:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA6DACE1B6D;
	Fri, 19 Apr 2024 18:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81697C072AA;
	Fri, 19 Apr 2024 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713550529;
	bh=l+4xcakx3AeagHaYK7SO0dZjcjwn/mRxbV7FhZhIm/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E51hjAZFVPfEks3QjAW42TSzAgiART9PGozK96xEylO7jcAo/iAsTPq0pmMg5kLLX
	 eYJi4+XTm3OitMbChJ8chFz9V0lP0pgV8zyGvfQSXaggPxcQcA5ktseHWRiPR/r6wV
	 EH340fIPVm5Ykhnh+vebnkD/v/L6XF8HdJrs5XEfTkWvnAyvtHYr9mrRkhba7Nv/Qv
	 cpnucZT4fZAlNAZ9oOhVcUOmq2/zrlT8XFhHph7Ft9akMsqq7Lp4dqbZSiyWRzBJi0
	 3WQgzX38GVEIT/DKUAUtyjkodpHc/R4p6+v2G4DErukXfEwstuHJVkoTVM3xAIFj+v
	 qWp3bGfGh25nA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ricardo Ribalda <ribalda@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: get rid of non-power-of-2 page
 size handling
In-Reply-To: <20240419141249.609534-3-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 19 Apr 2024 16:12:45 +0200")
References: <20240419141249.609534-1-mwalle@kernel.org>
	<20240419141249.609534-3-mwalle@kernel.org>
Date: Fri, 19 Apr 2024 20:15:26 +0200
Message-ID: <mafs0ttjx5idd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_111532_038861_00758189 
X-CRM114-Status: UNSURE (   8.32  )
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

On Fri, Apr 19 2024, Michael Walle wrote:

> The Xilinx flashes were the only user of the page sized that were no
> power of 2. Support for them were dropped, thus we can also get rid of
> the special page size handling for it.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
