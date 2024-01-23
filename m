Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5942AC47DDB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucHb39qrpTFam4Yj5APGS94bCdX0iGwLfwfGbACtM0I=; b=A1WnDCp64d4DHA
	HWaSfTdgdcu1rwhiBv1lOmksCImY3Ktj9+EMG7LRMdAky9rRuDEKMGDkl5ANSJRHfMMDBHhpEnuUN
	WV4VGW0/ACqalVkElrz6W34wR9Mtcm+affNxltsh5U0eBObW62jSNys9HsNXiV4sd0zhq3ZhU32Kx
	iARg0p/QdQX5oLbSY78OXRoaa3tRGAHD1LXXPOjebZlbReBkn9kHRDHb0QH6lxj9ZY8AlEPMdesu9
	dChZZNo8GMboy73TWQU4mAf70gI6o5zTQ+i6I8u2VM3KKST+sqIUveLcdaIGMk6sPSFOFf1y2wglC
	ndY7WeibgjGwFbn1nGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKyd-0000UB-25;
	Tue, 23 Jan 2024 17:54:23 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKyb-0000S6-04
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 17:54:22 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2cddf459ba2so9814721fa.1
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 09:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1706032458; x=1706637258; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ymav3I7OIfk8X1HSTDNWXcyiXMBoEN1DizaaPQT1+Og=;
        b=nWNo1Qo/IeuSCeonxSoILpENiQq1UYqKlQNVs5YTo9vC6PUiz5J3IknPu6WY/o0jML
         gVL4Lq3YOlx3YyU2lDV4xTx9LkqT1jlLzys8y0pbwkld8MjlBM34682BENeEndvYPZmK
         vkqfeaSndyFWC22pNtmDboVNFxi1Qrb90nSNvgJOY+8jocvW8EeTcqojTpVgzwyz/4yf
         rTD06lbjEluWxOQGkS8Pde+texH8qW7Pgd5J6D34tB5xWFNfnHJJmrosvkqkN2HLiZrg
         7PZwLwmkp/sz75B/G9ywR/1t3/F2h5lesxaQe72zllQPfgOQfL2M18nym1SE92JKafU/
         u4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032458; x=1706637258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymav3I7OIfk8X1HSTDNWXcyiXMBoEN1DizaaPQT1+Og=;
        b=ASCUGWvVt6CgegXpESz1BZxMu3UJomlE4RcflNOGfy+bS10QL4EqxDolGqDGqeuAOe
         jORDXnbkVwgbEqPE8kw8DEzBMdXq64oajS+P1HS0lSLj2GvOgvnFpYTKgwMudZiCodZK
         lq51B24HzFulSeFPy4/FIlVF2CFUEZfSrpvWBRooSq27/eshqwMxKqwdp+ycix0l8KY/
         5jBibH+6I9bbC0HXMmqc4FCwI4wnQRX9K7YV/lOpX+flFcd7kopteFTDQ6zTqV7nThHO
         KwWJ3OzbKTfOi9CwJlfdZx97aohl/+aDfMF7KHEvQBE35alzfW0Xqmp94sm8WfJ9UcWx
         P8qw==
X-Gm-Message-State: AOJu0YyGC7NwEVIMaKO9/oGHKKV/VLw6nMrylW25uwGKIOwXHMPAbhok
	Mht16qzyJi0zjwd93hCoXK4Ye+UT/Vx4cftpgJ0B+LkUPGenL1CSe6g7tLMD2AlZ0jJvUC+G/3P
	tRP3IjrgaNPA8tNnrujZS/uPReL9lBOr6OwNgMg==
X-Google-Smtp-Source: AGHT+IH5dOs4rVeRzijl7xfb6jmnW4/fJGG1C3+Cm0MCoVfunHt5sFT98pbl+4uKUnCzDyMItW8DhqfNf16B6C/6jm0=
X-Received: by 2002:a2e:a4d7:0:b0:2cf:d52:6ded with SMTP id
 p23-20020a2ea4d7000000b002cf0d526dedmr1804740ljm.3.1706032457838; Tue, 23 Jan
 2024 09:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20220413083824.247136-1-gch981213@gmail.com> <20220413145843.46a3d9b5@xps13>
 <CAJsYDV+3J0ipbR+N-xE=DH-WXsjierdHe_pJtKf1Xbt7fdaiWw@mail.gmail.com>
In-Reply-To: <CAJsYDV+3J0ipbR+N-xE=DH-WXsjierdHe_pJtKf1Xbt7fdaiWw@mail.gmail.com>
From: Ezra Buehler <ezra@easyb.ch>
Date: Tue, 23 Jan 2024 19:54:06 +0200
Message-ID: <CAM1KZS=tvEi6fed=BoynpkjfzZqKGb-wv+CVbVmAPYz5tNaNkQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for ESMT F50x1G41LB
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>, quic_sridsn@quicinc.com, 
	quic_mdalam@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_095421_231896_5FADE708 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Chuanhong Guo,

On Wed, 13 Apr 2022 22:50:43 +0800 Chuanhong Guo <gch981213@gmail.com> wrote:
> Their device ID aren't conflicting yet, so nothing will happen
> at the moment.

Since commit aa08bf187f32 ("mtd: spinand: esmt: add support for
F50D2G41KA") we have a conflict with the GigaDevice GD5F1GQ5UExxG
(manufacturer ID 0xC8, device ID 0x51), preventing our board from
booting.

> There is a solution for future conflict: Recent SPI-NAND chips
> contain a parameter page which has the exact chip vendor
> and model. We can do one more detection with the parameter
> page content.
> Winbond W25N01KV is a 2k+96 SPI-NAND with 4-bit ECC.
> It uses the exact same chip id as the current W25N01GV
> (2k+64 1-bit ECC). We need to support detection using
> parameter page for this crazy decision by Winbond anyway.
> I'll try to code something for this with my free time.
>
> My current idea is: We first do a detection based on chip id.
> If that failed, try to read the parameter page. If we got a
> valid one, match the chip vendor and model string.

According to the datasheets, the ESMT chips actually have a 5 byte ID,
the last 3 bytes being 0x7F (JEDEC Maker Code Continuation Code). Why
can't we simply extend the ID in esmt.c (as you had it in your original
patch) and increase SPINAND_MAX_ID_LEN to 5? Or, alternatively, only
extend the ID to 4 bytes?

If that is the way to go, I would be happy to provide the patches.

Cheers,
Ezra.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
