Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C33ECE57E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtKhKkpr9SkkPhz6CHQanSjKhFVNsk29QpHezEGF4+8=; b=k3cAOXQY74n7ZE
	qmMSJuaOr+0oGnXBFsM11nf7P6J0On5c+jyutdvf1dzeaBJS21YfmB+uI5LSIJwF/7q3DW9gB2zXM
	sGv6qfgYecG+rwmAGhSuSzLo7eVvWRF20h+6IANgglhgHTgdz/rAOTq5KqSLz03I5paqyCQs76mBK
	Nr0Y/eJLplxmbsZ0AU/48Y4jqnxQyftEjW+/BA0zR6TqjwTdTYBlJxDcEz4BRcvXHeGAmpDzQNP19
	XgywLh/ru8gkcmPLHdST5OYLP9HntGFwe1WnaFmjwZw3N9k5mGGNbeX35cBDqlxEHpaySNzKRXiqq
	Iqey85OmtlGkOB7Jy6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snf6R-00000002DWX-2O52;
	Mon, 09 Sep 2024 14:10:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneoT-000000028s8-2iMH
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 13:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 488DBA4320D;
	Mon,  9 Sep 2024 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06675C4CEC5;
	Mon,  9 Sep 2024 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725889936;
	bh=6I0KDNkGMAXRNHGe9spyVHeJ5YDo7zX/iCZiLN03fbI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AVDzIztp30tX+CaV0suKoMd8+sXQnTK94H3BXn+ALOKyWs8nsVxyv5XbjjxUpUZH4
	 yh8VaF9qqeK6lP3BG1SfHZpirlzbh+Kx34ESq6heOBoKE3EnJWeJ/Ya6Wj+nonpx/a
	 uqPF+GOQ1CN98/kQp00XDRNvG7d1IceJyuC9594sb5JnR80WQQvXXvUBcakj2BfPw/
	 CJrGSCIg7Fn+qNZ21+cZbjFuA+poEQw9GUI108tKrmyWQa3wRqVdSdRWEzBZmrqkoB
	 A+Qc3ZVcXdDaThNsaISGrmzoWR/2a/2/SZLKDi6T7s/5jwNZRvff2QixUYKDFC7wGi
	 2APfD1WLFcrbQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Jon Hunter
 <jonathanh@nvidia.com>
Subject: Re: [PATCH] mtd: spi-nor: fix flash probing
In-Reply-To: <20240909104753.0ce41fb8@xps-13> (Miquel Raynal's message of
	"Mon, 9 Sep 2024 10:47:53 +0200")
References: <20240909072854.812206-1-mwalle@kernel.org>
	<ad9ee29c-b96a-4861-a7cd-b8649a3d1f3a@linaro.org>
	<20240909095247.48358afa@xps-13>
	<b2d0ce1d-fa46-43e9-bb29-c98d1161aae7@linaro.org>
	<20240909104753.0ce41fb8@xps-13>
Date: Mon, 09 Sep 2024 15:52:13 +0200
Message-ID: <mafs0y141exyq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065217_765701_8DB40789 
X-CRM114-Status: GOOD (  15.50  )
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

On Mon, Sep 09 2024, Miquel Raynal wrote:

> Hi Tudor,
>
>> >>> Fixes: 2095e7da8049 ("mtd: spi-nor: spansion: Add support for S28HS256T")
>> >>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> >>> Closes: https://lore.kernel.org/r/66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com/
>> >>> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>> >>> Signed-off-by: Michael Walle <mwalle@kernel.org>    
>> >>
>> >> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>  
>> > 
>> > This patch will only apply on top of spi-nor/next. It would spend more
>> > time in -next if one of you applied it to this branch before sending
>> > the MR?
>> >   
>> 
>> The patch is intended for spi-nor/next indeed, as the blamed commit was
>> just recently queued. No need to take it through mtd/fixes. Pratyush
>> will take it via spi-nor/next.

Right.

I have applied this to spi-nor/next. I plan to send the pull request by
Wednesday/Thursday so it should get at least a couple days of testing in
linux-next.

>
> Ok perfect, thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
