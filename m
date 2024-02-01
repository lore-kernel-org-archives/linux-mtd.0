Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8CFC4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ED4Dp8tBHcZO96UU7kv+jpSFcik7zgVMhDvIxBXtP6A=; b=qrtDye/7PLkyoA+wzx5yM08xID
	IwbvNh8ggoyI40EhYl3zft0WA8ZvIPmsCTWfUoSnw7rcx5hTzKxGnUifYfWCSgjpzrPnCC6jxGB9B
	m0LvRc51R+lKkFrNayjLfAy+hDsgpMS9xQX4vhvDbmYdPbrfzlc6/2RB/DLoPSkGvaTXqjh7uZfsh
	5IeHwhfE5dkr272EMSyAUdw4Ug9SPDREeYXrw0VRi4zcUaCDTE3oVaIju4QeavAzaqc9rEXTCls1t
	VV9Ytdvp/NvLup8+SKeRb2KySKS1KuWXbs2FWN2gwvCYzznmck+lMJamS82JI42PGWI+rMnd5L9Yw
	9iln1SQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZIg-00000008VSt-37Hr;
	Thu, 01 Feb 2024 15:48:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZId-00000008VS0-16PV
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 15:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D442CE1F64;
	Thu,  1 Feb 2024 15:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5237EC433C7;
	Thu,  1 Feb 2024 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706802491;
	bh=id6J3Cdah8jvslg1QrGcgzsC/X2JHmHmGKSbDMSsEbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dbIzhgLpUu4cbJMkZ0C9hcGjOvzWU0SNikeIjwAkyy9HqZ30gsabUPaezCHWsY4l+
	 FY8PEEiOlIwKWkp2AYhAd8OKUQE7H44jHOwa43TaHgGbjyQyfo6RFkb1q1n3LpISyB
	 Uh60hYwkQDTyE8YWAmIeVJ5Ag1Cr+y7BOTTRvs2bAyLwsiPnalIF4RqkRieyhMy0dL
	 2jYEMeGumZHhnC0xcJADyTrc1EoyOaR6LCyf/Qt2+DMtxW0Ep8fh4WifBt/4nsLq0s
	 QSwQSADHyFeYHAz6GFvABlbzS/BBgdSJoKZjm35kKxU7Fdr4LH4zHqOdGCgMSmzRfh
	 eRP4hpp6iO7Dw==
MIME-Version: 1.0
Date: Thu, 01 Feb 2024 16:48:06 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v8 6/9] mtd: spi-nor: add support for Macronix Octal flash
 MX25 series with RWW feature
In-Reply-To: <20240201094353.33281-7-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <20240201094353.33281-7-jaimeliao.tw@gmail.com>
Message-ID: <f1ef9b347b5b25491cc65a8262de7386@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_074823_529642_CEC817C7 
X-CRM114-Status: UNSURE (   9.82  )
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

> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Adding Macronix Octal flash for Octal DTR support.
> 
> The octaflash series can be divided into the following types:
> 
> MX25 series : Serial NOR Flash.
> LM/UM series : Up to 250MHz clock frequency with both DTR/STR 
> operation.
> LW/UW series : Support simultaneous Read-while-Write operation in 
> multiple
>                bank architecture. Read-while-write feature which means 
> read
>                data one bank while another bank is programing or 
> erasing.
> 
> MX25LW : 3.0V Octal I/O with Read-while-Write
> MX25UW : 1.8V Octal I/O with Read-while-Write
> 
> MX25LM : 3.0V Octal I/O
> Link: 
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/8729/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
> 
> MX25UM : 1.8V Octal I/O
> Link: 
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf
> 
> Those flash have been tested on Xilinx Zynq-picozed board using
> MXIC SPI controller.
> As below are debugfs data, the SFDP table and result of mtd-utils
> tests dump.
> 
> ---

What is this? There is already a "---" below.

It goes like this:
[From:]

Patch description.

Link:
Link:
Signed-off-by:

---

Test data and SFDP dump

diff --git a/drivers/mtd/spi-nor/macronix.c 
b/drivers/mtd/spi-nor/macronix.c
...

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
