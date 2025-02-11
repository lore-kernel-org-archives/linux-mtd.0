Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E44C0219D
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlc27Z5eT9E/2RQ7+SaeBnr92AXK/FMXp4BzImpXVZw=; b=cvZC7kUL0cIwws
	8ekSaHvPUSlAphCUqVTVKkYADhZGeZSPNWlRKNmYkLhPRc0giE3FwdbAgfKDwkE6MtXGltUdxQBnV
	sB6zslLIfrZWqhtZym+ynGLIwZB3CZCxcP05upF9f2QWb6wL0+AD/1RXgSxG5yI22f+S9V7bv/Tj+
	CWIQFyjSNddPS8EKvVuwFjrrNSiI0DIW3wMkQZFFUaK8kpoUWwkuOdFAgxrqs9EuNw5lmj+flGjzg
	nA41SjHfEWvp5yLczGBdtl4pGoSeHCL2SR/Fo5L/+qaGzJXNBmqJPuGtn62/k1GX/mB2Er3jmxcNE
	n/i8gQBoyMralJy/3+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tho46-00000003T7E-26jS;
	Tue, 11 Feb 2025 11:04:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tho2n-00000003Sgv-0fzX
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 11:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B0845C10BB;
	Tue, 11 Feb 2025 11:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380F9C4CEDD;
	Tue, 11 Feb 2025 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739271788;
	bh=mm/P9dYMUsjdggE0Bz9a//PZdBSLXWdnB5J4maPmnT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n2XQPpVLM1Ade/kA0CapOTKcdl9LB4DQITywr+9RMYNLKFrmu8rJLelTnyV5T5tZz
	 ab5rEH6zEQ247ANfeaSwrAalLaHe+YUtNvqajVFPbNsAp229+1K9JViYlgpWoT8m4A
	 cmWjWUUY8OOgAVLXhgYFCaOnVSYNyRSXKRrnVw7fYoHdGQ7ZxvzaPX1bPYtmQqCUJc
	 lpiK31TGPJkJckzy6GlmhnUoNRaFea6lOAO7UqGt2CPRZEwA1sZaftb5DtwrZjJxR8
	 6oPcGU11q+McqiUDLD+38X+JnSzqBrIB8AU4ZuxFcPNi2Vp2qqFOkVS1svOC01grHL
	 HEqFXKQnaYzNA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: sort headers alphabetically
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
	(Tudor Ambarus's message of "Tue, 11 Feb 2025 09:30:53 +0000")
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
	<20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
Date: Tue, 11 Feb 2025 11:03:06 +0000
Message-ID: <mafs0seokyc9h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_030309_244535_4E0F61D5 
X-CRM114-Status: UNSURE (   6.30  )
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

On Tue, Feb 11 2025, Tudor Ambarus wrote:

> Sorting headers alphabetically helps locating duplicates,
> and makes it easier to figure out where to insert new headers.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
