Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF59BCDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfj0BuIeS6wYk0huiuP9I7KXYi6f7wm1JeBsIJevNs0=; b=hBeBy0t9PEWF6Z
	CAtWMYru9Oj5lDXmhjO549pc1zZ9ErpBIfWH5E+rYYOzS0J40pSX92zMz5BPIuCbLHpzwNTzPSjJ2
	cfYT77mzJMvbnXvEiXcaBxpyHt27cpVetBn4VXaQ4J9g/wGV8GLzVT/kgaZCpHMOj3sYSIzx9CqBx
	nFfu8Y/iA2OZNJNwqBZwsP6Mbb4l4Bg37tylnoClw8FYIV/gS5SIns7FeSRpylwnv3eSEVH8pdDRS
	+WHQjZPN9pLG+ajeC9ojF8K6n3MlufGprf747oCbETwZDtxW7y9y5F6dzGgQqjMgIA0/yUh6D0fy6
	2rQYtMN1osmSJP5HifTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrid-000KI4-0l;
	Thu, 12 Oct 2023 09:10:59 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqria-000KHE-1n
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 09:10:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-69101d33315so612376b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2023 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697101853; x=1697706653; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6WBoaIu84THz25YosUhISwHv1KIlz0LPT9W4T5S98to=;
        b=X2J3AEFnvq04AKJOi/pLwiDGsbGHZ2JcOU9Sf0768E/0BzNI+8S6IBwZ2VfO1tgdia
         4St/Bxt2SBFz24t7t1etEneVch9FE5p2nzwGBSJnJm916iM4gZRyvENKBA+x8bPvmCUi
         mMy4HNela0VU1qQQPrx6XgaPo0EuL1uFGz6DMcUJBQcz4BlFXXfpYEi0/Liy+tnkvCLh
         LcxwDhjws12EJkxM4+GkGHJ7fRuAGsxUSPBfBbzECiW7PGv/TwJ4HdmuCFdzB6vlNo6C
         g5MOvWR8bnK89IimZ905B7uSJE6Txf4GhBjlSGtLSi1bKB58RTw06hSL0JgFPxJHyWaL
         uZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697101853; x=1697706653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WBoaIu84THz25YosUhISwHv1KIlz0LPT9W4T5S98to=;
        b=f8SHpUXiTbJAuTlCPG7+1F8Jr7gXhUO/J5QOKhv51hL/du5ty3O5u95Vi/YnhBqtGN
         G78adu1s4lyAzGRwHe2cESVHUswg3jjWoKKcA4otIrxymMeiy/VGlWW69uBx7w4/xTE6
         5dqqC1F1QXUObATl3FFzjZMXCdV8fE9tZ8Ogx4T4j9k1lOdTFu/7TNyaKvCTOTKyAQNl
         eZDwNLOYWfHRjPoLzvXueVYBR19ET39gIyKObNuraD5r6Wzm5ccMmLz+cT97jOmLSOV9
         9SMYaaCj/KtnMyai7p+Tu71pvttzMNTY63nhf7+Jeucn3lZGBcu0NHGTCNyPuYuLy6V6
         SrNg==
X-Gm-Message-State: AOJu0YwP3VaR12d9ZcRiY6BwHApIEIHRSf8h3eY6Y0RtDOtZCAZqL11j
	L5mIOBQmlFugLdwLGgMswnWIKOeA3F3V+15W+m4=
X-Google-Smtp-Source: AGHT+IGlb5CEc31ku+WiBiZrhYmn5ATWcH+zJz/J8rFbNMYstKteCKHWdEmdssxDzAsHPLo/H0aBh25h7K5rFeE2S4s=
X-Received: by 2002:a05:6a20:6a28:b0:15e:5e8c:e45c with SMTP id
 p40-20020a056a206a2800b0015e5e8ce45cmr23689682pzk.30.1697101853631; Thu, 12
 Oct 2023 02:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-4-jaimeliao.tw@gmail.com> <f950812e-15a3-58a7-b556-a4b63ec7aecc@linaro.org>
In-Reply-To: <f950812e-15a3-58a7-b556-a4b63ec7aecc@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 12 Oct 2023 17:10:31 +0800
Message-ID: <CAAQoYR=ZEuARAxo+ChJiN9bLXPpS3mu2fUu=vaoXOSn-4R0vxQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: add support for Macronix Octal flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_021056_592197_E8C1340E 
X-CRM114-Status: GOOD (  19.40  )
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

Hi Tudor

>
> Hi, Jaime,
>
> I think I already asked to split this in a patch per flash family,
> it will become more readable this way.
OK.

>
> On 08.09.2023 09:43, Jaime Liao wrote:
> > From: JaimeLiao <jaimeliao@mxic.com.tw>
> >
> > Adding Macronix Octal flash for Octal DTR support.
> >
> > The octaflash series can be divided into the following types:
> >
> > MX25 series : Serial NOR Flash.
> > MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> > LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
> > LW/UW series : Support simultaneous Read-while-Write operation in multiple
> >                bank architecture. Read-while-write feature which means read
> >                data one bank while another bank is programing or erasing.
> >
> > MX25LM : 3.0V Octal I/O
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8729/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
> >
> > MX25UM : 1.8V Octal I/O
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf
> >
> > MX66LM : 3.0V Octal I/O with stacked die
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8748/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
> >
> > MX66UM : 1.8V Octal I/O with stacked die
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8711/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf
> >
> > MX25LW : 3.0V Octal I/O with Read-while-Write
> > MX25UW : 1.8V Octal I/O with Read-while-Write
> > MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> > MX66UW : 1.8V Octal I/O with Read-while-Write and stack die
> >
> > About LW/UW series, please contact us freely if you have any
>
> this is not the place for such a statement.
Do you mean above descriptions are not needed?

>
> > questions. For adding Octal NOR Flash IDs, we have validated
> > each Flash on plateform zynq-picozed.
> >
> > As below are the SFDP table dump.
> >
> > zynq> cat jedec_id
> > c2943c
> > zynq> cat manufacturer
> > macronix
> > zynq> cat partname
> > mx66uw2g345gx0
> > zynq> xxd -p sfdp
> > 53464450080104fd00070114400000ff8701011c900000ff0a0001080001
> > 00ff05000105200100ff84000102340100ff0000000000000000ffffffff
> > ffffffffe5208affffffff7f00ff00ff00ff00ffeeffffffffff00ffffff
> > 00ff0c2010d800ff00ff87790100841200e2cc04674630b030b0f4bdd55c
> > 000000ff101000200000000000007c234800000000008888000000000000
> > 00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
> > 727103b80000000090a3188200c069960000000000000000727100987271
> > 00b8727100990000000072710098727100f872710099727100f900000000
> > 00000000011501d0727106d8000086500000060100000000020001030002
> > 00000000060100000000000072060002000000eec0697272717100d8f7f6
> > 000a00001445988043061f0021dcffff
> > zynq> md5sum sfdp
> > 839ad44d1e758bea30bd9917ba763ba6  sfdp
>
> please do the mtd_debug tests as well. I shall update mtd-debug with a
> sanity test in the future.
What information do you need?
Is it enough for programing data and reading back then checking the
hash id for both?

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
