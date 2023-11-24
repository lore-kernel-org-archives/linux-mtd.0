Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE92C61DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3nNAlnauDgM0mXEcpYHqDlBOLK9D2QcW5sz+lb674c=; b=LtUsXbDnnM1VZR
	OuvzLpdNOf3PuMqG54oaO+om5XMhy2I4GpTluuVpFCrIQAZ7daT3/ykcV+J7yrE7eZOmai4p9azw3
	RHGPt6+LWBfR8Jvfprm7QUu5AnLcBQ/M8Hppi4cuYL39dE+lpM+3Vl9EA9iJusIG5wuoNDceEAe6R
	A+qYxpQEwm6MPipS6rrr+So8mKmQfjEdMFxGqxnkAWL6XqWHL2w3fsRA9JHGtV/cdzP/Ze3VUIeo8
	2XCLQU38SKHbR/bqAK0tRxSamQ2hRU3bbRMpH7hAm+LJoir/YU+cTUELhsd+zkoPclIVg+FQv3gsF
	w7fH6bou22XsfNfVa3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XSs-007SD8-10;
	Fri, 24 Nov 2023 14:47:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XSp-007SCW-0l
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 14:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBB3C622B4;
	Fri, 24 Nov 2023 14:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1462CC433CB;
	Fri, 24 Nov 2023 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700837245;
	bh=q8CschYes9Wu/H5uo0LqNzGtNJB/0uksw1+KLg0LLqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ojqk9VYsNdC87X39AK42OGMtvuoARxFlfed8TdkUjrvdGYUQSqGaHS4hvFWqjKeGU
	 ZXrGaapQXMrsEIJsI4k528eoHd7ZRK38JlAOCaWZ3bT2jT2G9pvXDHm5A6LeXrS93B
	 6FD9zRtFmceTjsSDAZ/YJkhxXKWgHlVT6j/RdfIfEerjOUy4QEei6EzOfob4354von
	 /BYMas4NssvxM4eQsJyf8J1sK/lYEzG6SLdfbHga2wNWXAzGolxle5XVtGwjxbfWqF
	 9sj8SxBdjgBUxBxhLAHtuKzBdtStHx+dAcOTfTSX9FPoIvNYTwKlnuAs8aGhUbm3Oc
	 nUWIB6MC8xJ7g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Srikanth Boyapally <srikanth.boyapally@amd.com>
Cc: <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <michael@walle.cc>,
  <miquel.raynal@bootlin.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <git@amd.com>
Subject: Re: [PATCH] mtd: spi-nor: issi: Add support for is25lp02g
In-Reply-To: <20231123054713.361101-1-srikanth.boyapally@amd.com> (Srikanth
	Boyapally's message of "Thu, 23 Nov 2023 11:17:13 +0530")
References: <20231123054713.361101-1-srikanth.boyapally@amd.com>
Date: Fri, 24 Nov 2023 15:47:22 +0100
Message-ID: <mafs0jzq7dx8l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_064727_320121_D8C5C205 
X-CRM114-Status: UNSURE (   7.51  )
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


Hi,

On Thu, Nov 23 2023, Srikanth Boyapally wrote:

> Add support for issi is25lp02g.
>
> Verified on AMD-Xilinx versal platform and executed
> mtd_debug read/write test.
>
> Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>

Based on a datasheet [0] I found online, this flash seems to have SFDP.
And since you do not add any flash specific fixups, it likely does not
need an entry and would work fine with the generic flash driver. Did you
try using that? See [1] for more info on contribution guidelines.

[0] https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
[1] https://lore.kernel.org/linux-mtd/20231123160721.64561-2-tudor.ambarus@linaro.org/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
