Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7029C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 07:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUdevqhDg/Zi7JssbKJp9CSymRmilnsbmG6LQy+whRk=; b=21u063AiJyR20a
	TPSDmVCO5R9YoR+V9Jxjgswi3jrfoFvyuS/MVNFN1N3ESpNESB8OtpA1vj+yo5gyqxruZceU54vqS
	MifrGxZ1h7yaAXBXIFNqxdHAVb8WRFrwDZz/nzHXvXvlSF1g2fqYNvf9QGLzuVcqkYoAmLgpby8f6
	41NQxxWnVWMbanLjCtKw2r2xwj4DFkiX7QpdH4L6ClrU1sI/zXdWgwm8gArWAljIRlWbqwxucc5bS
	XWdqqIal8sk7IFBCEAHuv2sFQ9Qv+5fDGF0C8SzTcMDCX6m65F6VvGfUFL+wg8kcA+SNds7h2XZfs
	pg9R04Rxlu4ioVaX7yKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntOwO-0074k0-5Y; Tue, 24 May 2022 07:26:52 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntOw6-0074c8-EL
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 07:26:35 +0000
Received: by mail-yb1-xb33.google.com with SMTP id y141so1954588ybe.13
 for <linux-mtd@lists.infradead.org>; Tue, 24 May 2022 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJWKj2F93NghAWdlsPXaL6PXsu2REAfRhsHMxfDodds=;
 b=GVa7L31SPkXGRtdqRY4xJ1bZ0GY6Y3XUnFaYwEvm1BNaY5qE1EHXs4O34BrzfBBLGT
 kXKVxAh73GftnNjF8xA5GJUuhINikT3k5JRm3NRucHv8/ph+2rutnKYz2DEDAKWScwNf
 Q28sXE/5q5iiU6hiY8gsxvG+k2rcLdKGkvz41SSnYDf4fkJkRyChk7hRS+CW9x4gQK8o
 8aNkqnWhnSknzqam7R02yw4pDG1ALsm24e61kHewJuVdKJTrJQYzdUuoleBCCa8AiZ0y
 EmoLeY0nDk6Q3kDWZWToeUTZW3H2dDIxrllKbG9CprvFc6ljJx04fovi1ukjyQvD4WYh
 ssJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJWKj2F93NghAWdlsPXaL6PXsu2REAfRhsHMxfDodds=;
 b=N6XIDooPLHjfvezbq1/mVhVt6AlbWaGQ/cfs/UOQps4rRqfVyiOrC8FeI1EyeLgyi9
 k3cWrcEbL5zAp8ahzu5JtaG4arlvcbZtp2PTC1+0c5+5TbpGMBuLsK+e/Y5Yd9l1ZW1h
 A/+U1Yt3UsMyKIPANFcj6mytDG7/BtJBx5aNRNqjOoUA1esZiV8AH8qc5PjHzJFCr85k
 yF51LHqP0fHs+5BCnZ2h/4cvM2E9DqisriioPSiF5Hq6BkkK/8K/uU9YyToRJlFmPbAr
 uXTkpZ5P94lqjADtezWOYm393WCoUXZPqD5A5OoC8uXFsXOBovQCKTPlIi6ZNuYTO7TO
 Pf9A==
X-Gm-Message-State: AOAM531n71LHmzgWYXfGnM6sXW+NmUTGzeE/NQSsaRVeQ07csHwX8VQM
 MyoB7Ct173QpTjcY8yXk397Z2nmrQBqJhGGiwEbjnQ==
X-Google-Smtp-Source: ABdhPJzHKwBmWdk7X6ijDIcbH7VCh5ViEnNHyoGaOSsJkkOCwAPI7g5KLD8oEqJBq/k3mckknqmLtth1uFFb4CONS5k=
X-Received: by 2002:a05:6902:526:b0:64d:b6ab:f91d with SMTP id
 y6-20020a056902052600b0064db6abf91dmr25689763ybs.295.1653377192575; Tue, 24
 May 2022 00:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220523143255.4376-1-linmq006@gmail.com>
In-Reply-To: <20220523143255.4376-1-linmq006@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 May 2022 09:26:20 +0200
Message-ID: <CACRpkdaJQUY_gaHFqyUtdq2RNry5oGdDxO3T9EjVa9bd40enMQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: Fix refcount leak in ap_flash_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_002634_582280_8CFE875A 
X-CRM114-Status: GOOD (  10.27  )
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

On Mon, May 23, 2022 at 4:33 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> of_find_matching_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
