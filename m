Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6504ECE57E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGb+F6WEI8iTLQ+rnuKm0Psi8q0NMZ250Y2aBUQ8Hhk=; b=YzNWHQH+eR5ytO
	6W/PwDjqL1XKGS3v1BbYMym5LQ0u8hM+wYJuJOkRv+QXjfCMXzBkyoow50U08JlrryGILCFU0u9+w
	82zV2BKMXNjFb6mJ8KX2Yv9uCDAwzsz5TW5NhnZnj29iI4GWtAUrmKCVR5R7AyzgdSyKhR7kg9rj/
	uQ2WRzCCft6Fwm/u7L66ojCHoZY82jtZgLjRCQH6GsxyuEAjtQdADXE3/sXpJtry9g5HGMCGAHbfY
	kKblWai4vf6S4iz0Uzt44hMZDhUl86QaFoaJIt1RM250kLKdoADJ5XV0isMcvvLnrfdtlC4iGNzdE
	4zYTAH3Iy4pffIosvvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb8L-00000001PML-1GA6;
	Mon, 09 Sep 2024 09:56:33 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb8I-00000001PJp-0bDv
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:56:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6BFEC000B;
	Mon,  9 Sep 2024 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725875785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bAeuadKeSyVHr07LY0GUdrdw29DCbIusjiSIYmZBONw=;
	b=RZv4hkaeubG4UehdbroKzmwajUTVf2HXwEqUnN34DFCVW7tzIao3HjC9Kv80oHBKWIz4/5
	IGD+mC5UwXLQElpEc8PyoAn3uGxvNV9/lKjcYSEEG/hSfIATAH7J8idYIgVFRgGMxvACUB
	MrQsKB8KnCsppntk2dKcb7OfYvirQ9bz4/XM9bzE8zYthOaSPijVENuYCPzPTfOC4W9hH0
	AtlMn9bguNNsG6ko8ltkfxExcnqcpzLCVvmYgJr2cYhK0CyA2GYr3s5NyUVCozZtTFIMQ/
	+2b7ZdGR4pCELPNSdE2Hs1L8yDBp9IG+qizquHZoZr244D743moipP2+56MlPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v7 2/2] mtd: spinand: macronix: Flag parts needing explicit plane select
Date: Mon,  9 Sep 2024 11:56:23 +0200
Message-ID: <20240909095624.20668-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909092643.2434479-3-linchengming884@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'475aadeba5df687524bd9bc5c77cba44c1736e08'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_025630_343707_DEBAAEC7 
X-CRM114-Status: UNSURE (   6.02  )
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

On Mon, 2024-09-09 at 09:26:43 UTC, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Macronix serial NAND flash with a two-plane structure requires
> insertion of the Plane Select bit into the column address during
> the write_to_cache operation.
> 
> Additionally, for MX35{U,F}2G14AC and MX35LF2GE4AB, insertion of
> the Plane Select bit into the column address is required during
> the read_from_cache operation.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
