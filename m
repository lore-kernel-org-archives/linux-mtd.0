Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C13EC46CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vN+xptAq6vNbBBLnh5eMYNgQWBnlKkxol5cYQOajE4w=; b=eSKCKzMFfu8QUK
	iVlhXr9kfA1mPi1rVSAV2Q4GiSNsgVzWI5yL3Lz0nh/L3W6p0mKKGusQ8gTzEvSCCrvnNlIUYwq5S
	1D0kJXo1ZkvWwhSG0PEjyNMltQ97/8nUT+jCUoQmIYAgkeiU0I90pL5QMozAHXnT4CWnJMoAIli8U
	z/auXTfK7ghc+2upNYzNTS37zy4kfFBV1MCnfI4e7+Jl7cSAdWZM7T50kHbra2ol9FLXit+1I/dk7
	c5cjDf/dZmxHIxvEPq6PEmvf7ajrGPxjMwn2sI23klDLfJgwCdxCyw4yiKMWI3JapODjnNSYQoIBs
	UWFIIpuOT9zQfwjIEKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5uW-002qFR-2B;
	Fri, 15 Dec 2023 10:59:16 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5uT-002qEt-2G
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 10:59:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 315EB1C0011;
	Fri, 15 Dec 2023 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702637947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/DpdWacBeVmA/hm3BZ9y4VmrrqsusBo4XPro7WpjvvY=;
	b=UsyWWptTAHwwGOCcNJ4fSN6Lrz3BPwQsCTfMAUA55rtU4qfVBRnAtOhGwuf1HVU0GI1yPg
	oQiXvTQTxoAW0QYNbshTaxwGwGcYPXgCoyltQx+Ks18slm0i1wcS8SXmwGaXvd14LK98fH
	OJ0U8qbLb8idRdApoAXdsJ9yEHP3I/QYkVIA4hdK78zrIeGwKsQBKye0pdATo6C40yPaBn
	pWgEckrfOz39xg8Wjulva1huA4XpkPRVbAgNzSLIyJU8LIKLdvrrLaJLqA5Jns3jthpxX3
	OB5LdEF1DBJ6fTKtU4X1Vjzp8ovmrwQsWFeR50KKs2Ujg6UoQut7MXjydpH0yw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: vmu-flash: Fix the (mtd core) switch to ref counters
Date: Fri, 15 Dec 2023 11:59:03 +0100
Message-Id: <20231215105903.499114-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205075936.13831-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a7d84a2e7663bbe12394cc771107e04668ea313a'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_025913_899931_158CABBA 
X-CRM114-Status: UNSURE (   7.40  )
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

On Tue, 2023-12-05 at 07:59:36 UTC, Miquel Raynal wrote:
> While switching to ref counters for track mtd devices use, the vmu-flash
> driver was forgotten. The reason for reading the ref counter seems
> debatable, but let's just fix the build for now.
> 
> Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312022315.79twVRZw-lkp@intel.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
