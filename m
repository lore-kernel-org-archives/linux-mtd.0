Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C32C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 13:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7/J5ybRziBisCJ+K2FMAgh6pIJDQM/SRLuJ9doESLE=; b=akUr/Oz4VF1mb/POlnXml5ynv3
	YFqEulRf6majr/Vcjr6VQT87qMRu6OiOelvWHvK8+AfkExMGySOKH9P18+aMTjPAI307E+FeMdoBi
	gSL/E3tFkcfKHL+jL3X4NWaksO/PbtlyrLA1+LfCcOHCz39JxaACS97NqXO44eyxNS7wHTlSLY1fm
	679jZGX56WJTCB4MyKlOX4Z621dV/vaDwMxzjdG8yoVjGVDe0pooI+yVKrYu3DqvUclmYpjkEhAKP
	pUKihGD8n0E52xhTaPmrYaO5NyPr3QATxpx8zx2AIfOHZypODBMWSSR0seqG04OL6sy5tLsEWViUd
	/1wqeXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLk0N-00GwEc-0y;
	Fri, 05 Jan 2024 13:12:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLk0L-00GwDL-06
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 13:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A0CA61A95;
	Fri,  5 Jan 2024 13:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ECDC433C7;
	Fri,  5 Jan 2024 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704460372;
	bh=EXiJloFVHaP55qrbQKP9mDMBhZJxMoX3gZIqq6pJrUQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aNmD/xBme0YN6ouqlb8aXu9kPkpQLWs26ZSzwAjwNIjnhwlBlJQWYhlLuM3DvhD3G
	 nJVivNcyzFBltA3/8dx/eO3YguoF0Q1tUDMjazBqWx+1PL7rUtLgh3ueZyp03DgmM3
	 2g+y5o+u7nJ5asuMajPnOF1QpWCQvFIW1oGu8zEYw6F4wbwWf0un2cWcr6VFM73UPE
	 xwFTJzUnKHOF9XRnhh8kNaAAKmpDBOTtwc+x3EJJZm/FU4gCxk3BvMBRzQ8GpMLQMJ
	 seqRAjD7HPdMIqzUIMf2J27nZKQmPXz79V65H3kzN7TY6jS9HlnTpxoS6YEwdGWn/L
	 Vc+ySjQ+TBRHg==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 14:12:48 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: add Octal DTR support for Macronix
 flash
In-Reply-To: <20231221090702.103027-2-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-2-jaimeliao.tw@gmail.com>
Message-ID: <51be5ac83c8cba2218536fe25325b8cf@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_051253_109973_46E4210C 
X-CRM114-Status: UNSURE (   7.86  )
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

> Create Macronix specify method for enable Octal DTR mode and
> set 20 dummy cycles to allow running at the maximum supported
> frequency for Macronix Octal flash.
> 
> Use number of dummy cycles which is parse by SFDP then convert
> it to bit pattern and set in CR2 register.
> Set CR2 register for enable octal DTR mode.
> 
> Use Read ID to confirm that enabling/diabling octal DTR mode
> was successful.
> 
> Macronix ID format is A-A-B-B-C-C in octal DTR mode.
> To ensure the successful enablement of octal DTR mode, confirm
> that the 6-byte data is entirely correct.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Acked-by: Michael Walle <mwalle@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
