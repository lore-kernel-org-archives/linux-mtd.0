Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD21EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtyTGYzt2saM8ykvR19GESt8NgOGWvPK3n1VX5KP2fM=; b=DAyjE3NRIu1ERQ
	FyX38KrHV7n3Hi29kANIJ8yWEm3qlpJDSFmGlXoYgukzpdIs3ag09lAxI5crcDemgHs05Z43AmjLC
	O2LeLZAVq4INLmZrJQNnGxkDoDORXOYRvkYcs4gKE9J0QnRyy9YUWFC3ioqkdONJ+fvgacZlX+oxY
	80gfzuTexvtoISqFKf4GZvHLLbn5wOURWNUzN6k+8WCM9ZAX0yexs9+Giai/FHF8gJtqFkLh/g1BC
	AByKlGZlrzjdB6nFoXyHgBdL2wM6VOfzCsWYHHBa+r0icpdTVqJPzocmDgTiw7DZ6h519ofSkxUi8
	IHLorN4yQIKVaUtn0zDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMu0-00F9Sb-Hw; Mon, 04 Apr 2022 13:37:52 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMtx-00F9Qn-Vr
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 13:37:51 +0000
Received: by mail-yb1-xb33.google.com with SMTP id d138so9252646ybc.13
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2022 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CdtxabZCkayl/u9mZin0h4LkVmWtRoG1gJbU+RkSoQ8=;
 b=S3tazSMp95YVk10K+C1+7z9a5+OIqt0m8oYQr9qyUcpePiFtbcJqHykyPQ+CZzH9AQ
 kpGOfP1Yr7FZi8tTGZ2aVNGX6mVUL6Q/bxB+KtTLT6OFcEPrv9wnnpwD2NXxQCde6UOH
 KkFJGPSpgFfHpBWEesc1CAHTSNqGzvOgj6UaZ+CxZ5Me4WssaGT36t3myiAYdmIw8yZA
 wRmzq0S1+7WpISN8DfeXD1k2Xkxkh8exI++OmIDCtM5rfmbK2tvAgEgf89BMMHKmKtKQ
 mISpw48mD5yt9Va1PT+Ru9aeTg5n/X26BNHZHWcYnrwRX4pT4J3Yd3CuChY+XTbN0LcD
 6Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdtxabZCkayl/u9mZin0h4LkVmWtRoG1gJbU+RkSoQ8=;
 b=fQYsgXeP4pCWnDgv8gm516vqHHuRNHgAPi0C83pbpKrpetRv9ydXquUTgHrHINhJ9M
 9bA9wa5c8cwlk+WIwBtOKFEEnSIr4llCojQqvmHFVVBRn05UG6ITcgRz7d7w//JXdrV2
 1amO7Z0RcZux20TY0Rki81gjB0Iyw8qHQX6PWMIdDKglITBqiLvR3vsiAADnpWlQX90c
 gdZMOAnNQVsWk46WSo4h9qAyTAG1cKBuFAJ1VaIADnTuSSCTNkLHCwU4j+ZTykTk3QpI
 BqutFrRMlkpRu6vYDwlLfeqA/+W8eM+dK9AqUNtAL0au8ITcpkPRFQrTvZK6dNlDVSRK
 2DMw==
X-Gm-Message-State: AOAM533V/e75t2RfwSfBGR+0k72+wv3eJ3ulWrKevcQHDihf9VuFoDNK
 vDOzaevndyvtMszzKlA831hChcs+wuJlliddpRM=
X-Google-Smtp-Source: ABdhPJxbAy9yWW5qwS38SKA/aFDQRijv4oZ8eoG3oeO2nf+VK69vJdJuF2/CQR4Z0PZ8NjCsfPOe39yuACBLYAF10Fg=
X-Received: by 2002:a25:3204:0:b0:63d:b2b3:ea7b with SMTP id
 y4-20020a253204000000b0063db2b3ea7bmr6670689yby.431.1649079466725; Mon, 04
 Apr 2022 06:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
 <1c78a1f447d019bb66b6e7787f520ae78821e2ae.1648562287.git.geert+renesas@glider.be>
In-Reply-To: <1c78a1f447d019bb66b6e7787f520ae78821e2ae.1648562287.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Apr 2022 14:37:20 +0100
Message-ID: <CA+V-a8vbnksh5u+WWW6jYGd14ccVyHibey8--KvF8LWTxQQgXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: rpc-if: Fix RPM imbalance in probe error path
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>, 
 linux-mtd@lists.infradead.org, linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_063750_085436_BF9E8EE4 
X-CRM114-Status: GOOD (  12.41  )
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

On Tue, Mar 29, 2022 at 8:13 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> If rpcif_hw_init() fails, Runtime PM is left enabled.
>
> Fixes: b04cc0d912eb80d3 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For the spi tree.
>
>  drivers/spi/spi-rpc-if.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
