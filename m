Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DC8C47DD9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 02:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+qfNPJ8A7ypvIGtE5falhmzX4WaWGWQlNXJachNQnY=; b=P5U8zT79/FzRcI
	CqUIbXNLqbAh1HfC0ytwzCaw0Zi+AJXSbnD6Ps7EjISxPbUFgTMGXs1g6mqEGeMZBs3ro90WE8U7j
	Uz8wTqYq9h4feW3Q7IohCib24FGq1sCemXydx2/WmOOrt1t5SRu54EpI/UqsTX3iY6+KP2QWtxpLQ
	faNVKNQmkxQMg0requgVS9Je61A96KPWtE+RhinSLp1fnb7bJcwjdtLNCP9j1B3D8H3osOrJVCvEh
	1Drulq9zIe05oqkD8FQ5PHVf0Yfi7EWqlKPKPCPtoWhGuUt/dh0e4d+WsFD5DHawR73OSWkLuHxZh
	9XFi/R+hxUoRYeHOU9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQKl-0000000G7ll-2BLG;
	Mon, 26 Feb 2024 02:03:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQKi-0000000G7lG-2Z9Y
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 02:03:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso3059684a12.2
        for <linux-mtd@lists.infradead.org>; Sun, 25 Feb 2024 18:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708912983; x=1709517783; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4cpaHBEdPSwYMPzpDqnA+dJ66X3qsQRUCH+N+Yn5wA=;
        b=nqXkxkr8VAJqlkHg+BYzu02klwaq4yk/aEfRtVwtd5G/7H2da0cZEzZguL8MihHtlV
         5HjI242QcdKWVuCDF5vodl5EIr0g9jDZcvANPXQBnpnWcwxNDXxry+0Ty+WrQYUv91FZ
         iUaO2s9PObZvWZKcH4WAy3AW/sKtdfFE8IW+yljWoSlGhL8T7NlxF9XVkYd+d6fDY3uq
         MeOXmeA5OLpf0InFulpA9wOoCEgH9OHhf6vlu17Wi4WQxtwBTYjkVbsZhGxzN6rKxx43
         qVQ9jLO5ixjU187jqJ+22evkdE4fNiv2k6E5d2ZlNNZaqfAxhYSqJ9NePpxCjTjCCAZr
         gJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708912983; x=1709517783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4cpaHBEdPSwYMPzpDqnA+dJ66X3qsQRUCH+N+Yn5wA=;
        b=OO+0KZX/h6P+QAQ2be8WlX540IreUswaeU16IiLDSuF4QHRbxOm3l4Tv2GlXHjNman
         fhivVpNpsMO93jwrihN9iQ3pIdXbMy1QeSWQT71xtc89+4mIAudo67mG/z5zRlnVd2EF
         oh9lREMl7cQ3By/06DzhbcCCSADIRRKBqvYXtin654dGVi1jkxJ/S5A4rU2beBa+kWMl
         +az6dHdDuMVyd5/wzok1hgzm4ZyDNdVmBXKr6d7NHBIleK81WfyJIPN7tfnm5drwA4/t
         W8WUYTfFogdqr0FzpK5YFePe5ZIdm9AzdYTnFn063pxixTaEDPgpdmXfQUXo7NyQCrjD
         IC+Q==
X-Gm-Message-State: AOJu0Ywrbk/HisKt+D3h9n5DyH4xXVtG62s8Oi888vm7WuBj9kxLl1xi
	kRGl7byLxF+ybdsh4zWeAc6cGN1C2+/401tLyUQGaf/Ua0GfJsyAP73jAbwCNEt8oVwm7Gi7iRY
	NEgiVq+CS9QTmZl7aO4UaN6jkxWo=
X-Google-Smtp-Source: AGHT+IEwG4fJQD3kx53nN39VRnBZjVmb0USWLLq2/UFkAVhbtU/RhqBXA8UMx4wIPqZM9NwIMAP96pMulpvNonxc0mo=
X-Received: by 2002:aa7:daca:0:b0:565:ad43:2229 with SMTP id
 x10-20020aa7daca000000b00565ad432229mr3033648eds.15.1708912983382; Sun, 25
 Feb 2024 18:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <75a22482-0d2a-4e0c-86e8-3a8e71f2f403@linaro.org> <CAAQoYRkVYjs_+7cSc5oU4qKoi3_5My8xk32RWq3O5V5D_xBg0A@mail.gmail.com>
In-Reply-To: <CAAQoYRkVYjs_+7cSc5oU4qKoi3_5My8xk32RWq3O5V5D_xBg0A@mail.gmail.com>
From: Alvin Zhou <alvinzhou.tw@gmail.com>
Date: Mon, 26 Feb 2024 10:02:54 +0800
Message-ID: <CAPhrvRTW0z950mZsuaFRW0_vs1NmOU+L_FKM_64UdTwLwVsQzg@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Add octal DTR support for Macronix flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, broonie@kernel.org, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw, Alvin Zhou <alvinzhou@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_180309_202862_D8DE84A4 
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

Hi Tudor,

>
> Hi Tudor
>
>
> >
> > Jaime,
> >
> > You're so close to have these integrated, I see there are no major
> > comments for the patch set. Would you please address the comments and
> > re-submit?
> This patchset would be take over by Alvin.
> Thank you for always giving useful and kind advice.
>
> >
> > I plan to do the PR next Monday.
Because I just received the patchwork from Jaime, so I need to spend
some time studying the comments to prepare for the next PR.
Thank you for your understanding.
> >
> > ta
>
> Thanks
> Jaime

Thanks
Alvin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
