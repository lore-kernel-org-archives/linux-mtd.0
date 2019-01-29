Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D2C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 09:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A172082E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 09:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7mKEBZm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiKxR6M0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A172082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtUCnVVI9BJvQ3RWx6PaATweesCMFLC4O1fIefcZMZs=; b=I7mKEBZmSZl74k
	jwUQsDWr2ra8OH/NUPgrYUMazc2xV8PVPVs2xLgVJ+a6vGsSvb/vqb69D/+Uiq6+9JD+8oU4C5G0U
	i3n04qVEZjC1uvoDAfRuT0HDctv44k4F+XGzhmD0r96ynFsThz+NYhEpWVuQsEaEHybrtw7/8KX+6
	Qyu8vKRnKe2nE0yM27NH71Fy0BllBTzgyYRJqBUUdOipp7kAdYmAjGwslAiVxlg0xV1wVTAJCJo0g
	Wt3JO9lxAxwOkJhbB5e1tZt6YCcowFV2Faq1tgRR9HQ3Rh7uHGu1X62LQSBz+Pk7uoLk6Ze5MWC7L
	1pibokecrMFc3y8SZu3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goPtS-0007Il-Av; Tue, 29 Jan 2019 09:41:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goPtP-0007IM-Qz
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 09:41:21 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 318A52082E;
 Tue, 29 Jan 2019 09:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548754879;
 bh=9JEmK0oho6kukoDsJLIe0qFvGHcbKBGDy2OSPapdHRE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MiKxR6M0bykVIstsSK7aIZBdirKf4ETIr/opHUyko8jU78V4Vfp2o/E3pEkfU8guI
 hzqIMOyJlpVJYx6e9NeZknT8sfcC6C9nN4oBe40tEGAv3Scskk/a+vp80+1TXPoH1f
 YxORBeP0grIKkvR3ffSXhm4E/tGKKjZ5VH2WsoBk=
Date: Tue, 29 Jan 2019 10:41:06 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Subject: Re: [PATCH] spi: spi-mem: spi-nxp-fspi: add module license info
Message-ID: <20190129104106.4645346a@bbrezillon>
In-Reply-To: <1548750550-23565-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1548750550-23565-1-git-send-email-yogeshnarayan.gaur@nxp.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_014119_893575_D105E571 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 29 Jan 2019 08:31:19 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Add MODULE_LICENSE info to fix below warning:
> WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-nxp-fspi.o
> 

You miss Fixes and Reported-by tags here.

> Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> ---
>  drivers/spi/spi-nxp-fspi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 0327216ef7aa..90f3d2e4fe5d 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -1103,3 +1103,4 @@ MODULE_AUTHOR("NXP Semiconductor");
>  MODULE_AUTHOR("Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>");
>  MODULE_AUTHOR("Boris Brezillion <bbrezillon@kernel.org>");
>  MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
> +MODULE_LICENSE("GPL v2");


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
