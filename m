Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423D6C5478C
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASd6g4tCwGEToQ9HCVILbJeXj+7rvqEji6DddSG7mag=; b=WyPWKJBzYQPMnc
	udFNIhX5lNkaY88eXGGJ9zx4TmpIWEvOEWBmn+SpBOxKdOHBzjnhoxUuL7Si1qgggto4ehomeb+Gf
	r5+fe7DLs2j0DLvC2FgfrNhdU9curfx8/6kkpjBT4cso9/fGjp0hiE/0COgs/G2lu7lofTzhJMORa
	64XFuNeC/VNA5oFleHjEOWUYe3uC2QXytUE5PPmr8p7LhcLQpbSmzdBd5cAbmQcxo2zYsqnDO9h05
	3PWzwGhm5jatGSAt6773KKJ8MTW+q5VKubJ6nZJ6K3r7r3mLdXVqYAdDX/2mHsh8QTqtrIFhkPUuv
	JIC+4xUymo/v7VxlyN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retq2-00000004Y5G-3FJD;
	Tue, 27 Feb 2024 09:33:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retq0-00000004Y4P-24mt
	for linux-mtd@lists.infradead.org;
	Tue, 27 Feb 2024 09:33:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33de4d3483eso906494f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2024 01:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709026402; x=1709631202; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO+fVvYT4dAHrJttHWDIajXQWAvXStDBe6OqNkn5JDY=;
        b=GjGWwi5UgnsDHUAQpAVVNSL26ZDmrLzLLkMa1TvBXFFHYX2Bvb6mWyzm/SFjfao4ih
         zUX5kTI3lcbBfcfmlwAk1Jhh+wUs341QYoiSlg7eF449TLeQLXGbEpkZGMB/GdeuIVlt
         JjDDkIYnUgARa+Tg79bXi2YNU2C1PDZbEHInRpb+PvRAqofxrfdMe1Ii4rR4lK15jo6Z
         jLLiu5VMXLKJeOkgGSQLDklM5JyDvJm7afExVIObzW31Hb6njWfMT4jivwxyxoXC1Zlo
         b6h28EZAs/WRA7/jtU6w4mP7zDv2WkBY5jDxGLas8EoFgORwg6GQGaOZJb/zPOvjrXPf
         L27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709026402; x=1709631202;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO+fVvYT4dAHrJttHWDIajXQWAvXStDBe6OqNkn5JDY=;
        b=MHR+C5UYSPGwUb3JN5ZTJbDakCNbNX1Pn/Vog1NTN1S/3Nq+IlYRByyKgWW6wsD7Pc
         l7qHgEG9y+pZR8Mh3opkD1wCGEzOy9aW32tPV9hF7RDDYj5UsvCOYAKuNyJ1dPynsEOu
         fH1W9tEnjZWClQGwj8kY4O5NOC2nmLugSv/7IcEcJ5YDhqKYcTcqIHKWq3NmNBCOUjLI
         TNCSrP94k5GM6qc+4c6Xqv1K+cawT+Zw+MtdMMoZUR4ozMpTXNr/9oFqY07T+/bfy0tC
         Ca7fJZ7REZMlR9QXGvHYlVprq57EfWXHsbrrTMV2+pf0v/LDE1pir5PDba0Trii7S93C
         AKeg==
X-Forwarded-Encrypted: i=1; AJvYcCVivuhgz/579Iu/B5QxCbKFIvN7AIkgOKpbcrIwdmwKLHkKqClmFdTXItzOaZG3x3xGTt8rR6kpsei+1PsJq+2GFRR0Q/JhxwLarBhGUg==
X-Gm-Message-State: AOJu0YwrdPtfLbygthh32/DndytRkIsQl4BrLrMDCLO6Mri4cFoGaNQE
	ZS8ZSUw24sAvty67atxylHgxfuZMUMJDybdykTKN97IU465YVJY7
X-Google-Smtp-Source: AGHT+IG52GbGx7L1akWKfhHhkraAZLo5t6gUtoUDZpAOXgAOO4xK/CVxXGuQV6KkJ2HPJ5K0/H+4Kg==
X-Received: by 2002:a5d:4743:0:b0:33d:73de:d552 with SMTP id o3-20020a5d4743000000b0033d73ded552mr7058498wrs.61.1709026402016;
        Tue, 27 Feb 2024 01:33:22 -0800 (PST)
Received: from Ansuel-XPS. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id ck12-20020a5d5e8c000000b0033d9f0dcb35sm11061913wrb.87.2024.02.27.01.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 01:33:21 -0800 (PST)
Message-ID: <65ddac61.5d0a0220.a0c6e.35bf@mx.google.com>
X-Google-Original-Message-ID: <Zd2sX0qUNY0ew_lE@Ansuel-XPS.>
Date: Tue, 27 Feb 2024 10:33:19 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Bauer <mail@david-bauer.net>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
References: <20240220200325.19089-1-ansuelsmth@gmail.com>
 <f7c45e7b-993c-444b-8710-042da7512bbf@linaro.org>
 <65d9d08f.df0a0220.988bb.3177@mx.google.com>
 <CZEVS9033HET.1NPH0K6PQLR87@kernel.org>
 <4d117770-6e0c-412f-ac1a-d9ba84b5b4ba@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d117770-6e0c-412f-ac1a-d9ba84b5b4ba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_013324_562296_D149603C 
X-CRM114-Status: GOOD (  19.80  )
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

On Mon, Feb 26, 2024 at 10:53:34AM +0200, Tudor Ambarus wrote:
> 
> 
> On 26.02.2024 10:51, Michael Walle wrote:
> > Hi,
> > 
> > On Sat Feb 24, 2024 at 12:18 PM CET, Christian Marangi wrote:
> >> The user just tested this and It seems there is a problem in JEDEC id?
> >>
> >> [    0.726451] spi spi0.0: setup: ignoring unsupported mode bits a00
> > 
> > What SPI controller is used in this case?
> > 
> >> [    0.732850] spi-nor spi0.0: unrecognized JEDEC id bytes: 68 40 18 68 40 18
> >> [    0.739725] spi-nor: probe of spi0.0 failed with error -2
> > 
> > And what kernel version is this? This should only happen if the SFDP
> > header is wrong, but according to your dump, it is correct.
> > 
> 
> I assume the test was done on an older kernel, where the identification
> of the flash based on SFDP is not yet available.

The test has been done on 5.15 and 6.1. The support for this was
introduced later? Can you point me to the commits so I can backport
them?

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
