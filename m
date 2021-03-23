Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B13C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:16:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDDD761585
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDDD761585
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GPO+kMXnFvZEW/BZV7120Iiy7IYOrKMCpa964Dp3E4U=; b=ZRllI/lzPhCzvg8+MgtDKdDtL
	mHdrdH5QKUbfeS12oQBDY78AuMBZU/vu/ZTDFfot/2cZhFx7hXiibPyh257hOXn18ViThuBxPTQpq
	wqQWjxtvLAHEcIEkG/K/zmLH+ioqBIpID63bgdy1Nk5cD2RkllknIJkpjpP0zhuEjyum0Ga8ZjCZm
	gzlLLyIf1Z3tv1DaCj5D9HiBs5xrdLNRdzjRWGYnwv0HbPWSXbyq9c0zFfaP/N21qJcbklw9HRxWm
	OF14fW0HG3sMxrc1k1FesSSoxRFXLvmfKQuUXl/KVw5qYjacGNO0GdEYlutlMvyqDZYI7M6BAVn7S
	GXcKEYu4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOhoJ-00F8jy-I4; Tue, 23 Mar 2021 14:15:07 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOhoE-00F8iz-9U
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 14:15:05 +0000
Received: by mail-qt1-x831.google.com with SMTP id x9so14975370qto.8
 for <linux-mtd@lists.infradead.org>; Tue, 23 Mar 2021 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8meLTlZiRn44+DNLKrLTAm0jlzGdfeXlOKDf3nF1S5M=;
 b=n+CyHXpCvNqgjqFQCw1Ureb1Am9mXfUzWPryDTmL9fn8N185+8k0ujfQ90CxHy+7gw
 UuBUGTldeK/8XlUoY9uQctm+OnklBCyJkoRD5xytOFFWWh0e311QC6oG4Hm5YIOK20Fp
 1u8Wa6FaiMd6Y1rqA7D3tAQurFqw+XEnoo9Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8meLTlZiRn44+DNLKrLTAm0jlzGdfeXlOKDf3nF1S5M=;
 b=iWKvNHmAeRDm33M5vjxcWieuwtDKHlzLgAR+cs+AJsLDsz7q+xI/C1hsmjiR7p0//b
 sE6uihhaZHJHbaTIeSKoao1jF7ZbE9yReiLjDzeGvFJwwc5q4nrbuF9AszdpIIpQM7es
 W13BdZE/tpMsPGgLzNvU5zHTdS0b5Kyg30OAwu16eKds3ubUd12fbUbklCbn0dYC+zy9
 Z5B1jKDWj3SpRVgiZV6+kvxuidyvZTZ5heBCvFcy6jE+dmwPk3eAr7JihrX6r7rBlwP/
 1FKnlou1bd69YFQebF9J+K2FspZMRYV2kJ9ZefKHrKVVk4cwWOasZ+Kfy609YlsvpsbR
 BPFg==
X-Gm-Message-State: AOAM530hV7PYVRrKR0gHcEoNxt8DwRiV0Vx3ORJmLNPjoI69BjTH4aVp
 BM7s1nqvm05kh192VUd3OzcO3Jo4VfROK/WU5aUVvbJLnX4=
X-Google-Smtp-Source: ABdhPJxLLCxlwvhUtL+3J+uDzjutd5tJWRqZy+adGA0su0wQFjLXycNlNjHEqpTnreoLpM52ToOL+31/uFkoXSn7XwI=
X-Received: by 2002:ac8:7f53:: with SMTP id g19mr4492681qtk.249.1616508900014; 
 Tue, 23 Mar 2021 07:15:00 -0700 (PDT)
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
In-Reply-To: <20210323150603.6b942a60@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 23 Mar 2021 23:14:48 +0900
Message-ID: <CAFr9PXnxvacKOf=n+Gt16BHdjwL2cUqr9ZD=A=YeSftYFYrKEA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_141502_646980_6DF1508E 
X-CRM114-Status: GOOD (  12.72  )
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

On Tue, 23 Mar 2021 at 23:06, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > # nandbiterrs -i /dev/mtd1
> > incremental biterrors test
> > Successfully corrected 0 bit errors per subpage
> > Inserted biterror @ 0/5
> > Read reported 4 corrected bit errors
> > ECC failure, invalid data despite read success
>
> This is not a valid behavior. There is something wrong with the way ECC
> status is read/retrieved. The read should indeed report 4 corrected bit
> errors, but then the data should be valid. Here it means that the
> introduced error appears corrected but in fact is not.
>
> We need to understand what status are available and write the
> appropriate vendor code.

Ok. Glad we checked then :).
Before sending again I will recheck how the ECC status is read and fix that up.

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
