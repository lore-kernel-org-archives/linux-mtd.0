Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C6CC433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 09:34:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F99B619B8
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 09:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F99B619B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sqhz/sC5jPsLRsknDKUrqki1gZY09B7LnnIZ2voL30g=; b=Rdc+9+gmZ++TlBjWuK4NaVa7n
	INRuGEUqm3edynuzNjJI2g+fxoFqpmDyLVaXaDPVb9NNcsb+/kZe10dLUGPRrtZJ97TRWIodf5SoS
	BP3paRe89dH898iGz3KIm2R9yZsAlMoEKZCX3fPxWen1mdqgmzkCA1QGuvP5snud84eTnQo3ng36J
	US9nwenWyX8iDGcLYgCrIFB2xW7uG7sc6QOT+S90VQhpyy0PmBk6CXBvd/7gN2g4LuueTS4Xgsu/z
	Lz7WIWtSLqOSaTbflwWVnd9L51EoR3XM2wix19fto0DzVwdFtI3uPjScTYFpNoad2dT8u7ywD65y4
	8lBrJMNmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOdQS-00ETEq-4h; Tue, 23 Mar 2021 09:34:12 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOdQM-00ETDZ-GN
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 09:34:09 +0000
Received: by mail-qt1-x832.google.com with SMTP id s2so14425362qtx.10
 for <linux-mtd@lists.infradead.org>; Tue, 23 Mar 2021 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6F6NXGeRgosTfbHvdsjCF0kdLc4P28DODH78gYIvxqw=;
 b=fV2KtRlBe3pRC9JBnAglQgxeGSx0SOHh5MWpO6JuKtiJZLRckX7LnmLb53KNDNv9RM
 HPDkxwKKP2o1egsy8SLrXaRPGJDIpsuIDLHW3bOIXLOnVzF5oDhavnE+q1UQj3aR7Q2B
 8VJACUxTUlp86gI985gqvFExbpI/Rr/qVJILE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6F6NXGeRgosTfbHvdsjCF0kdLc4P28DODH78gYIvxqw=;
 b=EwqUmTeQb0XeM5bXft/yxAfrtTDr+p6DHLa5A14mct3Wiw7cR6I2ApwC8Z0W+1gPaq
 JFUjc69EwmcW8TXanX1uhz0F/BNoEdiHYbIejAmeDJz5USjf5c2ful77Y0nmJL9/NUqh
 HLjL8tGkzAx3AecanXF3MfB0tPx1rFiQtK86h5abXdx7ZHvlMcqn0IkgfvoFz/ihwKOR
 En9ulmY30H4Im3qmJHQbcyxk/nytxTh/LGzFSEed+/G+aL9XYqz2yTQ7lyPtHnqswaYV
 0sGY93YEsZCMwqlIPP+iYw4Iog/m6JAk9bm4K8vlPUL/261ET2U1KzWcn+5xnjll06nn
 Og5w==
X-Gm-Message-State: AOAM531beS/N00LhcgcEF1JFm9Vzyhk7/O5fHvhIu1Mbs1vrwyeLetzd
 TLGKKLjKI8tDKzlJCJbfNrMKvOwAiDMEEMgUhphkBg==
X-Google-Smtp-Source: ABdhPJyaQ6eVd9B6SzxtJ9qIpIV127NwgBWnq05rA8QfHUnr0gUAolRXXUQKXqsEl2qp/wlkQGgU8wZxJnm63FRO2t0=
X-Received: by 2002:ac8:5313:: with SMTP id t19mr3518326qtn.148.1616492044872; 
 Tue, 23 Mar 2021 02:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
In-Reply-To: <20210322193213.18520b9a@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 23 Mar 2021 18:33:54 +0900
Message-ID: <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_093407_025538_E7002EE8 
X-CRM114-Status: GOOD (  18.49  )
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

On Tue, 23 Mar 2021 at 03:32, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > I think this shows that the datasheet is right in that the complete 64
> > bytes of "spare area" is usable.
> > I have no idea where it puts the ECC though. :)
>
> Argh, I don't like when hardware tries to be smart.

I'm sort of worried that there just isn't any ECC :D

> Ok then let's declare no ECC bytes in the OOB layout, I guess it's the
> best thing to do...

Ok. I think I might add a comment in the code that this is a best guess.

> I don't recall the state of the patch which triggered this discussion,
> so I guess it's a good time to respin.

I'll resend it. I've added support for the 2Gb version in the meantime
so I need to resend it either way.

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
