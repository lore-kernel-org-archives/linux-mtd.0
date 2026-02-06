Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63230EE20A6
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJvmGFRzoOfRcxI2SQ1FB/0VyzaStbkwYr4+XUz3pMA=; b=aEi3Oxcilrj2tQ
	XCIpYhGqDzzCEAaW2ZhRIIHjqFu7czAZJDVBOzZSLVyojeaOv6t1TYZGKk4m4PkLAUjFvTlzwrtbI
	hAQjkVlXUWMDvw52T5pJ+HTJAE3paEVMQxPWE5dXq1Y42kZo1Aet/ByvrBFikFcfgy4Z3mpssWKyc
	xoRjZvThOp/fzGLjdtS555oGP7eh3H5DuymFMOE2/rxWwi1VDUt9N49FzyS7HY9juEwRB3yxlJ53z
	c9PFCLN5/KG460eU/pVbY3CFhMlMgIxfgomsTpTWgywzIOkulJU/NYafX1zw65ueb/WGqjd3Vdq1L
	GJWnKlCU1irD/K4VzPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMbk-0000000BQMx-0HR5;
	Fri, 06 Feb 2026 14:14:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMbj-0000000BQMm-2Hse
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 14:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0CB160051;
	Fri,  6 Feb 2026 14:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9906C116C6;
	Fri,  6 Feb 2026 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387289;
	bh=Oea2q1mbzc6eBGZdMkgIL72V9UkqPZtZ/43x3BnRTNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bfTu/DN5eHwpzxiYSmOGCegoCwGzy+xMv1bX4FyFwWn8fl/8Gu3HWLremBZ94qNM4
	 E8Ldf4SIHUR4m10GIyuHJVG2Dlwc/7Z7gHGLSFBVWsxClUFwudDk7iFC+s3TMKYQvU
	 CDT+oMQqsgbMBwONol8a4mjTmYmmUya45le9xFYzoWx1ypATrp/CHaS0p75my73uxw
	 j0G5yRYOUU8EaC5a7LQIIh7dt+IitFQB+iSaEsHcCMP9ANi/XiEDmGBMdt4Dh4bStB
	 hBWY6nAV18xuOqFsdVjz7YbYtao3lcrL8uEng0Nf8+RGn7ypXkRGRYEJ+Gik9s4Rsi
	 Fy9jEpOa+RHNA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,  Tudor
 Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
In-Reply-To: <aYXu7uqMQdZRMmQF@stanley.mountain> (Dan Carpenter's message of
	"Fri, 6 Feb 2026 16:38:54 +0300")
References: <aYXu7uqMQdZRMmQF@stanley.mountain>
Date: Fri, 06 Feb 2026 15:14:46 +0100
Message-ID: <2vxzy0l6x8kp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Fri, Feb 06 2026, Dan Carpenter wrote:

> This was converted to a _scoped() loop but this of_node_put() was
> accidentally left behind which is a double free.
>
> Fixes: aa8cb72c2018 ("mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Miquel, since you took the original patch through the NAND tree, can you
please take this one too?

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
