Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0A8C2BA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 22:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmFNsG9E5sSpzf+tPuNcrLweZsIxSNxOw5aLzYYVHcs=; b=ZpPw91tkHWautA
	aytA/bMd3TFzw3kjaA9clA/XzxlsAZQwQmhhQu/vX+sLZu+Q2lbkVZCYkRSD0QWbdGOd+HHE1IVij
	tamP/xWgKd/B/P1Bkelcp3lEbMcQKTNLa+jEU+60r0H7BttT3aWj5P/hhtFCziGwZSgfrXjXT9FO5
	TFmJqcCpBeRiDL/iYLkkS0GH+h/1MiayDGsIv+yPfJ3F2r4PZqhYtQgbxEQeCOK9VyTdIOk/uJzHj
	cfw+QAckkEe7B0O723QQ6IG/6SL1KjESZYvqT7t0QFeIKRZb65J/L9gRk6NH+QFBUIWQC7H55NkfD
	x8RFsQKvnmjwqODamAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJKmv-0000000Cmwg-49t2;
	Mon, 17 Jun 2024 22:25:21 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJKmq-0000000Cmv9-1QTi
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 22:25:19 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B65F145E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718663115; bh=C4irShnxUq3Qay/2WqB7RvyVUXEGysIQbUzCnN557I4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VdD0t9BZfjVRwVNQ7jaQhAr9a4E9hkxKVtwflz/o/CZYyWCUA+uhNRKcjIk1PQ10R
	 OFvfeKrBxPQuohtGa8XCoit6wVBjSSpXyQ8ANwS0aAkvqNWl5CRRQ5KyWBF2YxfhQJ
	 YwwWcabOxRiX/GzvotTI46HLcIh1P+O8/xHh/CQ0FbnsoczR5CmodIUtGaR8k824id
	 mcHM6SSPalgvt1ZQwRebCFzDvlGGZWQ+b4Tvk22GGOzCe8jf1AaEYymcv4GQqM/WtF
	 ODCTa98flzrzdPe5AIE3FB3juAj5SddLFMVFC6NglpcRgnDFxSHrrCELIc7xJxMbM4
	 CN1hPv7sKJJxw==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B65F145E2A;
	Mon, 17 Jun 2024 22:25:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org, Alexander
 Shiyan <shc_work@mail.ru>, Olof Johansson <olof@lixom.net>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Documentation: Remove unused "spia_*" kernel parameters
In-Reply-To: <20240614184041.601056-1-thuth@redhat.com>
References: <20240614184041.601056-1-thuth@redhat.com>
Date: Mon, 17 Jun 2024 16:25:14 -0600
Message-ID: <87plsfgqb9.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_152516_919238_7F449278 
X-CRM114-Status: GOOD (  12.62  )
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

Thomas Huth <thuth@redhat.com> writes:

> The kernel module parameters "spia_io_base", "spia_fio_base",
> "spia_pedr" and "spia_peddr" have been removed via commit e377ca1e32f6
> ("ARM: clps711x: p720t: Special driver for handling NAND memory is removed").
> Time to remove them from the documentation now, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index ff02e1a02e12..dd8436c98735 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6273,11 +6273,6 @@
>  			Not specifying this option is equivalent to
>  			spec_store_bypass_disable=auto.
>  
> -	spia_io_base=	[HW,MTD]
> -	spia_fio_base=
> -	spia_pedr=
> -	spia_peddr=
> -

Applied, thanks.

jon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
