Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8BC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 05:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2L5FFVeyttQ2MGAYUskzbmV6IXg/tKd/9Jz7cjc/aM=; b=QUN/C9pfRoYdPE
	BxluXQM/DiA6Pwd3jS0MB9zM2uRp+NrIvfd5ytxFu1eec14s+ORi3NuNPM/K6r8V3PFA2fOx3rp/z
	J8YPZo56AR83JX7xybRI72zBmxB5pQRAgaGH3KDB1y3TMjrSaUyUwXRgnoQQOjGmRQXxkUwORXNS8
	FWaWeo6EW4I48jtb7s/ptw5v94aW9xSxg9LIJyT1DRs9xMKeLQ/vukLYCF3HXRKyCct9oMsIkigys
	9nJyPyTPNfhkQpWCD4C5okOppknC3PpfbjxFZhBy/oIojKhYyuaS7EgRSlTycLgXjKmsPxVeJfUmh
	q88biLPqLG7FDwkGLI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOAOh-001yKF-0C;
	Fri, 12 Jan 2024 05:48:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOAOd-001yJn-32
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 05:48:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-28bc870c540so5041615a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2024 21:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705038478; x=1705643278; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALU9IG2LG3WH8e+pzKAlhWd439AiTO7cNR/S5/Aijjw=;
        b=SvmYtu3c+d3R2tY9P2da6FdpgCxhwIxdbdEIqA/m90/iRfV4z9WN2vCyhpsD91jCev
         qSJ+TazNA8VNQqH4Acx+lTJNV6HES5meis5DWRnzLFy4fNGkjCHVLGmqGrozvQ2Wu/fI
         Bji8zgjy/MA/Z0Y86alaBl1dklnVYZaMQaBfT6tp35XQ2ltkvmshDR+Cm8BYsfBO/lDc
         8JBxhgm/ARkhHph6OnBuBfjL7z0UTFoNtKAipilUgpbo1PWY4G5rOZCi9EWS4ABvat7e
         fQHclzThKYVm6xKsZsJJsOppxLQgawwTHKu8FdPNKxXhmSz9gY7WzbstOuTRi5wFdz5u
         GJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705038478; x=1705643278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALU9IG2LG3WH8e+pzKAlhWd439AiTO7cNR/S5/Aijjw=;
        b=RpVqFgq/G0thmg2UV3dkp07kYgju8OEBVjFWPRnHoCPrwyTOtLghkK020mP02tZL/1
         QTkBVNMytm+RsPX/JpILYlv9I6WeHFlbECpDeMQgsyaPP0RGauP1XQOtuAYwgTEi72a1
         vN2pRTLtsjkop9BtXqyfixAD7ounEQYs+BvGEqbi+ILMIUp9h9K4sME1sI6gmxluTLsl
         orfnWXEFdgWmue4Vb4D237L/r3vcYK7SFYG7J2+54/7BNGVFVdi4+Ja9zuv6Bz/lpvUf
         0BcAxKf8na1d1KayQT9/SMMNJio4CDq17JZAohpcQn0xN09+T4ySjHF54EnDOI1KjF58
         ezlA==
X-Gm-Message-State: AOJu0Yy+Kyp6Rvm2HoxD6uXSS7jKz0b+ZSPIFSJGUX54fwnaQVCyVYX5
	l4vGOhD0dcvVRycEnkNIuBVN/rlJhvKp0qYqsnw=
X-Google-Smtp-Source: AGHT+IFlS3P+7KpaYy4Mr13QzOsC7hio9mn2VajCKQj5pDnLJFJlOXihPIm9lZmTHO6nS1T4ENbZUYY04QEcj8mpUgQ=
X-Received: by 2002:a17:90a:ff95:b0:28d:bd0d:c7c9 with SMTP id
 hf21-20020a17090aff9500b0028dbd0dc7c9mr731134pjb.28.1705038478236; Thu, 11
 Jan 2024 21:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-8-jaimeliao.tw@gmail.com> <567aa585b1c4746cd90b003a67459b3e@kernel.org>
In-Reply-To: <567aa585b1c4746cd90b003a67459b3e@kernel.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 12 Jan 2024 13:47:18 +0800
Message-ID: <CAAQoYRn6mxwc4MNHh=ksVgCHG5c_OLZUH64g+YGm_Czv9ibC+Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] mtd: spi-nor: add support for Macronix Octal flash
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_214759_983619_369C6DDF 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
> > +     }, {
> > +             .id = SNOR_ID(0xc2, 0x83, 0x39),
> > +     }, {
> > +             .id = SNOR_ID(0xc2, 0x80, 0x39),
> > +     }, {
> > +             .id = SNOR_ID(0xc2, 0x85, 0x39),
> > +     }, {
> > +             .id = SNOR_ID(0xc2, 0x80, 0x3a),
> > +     }, {
> > +             .id = SNOR_ID(0xc2, 0x85, 0x3a),
> > +     }, {
> > +             .id = SNOR_ID(0xc2, 0x80, 0x3b),
> > +     }, {
> > +             .id = SNOR_ID(0xc2, 0x85, 0x3b),
>
> Should just be:
>
> /* We need the manufacturer fixups. Keep this last. */
> { .id = SNOR_ID(0xc2) }
Do you mean I could add this in the last?
Or I need to abandon above ID list?

Sound good.
>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
