Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B3BC001DE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 09:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPRLz2Ph6WCslaoK1EmGROhBOkrtCXjiHCNoOGvxscs=; b=yDEm8TBvQXC0Ga
	6okh++qqeDUH3wdVsTqTZcQyzTooyoYImsB7XlvTD0haOz1mHfcG/zpd/NGANu0OBaM+OLvbiVLSg
	i8HK0xgj1aOSnr0EGyjlxY4KIHFOWPSEq9ALxzOu1Ev0DTYZcgPvHFiJZAz9UHiTEGN3h2kJy4DIZ
	UUdjv/nYwwCVvZAueSZ5OTFw3bWndr6m9+GxCmyQWrWyN0mGRxodA7l9JGqjLL+rmA0O8XMpw4qTO
	MkrWbB/UJqeKrydmYB+36sRzTG0dOlF94gvMAgP+bDCxKY442KGNvs7N3nSuqYh3YxBZljxgmSNVs
	i6rOXdIYGHDzqY54MGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEmX-0070nG-23;
	Tue, 25 Jul 2023 09:56:41 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEmU-0070mV-2B
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 09:56:40 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-55bac17b442so3877722a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 02:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690278998; x=1690883798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iZw8ubeYJMeZMtvbBq2A6XIQLcNKG9vzFKYP90JjcxU=;
        b=VYBV8izy4UkCwzYjeRwjpHqslSHg+3urYB8MnskBpnL5syoiA+WizfVAKNoPZlgfPz
         ZayGvPWwlFG0sgzaXR6uKcIVqcGtQ9lZRZGOexvq7jogsBfMLiQ2gYKba+D4Mt0xQzVu
         75IcS/gAt/ADyH/uK/cKetU4daEKJCWJPSW0v9wLrRP3AMjoru+4ZZwUGRickWuRP50d
         btRWViENFmahMdNwQDcP7nXoKZw88NJGOPYMkRz9HLGUZPuU7yqoiuxbnvb/XpcKXLxY
         kuimY+vaC5sizd1FDVmdgQ69uG+252sNouexHCGNCLBHkTZsK/b4zMeCprFS21Ojqaat
         KgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690278998; x=1690883798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZw8ubeYJMeZMtvbBq2A6XIQLcNKG9vzFKYP90JjcxU=;
        b=T/nYmS/pHfWSFo8+r0688+eeRUSZMD2RLzRR/KWAFCJkBYcFqS8JZ2nO5SSjqFKWXI
         cow02Y/3/m5+ieraYfsN/K8aD1kdz4KKpUqqvA0ZfhNaSOsKDhGRELL38D7O2Abp4TIb
         E7WBubgv51kJXIZmUcm5sXZlON0oTipsbpvLXcmfFaGAWLvxkxFm5heCSIS4cRGeFXzq
         Ct9ptlwaIqupy6VzGPgzc8E/BzCBe/DFATXO0OXNcrwBxlFqzkfsD/o+n9Q7QqotT0gi
         ng4TbsuaqQPpO2C0XSwVeDnTtugGk31xSz7KfPTbuSVbZWwU+9q74bpoc9U9Qs2K+1CG
         uK6w==
X-Gm-Message-State: ABy/qLYPC92IdKfozwd02KWN1wDJm8Dzs+obDf3lrIoadYPmgKanfzk6
	/C2ti9tvMpFvNDnMkSOqaadVwManEwdLPhQ/Qpo=
X-Google-Smtp-Source: APBJJlFtEUWsGQMnF21eFWFOro4ZrrHl9OxLWLtN6eEVQjgXCP0l3gp2eyI3SFPmXyHg2AEUVkR133bzbkxwOlrHAwc=
X-Received: by 2002:a17:90a:9a8d:b0:262:ec13:d3a with SMTP id
 e13-20020a17090a9a8d00b00262ec130d3amr13192412pjp.28.1690278997837; Tue, 25
 Jul 2023 02:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-3-jaimeliao.tw@gmail.com> <eb15e38a6bd4929c0afb41cf1c652d98@walle.cc>
 <CAAQoYRkCPsfxEzRGJ+fdtztCGtC7PwAVEekTAdb2KYGhF39bHA@mail.gmail.com> <7a895a53594b607614e0b7518127bfbb@walle.cc>
In-Reply-To: <7a895a53594b607614e0b7518127bfbb@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 25 Jul 2023 17:55:58 +0800
Message-ID: <CAAQoYRkUzAD6-AWsYHZq8kjeXUFthOvXCTmKj_k82LSUoj=URQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: add support for Macronix Octal flash
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_025638_710972_7B5BDCA8 
X-CRM114-Status: GOOD (  37.11  )
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

Hi Michael


>
> Hi,
>
> >> So the stack die information come from SFDP? Can RWW also be read from
> >> the SFDP tables? Do you have vendor SFDP tables where this information
> >> can come from?
> > For this introduction, it just introduce Macronix EPN naming rules.
> > As I know, rww didn't include JESD216D.
>
> Yes, but you might or might not have proprietary tables in the SFDP,
> which
> might inidicate wether that part has RWW or now. Thus I was asking for
> that
> document above.
Sorry, I don't have proprietary tables in SFDP.
For checking whether RWW feature support, I need to check in datasheet
and EPN.

>
> >> Again "us" as in macronix? but then, there is no trace that this
> >> commit
> >> is comming from macronix.
> > It is relate to Macronix mail issue, so we prefer send patches on
> > gmail.
> > A question, how could I mention the commit is comming from Macronix if
> > I still send patch from gmail?
>
> Yes see my former mail.
Thanks.
>
> >> md5sum is missing and please use either xxd or if not
> >> available, "hexdump -C".
> > Ok, I will update content of SFDP dump with md5sum and
> > using xxd command.
>
> Thanks!
>
> >> > --- a/drivers/mtd/spi-nor/macronix.c
> >> > +++ b/drivers/mtd/spi-nor/macronix.c
> >> > @@ -179,6 +179,33 @@ static const struct flash_info
> >> > macronix_nor_parts[] = {
> >> >       { "mx66u2g45g",  INFO(0xc2253c, 0, 64 * 1024, 4096)
> >> >               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> >> >               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> >> > +     { "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096)
> >>
> >> Please use INFO(0xc2843c, 0, 0, 0)
> > Sorry I didn't get it.
>
> That should come from the SFDP tables.
>
> >> > +             FLAGS(SPI_NOR_RWW)
> >>
> >> Maybe one of your proprietary tables indicate RWW capabilites?
> > As I know, RWW could be got on datasheet only for now.
> > So that follow the existing rule using FLAGS for it.
>
> So you didn't test it? Then I'm inclined to say you should
> drop this flag from this patchset.
>
> >> > +             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ
> >> > | SPI_NOR_OCTAL_DTR_PP)
> >>
> >> No NO_SFDP_FLAGS() for new parts.
> >>
> >> > +             FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> >>
> >> You should have a correct "4-Byte Address Instruction Table",
> >> therefore
> >> you don't need the FIXUPS_FLAGS.
> > 4 bytes opcode flag could be get by parsing bfpt.
> > But I think it would be great if ID table include it as well.
> > Because of some flashes in market may not define SFDP table.
>
> Which ones would that be? Are there any new flashes without SFDP
> tables? And even if, it should be added if there is an actual board
> using that flash without SFDP. I'm against just adding flags just
> because "there might be something out there". Ideally, there shouldn't
> be any entry at all.
Agree, I hope all features get from SFDP table and as I know new flash
all support SFDP.
But for RWW, I still need a flag for using.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
