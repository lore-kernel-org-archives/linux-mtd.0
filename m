Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DB1D58D4C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gps4AzamOO1HvoXi8Ru8dDZLYVr1lwcLpYbQGmhzVdE=; b=PjDK/wtn/A4NBh
	k8zoBhhO88FcLSNH84bEgyf99FxWvXcNvc8AKFny64z+Pw34LuxIhpZnXfjFfktLC2aqDOIb/lxXK
	VzjzSfvDScKwdLxxkBGmeX3uG3R7MM5eiVU/yWd8AWVx5vuAgo0KHjEHhatEqOmYeZsayJf5MJMmm
	dUNiXZScQ03pLMJLrm6BgOBql61hnLnbcl+Bv3j4MqQ/b5ggfJNMeiGeNOUFc2oFgmNZrC9n/E4ZG
	MSs91OP/9Z8b0K1k6kcnxhZnbm53osIiHViy9tOK9aXZW7kKb7UB1Zi9Q9ZEo142NJuwjFaLD3YLx
	zu7yo3sGvm1ZjNhWFlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZaX-00000008Ct3-1cBy;
	Mon, 25 Nov 2024 13:57:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZaV-00000008CsF-02NL
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 13:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 970145C586F;
	Mon, 25 Nov 2024 13:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995A0C4CECE;
	Mon, 25 Nov 2024 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732543033;
	bh=+FdWbMF8ffqZ7lp6RGXaARc4HmHv7Xcqbl9/GJNnDn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kzJHt4bJW2mqFV5Gf5iBuSL6+BstXQA5Rwg32GnHqa9HQuRN8w7QEwNO4iGvwoRf7
	 +ZUv4NtluZ2X9lP/PAVzkf1lZQhKHtEeqMmOeUZeGVoMwxqCwh7S019fRZQFkl2iFS
	 SXhk+az+xKaT+IVttqyuUeaffSt9FzQKQvSjWBDNQx0sJ7xa2fEQR13Fxslm2QVWNZ
	 T8jUsQ+2ROF/Qsmhh9bjZhik+qVhmk/Bqb2fTx3eqo4w48DGurC5mcw/TXhXkA0KvF
	 WHi8YqjSfJpo6ILwxyXEJZgJaJQIib58YEyFCe1ILZsGGq1RYMu6U5waspJ3jqtjYe
	 GNDRDqet1EQPw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alvinzhou.tw@gmail.com,  mwalle@kernel.org,  pratyush@kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  chengminglin@mxic.com.tw,  leoyu@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: macronix: use nor->addr_nbytes
In-Reply-To: <20241111113609.12093-1-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 13:36:09 +0200")
References: <20241111113609.12093-1-tudor.ambarus@linaro.org>
Date: Mon, 25 Nov 2024 13:57:11 +0000
Message-ID: <mafs0mshn5sco.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_055715_083973_C0A4BE0E 
X-CRM114-Status: UNSURE (   6.96  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> Use the nor->addr_nbytes set by the core, we shouldn't use
> magic numbers or states that are not tracked by the core.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
