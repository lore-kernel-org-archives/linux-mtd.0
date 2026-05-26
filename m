Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0058CCD5BD0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q66xqDHPKC611qETGifV/3euq8KZgh7Z9xsGvpqegOA=; b=g1qYy2Ptervm6B
	Q/oolvjlNYEMmOr1pHuf0ur+KHxTVnr/TbpAJgVmja8/MUU0wWhJrMLnFtEvEZvkQuZ0UCmDJzjhz
	X3oW6xvqZMTKFfd5a4nK1bKZJH3O6Ofmmc0fg8N5FPns//YLzkZ8LtJUtwpJ2cgETicTJBKjnaego
	AdoBBPWwMhFT+hGRlMWyS2bNVKhB3Kesw27zz8IYzGLiDNhJl0gxqUM6w0XR0Gk4II8XC7BFL4sqK
	3U8Ztw4WKg4ODh5X2vAdb707242yhr4XOw09lwZWsHL87xHfpIUZSco6PmzKTvGS3Jpp/lV2Z2Tsv
	a+3rxmcg9tvNJAFY6nZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpBq-00000001fem-3Kqe;
	Tue, 26 May 2026 10:39:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpBp-00000001feS-20ml
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 10:39:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C45BD6008A;
	Tue, 26 May 2026 10:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61761F000E9;
	Tue, 26 May 2026 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791952;
	bh=azs2doTn6WRcYeDt2Z4GFWdIIH9QPs8kBk3Pel10+sg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FESVv6KmUcG9mG5Val3ZWzwaoCbxIW1TDDMFUzHpao8wF25ZG7ukaHj6TbohtehGB
	 ep0rgCAzaaV5mOlavkP1E5/bas4By3CpxMdnlLvcaR28FE4Vz9sTq0oZHUGbyGTMn6
	 ypXswy17YuWTuva6bSVoj3pU0XRitbc90haYGUFbf+D1MM5Z10e+D9wTkqyiAwDYHt
	 SVjAm5aGSnI9e7JToacTBktRYu2p46jVjkF31GNbTCDHstcQGdZFbzrVLgLxYuGF3s
	 Q6UjQ90f/v5RZa4WQFq+PmNBsS+2RHnqqYDTl3l/J0yIZKNTMRH1/2+gCQ/2C1+Wwm
	 Eunr4anIacNvg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <87o6i7o0tj.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 22
	May 2026 18:39:52 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com>
Date: Tue, 26 May 2026 12:39:08 +0200
Message-ID: <2vxz8q965ub7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Fri, May 22 2026, Miquel Raynal wrote:

>>> Technically speaking all four first patches are fixes, except I don't
>>> ask the first one to be backported. The reason why we ask fixes to be
>>> first in the series is because we want them to be as independent as
>>> possible from previous cleanups/changes. Here each four first patch are
>>> targeting completely different places and should not interact with each
>>> other. Anyway, I will re-shuffle the patches.
>>
>> you don't need to resend just for that I think. Pratyush or Michael can
>> re-shuffle when applying.
>
> It's a bit painful to do while applying, I will send a v6.

I didn't get what we want to shuffle. Do you want to have this patch as
03/28 and "mtd: spi-nor: Make sure the QE bit is kept enabled if useful"
as 04/28? If only that, I can do this myself when applying.

And here's what I am thinking: the first 9 patches are reviewed and good
to go. I want to land them in this merge window so we cut down your
patchset and land stuff sooner.

Unfortunately I just can't seem to find time to review this series so I
hope this helps some at least.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
