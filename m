Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C743DC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 12:41:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4150061003
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 12:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4150061003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJc+afLoL9BxG5ebcF4yoShZzaCSSjE7fH2qSOgzgTE=; b=bXI7p6Zb9ihmCxpPUoy6CGNa8
	uaC6uGrGmEGhjRzwT3kNANVhzNYYnducMOiseotMYZWzs4+FJJncp3fKfKTXmmVMSo+9m6yVwwRRa
	kxuPGB8nJ3AkpIS1YTExUs/7Hgr0ICkfdc3Nb9cf6VqdwGIORNoXFq8/UNfWxsL5dphaCeJLpjmny
	CNv2/eIXHx+5TpiC6q++EoRZ4yLjcYKtvRrk2d/K4EHUxpmNIgliyDHPQ4r3YQd+NJqfJ7xhQo3Ts
	CUyJ0+8apT/zngLlhxIic+PNijosjrFDvC0yYVeXZHQ327uZdk9U0SSipa8Mq1ibeTV/5L5xqKo0/
	DGuAxjwAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYTDM-009sAm-IU; Mon, 19 Apr 2021 12:41:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTDK-009sAd-A3
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 12:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=p/HWSWWoTTPHevw2L6cq7eVaLH/qmZtDMWKo5gA5XUU=; b=3W8Brq72A1+b74UrZZFtQHb3GL
 27mYOmL8Xn8/U0DRjCOhYoxoxKWGqHFT053BdGEddUpZMjD+Wt7KoYAuNkS4bze2R5kugKNX7L7nv
 kZSQmkyl8f5rpuhPRkGQKRhQUFbDODlm+weDFDuJnPVC7vXNY19DpEgNf3annJ8GQDi2VpZax+bZB
 7mi0H/mFYBlsEowI5lBaTzJKBQ0A+VwFH/Wk+TFGAmE0IP1C1VSNBQ9SgQwZr/DmyGdLrKWM7RFUh
 AH5fC3brnBLlEgXyiNgIOY1o01wK7nytnrCqJmOevZOAr9/w+5esRYIN/PpXJjbIY8QXL0VrZM6L8
 cuJQZfPQ==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYTDF-00BMPP-7E
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 12:41:17 +0000
Received: by mail-lf1-x134.google.com with SMTP id j18so55751053lfg.5
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 05:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p/HWSWWoTTPHevw2L6cq7eVaLH/qmZtDMWKo5gA5XUU=;
 b=tXbQ8r18e9ZyCNfArxHRgnI4urGuTeI/hNZYvNx6TOffYgKQu5bu4oaAu+Dymksffu
 FgftLknwUB7XNzXbretiaIPwWAOg9NNmfkOIgv3otD8kWrAgDqIsi+gvqlmAtyYuYvy1
 gEdzU0EznjCl7g+NLxm2cYo1LrmLBtIILFXPbqqijmpd4J2CCve/l9+9WOwzT3+pqWfO
 pFuGi+SVEAd/37DLrQhOmpga60ux1QvY8JwjeJ0cIzWdQIGt52GG3ST6zBYJuaAh7cdK
 37eDiAQks2SoNcNnMYK2pjsQVvTAm0eS7CYlpY7C+QpMb3YO/+A6KB0X886a1nHJ8C4o
 f0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/HWSWWoTTPHevw2L6cq7eVaLH/qmZtDMWKo5gA5XUU=;
 b=bvI3rGEPxBcOGLgDvBtnuH6Cc/Oae3okaEGru4IbEOGbPiSjgHrJNbXVDKK+zXuBgN
 /FQSgfcTL8xn1upRkq88HMV85ktpgHwZNLaN20cOMppYeTDd31J0vQsrJtfEGVAQswml
 GWXSwAylU0dazyHgUYWcr8ogYLHjR8rBzH2vc+RRdfjoCZ21R5hSqskH1QkDU2YkRlOi
 LMkiJyfj4qlK9WWeNFT6qWzRG7aAKxpzIGHe8o5qbOcegjfpMw5Lp/ukN6jxvvYsBw0P
 59LbN6TKuMGNbmeL3P+noQQJTSJPD5Vtt5aVO6TK0An8GEuE+6KEWTijr6uOaLMj+C/u
 IsLA==
X-Gm-Message-State: AOAM533p3qEPELg03rkvzeh7iP3A0gwlw+TNrhL5KICw5orxoI7TSMZB
 FgElrT0gCGL5VG3pDh7Tt821yC06esIEHNzxd7M=
X-Google-Smtp-Source: ABdhPJw+lLNU71Li+Ai77Nrl0ej2RZ5MkPEn9XmgbDXVvr/H5pUDUyWFDj7xXUnURI+32wiRC6QrsSKISfPaSN7yAtw=
X-Received: by 2002:a19:50d:: with SMTP id 13mr11673676lff.443.1618836071602; 
 Mon, 19 Apr 2021 05:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
In-Reply-To: <20210419135833.3ee22f58@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Apr 2021 09:41:00 -0300
Message-ID: <CAOMZO5CS03F9dDeaUus4WRBv9z_1svx7BqHM=b6PkxeUthGdzQ@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Sascha Hauer <kernel@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_054113_283826_6EA70784 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Miquel,

On Mon, Apr 19, 2021 at 9:27 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> commit bd9c9fe2ad04546940f4a9979d679e62cae6aa51
> Author: Stefan Riedmueller <s.riedmueller@phytec.de>
> Date:   Thu Mar 25 11:23:37 2021 +0100
>
>     mtd: rawnand: bbt: Skip bad blocks when searching for the BBT in NAND
>
>     The blocks containing the bad block table can become bad as well. So
>     make sure to skip any blocks that are marked bad when searching for the
>     bad block table.
>
>     Otherwise in very rare cases where two BBT blocks wear out it might
>     happen that an obsolete BBT is used instead of a newer available
>     version.
>
>     Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>     Link: https://lore.kernel.org/linux-mtd/20210325102337.481172-1-s.riedmueller@phytec.de

This commit landed in linux-next 20210329. I was able to find the
kernelci log for this version and NAND is correctly probed:
https://storage.kernelci.org/next/master/next-20210329/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

The first NAND error starts with 20210330:
https://storage.kernelci.org/next/master/next-20210330/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

Regards,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
