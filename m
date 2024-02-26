Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EF6C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 09:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmIDt3yp9Puw6b8Uycs0oMYx71JOBwtGLQEGC6jKcYE=; b=alksZ/rcRcPUWE
	JPLDXCItg1ytxrrpqrmsQWoDipqGGWwd95wyO2H9sDXCMBIgXA61KqRDHsqtmyw369e8WsVf6gqlR
	y2V7ObndHdY5aPXtFBz1HYZQ+ziXIuyUV+cwsdFzD1tGUIt4XUS2qWyK9iARlNMhyXfyBS6qVeMir
	LkOXKv4NYUf65ct6ZLb96/dTek1GRSejr+lc4nN7vbePHdKU6gD2rTDeIvqodRD4BgyVGf4oE0VIN
	h56j5dvlylf+JAkwhFZHAWHKuS9X7D6yQrWsmNFmUCDGvMiyyq9i+6QGMVkl7zLZdJeHvZFDTwMOl
	ncCtyz5FnkZX3lwZmFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWsl-0000000HChH-4Beh;
	Mon, 26 Feb 2024 09:02:44 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWsj-0000000HCgG-3Kwq
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 09:02:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-564e4df00f3so3539334a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 01:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708938160; x=1709542960; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l4vuj3eSn8A7txG5vBFIYiDQpLrdAS5lSvykbiGNFDk=;
        b=W8tjM45ADhIUU4SC6ZiGMkb2cLBiwjO1nR5o6PAtL3zwtcTsGU92J7tDCvrWtbPtTx
         nr+89r4Zq5E7o0LF72oaWa23SL5/lBfJQXhTauzbCGLSdjzyczzD4WpgnJLvtJmpznku
         MJRlSEFinFO/73hK9gs7nVqPPzgP2Oe3g6nyiGP4b0LTcNUJO8Lb3MGDx006KlagEfdh
         TCFB1fB4vgtup2ujSdjJjmAZiXrfvfHxW5Wfyb2sSR8hRHODrKJHkgTtSAAymTIiBTcw
         zgGbQ33JDibYVioAjdOZKoaYhGMsZQq8CKvoRtMMlYwgMASBMyXS1etJs5hqsc7IucJO
         5Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708938160; x=1709542960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4vuj3eSn8A7txG5vBFIYiDQpLrdAS5lSvykbiGNFDk=;
        b=tkcCD81GjIuoAk9WPKeWwqP8AnUYQHvbUML4tH/6PztY0TLIynLyQD67kqODoYJD1e
         fBmB1ExanHCqWYCmXboRvCVAnb8/ZNJVdYTxh7OsX/28f/qmQxOwUodze+auTKnonNJO
         uWceOTHNqBLIdyDqUquzhTkwVrAL3cKayON7dZh/CfJhh+Kkvapm2vpISA/ovKz3wDWb
         FLUm0Kwk6dbQ49yJLlwYMb+/8kqeqI/eOOayFT03yW7BsUTVuGHj2vjtdgEfIlSg6S2x
         gxrnw/B2DiVpcHdbxy81I5xgCNuwLz1KI+U7TgNGX874l1QnXPD03dQG2nZvd1A5SN8O
         n9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqdGbt7gRVfFdkdjyqEp+nM7AZRXhV/lAFbnZNpCQhoIVSIYm73AZjPA3xSOCcwGqWrhpsm6cm3KnKPa9o+ftgs+8EbQf3WAdFehYXvg==
X-Gm-Message-State: AOJu0Yw1WT3LIwZ4cP3ao/scSjvGsIwdYPNgnIs1LE+Rm3teUnknFx8X
	mQ6cOAVZ5nZGU47q9CF2ooQVN0tN7pMOtLoTUF0zuTt6V9ODyb104ybXOurOj2U=
X-Google-Smtp-Source: AGHT+IFiM3a9JqDcX+o1wZIY33EBfcLiW2gXKm3nl1PJL5AegCjP+Sp05In2Y6rAkAXy3GuYhUyJRw==
X-Received: by 2002:a17:906:f191:b0:a3b:e8f3:25d with SMTP id gs17-20020a170906f19100b00a3be8f3025dmr3933749ejb.75.1708938160001;
        Mon, 26 Feb 2024 01:02:40 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id pw23-20020a17090720b700b00a3e4673e7dbsm2216139ejb.38.2024.02.26.01.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 01:02:39 -0800 (PST)
Message-ID: <e317ed6e-d132-4e23-9396-b747a939913e@linaro.org>
Date: Mon, 26 Feb 2024 11:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] mtd: spi-nor: core: set mtd->eraseregions for
 non-uniform erase map
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_010241_873948_9D13C7F2 
X-CRM114-Status: UNSURE (   9.53  )
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

Takahiro, which base did you use for the patch set? It does not apply
cleanly on spi_nor/next (v6.8-rc1), neither on spi-nor/for-6.8.

Please rebase and resubmit.

On 20.02.2024 10:34, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> In v4, split two flags removement into separated patches. Reworked
> spi_nor_init_erase_cmd() to use n_regions in outer loop.
> 
> In v3, reworked to remove LAST_REGION and OVERLAID_REGION flags. Updated
> and tested debugfs.
> 
> In v2, reworked spi_nor_erase_region to stop bitmask encoding in offset.
> And added n_regions member to spi_nor_erase_map.
> 
> Takahiro Kuwano (4):
>   mtd: spi-nor: core: rework struct spi_nor_erase_region
>   mtd: spi-nor: core: get rid of SNOR_LAST_REGION flag
>   mtd: spi-nor: core: get rid of SNOR_OVERLAID_REGION flag
>   mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
> 
>  drivers/mtd/spi-nor/core.c    | 187 +++++++++++++++++-----------------
>  drivers/mtd/spi-nor/core.h    |  30 ++----
>  drivers/mtd/spi-nor/debugfs.c |  26 +++--
>  drivers/mtd/spi-nor/sfdp.c    |  47 +++------
>  4 files changed, 128 insertions(+), 162 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
