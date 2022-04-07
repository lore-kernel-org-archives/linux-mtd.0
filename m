Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37289C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 07:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj/UTSuHH/UXWeuU3hb5US+JHWKzs1veQ1jNimE79kY=; b=kyQ+ocMw0YNfJz
	NUyhA/cxiKKbRCcn0Aa1c05g/MfoejaCn6rrE059+pbi8TGQaoNmE7C2mgIm3sI1BJJkAY7DXX+mx
	YOgwpjW9N/1jnwlI5oVlf0RikwOo0WKhbkVAZ7+K5m90loBXycCglFDWT0x2YTqftZemLKwrl3fSn
	Oqfh8k9Df4leQwa4cAT+UEKVH4ypVz7Ww+pF6bkpLmFceEl9tS9ZYGse4S6dJ9evEU0aDJt7Kgdji
	C1JCvVN9xc3nyqMOHOxQiSih2ZJXlNtRi70Q2Y6caJdNuqwoDFY+BdbGaPFzHFImPmEkR/BXiko2p
	hErBoB8EznSP1BxfzRRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMHI-009pkB-80; Thu, 07 Apr 2022 07:10:00 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMHE-009php-2x
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 07:09:58 +0000
Received: by mail-io1-xd29.google.com with SMTP id z7so5792378iom.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 00:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzhpkLkAxKKTCeGwHVglx3WTSFCKzXoafTwEHEU4NcU=;
 b=L0cqgrWN4QLbqNJfHMzilsPy92mJ5fiKFCmTiOfI4o6WDlFXtCOJQQkh7yZemHeoY0
 89eMjyr6XXpj3FHS51jv3zYtFELyrtr1+vZpwpzI9IASl2L8la4l1qrL/52gOgbSlHaD
 xeWldQEZhCLkwaMI0xb29b3feJxATFglNRtX0jfGg+ejs4CFDreo61bCqs7x+Z0c2gtE
 jZ4FOJWKFWAthaiKNnv7MDk/V6wXABH4KhyAHIccTuiElQPWbSQ3nNhiADoZuIRwSjr2
 cdixvKn4j321WH1MrUvEdJNEZ8PGTdHXYyGhDD1mVMNG9DblLDJaEqXSGk/vTWikhfsv
 La1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzhpkLkAxKKTCeGwHVglx3WTSFCKzXoafTwEHEU4NcU=;
 b=7ihezLDXBDJ2uBtk5WCUxmoJtZev+HESe1uXXTCXMhvzoPCsJSqF5U3nXrhWYSj4aY
 elQWs0n3PfNQl2rP/yeQhhsFuxgJxJ1YThm2rS03F6QH4wLShOMyQngdW54HqUJfchOY
 ZY8hvPDJdVyLDp5Hev7uJncCW0DYshEdTnIS0WttHMBd3sjlnxw0ZJ5aq6t6bpGXcpvl
 RBMGTlZ7Xke7K27PSj12Y/TGvrYe33q5tqVX54+71aQ6iMZ7rxs69hlfZ7qxQ4iwkaEr
 /b0hEZhyklMCEe7XKE2WYjAnluZ0I+kpmUXzEqb1Gk1ejf6Chf6iZK5yJ6oX+8EcYvAd
 4ERQ==
X-Gm-Message-State: AOAM530vwR3LYRVzQwk2/3UIE8j16g54/p+M4SPOOZaxBNW8x16INHdi
 cMYIFVsEmfb5vCXKWeUnJv6N0GoOGYBmKcfktT4=
X-Google-Smtp-Source: ABdhPJw3u2VTJOB+BHTGPqMrdtLHZ0bF2EInqEZ2HkmYernVaoBUJ+DNCALbXH9eQyhVaiUDMh0d/xR0z/2dDnWi9AY=
X-Received: by 2002:a05:6638:d16:b0:323:63cd:c144 with SMTP id
 q22-20020a0566380d1600b0032363cdc144mr6615800jaj.76.1649315394661; Thu, 07
 Apr 2022 00:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220401212951.1133780-1-felix@matouschek.org>
 <20220404104141.7b7b79d5@xps13>
 <c1387c1949a8ec705116f5ee8a73fa35979aa196.camel@matouschek.org>
In-Reply-To: <c1387c1949a8ec705116f5ee8a73fa35979aa196.camel@matouschek.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 7 Apr 2022 15:09:43 +0800
Message-ID: <CAJsYDVJ7e4zagG9Yvu5r8dQn++ta9TpetC6YHzq4S-GBFEBABQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: Add support for XTX XT26G0xA
To: Felix Matouschek <felix@matouschek.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_000956_169783_93902994 
X-CRM114-Status: GOOD (  11.36  )
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

Hi!

On Thu, Apr 7, 2022 at 12:20 AM Felix Matouschek <felix@matouschek.org> wrote:
> The data-sheet says that only offsets 801H to 807H can be used for user
> data and are not covered by ECC (offset 800H is reserved for the bad
> block mark).
>
> The remaining 16 bytes from offset 830H to 83FH are read-only when ECC
> is enabled, so they are of no use? Can you please advise if there is
> something I can change?

According to page 30 of the datasheet[0], the 64Byte OOB layout is:
8 bytes: OOB not protected by ECC
40 bytes: OOB protected by ECC
16 bytes: ECC parity data

so your OOB layout should be:
ECC:
region->offset = 48;
region->length = 16;

Free:
/* Reserve 1 byte for the BBM. */
region->offset = 1;
region->length = 47;

[0]: https://pese.oss-cn-shenzhen.aliyuncs.com/pdfs/2005251034_XTX-XT26G01AWSEGA_C558841.pdf
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
