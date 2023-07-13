Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A87C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CineyaFjK47DDJmXb63iPP0Func19NzJW4X4KP8Ld8g=; b=4Pn9fxv/SR0GJH
	6q+nOtTbUtJ5Np+PPk5PR3Gy7CzeXjCTpQcAoEOwIvy1oLnKImQUD0NKcMxR+rEDa0Z6B9Vc1ERxE
	/MiRPD0w9EIBvsZcrbYGzbVVf2Ixdw5YSazOQaR6IyEX/lzVCVykZV1FHo8h/H/gUNW5mabpdaqrt
	dtJIZlkXNW9PoVRBs/1MbqNPelGfFvwd/TeOC8O5GW54f/3xglTsZJeK8HOGxYB2w67cepc4uWWHd
	5/vzdAxOrl/HFJoQOSxuH9UN0aCTnFspD7YMT7bl6ri8KYkvPaQaJ/pz0ZWSmKqa2/6Jy03pS5fat
	eN7YNaqEWlVKuf68xcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCn-002JLi-2b;
	Thu, 13 Jul 2023 07:57:41 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCl-002JKb-1K
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:57:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7CDAC0006;
	Thu, 13 Jul 2023 07:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O91e1w6Iq4C7RGnZeF8oJ3LsJAQZj1iKYFvjsH6RaP4=;
	b=iKYcGWdK82kH1t+evHPcN8+R3g2sn7/dp7bp4oJ0QqZx7fnZZY+DJOOR0CvL5CxD6UGxCM
	Tr5LyKTkeUN6aYAOnDaJu3R9gKLCLucrEYcMkhkjoU1lcSLPX/kxWTJy5xFeH8sYxjBuYv
	3gbPW1rd6eAI9Ncod53LbMKeZkCoUqrpUN/HlGW7cqxNBjU2viNS8NvOt528q+g9Raw3r4
	k/4X8mM5/3vrYbUk7xYNAazebdDk4H6dIK5CUw0bZ4EbFQVJyT0Ji5yoQ8RetcFBLQ0+o1
	3d7u105gujwoCHRN1XAG2Z/OrYdGJW/ZuruxpBv0LRPmuLnRvj8fqPMSMJw0pw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: rawnand: marvell: add support for AC5 SoC
Date: Thu, 13 Jul 2023 09:57:34 +0200
Message-Id: <20230713075734.485960-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703035044.2063303-4-chris.packham@alliedtelesis.co.nz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c7758249db25999ef01b054ed792c5e0be356668'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005739_579721_A204FBD9 
X-CRM114-Status: UNSURE (   8.51  )
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

On Mon, 2023-07-03 at 03:50:44 UTC, Chris Packham wrote:
> Add support for the AC5/AC5X SoC from Marvell. The NFC on this SoC only
> supports SDR modes up to 3.
> 
> Marvell's SDK includes some predefined values for the ndtr registers.
> These haven't been incorporated as the existing code seems to get good
> values based on measurements taken with an oscilloscope.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
