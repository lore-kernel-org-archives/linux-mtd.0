Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36054C197A0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4tkfcrfesyjztFd9Rr/B/mPqs49g+rlz8iAXpPyWgk=; b=uAluyR9awRYDBJ
	Uy4+ejQjSYxXTW67EiTUsEHxDI6sBGw0B4IJKEpbNoGkhO/J7JrJ1og7yJKXfBwHqLQmnt9719xcB
	IRZhJgivcSDxEWv7/KFYohk6a+ukEHgja5sppu8Ryipt1kIQJekF3R2ZeY+wlUejT8qyMJfaR09ZW
	ds+CGaenm+ITGIM7to0/0IUybu4vJcN7GQ7H9H9MGHEoHQ42NnMqsLrzxLmVIWCjrfonE7oofSi/f
	ccwT2OyaLjzt/oDuc2EhqNfIXqvCqbH4XRC2o0a4v/rkqit9TlAvOkeIgYxuNktY+t//+hWgaeqON
	hSi1+J/BEbyZ2DldOpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vfZ-006AvW-2C;
	Fri, 17 Nov 2023 10:01:49 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vfX-006Aun-0D
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 10:01:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c19a328797so1338412a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 02:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700215305; x=1700820105; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lBmaTWGEIv2BRU0L5uHdLe4rzQ7J6hee6xoFm8lTBlE=;
        b=djAaoX2EKvONl0gB+7CPFx8SsNM59ZPrsIX+Wj4qlRTuzyXLgnqFRhco1d8dnN1M/Z
         UcdAPyLAzICVxicYW+afF+GR9oFHq4YeP1slpAWj7swOrCaII7aLBekoIj5yw47ypEjG
         v28DAMPO7hnxIgPuWM8SrkOT4zJA8TBDIxd1zivv/CuyLc7mekTMYh82+/lbKc2UU8Wg
         SYwCMwaVBU9T1ff8uwTP/au96L853fI5gFFHnuSD1Q7ED5vKr14XNzFA2TT3PN2WdcZI
         h1MQERD8yWzIz5tb9b7NYahvWRW1qCvdoTfGA3I0A3y33HKOj6hPlVxmJYgnxTvLd93L
         9EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700215305; x=1700820105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBmaTWGEIv2BRU0L5uHdLe4rzQ7J6hee6xoFm8lTBlE=;
        b=OlqYiRPv8qfUD78STBH5RPv7KayMfwDzv3C9/0fvEDlFWPD3ZXy/JM/84d3lpVtqIi
         2FELSWCAXB2lAc2MkvUsWaEUJ0O2Uow4eteCaAqqaG94IY8SGC2mps2kJ5YKYnrrZg3r
         j/gWwOb3/XvRWzYa1h0s/6wgA8d8f9wit7Dky3u8VZSz6r4IdxMmpNKKcjs+53LxrWEQ
         D9IEI6lDgktP/BoOPIayM9q4jvKtt2YoV4n8JrdPlk21VakeGZivCwrWVWqVSygqaofo
         Y25UOBJMztVR7XcqBSng7jAmHIA+n+h95rewRnT08UmuzxTO+PM+ETXVqIsihubTmYLY
         GWeA==
X-Gm-Message-State: AOJu0YyJNaQvfqaumpB3Vb/tRvNeHyxgwyKpA5ST/E3/NEp/OH3vFESn
	yPaRGmaAPLy+ClczblTdY7Lzs4HYWGwraDQJr/c=
X-Google-Smtp-Source: AGHT+IHxW6dgfBBOvca0jESXJtaw61XPKWX6Y2xJ+f44ZwXkY8BeI7hjdh87OTXppGkjfkvPSuuVo6VaObvp10pmt6k=
X-Received: by 2002:a17:90a:8b01:b0:280:31a8:191d with SMTP id
 y1-20020a17090a8b0100b0028031a8191dmr15504214pjn.39.1700215304918; Fri, 17
 Nov 2023 02:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-6-jaimeliao.tw@gmail.com> <4dc92f1f-8882-4aea-bccc-9d880774d240@linaro.org>
In-Reply-To: <4dc92f1f-8882-4aea-bccc-9d880774d240@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 17 Nov 2023 18:01:32 +0800
Message-ID: <CAAQoYRmSjp+H5k+WqeD3zoEZFh3SD5X_0nThupkKc4eLgcmNOw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] mtd: spi-nor: add support for Macronix Octal flash
 with RWW feature
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_020147_099051_965C86AF 
X-CRM114-Status: UNSURE (   4.79  )
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

Hi Tudor

>
> Is RWW SFDP discoverable?
No.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
