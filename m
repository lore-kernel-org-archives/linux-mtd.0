Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85157C33CB3
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:36:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562D72072E
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M+ndwOGz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDs7ULy3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562D72072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Vcz8IF84HgGtw32L4h4nwWjmxar3aJPGtkpvfFhTZw=; b=M+ndwOGzy21Y94
	Yzdw2LLIBunAlerf+wwp96PuJW5gFRmOH/GD5j8GamPEd1AxKizZkXvsYOZMwjApjECHB3IFbqjSy
	cSecM9mI+EvDRSWJRd6XTKhBEg7SgN0JVsT+D8UwQh8gapIfIa8cJEbp1e0eepun68FYsYf4PkJyP
	58o0Ln2JlBYpc/Btvct1B/IVRwM5kmb11/zG5EXrsN9zIhnteA2vEP3z9ApDLfLKBfP2yCWMyDi81
	PFkckW3In8QoRnuKxauEz0HhsvfB9v1Nbhbd5voskDFjNh97PsiBIN24UYX+C1+Ej+C4nxrfnpHr9
	yB88enxfFmM+Q3/OZZrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isEgp-0006K1-VZ; Thu, 16 Jan 2020 23:36:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isEgl-0006Iw-Ox
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 23:36:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id q6so20846030wro.9
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2020 15:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bF3317OGHK5krTcjjbGSkGwDhwphNfmQD5j464wXOIU=;
 b=WDs7ULy3CVS+9iYfA/uB0wYPil83dz50LkBF9KNZwmshPSasfn3BYIC4m5XuJRwO61
 df7ja6uqCjtAyFCyHU2OhUANcR58YrZVowl6/oJXV4y3SnnCaVZdumXIqdVrOIGvWvhR
 vwf7Help7agnC25Ynsy6QnnXyQcYOiZqcPDG4wJ8pJ0gcBHc9ZNypb9O+2dPrkZw3maK
 8hgVFRIOXqzbAeF1JaODBtfq31bMms3Gzd7Y3aj1EvKVLS/T9HtvaPC7UmmIaE/Y2v+B
 qUffVEGJNimwW/9xf5yNYwOZop03NeiXCeslZSXPYkOkKtLFaUEwDVBF6+n2PREwsHo8
 I30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bF3317OGHK5krTcjjbGSkGwDhwphNfmQD5j464wXOIU=;
 b=JBrveSR8K2F21No9JZ6rE7nA2ORy2P26KS2wcK42VgUXPEOpeElJyViQPXcc/Elo0P
 NaQ3dhz25nrtfwcOT9d92kDUxNgxj++15l7wVfnQ+yOpN0cjZFWoPxse1fceGJ3Sq7Vo
 4GtsG1x4ueJ+qANbTPtLk8GYfaefzv8gJXtNKe7XFPV6LIlukpXi0Xt3BFWvhhPOK00H
 LIIpfNn+05Ha8wHkRJyH6jCiZJfE5VmsssydIqZH+v4vsj3ptChOTmwmImUqwr7aww3b
 +KG20+XBAHKTXCvMJlwJXhbCwAxAinS2Ifa2XF7c7nQkD/gQzYzNaTxTDVZDlpVIsTnK
 26Yg==
X-Gm-Message-State: APjAAAWrmDxEYE7ZK3eDgzJjPnowobkoAqUpLzdLhXiXTY3VgSISdjo9
 +fDszxBBU7XY5xGGattsZnZEcN9dFQNq9IvZSkc=
X-Google-Smtp-Source: APXvYqwp34QgYzpaQTk3I5h4ff2xMWUbBxY86gwE9O7Q81Pi8YEFrvCVPdsmJzanpQx1SHOiplE2IKkdo/FyXRllplw=
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr5708414wrn.214.1579217794610; 
 Thu, 16 Jan 2020 15:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20191127062002.23746-1-yuehaibing@huawei.com>
In-Reply-To: <20191127062002.23746-1-yuehaibing@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 Jan 2020 00:36:23 +0100
Message-ID: <CAFLxGvyqyhCa7gvhRHT6oNML0+XJ-Fyexf4xK=bm7bViusuGFg@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: ubi: wl: remove set but not used variable
 'prev_e'
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_153636_871219_5B7C728C 
X-CRM114-Status: GOOD (  10.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 7:22 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/mtd/ubi/wl.c: In function 'find_wl_entry':
> drivers/mtd/ubi/wl.c:322:27: warning:
>  variable 'prev_e' set but not used [-Wunused-but-set-variable]
>
> It's not used any more now, so remove it.
>
> Fixes: f9c34bb52997 ("ubi: Fix producing anchor PEBs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/mtd/ubi/wl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied. Thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
