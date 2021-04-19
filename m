Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D5FC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 12:49:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BDFC611CE
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 12:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BDFC611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y3x5my6F5fGN3GBuY2vKMGXMkYXJtPKNTPPyBO0DxqA=; b=C6EoAGQusKPk9QLGrNln7ti/y
	iwNq345BD82tnnej8XJUi9E0LfuWElJ+C/Ct/oVnxv71eAGkXobo/wg4y1/M50n+IaXDAG1+BGkfL
	3oJyFS/Nvmo7TavwHeKaX6DB1Emb5EvetTcxpCw+yncAhJAsBC7ECLpO4v5QI2qzrTtSA9qhS0tR+
	SJbgtr4Sv7FZ5xEwdUWlJJ91QkMMIEd/u0Glb/NLBUtpOKRz/SHolq10evWixeyTL1SUCw3+7wwnP
	a1iMc6Z38ghWDXoyVuwECh0M7LJQ+E708Lwr7c/lJJQyFchpiiFq3BO3Bi+w+rsL6Z3bRuYOwXicZ
	ADb+Wn3jA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYTKV-009smf-LZ; Mon, 19 Apr 2021 12:48:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTKT-009smT-5O
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 12:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IzNncrUvMiSoYdfmEKkiPrKCqxFW08xt1QZKyz3MTaw=; b=qOmhH+tf+rSJP69kWb8VceBZdj
 8Upb71TBia1ySXwscxHix+EJED/IOh/+z0C8zgZKe9mDHdiMRRKjzyAEw1SxCxj8tifqhtuJn5h3H
 ZNsbh8F4Ffkhk3G4dbETaBcDA5FoKzKzkM7Wx5CC6R+95mzqd4FqwjXjN4GNSlDxnyw+F5GflQYYX
 fh+krVt2XQPDAHayGPjT5rj2tQqsf2/fJbmFXFsleOH+0JHpvNPP/IdoFJ1qh9/78B1/t0vSCdgvE
 koLRHgxQGtxtWakYrv/JmxZb6uo3xvKcm6AU6h7VJ/k+4brIB9uTJyOIUJYMm3h2xUjkS0+YTDUUP
 tqMnHcsw==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTKN-00BMbn-Tg
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 12:48:39 +0000
Received: by mail-lf1-x12b.google.com with SMTP id g8so55776291lfv.12
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IzNncrUvMiSoYdfmEKkiPrKCqxFW08xt1QZKyz3MTaw=;
 b=Wm5nfUrPEM4JYzYIuOOtq4n5c5tIe7CD/CX13Z/tDQ6v2ihJhJ8bK9Dg10fbWkytU3
 enHHj26IqgqBrT+H3mEC6p3n8CD3/7GLQScHaU7+3gfK7qNnmoOjN2c8L52/HEtwuTtt
 JPfdOUvWljC/G6EqzoKHY6QY87qHCccyXjkp+czWdULeN7qEZdSsSnwNTq4tMGxocqxU
 2uaZBToBaqnNkHhbldEsbERBfnAqwNqtWa+4Z0RJpZb7lwNzOaQf2mx9wUT77gQg82Z/
 EfS5Kp0VmZ6EqvTaTECqnz4NwOAkrqAjzIpvzgKyb59Z+ESvk2W9o5M2R16dzovCwwqf
 lBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzNncrUvMiSoYdfmEKkiPrKCqxFW08xt1QZKyz3MTaw=;
 b=nJv5rpHlEcLPhlYOrszyN98dOy1neawtD7gSVtOVKPop5Cm4cX0nnTTKpPzb0AQoj0
 sxaWj9qdUuG+wuz3zn9R6TkbN37wLFNxBA2hBhLuiDMVdbZPmgvzdhqWxUOOj4Ajd6bA
 59YIvhoiQk175Anr58qded5Gfth5ZjA3cbkLz6Zxq/lVTXYDN08R7FTpkZ17qInWRRka
 3tWKyMvKVJ7Z0Z1aGgxdubqMb8hrbvGQ7pFCO08bmUz6zwOabdpWb690m3Y4qVE8B9BB
 hS2oKevu7ugH85SjhGqw/WJ7w12UeYUaoD8vR8k04QOGdvGKpPQAdDYNUP3Qk73qJ32W
 GbZg==
X-Gm-Message-State: AOAM533Z2xRIcNQ+A0TMhzpaMmNtzqHH8BZLMSNVabkpF9hGRzOA+Kz0
 +znpetwOZ3p54ivJbBPgnw+0KOIce1j4MX/SAilKL19Ufu4=
X-Google-Smtp-Source: ABdhPJzh3ZGxnJpfSycSJzUVwHj4vjkGtardYMbF1rpJwidqxRylznr6ImwFjC/pHrlGeAob4UPvE1MyNaZc+5khuSA=
X-Received: by 2002:ac2:491a:: with SMTP id n26mr103262lfi.539.1618836511507; 
 Mon, 19 Apr 2021 05:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <CAOMZO5CS03F9dDeaUus4WRBv9z_1svx7BqHM=b6PkxeUthGdzQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CS03F9dDeaUus4WRBv9z_1svx7BqHM=b6PkxeUthGdzQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Apr 2021 09:48:20 -0300
Message-ID: <CAOMZO5C921yS9mVkTpTjwxapjKhr_FgSddYcYXA62LBVPoK=9g@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Sascha Hauer <kernel@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_054835_975682_9E8D28CA 
X-CRM114-Status: UNSURE (   9.09  )
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

On Mon, Apr 19, 2021 at 9:41 AM Fabio Estevam <festevam@gmail.com> wrote:

> This commit landed in linux-next 20210329. I was able to find the
> kernelci log for this version and NAND is correctly probed:
> https://storage.kernelci.org/next/master/next-20210329/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html
>
> The first NAND error starts with 20210330:
> https://storage.kernelci.org/next/master/next-20210330/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

linux-next 20210329 introduced the following logs that were not
present previously:

Bad block table written to 0x000007fa0000, version 0x01
Bad block table written to 0x000007f80000, version 0x01

Maybe this new 'two Bad block tables' will confuse the subsequent boots?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
