Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B56C5ACB3
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ng9aMSrohmMiWGdSLnLtaPehW6mL360pZ7VjXoCCxX8=; b=HpTvy631yi5PkC
	orTzuZNq9rEpHxyduTgJAc5isIitl+XJdsserKtHbxJMoDq7pBDu2Gt5iJH4Yl5SaaHXlagEDIPf4
	OEjPDcBkeM+Ul+pgnsgDcjbmzEskSDNvGNokARRuGqiuz6Xt5+vPrtVKnxUYBQP7HIqmcMVKAd2Vg
	UtzKMDEpJIWp+jHdFNS5uXHkkWqq0zxGhSMf5D9lyJUKz6n+cdsH0KjJ9N9fiwCQlhvQ6OYh5j2gM
	caRvV+EfgMSs0UuAd9fpWRsOlBLLLbrIfvpcO687CsYp2Fxoq/3g2XyoHA/63IDH6N6lJd0mksPv8
	lgVz+0PfwoTIC5YGqyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5NRX-00GBiK-2N;
	Tue, 21 Nov 2023 09:53:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5NRV-00GBhr-00
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 09:53:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-285196556fcso1721847a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 21 Nov 2023 01:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700560394; x=1701165194; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9bV+eQoXG+2qkZ8xOcHJWc3hRyfcdOFQlUGsKNZZ88=;
        b=TU0wSVfMgdxUFNUKtZnaSUAq+F5yFMVV+HLiAmEUlSrqebEik9NU6r0cJEqrItnMWv
         N6XOaes7jLfpRAv8PXOjyIOgyQI8NOFeeDm3xxh16rd0X6EU/8me575tA8fsj9rktoK2
         nuRwBK2+cx94Z8GVPRLz0flVB+NQ263cyZvwHczjak1R8566nJdTueTFLOmkNncKipbH
         sLa0et9NyLIPkXK/JP04rar+rx6YpfOvXyKpQGvfcn4TouBiaEJFhw8jG38Zy3nzHB7p
         8tmO63Ma/i+qzW1phDX1UUG1qol0P25R7vuK9K08KB/pqGjH+QEAFSFcK6ktkLX3K26P
         yRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560394; x=1701165194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9bV+eQoXG+2qkZ8xOcHJWc3hRyfcdOFQlUGsKNZZ88=;
        b=WDfcP4mDtAQk0qsIWW8hgYkoJD4QZy0VzIhdpoTYqXIdY7Hgsi2M2aqgh6qW8wTJgZ
         ZGVBoDVL3/awUiBBFwp0+VnhPpYpeT6zwPBBWMV4ZVTj4rLFtHSHr3JeqPpF2MQoB7Au
         UnbUG3Nj6x7MiVFP0My7GbF4F038U/REjqhbmeC1OJHzFVm9exYfkYzmROtTsroNQFSD
         3GlEqhoEp2Y5nUZutWfsB894k4AhIhFU7DYwnAPl4Ngh4h4f7slzPyHQq+C+HVvbmVdg
         zyAqsEzZSO8x0wrYCjEIjgtW7SZpacPyF/+u2ibSu3iKw5E1Au74pEwqTwvx6rdGGg5Z
         BF1Q==
X-Gm-Message-State: AOJu0YzXUYbDpLu63bhRNpoDVSQqIorMMYc9t9NFAkSejxhb0IBuioBx
	A/q84w9DPmYHbc4wxZQ+UzjDmuHk7URcaYWQ8fE=
X-Google-Smtp-Source: AGHT+IFMTJ18tJIhg7ab7NgSyidp4zdPZA6hKZ6ibUWFvYM6j7+wK1Yn+41Q1ezrpaEjU/l8qlwi+4k9lI6jWWob/mE=
X-Received: by 2002:a17:90b:314e:b0:285:3444:94e1 with SMTP id
 ip14-20020a17090b314e00b00285344494e1mr3402353pjb.35.1700560394054; Tue, 21
 Nov 2023 01:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-4-jaimeliao.tw@gmail.com> <156569dc0b92a7bfbef59a10e6f42224@walle.cc>
In-Reply-To: <156569dc0b92a7bfbef59a10e6f42224@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 21 Nov 2023 17:53:02 +0800
Message-ID: <CAAQoYRnC=h--3=3uAT63yLc+0QdsW4-X2HAAhNJ4J-2P_zgo7w@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] mtd: spi-nor: core: Allow specifying the byte
 order in DTR mode
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_015317_057453_6FCDB6C9 
X-CRM114-Status: GOOD (  10.69  )
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
> > +static inline bool spi_nor_is_octal_dtr_swab16(const struct spi_nor
> > *nor,
> > +                                             enum spi_nor_protocol proto)
> > +{
> > +     return (proto == SNOR_PROTO_8_8_8_DTR) &&
> > +             (nor->flags & SNOR_F_DTR_SWAB16);
> > +}
>
> I think you can keep this code, but SNOR_F_DTR_SWAB16 only makes sense
> for
> SNOR_PROTO_8_8_8_DTR, because this is the only protocol where one clock
> cycle transfers more than 8 bit. Are there any other use cases?
No, as I know 8_8_8_DTR swapped byte only.

>
> -michael
Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
