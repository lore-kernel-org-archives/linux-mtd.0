Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B6AC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 13:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E992083E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 13:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYKAIYAR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qShOuaXm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E992083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yijl7mE9LG7EE+JpAHdpvZK40nPhY6UTT+3Mr28+aHg=; b=SYKAIYAR7gt1Cu
	ZUvnKtgkXskmzxDR71b07fc229XQAWlcH09ZpH2howy8kNf9wW6tJUgeQrsiHRSgG/E2Y5EIhDFQ8
	gMDHzNod5wfTd0jDexMKeA0vNpTdnyYCV2Jv6hzvRua7KCPZhzQICYC7/wA3QjuUH2z756IuJhLpb
	F+sjunH9xWAxaY1bDhx77iWPpCqN67/oc/KWjzAvAS4YSy8TqwdSgxp3O0/hUxy/A9n4iWBcu5EpM
	G5cRUXX9zk183fpkzZP2zeQqH8xnbb3XogaSCdiP2JPXfvxwL7xk7uTYbCLBJ11yKQ87zuQGQaNnC
	9r9T5i44m4+cAXlMwC8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hECvD-0003lM-Sx; Wed, 10 Apr 2019 13:05:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hECv5-0003e2-Pn; Wed, 10 Apr 2019 13:05:41 +0000
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB696217F9;
 Wed, 10 Apr 2019 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554901538;
 bh=QrXNsTj3UCRv+IFfAkumwwduoBEVW21RnGj5GpIvyjI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qShOuaXmr/XhiRScUWM28aAwAhULyd5H8OsappERIlz3bcEn9nFq9FR5I/0G3N36h
 8bWnh9DNi6mYprrHfAH/kD0jFcuRk9gwbaTJenMLpThx/KA86bwnCq1ccFFlwSWbu1
 5dKNCdowNFgd/MPUuwhS59cV44aPEONcJa+NdbHY=
Received: by mail-qt1-f174.google.com with SMTP id w30so2675080qta.8;
 Wed, 10 Apr 2019 06:05:38 -0700 (PDT)
X-Gm-Message-State: APjAAAXvY9yzVYA7xYMHvTqNict+xoCYq7zSnXOtXE8sPxrUHUZaT95h
 Gg1Uxmx0XppYq8vS/CNRg6U/6PAnxZXMHOOvhA==
X-Google-Smtp-Source: APXvYqyUW++FdC3qHiedwEgJ4noPqVY54ncZULcbcS77fsDPd0iWFkkq1CtD4e8XWCFdKdOAwnVUTXIWN6i329/Wy0o=
X-Received: by 2002:a0c:b656:: with SMTP id q22mr35346566qvf.205.1554901537915; 
 Wed, 10 Apr 2019 06:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 10 Apr 2019 08:05:26 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+aXtRSAUoSLxSK2vWj0p8uXMhcr+kfd=60BmdK1agvJw@mail.gmail.com>
Message-ID: <CAL_Jsq+aXtRSAUoSLxSK2vWj0p8uXMhcr+kfd=60BmdK1agvJw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_060539_861723_4C242349 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 3, 2019 at 2:48 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The NAND chips in MTD have a bunch of generic options that are needed in a
> device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Fix the regex for the NAND chip node
>   - Move the minimum into an allOf for nand-ecc-strength and
>     nand-ecc-step-size
>
> Changes from v1:
>   - Removed free form text binding
>   - Enhanced properties descriptions
>   - Fixed the SPDX license tag
>   - Added minimums for nand-ecc-strength and nand-ecc-step-size
>   - Removed Boris from the maintainers
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 143 +++++++-
>  Documentation/devicetree/bindings/mtd/nand.txt             |  75 +----
>  2 files changed, 143 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/nand.txt

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
