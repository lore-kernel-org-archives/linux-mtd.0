Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2575105F796
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnC49rQ+UDASKNJ8mGp8QkQDi7aKZzuv13ZsmWu+fWU=; b=GBolIpSASkDi+6
	PF38tk85VDcASOEzQ2umN6YDth0AX4M/Ul8Nmpd+yksywFAKV6wOZSJ/LqMX8PCegMy0+C8TYW675
	05VgdVAiek2StxwBCxZV/FWAhGbeHB1AEZzmPCcHlNb9l1H6g+64Z24VmNmfCXdFp2O86696TjHPT
	TgAvZU03TxbcXlrvQI9pkfNPl2hC/Gr/Pyna9rHS3NIneG8lBW5G6TMYnVkzn4rOV/p3v6yZ+odGl
	4qwN+NnJp7avlYLwEbZGG008aOH898Zr9w7XpeXOMwRApaimpv4RpRZXy82XfSocPWbETYxuARRFX
	V77jdF6kbsjoa24RcwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zzy-0000000HWxW-3wiX;
	Fri, 13 Mar 2026 10:44:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zzv-0000000HWwg-2LjA
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 10:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9666160133;
	Fri, 13 Mar 2026 10:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B58EC19421;
	Fri, 13 Mar 2026 10:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773398642;
	bh=cTEoqJ4gEQuPI80YrHpvT5IQpT9R13pIvXiC08MEgeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tFGdZ6JFfP+CqaVXaYvo+L5HcpcxtSoK8Wq3Kz5iKhvJTzN1nA7VlRQTYPgqEPHUS
	 K0oc/cMiHguNI7jh5QbzHIkUp0+3/CT6G9NHcVgLdtiXwRy4QJcsvwfVAwEVes3W2R
	 BFwEGFkPjiFg1SlF0JXOMx0/ZHxL86cCyTnlDC2BMFeNFIE6w8v4UM+PpHjNz18xh7
	 f7aa/QWZpZ5wLSN1m5jVtR2Bvr4iybwb/N44xFgfv31dDX/CTCH2Nsi5Wd8PoxYJUG
	 LnCD6U9iOzzmUoehVdG3Iwartke4E5VvgVnnlc8MFOdOvPiU8+OYz5tnrTb4lH287n
	 Bob0Qdm6edH6A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev
Subject: Re: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
In-Reply-To: <20251208-spi-nor-v1-1-f6669a645395@nxp.com> (Haibo Chen's
	message of "Mon, 08 Dec 2025 17:14:14 +0800")
References: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
Date: Fri, 13 Mar 2026 10:43:58 +0000
Message-ID: <2vxzh5qkf1qp.fsf@kernel.org>
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

On Mon, Dec 08 2025, Haibo Chen wrote:

> When check read operation, need to setting the op.dummy.nbytes based
> on current read operation rather than the nor->read_proto.
>
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied to spi-nor/next. Thanks.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
