Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2571C10F00
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 14:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 914DE2171F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 14:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWxRwhVa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW9dLhzw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 914DE2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptgClD+cvtH7mkwh589Tk/dR/6qncWzXaveVh+GxIAY=; b=mWxRwhVam8oN5F
	+R2M8x+MsTevWwntEeWKXa8/o2ZkqOEGsrQsdqVTxuRyHNstS5+HoRLCjsvztlzcr1l48a6qG+pxo
	uJH+GJnDl8mxf55R4N8h8VrqAF7j+MVcbTkrUZquBFsVfyX8G81Gi4txKn8R7wpBuRkCJtdWBk62m
	EMgx1MMP68lYtzI3gAG1v7GFsJAEaGPX6nN9ejJhWcpVhvFXgDww0Emc3dRouaxaluSpy1nUIVmPz
	yl4+1sZ0zKIl9hXXN8HhilgYw8l8ii5/NqBU6F/K2yEUqiuNq5LP/GAiys21ILXcGyDAA3PPcb3cx
	R8gH7A38mw2BMlbz17zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzMdf-0002Zo-68; Thu, 28 Feb 2019 14:26:19 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzMdU-0002Os-Av
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 14:26:10 +0000
Received: by mail-pg1-x544.google.com with SMTP id r124so9804706pgr.3
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2019 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=TPH1F6QaQBZy0OXRSFkFddIPa1FgO4WXkmvghRdHxvw=;
 b=nW9dLhzwtKcSF+9EcYgMks9YJfTfXaGZWsLZvdaKyOpc4zAMiW/DxV5nxG3ALRkTlV
 4Pta6iIdHT1UTIrcDuzjWLL6M4oEDi+9A3dR2GVhins4FO+kVC+MEwlzq/JJX5EdZF1v
 7sq3sqTazQScjcLk6gGpdNu3dNaOgxPh6gnyTRYXSZ7roZZ2Q1IUlcfWqOMij29id0Y5
 a+11h/1vpI5pHjJuOpLl61xEhQ76FFqgeY4jN24eoi/2X6z/GO5ORoNF4wCuhs/D/e7y
 AC2llNwgJD8M7xesx2imWhdPinAOxXzdS1PmbF7GIGNjN64vWV3DAscmQ/pUBpEGYEqo
 YStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=TPH1F6QaQBZy0OXRSFkFddIPa1FgO4WXkmvghRdHxvw=;
 b=i9XxLX2cXWSbyeIrkQsaq5HWF+xRK2qNoQ7pl38qOUzgdIsM2+mpheFrRqFMiwuNn3
 eufcwrxbiiKAFnC+cFtCPE2zP6k/xjFQQ3K0GYPRV8TV8yBE6yb0iGfWA8slFjNyUBHe
 CySORXkQl3VsJDfCNpvldqcGhd0aAgl2tawd5ujEmc/jUq+YD87tkdfmM/Aw8zfb59pI
 Ka83fsHpU94GFmJovb9p6W0tYiygv+CpZO6Bp6n+SpA34pEcOMr3QkiUlPumMu2D81Ja
 6ppefwO4ZY1+38JB1FGX/GeW0Nm8LesezetPX8qBZeZ2D2XI5L0AMZlDH0akujCBQ+s+
 VoZw==
X-Gm-Message-State: AHQUAuYuomOHrLyRUbD8E9bwZ6ir9gKdBavHN/8QJXSECicT9HhwDAEP
 Df90Uxyl9r27CsvjP4jDzVA=
X-Google-Smtp-Source: AHgI3IaIfiBa+SKpNvdBXqmBfF/E2jePBuz8TGy/jNmYQrv/IjNM7Es/QWtYG24547o5JdQDK9ur5A==
X-Received: by 2002:a63:2bd5:: with SMTP id r204mr8924602pgr.48.1551363965942; 
 Thu, 28 Feb 2019 06:26:05 -0800 (PST)
Received: from ikegamiPC ([240b:10:2720:5510:f9b9:4f97:abd5:501b])
 by smtp.gmail.com with ESMTPSA id y70sm22777080pgd.6.2019.02.28.06.26.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Feb 2019 06:26:04 -0800 (PST)
From: "Tokunori Ikegami" <ikegami.t@gmail.com>
To: "'Liu Jian'" <liujian56@huawei.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>,
 <marek.vasut@gmail.com>, <richard@nod.at>, <joakim.tjernlund@infinera.com>,
 <ikegami@allied-telesis.co.jp>, <keescook@chromium.org>, <vigneshr@ti.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
In-Reply-To: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
Subject: RE: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Date: Thu, 28 Feb 2019 23:25:54 +0900
Message-ID: <016001d4cf71$865e7b60$931b7220$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHOptjmAmqem5WpXlLpfOi8uScBsaYBk5wg
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_062608_394560_CEDE5ACF 
X-CRM114-Status: GOOD (  16.84  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Liu Jian
> Sent: Tuesday, February 26, 2019 11:01 PM
> To: dwmw2@infradead.org; computersforpeace@gmail.com;
> bbrezillon@kernel.org; marek.vasut@gmail.com; richard@nod.at;
> joakim.tjernlund@infinera.com; ikegami@allied-telesis.co.jp;
> keescook@chromium.org; vigneshr@ti.com
> Cc: linux-mtd@lists.infradead.org; liujian56@huawei.com;
> linux-kernel@vger.kernel.org
> Subject: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
> 
> In function do_write_buffer(), in the for loop, there is a case
> chip_ready() returns 1 while chip_good() returns 0, so it never
> break the loop.
> To fix this, chip_good() is enough and it should timeout if it stay
> bad for a while.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check
> correct value")
> Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> Signed-off-by: Liu Jian <liujian56@huawei.com>
> Reviewed-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> ---
> v2->v3:
> Follow Vignesh's advice:
> add one more check for check_good() even when time_after() returns true.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6..3da2376 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1876,7 +1876,7 @@ static int __xipram do_write_buffer(struct map_info
> *map, struct flchip *chip,
>  			continue;
>  		}
> 
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> +		if (time_after(jiffies, timeo) && !chip_good(map, adr,
> datum))

  Just another idea to understand easily.

    unsigned long now = jiffies;

    if (chip_good(map, adr, datum)) {
        xip_enable(map, chip, adr);
        goto op_done;
    }

    if (time_after(now, timeo) {
        break;
    }

Regards,
Ikegami

>  			break;
> 
>  		if (chip_good(map, adr, datum)) {
> --
> 2.7.4
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
