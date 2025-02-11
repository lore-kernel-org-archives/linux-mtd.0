Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E2CC021A1
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnkBIcodpMFcPapIc/P3z6rloBc5a3PaoBXOsSfxdvU=; b=K4uNgJpoQc6NVK
	5LNltIdkHOc+NHiz4aXR56SNUuSuj3AiqdFwdSNNh1R8j3Bah78TiBft0HujRFw3pBsAM55E0i8b1
	/q9NhsMc24LAPya4cvS10t1UXJU/4MF6a4EiXjDKgnouB+evA/NebLc+ba+KeakqKZZLAhmJ+Ea+c
	/EmT0yuCAbv4fzE6Rk4M1jOIDJl7ucJuk11pwJlI9oEVizmjv94D0RXDK1Qlav0tmBCqJJVEMK83F
	iatiPjqqZ0XbCm+aWhYXpKGux/RY0B0cKjNBeWrY0QOfxVpJQxQnEfMPiq4RI7zYxc/1g1linA5Fp
	62np0zJ4kRAwKRoLnxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tho45-00000003T6R-3dpe;
	Tue, 11 Feb 2025 11:04:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tho2X-00000003SbQ-4AL2
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 11:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 748725C105D;
	Tue, 11 Feb 2025 11:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FECEC4CEDD;
	Tue, 11 Feb 2025 11:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739271772;
	bh=ZT4G12wefUcykpMEvckbzgQ874X4vZCquiLKUUKJExM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oflqkrHP2MDENTEAj8eO9cpraEnhFcpfTYWNtBa3c7x2PxaT0FT+8g95WXpj+vrsF
	 sGzkg1fbAg5uU5eaeSqcGURh5wgiCyRQnaRGcSFsafelDda4h+9I6YyvpT5IOnSLAa
	 /RWRQxNmWCWEacZTb4NugdEIwT2noKklYBrcE2f1loO/uCphKZx6UfPOKpjDxzMLpf
	 aLTIMw3djvvs1ye5XrdiueK044bMfj9Ou2D1TfA4XNtb6uvKIL/oV//ZDxndsNl383
	 /f8YX77XfpfsBeatuFuXMl6gaBDsoqSmi9eFsHcEQo85wQZLmUkDmbO3FXVRqFXA0T
	 xU6qcM1Oy0y+w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: use scope-based mutex cleanup helpers
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-2-05ed77a484d9@linaro.org>
	(Tudor Ambarus's message of "Tue, 11 Feb 2025 09:30:54 +0000")
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
	<20250211-spi-nor-guard-mutex-v1-2-05ed77a484d9@linaro.org>
Date: Tue, 11 Feb 2025 11:02:50 +0000
Message-ID: <mafs0wmdwyc9x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_030254_080721_90FD0EDF 
X-CRM114-Status: UNSURE (   5.49  )
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

On Tue, Feb 11 2025, Tudor Ambarus wrote:

> Use scope-based mutex clenup helpers, it reduces the code size.

Neat! I didn't know these existed. BTW, s/clenup/cleanup/

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
