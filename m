Return-Path: <SRS0=lLyx=23=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D808C33C8C
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 21:18:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE3F2072C
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 21:18:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CiVxz0ev";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="pkW2Bc8u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE3F2072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k99FJM9zfF9kPOaN/+w5QNBzPqmvjzCP1IrKFdlHwDQ=; b=CiVxz0evaP26aj
	+qOJvuahr2aSUul7sqZst5dryclsGKzyt42krd3CZ+y+tUsDyeOiYQXYQlWw3hEiaeJDsdKrIjf7C
	ErKKxXjLLjxyIv2Xijhu7VGWOkUyGTC2/5GoeHs4P4eBAoTB3fUTKDKaoFunL23G8PUu8cpmZT2+t
	K9xziOWn8sDYs1Yz0DPcQoD3awAuPqK71aQpVCP/Vut56C+GSmJgSkXd0p7LgS5m0RJlgfxU/I2Bp
	OlSlttG80yk23d/DWqlSAuLYB1KIZWJiHcU5G7WiHZPiamQ+40hOGgXe3NFJdKfXv/Rsvu7wNspp1
	2pm/Y9+21I+Rf9j2D95A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioZli-0000bX-Mt; Mon, 06 Jan 2020 21:18:34 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioZld-0000WK-VH
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2020 21:18:31 +0000
Received: by mail-il1-x143.google.com with SMTP id g12so43813397ild.2
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2020 13:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fNSwpAU9T9Ditm5lbQpzyHWb6Vjzt8MFLktggpxIJ0w=;
 b=pkW2Bc8uL7WFlR5binpUJ2o+mA+wJOL4zBIg31tpcCRmDn7+Ovh2mNB9fKUivhrzZy
 6msTWNsj+DMQZGlaWH2MJJY3Erq+TvGCgTqZvKuVsKUWxIfOarjMDPtDI5cFe4WNx2sH
 WHMxrKKqr8ie8VYK86DW3E2A2hAdX6UtnYqy0JGrOmYgHL91qPbHnNyr9zjrfMFjHYRE
 fSm/awWyRsOS6KrhnjuXYP/x/SeElZsPWNScdnTc/jFjjhIieugXz12i0rQmPYoHbQAY
 Eh8DqEvdBTcV7DjAn5XEsX7OIoa0do/2fm3I5jDXvOeVdildyrMztVDISn0M2cc1SNCH
 SZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNSwpAU9T9Ditm5lbQpzyHWb6Vjzt8MFLktggpxIJ0w=;
 b=XSMoKQ+SOaZWE1ReP+s7c680TyMjWPVX/wY1bOBtexJlsjvfTbIxt/wBu31CeHIgIW
 es8th5XPZCrwWNf19JLzAWnoHy1P9OQthO51giELXGYXp7Pk6y+pzd6gPa/vX2LREtg1
 xd+X3fzifxK+TLs6YEK0c/wPseEicdtsCxkRYbDYIbshT2Ies9DPImAlMLPXU3OQZeCc
 dVA2Ea2HsKkA+c31weLxMsYWrED0TLbxvT6TMVk60R+ke6X0FoZmXBOGfLLg1tn4DbrR
 f52WJqZsDAigOE7jK3VK7pLkgTI/IOmDcUpffUq1q1gnGTmAAPqzSGKBRzjzpBulhm3L
 fFlw==
X-Gm-Message-State: APjAAAXOErTTppEAZKZis8j8jQWOvQlVVcfXc20WZv7J0Lcv9+EHLHgb
 S/3vBJbun6AH+dwimd3Dc5q8pMSOAxbaTP9zkMIUWw==
X-Google-Smtp-Source: APXvYqy8MsJCk5GJ8K445xwMzgYaN3g6i94F2/UxUyENUV9JW1kEJ5YELMSltxVBc8qNWXIY9gK8wWOvwuyUoQaO+cc=
X-Received: by 2002:a92:5d03:: with SMTP id r3mr82418941ilb.278.1578345508762; 
 Mon, 06 Jan 2020 13:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20191216110947.6fb2423a@xps13>
 <20191218095715.25585-1-gomonovych@gmail.com>
In-Reply-To: <20191218095715.25585-1-gomonovych@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 6 Jan 2020 13:18:17 -0800
Message-ID: <CAOesGMjp8=uOwTnGwuMwTJMKVh915udgkhSb0joKMTcwWBEy-Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: cadence: Fix cast to pointer from integer of
 different size warning
To: Vasyl Gomonovych <gomonovych@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_131830_046006_E423ECC1 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh R <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel, this warning is still there both in mainline and linux-next.

Can you please apply it and get it sent in so we can keep the tree
building cleaning and spot warnings without the noise? Thanks!

On Wed, Dec 18, 2019 at 1:57 AM Vasyl Gomonovych <gomonovych@gmail.com> wrote:
>
> Use dma_addr_t type to pass memory address and control data in
> DMA descriptor fields memory_pointer and ctrl_data_ptr
> To fix warning: cast to pointer from integer of different size
>
> Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>

Acked-by: Olof Johansson <olof@lixom.net>


-Olof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
