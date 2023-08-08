Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13A8C001DF
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tempOtLZ7Po+8B7DBU1ZWIVMC3thnh3HKuQOHWgpTA=; b=BGpNBYFbCZNc9tkBfIlytA1NV0
	RDeX0znAt5PwBMk6iz1GxjKxx/wuXAfwGLn4C6iOvf8iMIRiycP+Wmw3NEWAejYYogIqwcMzqioUP
	yVZHoPT1jM5bi/OGZ7Fjxvwq6QxoIcffnpYyp4OJXccGQOBui7JgJsRJq7mVN4hGAKoDNhdBMGlF1
	9/jmQ/Tc0BlkQWRHc82xcFKNraDDhr0PcaN0zLk8kaD3KJc5nSB2pXhDzYhBW+geUNxIytWgCFRDx
	CvRJbCgTQPP/IFCzvtsUGhDAvco88ChPi6NV71wEuRJxVHUOS10lw3pG+qWC7G6f3wQ5YzJrT8pEi
	3Wrk7xqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIxs-0028EU-1u;
	Tue, 08 Aug 2023 09:25:20 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIxq-0028Cj-02
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 09:25:19 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9312B143;
	Tue,  8 Aug 2023 11:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691486713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnWaMg3pDXLcdgXWo2n1OSIIXOLVVnJHBw9DYZAQRK8=;
	b=MnY9VJuGz9KvfjWX5YQ/RtcCgRAL29rIouLpbf1EAhvtUwPg8l7woT1gozLX8/Uek3Aj25
	Fb67HVnLhN+ex6M+a4bBO/yCnW6my4fXhXm35oaxvvIA66u68VupqNJMAimwfv4CGC65Fj
	y1IE4fERwN7TqerqLThNewjWPHAVhhGD6dmzOjAAbUTNDmU2naImtO2y0+L87f35w1cDA0
	sLglxX1QVeaMwuJp070VJBNCPXZLnRuZTiwb7s8GwuQ6qkY47lhL/OfVM3OmK67VDERzgD
	H29uQMo8hXyKZ9ZRK6IMpkwxgFe6xt51wkAaZ8m8argYNxD9UBsCTizxb+iUaQ==
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 11:25:13 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 00/41] mtd: spi-nor: clean the flash_info database up
In-Reply-To: <2d86bba8-6cad-d67f-59bf-157e245edc97@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
 <2d86bba8-6cad-d67f-59bf-157e245edc97@linaro.org>
Message-ID: <ecd7b592e6aaa4ca7e98d231c74693ed@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_022518_199011_8AFC192F 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

Am 2023-08-08 11:21, schrieb Tudor Ambarus:
> I skimmed over the patches, the idea is good as I already said.
> When do you aim to have these integrated, now or after -rc1 is out?
> After -rc1 is more conservative, as if there are problems, we'll have
> more time to fix them. Either way is good for me as long as you're 
> around
> to fix possible problems, but I'd like some timeframe to know when to
> invest time in reviewing all. We're at -rc5.

After -rc1 is out is fine. I just need to track the flash_info additions
until then.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
