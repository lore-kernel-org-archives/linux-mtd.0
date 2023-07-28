Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2268C001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=183kzO3Wb+ZLms0ZoZAU6crN+n/iuzGP4xSwKxx8C04=; b=TygN8gBTQ/lYF9
	fhuZrk9rHbXWoAhNxOeOnEfZ135xINJos51L6ZiHlbQYo5zq5cKduqeLcBD9yrG6X5wM13sG9z0pJ
	ChsAQCXsxjB5+4HV0h6YfHuGJkl1LwWF5RC9Tx2lKUJgI4TR6xfJEPJYzaPeAqRWdgnkTQTjAmr0e
	zC4M5JjgWfxFsPuMI+wYrp8BhdymD9ACZlXQ9DCqlcfkZH0LLCrJXrTW5D7luwymtqX890wJK83f6
	m9D1o+fYUa8fBNaSEoddgU2sCk4wG+XFezhkvWIi5/1ZbvfWcgNHZEo1kF5NVCKLJmkyvCYlxWrnH
	ey4KyzhTHzBsUreN6MUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMhE-003LID-26;
	Fri, 28 Jul 2023 12:35:52 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMgf-003Kwj-1M;
	Fri, 28 Jul 2023 12:35:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E4D8C000B;
	Fri, 28 Jul 2023 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VN7SFfbLGnj6ijUce9X+9xMIz046fNHJyl3BArenAyE=;
	b=H21EUrZo/eZdpBbbKZFzJDS0dIxP33Vr1CmWTt6CjykPBBDOqI8NteCKDO0jmone8Pv+Ms
	BvKSe6vjiOpLEqFfEu/Oxurzb6+zk+pCcVc4jxLkpVk4Ur5ve1j7XVblslcBAg6kMG5cnZ
	ztqV+prj1zU6iJMu7FOdau6NLDhr+c/vthvohHzEy3dV9QkiaYyzIVSdldEndvCvGHXdXn
	VNnppCl4a0KwJAdLTwsf+gRz5k0yN2HaJlr67p5V9L1YT2gp4UVspwffRCrMXWx9cORf0j
	nPy5sGRa/cbc/9yXCQkdC2HBtkRPMAKM3tEbPkwW6SSAEdLyT+BBOcNUTD55IQ==
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] mtd: rawnand: qcom: Use u8 instead of uint8_t
Date: Fri, 28 Jul 2023 14:35:10 +0200
Message-Id: <20230728123510.640818-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'428771b61afdea898abd8724777cc36912566017'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053517_601765_42A59C30 
X-CRM114-Status: UNSURE (   5.20  )
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

On Sun, 2023-07-16 at 14:46:06 UTC, Miquel Raynal wrote:
> Fix the following checkpatch warning:
>     "CHECK: Prefer kernel type 'u8' over 'uint8_t'"
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
