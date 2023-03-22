Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C799C6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PozkMzj9jqzJkKjmXjCUF8Y8VFjlyxooXittJnutvo=; b=zvdg80nf6DLHmC
	TmDSAsCjkBocH/N7oHveWg5SJ9GxNr0vJpuvicmX+od5MerUrJXzGLzm2LSAD6M8YIQenXRVqWhCh
	bFPJMHMwWL0w4GGAjXO5yH83lKzDCvhrNDPXSyoK6rqntA/BMG3Tf9bUsn8G48TAlX+e2LltWIJu8
	MSbosarJTel/O7wovAuKSo11vdpuuVWWIkBMktrTtf4n+kOWYw5rlSyI92GLNblffd09v896WlAup
	GDJ3fHgqyjdf9v4f/hUyu2OiwoQmqsiJsv9Zdy4XlkUQAEbPyHnPoF+4aGyzbACNiTT/iG6MmdVQJ
	YObz9QjqdO5dQYNtBBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10u-00GbYi-1b;
	Wed, 22 Mar 2023 16:08:36 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10j-00GbP8-1X
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 16:08:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D2991100004;
	Wed, 22 Mar 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvvMWTp5RgpCN5ryxWKANDiAM7qABSSubTXji+1S0AU=;
	b=i55O9CaO/uaXLS/PDe3k9SigaTYTvafI1j5ZL3XbQgwIm2sls5x3SK5Kxe2fn5c1w7fp7/
	G2aWh1B/Z8UKkjQBEFs9yEdOuJ//ifu1QPK1tEdHLjtJJC5uQahSnnq5598AdT4HvLdRih
	Dy0b5g3YhtKmxeUFfkvolfoIX8+/P6dLq/C9RolhMNZwevj8eQxKH2o98rvNeohpQrUFpw
	XfJkVFWNV8L5g1K34NhJrmXVqY8fEJOt/uOnFfJ3MnkoNXARQzxPNnagGifH6Yj7WFfnG4
	WLz9lqfr9p6lzmNDmlEnNJy2m5gAPPXI1L/aDC4Y+jq/G9+yX3LxkH1Qucfw+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bang Li <libang.linuxer@gmail.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdblock: tolerate corrected bit-flips
Date: Wed, 22 Mar 2023 17:08:22 +0100
Message-Id: <20230322160822.2232771-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314165653.252673-1-libang.linuxer@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e6b0922a9c614d7689393391325c943b34afd6d4'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090825_689090_A1BD5B9F 
X-CRM114-Status: UNSURE (   5.22  )
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

On Tue, 2023-03-14 at 16:56:53 UTC, Bang Li wrote:
> mtd_read() may return -EUCLEAN in case of corrected bit-flips.This
> particular condition should not be treated like an error.
> 
> Signed-off-by: Bang Li <libang.linuxer@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
