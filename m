Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8CEC10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 17:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 809A2206B1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 17:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4Kz//T+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uYwRbsEj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 809A2206B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSPCLWIHFv/7cfeTtMP+g1M9u5Ch6gFPfw2heX5eapw=; b=a4Kz//T+/5P6RW
	5+PgEJ5+Ff//pZAESAQdBRYFg/R3p9kOZMA6oBrVFZROKlFsnRqE3WkN+i3w2vEnao+EoMzPEB/+A
	irZZqGD6ffr0C9jX0CQqFwOW4Vj00aHTweT4hJLFYrq7Vvb69rjyL2py4GRRqz3T72JOWqRH4W5fA
	IBEKUQ1kRgBIhEVCNKTkfo62Y2wQkM3rn/0Ec9viRjCKAW9uYr7nEwAMapp/AEUZ5CI78HiQnKQZm
	Ag/01kix6VHpGBOHV2s827fcYYgo74jNEKP1sYUEC4cQV+M2Brr6MQBniyymUKfJjGhysqRXl+3Q8
	GQ2V6BeHsyXg1CU9A+kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCo0L-0003KV-SR; Fri, 13 Mar 2020 17:21:49 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCnzn-00039k-01
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2020 17:21:37 +0000
Received: by mail-lf1-x141.google.com with SMTP id j11so8526941lfg.4
 for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2020 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8ol+aCQWfmc0Z8es3pJShdbNVzJAyKuhxdz2Y8nQ7I=;
 b=uYwRbsEjB+XRhUiZo4qoCEWwOZYRugRDu1YpX+qfEmZWexQo11MAmBzChCEg/CdFUV
 ZW1ERrmKGQRl+0iMizeaTOLk14wr39Ej05XrmuXWlq1gDaw2mh/GJOg7xZXrw50HHTqX
 21uZlQJDd6lyqdyykz1KLcjY72jo3QEEgR8xhFehu5M87A4BG831Eeh63a2TTudYyVbd
 a7KGaN4Zv8JnuAH6WUdqZ5oPUhyPzKrgCMGw26AFrUTB6A3DTGGoT2J02Yj0Ba9rKz1p
 /AD+EvhoKXXhNnHNxp5wLfo3MAn1vgz+7SpfEi893QhvOnqQHxNnVEV7i/+WXZoFaA21
 drWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8ol+aCQWfmc0Z8es3pJShdbNVzJAyKuhxdz2Y8nQ7I=;
 b=tw0pJSQunwrRpSlduL1qJRcYWd/TgLOKIXKrqlO9biH5Ar8VTZ4++7hdtibsRHCT/7
 LDrKuQYHykEMR6Uq/qOfVBhLLA6QKNswbbl8AT8zgLfumBsEzQ+emkxgzT3Ry3btDluf
 urKDWxCi60XXNBoujdI6FySrs7JdVatl0eWdxs4P24QhdIB9hMFhWUHsx/AhBvyj3c4J
 oYIolCLTQSt+09YmHfMu3h9mTnGf0rfFIv97dyaHaY+sO+sfmZhBoznQKxFjhJZn2ZEi
 v1IzddMHpwFmgroXOowEYx3HeBww8aS4pqbjAJFZf6LhpPNI6Hm8QJVlyW/EDSMbeABj
 4YdQ==
X-Gm-Message-State: ANhLgQ3ebnWEu7wqcTqhNrfkGnDD1EYXWe7/sFEr9Lb0Es80brUayL5M
 0hF0UKH/MpCugBq36pH5CDoMgxDLs7fZxVXt2xo=
X-Google-Smtp-Source: ADFU+vv29Gep1CuoIYZbXZEIoH7OutCu1R14wQQsQMbrFJzqXk03SeYuYiKociE1NY8KeQxfxhcqJtRAY8yCBECcfYo=
X-Received: by 2002:a19:cc11:: with SMTP id c17mr2137132lfg.86.1584120059230; 
 Fri, 13 Mar 2020 10:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200304110830epcas1p168bd480847959dc497ac5cc272fa2f80@epcas1p1.samsung.com>
 <20200304110800.20658-1-js07.lee@samsung.com> <2264052.42fd6meZLV@192.168.1.3>
In-Reply-To: <2264052.42fd6meZLV@192.168.1.3>
From: Jungseung Lee <js07.lee@gmail.com>
Date: Sat, 14 Mar 2020 02:20:48 +0900
Message-ID: <CAPP0e=MOKw+O=q-PjfrEQo66HSU0zy42O_9=WHmHadYx_d6mfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: reimplement block protection handling
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_102125_710913_68697E60 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: michael@walle.cc, chenxiang66@hisilicon.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, Jungseung Lee <js07.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Tudor,

On Sat, Mar 14, 2020 at 12:22 AM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Jungseung,
>
> I'm going to respin your patches on top on the what will be the manufacturer
> move v2 series, https://patchwork.ozlabs.org/cover/1247794/, I want both
> included for next.
>
> On Wednesday, March 4, 2020 1:07:58 PM EET Jungseung Lee wrote:
> > The current mainline locking was restricted and could only be applied
> > to flashes that has 3 block protection bit and fixed locking ratio.
> >
> > A new method of normalization was reached at the end of the discussion [1].
> >
> >     (1) - if bp slot is insufficient.
> >     (2) - if bp slot is sufficient.
> >
> >     if (bp_slots_needed > bp_slots)    // (1)
> >         min_prot_length = sector_size << (bp_slots_needed - bp_slots);
> >     else                               // (2)
> >         min_prot_length = sector_size;
> >
> > This patch changes block protection handling logic based on min_prot_length.
> > It is suitable for the overall flashes with exception of some corner case
>
> What corner case, do you refer to EON? Are you aware of other corner cases? We
> should be more precise, for easier review and understanding.
>

Yes, that is eon. eon is the only corner case I've ever seen in 3 bit
and 4 bit block protection.

In 2 bit block protection case, a significant number of flash fully
use available bp_slots (2 bit = 4) regardless of the above rule.
That is the case with microchip, catalyst and more..

Of course, none of the 2 bit block protection flash has been set to
lockable so far.

Thanks,

> Cheers,
> ta
>
> > and easy to extend and apply for the case of 2bit or 4bit block protection.
> >
> > [1] http://lists.infradead.org/pipermail/linux-mtd/2020-February/093934.html
>
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
