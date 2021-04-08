Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ED8C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 07:28:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA1D60FF1
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 07:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CA1D60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xVhQsPzVZy5L1WmPRcG4IVPyGnysgydSyNiy17/X4fA=; b=UOxLNW+mGG25wNQW3cKwKofpc
	iXJ7PWY2hdsT9LqhthC5G0uZuA/MTwvU4J3NUDSZw9sMHquYrFUviWvMtPkkbccVaxCzDkuviUW4s
	VhogyZsLZGKKnnk/AzkqjD8adtw+ygYW1UDzdussNrKdPpQPWF4PaBAil+Ca0g1BGV/nCc0ZxMR6x
	jwRzWVaAuxTTyKXkIlnBSgMORt/+2gS4EU5xPP8J2sc9eOEpEm7114xBC3gPFwIO2bT9a0XSTGUim
	CdtNmBNgaRMA0Zvab9iZiszDI0DzeoM0JHM9AUc8E+YE0TcIb2ifQLzoZ8/bXykJ9j9kGy7+Ln2qO
	yL4bMNMzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUP4T-007Daa-GR; Thu, 08 Apr 2021 07:27:21 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUP4F-007DVl-Mf
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 07:27:11 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id t13so419198qvs.7
 for <linux-mtd@lists.infradead.org>; Thu, 08 Apr 2021 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EjFr0PvXCimeRN9CqmVjSUUdOG+//MfhWL1w/fQOwA=;
 b=chqErVHX75l1vvdNCuYtisaHUToXrG/ZzbvD5p7yI7mEotk+EbjK12GGBd4NpnRzBq
 As78YRhnOOy+SG/+qDxRtD5GBodGdz4sKIykBakh4XqiBHyNWTqFJaKhHAxvQEiGw0AK
 U/EON+d2k4oxkb8W6+aJGuSTuhImTUZOu8Zvsp47nnpVdEkm+C3XwyH6Oqwgp8VsNphP
 aFdbySx9upgSxIlpMf+qmgIBXJEV0JYZ/h7kVwQlMIvkQZNWDhHA6pavaKv2lIL7wHvi
 gi0JaDJiS2glYW/j4a+20aKZAFfkZXGiNcdHqVh2gT3addwt6R1zsG8n40jtQhXrlJWW
 8kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EjFr0PvXCimeRN9CqmVjSUUdOG+//MfhWL1w/fQOwA=;
 b=e6jD/aloSRM1gZW4ynI80ApIeYOeodyc7GwC6BLdwAYctZ7Yfc4pBRKYLlaycexMuJ
 vlWsXBchs7PmznsGPf+HEz0MuRRlT8ecG9fAe3dPp1Qb9f2OLIuzCCLuJz2DszVh0XEY
 o7G1byJIAMzZK0D0+eLIFk2diQJsqXwlq2Fn19eaRNSAdCkMLFqjaBE7zQfH0kC/u4pu
 JbyWC2b+uNoJFmHK9DXlupipW1oQihVWnW563ITqHqyMSciNuYNYXVGW1IU9un7q0nXp
 jy2f97HKFqa+Gnm12AN2omo3CAcGZX2ND70u3h6A0NEO2ttj0oyvVl7OT9XMSmzKQN1d
 IcvQ==
X-Gm-Message-State: AOAM530LCwvWGyLuoPsaGog3qLDp3Qz/51Rb8gzdETa72hQ698cF1bag
 580J9TBo2etMlp2JgOuLsDOaqScjR0BFi60iaM0=
X-Google-Smtp-Source: ABdhPJyBdNG1ftuob+yI8bN8G5e80uY3S6iEoCXWbovAPwvdTcg82yM9zwMt9E7cIZzupqpS8MfM4d57XrYFPkYYcl0=
X-Received: by 2002:a0c:f1c9:: with SMTP id u9mr7626980qvl.17.1617866826260;
 Thu, 08 Apr 2021 00:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <34544eb22f7661f6fb64af3ed99b1c2092b99a31.camel@gmail.com>
In-Reply-To: <34544eb22f7661f6fb64af3ed99b1c2092b99a31.camel@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 8 Apr 2021 09:26:54 +0200
Message-ID: <CAFLxGvzRWYTMsh0-476k_zBnkeTHDUJox2u82+qfdUpO9-fBZw@mail.gmail.com>
Subject: Re: mtdblock is slow compared to mtd device
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: linux-mtd@lists.infradead.org, Edgar Lakis <ela@phaseone.com>, 
 Martin Egholm <meg@phaseone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_082708_569752_924B0B83 
X-CRM114-Status: GOOD (  17.70  )
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

Claus,

On Tue, Apr 6, 2021 at 2:12 PM Claus Stovgaard
<claus.stovgaard@gmail.com> wrote:
> The 512 bytes sector size is for me kind of oldschool where all
> filesystems where working on this. Has there been any work in making a
> translation layer for filesystems block sizes in the 128k or 1024k
> range, like I would create the squashfs?

In MTD we more or less gave up on FTLs, they are toxic (patents).

> Alternative as I already using UBI for parts of the flash, I am
> wondering about using this together with ubiblock. The question is
> though if it is faster, and for the second part how it handle locked
> flash?

ubiblock will read up to LEB size'ed chunks. So, it should be faster.
If not, I'm all open for improvements. :-)

> One of the reason I am looking into the squashfs is the readonly
> nature, where it fits with the locking capability on the flash chip.
> The plan is to write the data as part of production, and afterwards
> lock the flash for any other writes. How would UBI handle it, if the
> flash is physically locked for writing?

UBI can operate in read-only mode when the MTD is write protected.
See MTD_WRITEABLE flag.

> Any comments regarding storing some data (preferable files) in locked
> norflash, where the read bandwidth much be close to the bandwidth of
> the mtd device is very much welcome.

I'd start with ubiblock plus squashfs or erofs.
There is surly room for improvement, but it should be doable.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
