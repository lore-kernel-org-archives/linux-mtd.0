Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D031C46CD3
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TX4d42iQrSjWs6rV+2dxTO8Q/HxS73DgyCheHqPobNo=; b=z2uFSTOqFu2FniMdNT7MAliP4I
	kB/yFe9VBkOE7eV3WY+Fd1H7gUgBuj543i0o631y5uPYGCrgM+tNLI3LacJA453/LuHpaT6QtJp6F
	DEBb8qGcK+Aed1RywqpNnN7Z9xsA9IsXBJ9Md31x7ScjSC8nc+Q+BLJc7x0IikMQVnaypTeQX8Wxp
	zeqw36qzAzNeuHWNLD66H+cqc97kKQxe92HYtipSlea9av86wxGHNc92VrPaIPBIoTtOWcz4yBQio
	kgmg6R8zeqd7CShGTGdAht0Lp4o1Hy2JMugkZ6fXWQEGxWCIH4FlEbCyJg2tEUjcjftcqYTfEj6LL
	q5DNxYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZ0X-00Dz29-17;
	Tue, 19 Dec 2023 12:15:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZ0U-00Dz1T-1x
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 12:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11A236124D;
	Tue, 19 Dec 2023 12:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1745AC433C7;
	Tue, 19 Dec 2023 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702988129;
	bh=BXVVjm8qwq3bY1dOIZ6JRoDYBOibNz+PZryuWzsQUC0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qZVrmHVjBiD/2/V2DoOFt1x2BL7v6DCviNGWC6lgHVbitlbZFt9pSIATtVKmjiumH
	 3N6gkReMLZE6wN2Hsk+76gfyE7UZWDndsKd87UqyZg0RP1vhi5KMYHTK1pF/rzuQ0u
	 +RazAaiopSs2yUxIXACxf/j4Nm+1ovctRiy9Qoo5NQ6vjHTV0kyZuCCT3O37oDyiuT
	 Zj/uoaQb/JHd8sTUC9+xS24T+Hix/UNZdasZ5qFgcATAoL9r5cGD/QxfQfLJkQ15ug
	 9+uyYpj8P/9Pnf4uyN7zRXr5fQ4O9qqKvHyqjNbwBlB0io7XO+EHbpJKQkerwOqzbq
	 QUyJREBQaaZ0Q==
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 13:15:25 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v3] mtd: spi-nor: sfdp: Get the 1-1-8 and 1-8-8 protocol
 from SFDP
In-Reply-To: <20231219102103.92738-2-jaimeliao.tw@gmail.com>
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
 <20231219102103.92738-2-jaimeliao.tw@gmail.com>
Message-ID: <c822301eddb512abffede8768300de2d@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_041530_682625_A8A81CE5 
X-CRM114-Status: UNSURE (   8.78  )
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

For the future, please send separate patches as separate mails,
not in one thread. This will break b4 and probably patchwork.

> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> BFPT 17th DWORD contains the information about 1-1-8
> and 1-8-8, parse BFPT 17 DWORD instruction to determine
> whether flash support 1-1-8 and 1-8-8, and set its dummy
> cycles accordingly.
> 
> Protocols 1-1-8 and 1-8-8 support are not determined by a
> single bit, so that use 8 bits instruction to determine
> whether the protocol support or not.
> 
> Macronix spi-nor flash didn't support 1-8-8 read feature,
> this patch validated 1-1-8 feature only on Xilinx board
> zynq-picozed.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Also for the future, if you do significant changes or adding
further features, you should drop the Rb tag.

Anyway, this looks good, so my Rb tag is ok.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
