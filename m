Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFB0C001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whW9T39xPmsLf0h09mVOiwJq2FIh9ZfPy+D/k3YL9KI=; b=jlzg3BU8HNtgVc
	SjmOKn1ORcyuNHFossfYIo4okWN9fmmZxHi8p4njReBSW/48YT7227MALFwA0+TVx2/uZjNmOnM5m
	vxCL/WAnzvRhExfrdqy6UcW6yipTi6i4OF+QOytO+1ooob9Q+wAmlSFOBf4xFPnWoV48jUbS6zsXE
	lfXl+HYyKcQ9tiuvubW7sdBmy0vqUXHk6X8Ep2RhjIdOwba4w5HWJTBdpIXf4KggIHNgXBpB+SqkQ
	+adUZIm/GXr216mIT+taTrqM85fz3hLImURhMsFhZSxJxDXkk6BC/ch17OzM0GRzJ/ouu0+SitlYu
	5qN+3vmjjEzE19AP3dDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMg8-003Kil-1n;
	Fri, 28 Jul 2023 12:34:44 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMfx-003Keu-17;
	Fri, 28 Jul 2023 12:34:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3275F1BF207;
	Fri, 28 Jul 2023 12:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m40Xwk8mnLwoBSQfBVMMqtng2WC2N4ZtYfmOZOAW6YM=;
	b=bmZf9cKszbiUybmc0tmYyO0i4jQ23WhywgSRwGgxTYjUK/29xx0X+ZJK+OcfAfT1veZ7P+
	UbltWC4nhXAJJBo30SXRwAcpaJGhsNJHokddQtBf96/N0/V5dQa89SR+Q+bS3MQJLpi89X
	3EinS6WVgSDCzsfeEoiBVJp6JG3f+MJ9CFseVji8hwE/+wHIct9RjZn7XNQCpBPU8Gbjax
	M5AoTc61VTxnsavIN6o+d3FpX/YGilxtNiJ9yHltBD64LaB/1O3/8K8cll/wlac9XJvlXy
	se/ehX89wSYcHbi+jsTvkW3cgEAWi0UfPEtf0ldUuTRcw+opKe4Z/n5+2VFi1g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within ->exec_op()
Date: Fri, 28 Jul 2023 14:34:27 +0200
Message-Id: <20230728123427.640636-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-9-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e2532429312d089cf0d13bcb411433d85aef98f0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053433_513258_E49F669C 
X-CRM114-Status: UNSURE (   9.09  )
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

On Sun, 2023-07-16 at 14:46:12 UTC, Miquel Raynal wrote:
> The naddrs variable is initialized but not used. Fixing this could have
> been a matter of dropping the variable, but the right way to do it looks
> a bit more complex: we can avoid useless writes to the q_op structure by
> using it. In practice we could even have possible out-of-bound bugs with
> the existing implementation. Let's fix all that by just performing the
> right number of assignments in the addr{1,2}_reg fields.
> 
> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307131959.PdPSC86K-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202307131730.NOYbcjBr-lkp@intel.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
