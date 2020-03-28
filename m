Return-Path: <SRS0=12Mr=5N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A92DC43331
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2020 19:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23EA0206F2
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2020 19:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CX+/UYXQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk6R1b1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23EA0206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEkGcsd/Bu3Ary7gOuscU8SE/gVlbxvx0iPdkXPwMVQ=; b=CX+/UYXQEpfTwE
	17QKg/34u7+0+KI05BRZjCwT4Ie09ElF3TlJEfU33hsY9JZV5a/1iA7+RghHAi9KTse8+/7MXIbEB
	puM4XTWVr9hX+DUh1gvvit8SXLd3cBK+GosDYf2lceWJ5Tt5fwGE5PFU2OkQBdilRcrN55TnnI3TM
	xvUC7wvR4/NG7RTIFItX4InQHMOEbVXx8BPQCT6nFLEjShyl9yQUxLsaKr3Ffaz7sdQ0FdruUc2BO
	iJ4X3VIJPo0kjVM85iv8o8fJTqDejRe45UDVgEbfcwo/Iw26rb6pQI41FU+suIDgokaNLohhNJ1Ew
	Ihfb32BqdY2sXcavfjVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIHD1-00086F-TM; Sat, 28 Mar 2020 19:33:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIHCz-00085E-6K
 for linux-mtd@lists.infradead.org; Sat, 28 Mar 2020 19:33:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id d5so15973469wrn.2
 for <linux-mtd@lists.infradead.org>; Sat, 28 Mar 2020 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trAZ7+3c2E9vwgXITsLHfzCGAiV33g+/LMj2G5YpbTk=;
 b=Pk6R1b1LT/LUmQbnYNN8YR2/xnALYE93CgQFHg4gnzAGYuKEfSK91cbtT+XLGy5SlW
 MoytI8n682BEdwgl+S/zxNjZ+EVrk6JWEP9Adf2NEnJBgQNZO2DQzsM93ioZpRSh1oJs
 oTpLXh8CCqOgP5838qtn3GWI6XCdqbIVHT2pSUakA/cWJUga/fsJlnbiMPbhiPOo0dHB
 D+Lzaozjy4IU03XwsaqRLsjxpYnIE7kVeGOfRGdDTl0zNKapJ7u0/ocl99XS1A+uobME
 QahbHv4KJMHodEmBvbQqsXgpiSbSL9IjzOYizjmNlU3mMmn6Eik1Ak5WYzSoa79F1k+q
 MtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trAZ7+3c2E9vwgXITsLHfzCGAiV33g+/LMj2G5YpbTk=;
 b=rY0Q/DfQUHkPkrRYYOXFK5sRnZukEde/Y1mkZ8cycYoZUwuo7a5K2wo26TFbOpna08
 jJRcz7o1vfSp+oA717ydgePnhAYbvD02IAMBRw3udvw2dSSpT9pix7jWFO4ZPY5T2BmB
 RPYeGqLEx1T2xHESemlKkf0clCr9HopKtElKDpxFIjXVPSGq8p33eDYTc96spggXuDx2
 DSM5oM7SKkM6TeSjR8+oLlwN5oKjP22Tl4sQLVYYieFqNBNK/hADicAg+Ul6L4AXAYlL
 2AZ7IIY92DeaJ+bxnNqRggDoFer3tRG6wFn/V5qml6pL2moKmiGLXzRbk5Yre9geQS1O
 QQrQ==
X-Gm-Message-State: ANhLgQ2vePzPe6sGcz4ldrzGsA495dF+kGH6WnvgITdWsW0L2Ze1Tw3k
 aJeUTjvyQHtP9mxQY++NJGr56bMvBEOB8xv+o0s=
X-Google-Smtp-Source: ADFU+vsfFykEHM6m5v+A6IPD/7Tgf2c03nsmiMRa0xcmO/pRs/OAOVLveqBx76vuHL7Oofh773L8ofDzpTYFqsiavA8=
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr6018397wrp.184.1585424005325; 
 Sat, 28 Mar 2020 12:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200325212115.14170-1-miquel.raynal@bootlin.com>
In-Reply-To: <20200325212115.14170-1-miquel.raynal@bootlin.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 28 Mar 2020 20:33:14 +0100
Message-ID: <CAFLxGvz3jS2tjDqGvSi1BiJGDjUEdgeoBJF=2NGu_J6V+WoQBw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: Convert fallthrough comments into statements
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200328_123329_258270_10A69228 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2020 at 10:21 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Use Joe Perches cvt_fallthrough.pl script to convert
>
>         /* fallthrough */
>
> comments (and its derivatives) into a
>
>         fallthrough;
>
> statement. This automatically drops useless ones.
>
> Do it MTD-wide.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Vignesh Raghavendra <vigneshr@ti.com>
> Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
