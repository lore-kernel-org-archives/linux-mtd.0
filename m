Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34896C7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mgb/54UtQ3CdKNlmEk3Cc+tAn6iN++JbFFow53bq+jY=; b=Czx+Nm0ZVic+8V
	mlAseQfhj88GdpRUea+nDxGvcK4EP3IoOVr6dWzbWTULGziDkNvEKvj4Bk+/+dQcvqCH+4LHHWWg7
	kK3Cj2QtSlZqKmPoMPnQp38+9ARyRNS59Q85rxnLaQCNm3CjlXqFPNchcdVsqD5Bg9I4DZHlzLo2r
	0lJkzM4jt3bKE7zHYlW2bjjOieU6JpKnI+rjB7DQ0SE/y1cB7swseP2bM/GxiIp/Aaci1rGznehoi
	GnLh/FvoQXItaVQggQevHjOhzxh1EqeNroh5prNWqLV90S0hUcnlbJB25CYsula2dIYbNwWZDrCA9
	6XdJ9fuemK/D87glPP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17vx-0077ao-2a;
	Mon, 22 May 2023 15:58:53 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17vu-0077YJ-2A
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 15:58:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0BCA2240007;
	Mon, 22 May 2023 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684771118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNO7ihmAZxKF90Y/XV+Q0lLC8kGDIEujfsZBJ+mXFHk=;
	b=dlJCMm21miORp2NPYFg4PRL/poVGsZi+hkpYbTXClU9/ZpSzNUIAC7Xmm2icgQWrZLmiMs
	6/GyuZk9X8UjXRjMWZ3Fmgmmx5H4KzpTO1XwPCmx9dGeN5U2IolIAJye9uJzm8GcmscTSR
	v47NXFbeSRU8Mf8MxUD8dETcFjZuzBjbdBjBnBObEiemoKaE3zu/0wrxZQqeBK3NZhUt85
	+6Rw3fA2nS5nf1W5J2pSAaNGaUKpnHVPb1YycdKNy1tJDN/yIpyGXTQmw9V34S5+OOrYjI
	96J+T7bHVsLnAvZy3YQhzZTO5v4UjM3bfXHREXqhNwcu+Lo4wYqej71FPocJUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	todd.e.brandt@intel.com
Cc: vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@leemhuis.info,
	bagasdotme@gmail.com,
	regressions@lists.linux.dev,
	joneslee@google.com,
	Todd Brandt <todd.e.brandt@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic flashes
Date: Mon, 22 May 2023 17:58:35 +0200
Message-Id: <20230522155835.46756-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'da8291aa0ca6c789dcfab7bd2654b7faa3894956'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_085850_860056_513F77D1 
X-CRM114-Status: UNSURE (   9.74  )
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

On Thu, 2023-05-18 at 08:54:40 UTC, Tudor Ambarus wrote:
> We failed to initialize n_banks for spi-nor-generic flashes, which
> caused a devide by zero when computing the bank_size.
> 
> By default we consider that all chips have a single bank. Initialize
> the default number of banks for spi-nor-generic flashes. Even if the
> bug is fixed with this simple initialization, check the n_banks value
> before dividing so that we make sure this kind of bug won't occur again
> if some other struct instance is created uninitialized.
> 
> Suggested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Reported-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
> Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
> Link: https://lore.kernel.org/all/20230516225108.29194-1-todd.e.brandt@intel.com/
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
