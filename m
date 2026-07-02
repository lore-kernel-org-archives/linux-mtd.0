Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33428C43327
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOirOBYMzylelPdTY5T2etXbFXYbwHwIRoCm5v2nycs=; b=kzxDJxyJ2NSpvy
	BqIc/WTW3yIVRXe1Inv05Ig/ho0aS+TwT7Xy74YJJhhClfZY4ACm7HlJyDhGm7lWCsCJAYa+FiVg4
	CCykS731HWtIAhUbk+Bnfr6vG9TDdZkvYRU4dRSrTipzYG/RZsgIocZU+a6YxqN6H4g3XXlbESMa4
	3W9LoJXJ4NJg6H88CivpMxUb6W4N/QR2NUnRXIkVEBDQKopWUjgvHT0fo87yGTkIEVgFMQ0Bdn20Y
	DUi4gP+aVzrWxFOu3z8QWf+XMUNUIqzzZd9GDGceRlp+M0CTwBW4UtI+CIrNlzPSm5gqS8zZfU4+h
	laZD8ozqTdogVlAUlwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5SA-00000003Igs-18dY;
	Thu, 02 Jul 2026 00:38:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5S9-00000003IgX-0a0l
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 00:38:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9950B42AF5;
	Thu,  2 Jul 2026 00:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD801F00A3A;
	Thu,  2 Jul 2026 00:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782952732;
	bh=LpCJQlPE5Ak0zE6/hYgX3ekV8KmQRxvp3FBqk+6eoys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hg8zbCOvSiJwasIpSLYdLlrGV01erTu+gpjTn9O0lplXVuzUv1wwuB+bv/sYElrs/
	 64pSMOm6Kqzmvf2rGa48Qt1updcvPfdzfKoZYD4mKFn2/gRv6zXea+Ds9g/3IWOhQc
	 plbWzs5+fK82Q6ThiZrlbjVh7wp/ASt/XFQ0eyhsIuTs1iBizM0A4wmtor7xEy68NS
	 /bCZYHkyV044QTEqBLiASqNjVaJP2ckeSE8kGia5S268SxGP9BSO+DwlpkRY5J7nkC
	 xhn46Ai8k0tcTpaqCbwmnVvPUcCLT+9HVmrav+2ht7qu2SjGtUOYsHI4bxjduxCJst
	 f4crNqeUvY6Fw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Cheng Ming Lin <linchengming884@gmail.com>
Subject: Re: [PATCH 6.6.y] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
Date: Wed,  1 Jul 2026 20:38:33 -0400
Message-ID: <stable-reply-mtd-macronix-66-20260701193800@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701023619.2730136-1-linchengming884@gmail.com>
References: <20260701023619.2730136-1-linchengming884@gmail.com>
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

I can't take this series for 6.6.y: patch 2 adds flash_info entries
with a NULL .name, and 6.6's spi_nor_match_name() has no NULL guard
(only added upstream in ac5bfa968b60), so the legacy probe-by-name
path can oops at boot.

Please send a v2 that either names the new entries or backports
ac5bfa968b60 first.

The 6.12.y series is queued, thanks.

-- 
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
