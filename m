Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21B7C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 12:00:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B2E861139
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 12:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B2E861139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+jr1dTL4uSuAY9KRO6YVD2ZlDoVJkoUXGF+z3nseDKI=; b=rPoCwZt0o4CcfDBgSHmWv/Q51
	2vHD2jSQGydKtCacRLWmK6ff4s9GiDwKr95gZdca/oWy8lMMOkoi8j0q+C4XWuaZ8XgLtnD7tNvaR
	4cf+JPU1dbGKhaNseil1XldwKiinWufXcMIqVS42aMTd3aMSAWh7Bh/M7iEVrZmwxnW5j3LKQ/db2
	Se6TnRfWx++6szldomTx5V+siFUOBkbbnbrqZpnshWeElBp8fccKsVO0zhWCys5Ij+dqFrLbaW9KZ
	G4W0EglahQu43UUTIvle1UJaogL37zi0pGtcgXCxxtqGpROAJGvEH5e8E49GxcvmfCHf8uEKoUbvq
	/ILEv+frg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6qf-004voe-3L; Wed, 07 Apr 2021 11:59:53 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6qX-004vnR-FP
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 11:59:47 +0000
Received: by mail-qk1-x734.google.com with SMTP id i9so18335258qka.2
 for <linux-mtd@lists.infradead.org>; Wed, 07 Apr 2021 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wD+7QjxW8Yy8u2YJJtpm9de9zmFgNbvMAMPJpbXhd3s=;
 b=RithvaeISWOYFMKOs+4g/yzDzcC1QR5HGBFNusZbLRrcUOYrNhj5Iv6cvmCYM00LDj
 HYWg2/ulQV4CwT8We2hte5vfPOY6QOFgQnEvGnIl4zx2OPts88+FM89qm82iyJlz1url
 r3BggoDlxf7mJd0/sO+tRA9OpxRyxDqbl9JuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wD+7QjxW8Yy8u2YJJtpm9de9zmFgNbvMAMPJpbXhd3s=;
 b=jomPANOOIrLFkLiadFaVXOV8GyWwMz7qdEPHqnZdOilwQZGxTESzyqQrFIBUg3dAva
 rBQR6pzysgvnDz65GNdBpXA4nZEG35Jps6t95eI/ZC1piHURq10jmTO0jbt5FFNv+M2c
 Usb+KyxdiRQBAykb0YMCAgm5fj7IVulIAQAU052s9DpBQLY5znMpcjPFXHxu6M0daoAF
 b0mV1RHyZDsj8wBBe06I2AbaMxI8UNZDFdHJBOLlyPGon6eHe5d9Ig3X1D81dsZebX2h
 eFR8XGbz5DTrbJwIDz2M94lFkitAR5XV3LV7Jx7sXqGJOa2ZqNMwX1GZZD0Mw/4ch5kc
 MICQ==
X-Gm-Message-State: AOAM531sw1A/ScdhVbkRVUM6doJop5+61lDI2Jm6wJbfcre9AF4YWGgk
 83ZLfGnNS1Wu12ZKTZvoTZVe171OSMb7sRGyC7yILc9rnko=
X-Google-Smtp-Source: ABdhPJz5ySbfYXXZwpf33xxO36joDp/Mzky80FMCiS4DEuWAntYABJySYm1p3wPpOyinS8r/oOgTBoLnXTuzBQ2PnaI=
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr2795952qkg.468.1617796782806; 
 Wed, 07 Apr 2021 04:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
 <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
 <20210323113233.3523d66b@xps13>
 <CAFr9PX=KMZuzp61Hq=2WdHyEzE=6J7HEPWZxPs7FEqiH-G8wFw@mail.gmail.com>
 <20210323150603.6b942a60@xps13>
 <CAFr9PXntCmdrmg+i3BB1j-aY4VbE=2iqyLcoSr9cX2090jGiGQ@mail.gmail.com>
 <20210407100204.08d894ca@xps13>
In-Reply-To: <20210407100204.08d894ca@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 7 Apr 2021 21:01:01 +0900
Message-ID: <CAFr9PXk-PNWBa9VPriP3nLUqdhtm6uPnbG3n4_rRCdF5YvS7OQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_125945_879133_1FF4D58D 
X-CRM114-Status: GOOD (  13.20  )
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

Hi Miquel,

On Wed, 7 Apr 2021 at 17:02, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> You may look at micron_8_ecc_get_status() helper to guide you. But
> IMHO, if there are 0-3 bf, you should probably assume there were 3 bf
> and return 3, if there were 4, return 4, if it's uncorrectable return
> -EBADMSG otherwise -EINVAL.

Understood.

> We should verify that this does not mess with UBI wear leveling
> though. Please check that returning 3-bit errors no matter the
> actual number of flipped bits does not lead UBI to move the data away
> (I think it's fine but we need to be sure otherwise the implementation
> proposal is not valid).

Ok. I'm not sure how to check that yet but I'll look into it.

Thanks for all of the help on this.

Cheers,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
