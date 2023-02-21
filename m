Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FFBC61DA3
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Feb 2023 21:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RduxqwmYRB0h7N5W7+ePQSAHIsy0pzYglVVfSzFXl2w=; b=eMJtxm1cnwgGKZ
	OgRECcyR8qUL2OEOMv9C5O3ugIEbVCEz6BPTwpaHMb9AY1imDRrc0+CoPl71zCPzWrFBEjrh6cpwW
	miAz+e4U8QSw6+zdEIHo+2sDGb4PHc4BPY9y8i4CAjuEX4CSp27FxmAI7WvH31A/jSkTJXpbi0+iS
	ho3bmjxDwAgjcrGEMtYQSVWCbls8bLfxg4tO9qEo/m9GmvlA6zaPlMXLXuVP+pmg1lz3+Ae9iWPiZ
	5qVPRR6KF8kcLq2/PTEOZvaqPNKCWQWqRfglZ19K7HxTARCxQs4DknfsgskLzReP3P96RUUjTuMN1
	isPq1EFhTe1pNTAPQpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUaEl-009pXp-Vk; Tue, 21 Feb 2023 21:31:48 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUaEj-009pWw-Hd; Tue, 21 Feb 2023 21:31:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id g1so22465105edz.7;
        Tue, 21 Feb 2023 13:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WokcBLUnLSvFGi3BJyxHBNtjfEojDdGdaUBZIAtdp4s=;
        b=Z8fWeEjGHvPG6JVdryyxrCdAVI3nC1xgRLImgd5JYTLys0lbg6K9T9/bKIVU2pxAYq
         buyL+iGVc8ZxTzavZWiNk2peOlZUn+afRv9/LAf7YibQppVfDrabdLNyPLBvNFEel7FG
         Q6683yfIWP/EAL9pj4GrYv7q5bPSzT7lqTMMafhtQU2MAhzx+xlDm70LbkZOdMmpVm2k
         63T8vwVi4R9kVuF/gjxJStgsO2uST8/J7saB2E3On0KG21kGz/Td1ul3t4QugFSxJ3O6
         JUOMS8OtHGg9McIGMJlqhize/zO5ft2pWzH43XJAIYHPYhih0MCPIxu3IMjAu73RSUwI
         AhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WokcBLUnLSvFGi3BJyxHBNtjfEojDdGdaUBZIAtdp4s=;
        b=OOirkP5AX9Zuy4LzwV60hCEoKixI0L0vZ5Zy9Ljic+UpFYOgMJZ3HYISarZviCEBSh
         8sLfh0Pzom/8tOwOpALzdr9wtT1Ka1f6RqWbk7Q4PETviL5df66MbZyTy4kHyugEWd1k
         fbB81LcUBzWV9g5JUQ1fQhwEDzqYg5V0FYjFFizFvGzRMco9VN9Bw+cYYNasKU5feV6N
         lZbOMWXW+iXbzdf+8zXrkSB1lYbYTZ/K3w7NTT5qHsMSrvjEhGABak9rkUuxYe9FtQpm
         modrDTJPjMZjCPBDHypZR+WHhLwy2NovBmu981PmOcOpT7zcdr0rMUjs2eCczpH6tUkN
         VQpQ==
X-Gm-Message-State: AO0yUKXu0fCLrRSrEsPWKIFwiDSwEEbR0eIoA5fZQ71Qjrsi8Mepc1Xy
	LVtk3OP5kMsKtyCNyMd8gOYUTXNkBsQlSSxXK7M=
X-Google-Smtp-Source: AK7set9vk9Xi3fa2gAaKh/M40NvhtCdUZG0stm4aPGsfWumGGlTYYztJ7TujIRU+FWLYsnYhvWwu8Kb2bpljPLahEZc=
X-Received: by 2002:a17:906:8144:b0:8e3:da0f:f9b7 with SMTP id
 z4-20020a170906814400b008e3da0ff9b7mr866379ejw.4.1677015100846; Tue, 21 Feb
 2023 13:31:40 -0800 (PST)
MIME-Version: 1.0
References: <6474e163-e61a-e04c-590d-60c674dc7ed9@sberdevices.ru>
In-Reply-To: <6474e163-e61a-e04c-590d-60c674dc7ed9@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Feb 2023 22:31:30 +0100
Message-ID: <CAFBinCCaQ1fwFmV=CtihP+peFGTiHfVXtdKmQYJnX3a+-wNuzg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: meson: initialize struct with zeroes
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>, 
	Krasnov Arseniy <oxffffaa@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_133145_622828_9097A76D 
X-CRM114-Status: GOOD (  10.96  )
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

Hello Arseniy,

On Tue, Feb 21, 2023 at 11:07 AM Arseniy Krasnov
<AVKrasnov@sberdevices.ru> wrote:
>
> This structure must be zeroed, because it's field 'hw->core' is used as
> 'parent' in 'clk_core_fill_parent_index()', but it will be uninitialized.
> This happens, because when this struct is not zeroed, pointer 'hw' is
> "initialized" by garbage, which is valid pointer, but points to some
> garbage. So 'hw' will be dereferenced, but 'core' contains some random
> data which will be interpreted as pointer.
I think this should be written as "interpreted as a pointer". I'm not
a native English speaker though, so I'm hoping that someone else can
provide feedback as well.

[...]
> Fixes: 1e4d3ba66888 ("mtd: rawnand: meson: fix the clock")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Regardless of my comment above:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
