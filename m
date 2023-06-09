Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB3AC7EE45
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVu127gUl4jRtPGlkU7PmRjUlv6RzXLM71eBYCYzMOI=; b=U52QECY4Hbu4xg
	aMrn9Xax31Stlnah+NbTyGlQbg8jkwHZjLFzbL41bQfqw3mXD/0ECntPtJjMfHdH+KoZbvBgJf1vE
	468RqeuDb6mLPIbrrM3vMe8KARaJHfxjT/uSDd7mB3sh6hTBeYPBwspnnvZDRZp80x8MF8YaaJHIp
	ASrM3dpOh6N9ZKoxETk5s9X22cm1Ng1vyOFFKIV4a5y1mZHF8aIQPEnz1oBYAvCvJPo6eTDEGVPTC
	4dsu6xfyiHBF761cD5hfXGXfb4PIG+Of3xSSw/AuvFvRQ770SbFfgVXGe6Cjji6zeKs35jg8LQ9Bp
	uj0HAoqeVeSo0twGcJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dz3-00DQBo-2V;
	Fri, 09 Jun 2023 15:25:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dz0-00DQAN-36
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 15:25:00 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1C+54ruTlMhT2spD+yvcJkbsq8HlZnkMAK0u6gLPYI=;
	b=gXd+AEMc59RP+/XptHfy4xbWogdqD56a2OZw8bJpbwu4IRlnaV+2Oq0a1DyhLcex1DhtLt
	F5a5co+7++ToF1hK+5XOjJp2IiNcpDM2JcmZcllCZbGbdMNQ3C3pi3jIredIfkykIcM8E3
	3mBE7+exghemw53W1YRSVNd9MKg0PrRUxuzxmGk/oFPEIyRAHOV/cgB28DTaaq/OMePrxi
	R6C9OOnl+8K/vG3de20HS5DLYKluM9luizjJtOyTg0Y+rbesJNX1riMB318pUM/kRyTDLp
	LKJQvem/XEj+wy38/3eJdd80j14UviB+UuM9m1AC45vSwA/YF+1PCi92U4CKjw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B525FC0011;
	Fri,  9 Jun 2023 15:24:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jaime Liao <jaimeliao.tw@gmail.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org
Cc: alvinzhou@mxic.com.tw,
	juliensu@mxic.com.tw,
	liangyanyu13@gmail.com
Subject: Re: [PATCH] mtd: spinand: macronix: Add support for serial NAND flash
Date: Fri,  9 Jun 2023 17:24:51 +0200
Message-Id: <20230609152452.1185683-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608052114.20454-1-jaimeliao.tw@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1a50947df5b3a574c4c97891f8deb8de6500be6c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082459_136470_7CF4F66A 
X-CRM114-Status: UNSURE (   6.15  )
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

On Thu, 2023-06-08 at 05:21:14 UTC, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao.tw@gmail.com>
> 
> MX31LF2GE4BC and MX31UF2GE4BC are Macroninx SPI NAND flash
> with 8-bit on-die ECC.
> 
> Validated via normal(default) and QUAD mode by read ,read back,
> on Xilinx Zynq PicoZed FPGA which include Macronix
> SPI Host(drivers/spi/spi-mxic.c)
> 
> Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
