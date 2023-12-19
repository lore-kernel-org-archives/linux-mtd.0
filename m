Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF3CC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Rv2P5nhwcEptPrFlgy4VExcmCZX/z07CM3qyF+nS0c=; b=f9BK+V/N41BDdh0H16sZGNNxjA
	1Dw8rM8Yf1Wp0+0bnk29g5RPI1cPjYSYWdPMuaVx9gm6CVrhVzorxbfI27DtzlibuHSJtvV2EJNuE
	tt+d5kyjPN9l5jx75wK4ddw5CCv7Sg6BDqh8OgzaJW07FitWUt+2Wt1LeKBaB/GeoueS+wUzaBF84
	WcSUOzFGAsCU7hNcdjofPedClPEIue8GzP2uVARW/iEXZwY0kUjKt8CORhOpsrTW58euMGW9jW9T6
	RDtooFQziQxdnQWI9Tfm0SJyytQ7QP5vDeyVSe+U4UUa+F8os14mY954sDvFIhvSxaYEOMH4j5Yb7
	ArV/V2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYxy-00Dybb-0M;
	Tue, 19 Dec 2023 12:12:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYxu-00DybE-2w
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 12:12:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C23FD612BB;
	Tue, 19 Dec 2023 12:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9971C433C9;
	Tue, 19 Dec 2023 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702987969;
	bh=yxPIwl076bwKQDDemF+6Z/V75Z/YoS+xlZiXY+NmWvY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MCbctRuGUngy35kwmd6IVsMCVT3ZRyXFl4tbX2lB9N06RfU6/BQmCE109z5l1HOey
	 xvUAJd/2+Gd7gkw58bDJ4DVLi4M5w27j0LhX/PD3MYB17DIAaL0bZZGwYB54oo6NTP
	 4DrkkfUs9NFk14FR5toMII3Qj7fbx5AilHxul96PwZWGRfKF1EERDG16JgqV5rj1xV
	 WZPq4V5SEycYE4ihX+eOhv4q0c+Oyuedx2h67G2FksU/wQty7qPkQ2LP5pl5d/nLvZ
	 7DHpPCOg280rgeNUCR5K7PZgW20LmpvCpRjy+AmQudnspXXZ7tllB/VJrpZfwqAyIH
	 Qo5afWqYsI9Cw==
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 13:12:45 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no
 enable function
In-Reply-To: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
Message-ID: <dca364fd69ef090f1c1fd130deb035e0@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_041251_019562_FA1EAEB2 
X-CRM114-Status: UNSURE (   4.22  )
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

Am 2023-12-19 11:21, schrieb Jaime Liao:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Discard corresponding HW capabilities to prevent carrying the
> wrong protocol if no QUAD/Octal DTR enable function hooked.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
