Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD5EC56202
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 01:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C2824671
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 01:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sV/IPqzq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bh+8rQxw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C2824671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SNdefZVZ8PNl7S4y+nd9/QM7E2PrJC1jlSJoRvoE8WA=; b=sV/IPqzq73UhVGdcI+KRTfbxM
	5ViISTBvbPFxFpHNtBxYhNnslV73rIwgAdvkeKDknpznO0F7BXckPXZ/7p8v/e12+6m5Fz/5IXZlG
	UmGW2EOR8ydiIo/qfGYhgr1z7bPmRg8TZ69fev5ZoerOFlPm06KEgAFdNM6qARqwd4iNfxn5UlZkk
	16Ir8PSM4QWAWnmVusICGJ4ttlWTGMT+nzPgm8v9PkEU02v988zRw5QNu/lktETm1BvDR+8bMu8bn
	BnbuGLmZ0W2uzs9ZM76byq1ZKfKdOc2twS8lpoRz1eIAT2xDVsQqdM5uakk71zgTlEXolKmeYK6zf
	EWgX92M1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfC68-0000sZ-QR; Wed, 18 Nov 2020 01:17:24 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfC66-0000rw-Ag
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 01:17:23 +0000
Received: by mail-lf1-x143.google.com with SMTP id d17so535193lfq.10
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 17:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=upNhDSD7uK2ZOVQ0hHkzhR+LnuCA5mLVwy01zUvUhgY=;
 b=bh+8rQxwa7EjqGdcGJ0qNVsUM0Efy0UbTffNihX5hvdZWSCg13yXcuLVT/XQ+mL3y8
 j3YsVmlBs2K2YkpaHT7okR68fq7dIIoLfLJFfUod/C+v6O0fHrxUPaYU6WvirJjsdGaT
 m5iuhQ0cBW3zH1BevrETby2ATSldsXill6yhSradv2bCdNneCQdasMPdNavDdsDRXbwH
 o5i39TSLtvB1PYLKz4dhv38Xvz8w3kyQcVJa+hDXFJpeGC1uRk55rxjd2WQ8Xb1bPqAt
 k8eetWzgpY6smlLohuJC67AP4sHcQEju41rmUl+whR00O9X00ObqbUmEUq57rqPR26i+
 TwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=upNhDSD7uK2ZOVQ0hHkzhR+LnuCA5mLVwy01zUvUhgY=;
 b=RATsN8Il4WCRsQYo0WDa2LhxzQUjJT6/lGnrxGMasrdfDSWEgrn9O9p2z7S7TeTKPX
 H5qWPDzIcaw4ClcriOxllwfiG51csQSWaEKj9b/eKZDIvcYCVEo2nPGTNIA8wpfBUMxG
 IUhTL+FiDdbOxR6kp0kmf3ZbKd/0U27hdheI7qZKQ5hHLRDoohONrcWXQzY0NuuTgGoj
 wPH1+wYYmOsd8EcCgbeW3aQOgwHpNO4oa48lP2sRfI8tRMJoNnAAKiUUqPrKEWcPgmVI
 q8rQill21SFaXjiXYzHsvsHLG97U+lYS08QnpqTXbiwfQ6+0D3hbvOzoNMbS3lpJpltT
 LGZA==
X-Gm-Message-State: AOAM531Qy/n0Xoz9u3Fxg8399vfkgKuGpAUwmvcibkvT1gUu3NVqph2a
 aVKgLOrccP6NSwVSFaa6ampzptWhfHVili3G993cV8ddG0Wt1w==
X-Google-Smtp-Source: ABdhPJxFHQAIQRDKhTcuTDcK2nXR2ixM+rGNxNiVeK8ytP7bxNblPyvGZGafF5gPs+1iohaXMatPtKjbDdSfBnvUCG0=
X-Received: by 2002:a19:546:: with SMTP id 67mr2520411lff.502.1605662241004;
 Tue, 17 Nov 2020 17:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
 <20201117174845.28684-5-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20201117174845.28684-5-manivannan.sadhasivam@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Nov 2020 02:17:09 +0100
Message-ID: <CACRpkdbaAJdH6FebbpiAV7wmoTA8Rb_vqKyrDNLX9sy4Jv9RjQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mtd: parsers: afs: Fix freeing the part name
 memory in failure
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_201722_640452_E9035179 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh R <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 6:49 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> In the case of failure while parsing the partitions, the iterator should
> be pre decremented by one before starting to free the memory allocated
> by kstrdup(). Because in the failure case, kstrdup() will not succeed
> and thus no memory will be allocated for the current iteration.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Fixes: 1fca1f6abb38 ("mtd: afs: simplify partition parsing")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Good find!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
