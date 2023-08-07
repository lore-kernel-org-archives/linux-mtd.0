Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D48EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSgaDoUe2ZcdEnf9W4dBmJj07eTHWLkrI8qe6WqX6h4=; b=ksAUvPc74ZpWx65wAZVNxjaBKg
	bgbJRLOyOffUyYoQGXN7FQwKkM2ODaF6g4I2CwJSIMpRusbinMerrtRTTqIad9nJqJyuOMaB/HthT
	pAA4V87/P/vLp7k5HxIbkSTABVq0cA6ysORtYJ0PFgrA0E5Gw01AwoEeW8CmKGy9uCyXh62vZ2ov1
	7wOKCcHZl9OCxjtIMT/O/SWCxeSNlLpGQrXAe7sLO/P1buQBo/9/wH1P4JV3VKCgrG1VJWrGSYnQf
	iKnaSv50wqsGaH+BdRoHm2hVRHOD0ZyhgfgCxcqXJZ/ceQLsPVaRV9T/b/d8Ct7C8X2fSAowq2GLZ
	rzPW/OAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStxL-00GHsZ-0m;
	Mon, 07 Aug 2023 06:43:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStxI-00GHs4-1V
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 06:43:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB2636155E;
	Mon,  7 Aug 2023 06:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16CFC433C8;
	Mon,  7 Aug 2023 06:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691390583;
	bh=JjnVQH7JKtORspz+K5Ssi9zBCwJVdQN3/eIUU3zRQDg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uAn4e4JQ7DECe3/R71NDi7YrHx80lbb3otkW2zbnSwoxa2aH0H1lPz/ybDF2kSmTA
	 i8d59vJSuSsKUxKIEn2LjB5B+E/cQVByCC3EoG/UBJ8Oa9MiD5SXZL4bePRPUkNq9V
	 UUOYCd9SMzXJib8AAh6L20meMzj3xS8W0R+coFIvAss982GSM0WgcfKf+sEVse2lu8
	 3pmAcdlSRkfYajrNECm+d7dos7tXgAd0g97S4AfjGmZWa2uRchhUOBs2KHyTI4htL7
	 LC+b61cTuDaDyfX61XHiH26Y2BhhYivqXBj+EElAMtBKfhThAhG9rAfyYmyRGx4XyV
	 VZB4NZujfCqAA==
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 08:42:59 +0200
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 0/5] Add octal DTR support for Macronix flash
In-Reply-To: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
Message-ID: <5308b19bed5eb7d3dc2d87611489119d@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_234304_549546_10682E0E 
X-CRM114-Status: UNSURE (   7.68  )
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

Hi,

>   Add patches for specifying the byte order in DTR mode by merging
>   Tudor's patch.

I'm not sure what this has to do with this patchset. It doesn't get
used at all, nor has this something to do with the flash responding
as STR for the read_id op.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
