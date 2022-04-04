Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C94C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMT2ooXwHCjQ9xqKsqMWf3yIfjHE1QnnB0dhAy3MF9o=; b=ekaogsmIZJw0KU
	hypxwWyn7kbdWWcdGTd3nxx1bd4guEL6hjDfzejtCr82F8FEjSxMLoQlBfZV3T3LjlalcfiKXVAuX
	Eq5rWyxvJC8Zr8ngvSRBKeI/UewR0hCZPHxi6ZLZCLZJjd5UboB27DEnDCfu23Chgabh/N+AZt5fu
	8uRKTk3jAWJ3f8VDEPZNdH3cweTERSzL/AlQlLi9GsGvuM1lENmPFq3RSU3jZnrPIv16DOf+zSPxp
	0Tgw66LN9GkC8Rn7U+E7UMMH7IUxVndH6KWEZuT/ZKey0ouOxZEorcuosgQYAF1+BEqVqbnh+7urY
	S43xek/i/TS0qMLd6yeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMqw-00F8fp-GV; Mon, 04 Apr 2022 13:34:42 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMqt-00F8eO-2C
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 13:34:40 +0000
Received: by mail-yb1-xb30.google.com with SMTP id g9so17656774ybf.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2022 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YaTxLCUntWttTrySEX5v0WWGqUyOjlg+VT/NTYbEi1k=;
 b=XhW31WQQOkGD/WqzKYUh6DrLwiPMTC47Zm3P6AnIsAE4hVYbBQtmt0AzmS+qNT8x4f
 qzYoraXVz01ewciISt+1ftpiwzYFEgcVUEQDf+45O5ouJPNVC00wd/00bVh6GPsndgj/
 AzphLzXni/vxQleqvUQLfnBV7uc42FBqQ2Y3SAlwRNP7BQgNz9MBLtN9fjv059fWlS+f
 h2OxbFYZHvTKk+xPRW+HxVoN5vP5UQUBwT7XABsoYBTPr6C+r36nW+TFb7yIm8zSVnfS
 cz3NljZzji6hoFpTU7I7FSYNNX/c/ktjSGKWm47e50EUlnBUr3yWOy8kA5wiM+u8RDtK
 iNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YaTxLCUntWttTrySEX5v0WWGqUyOjlg+VT/NTYbEi1k=;
 b=QVpPy+EAUqRft/6gCzcJIQ7X2qTdd66QwGPCscA1oOnQkV331QDA404OI5oZY3Jg9k
 6vHa83yGBAT7avfJ0G5WMPteiOlpyITMAMXX6NOqF2YfzdIh/3Y8eZhdwtV9AU9zSQxG
 c82hlmIroBJ2N1DOO8gpz9v/c7atd4Ueh13S2g7go4HWpaNOqYREzKreTKQYPq9wSEqP
 Egn5BBs5No/nt8m2CHmPSN+5gNX5MY4k3chedRhFMwfadzl9Wt1HV/YkRwuUdNaFhTCE
 vBP8tLeczKSZoS+NHe1m39FCJfAX99hiHwhVT+QbG9ThhdsUs3+BXvGMP3rkeU1/hb9D
 2YIQ==
X-Gm-Message-State: AOAM530iyNq+qjiXnwMN13/EZW1rMAi0w28rcmp7tsSJqn8qBxo5KDPt
 xWnBewyvDfMQn1ZYX49lXb5HfQzsq6qFCsfSj4vhGDYGvTqN2/qF
X-Google-Smtp-Source: ABdhPJxKtp10ufyLemxrLYs1Do/IZNZpDWiRF3iXVcHDtm+e+UdCgHS55mIXAUc3/LdnzK4WupgU7fiKHMOuZIjbuOU=
X-Received: by 2002:a25:374d:0:b0:63d:84a2:237d with SMTP id
 e74-20020a25374d000000b0063d84a2237dmr12786814yba.417.1649079276152; Mon, 04
 Apr 2022 06:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
In-Reply-To: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Apr 2022 14:34:10 +0100
Message-ID: <CA+V-a8uiP8TX2MJs2cvMdxJCt5cSmvYTm3biQYmAg+TH=yw7ng@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: hyperbus: rpc-if: Fix RPM imbalance in probe
 error path
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
X-CRM114-CacheID: sfid-20220404_063439_173140_1DD91B12 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, Mar 29, 2022 at 3:09 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> If rpcif_hw_init() fails, Runtime PM is left enabled.
>
> Fixes: b04cc0d912eb80d3 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For the mtd tree.
>
>  drivers/mtd/hyperbus/rpc-if.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
