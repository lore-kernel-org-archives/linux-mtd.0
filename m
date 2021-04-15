Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60432C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 19:15:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DECE610FB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 19:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DECE610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IDEtZzqBx4llihFPJ+J/aZEPgUiXWJY/3fHZN+cDTKc=; b=megYxntDZXj53HZ4UZW7RLEo2
	oY4TFqGUJD1FxxZ+OM9f8maLYgVlUMmhAomkAg6l7xDEVhy3IJ9eSSeyfLVMvsIupvUn7afLLVwZi
	l+lYHA/68fBLauTCIBAR6+tCximEUHm4xioQkti3FG6hgAQ48ozmo/T5eILAH8UTIrYr7T8mhmEqv
	XxIyuhtsWw7OdHJ97yF7VA7FBW6UKC3eXUvdUX9KmjSqoIhx6UXcY0uBLRwGDJ38zoHLhWDjFFvmD
	TAmAFJiWGFJ5iP4KG3YRVMTfuhrUxuE8rIPHD8g0U2+fdZlPZjqSQIzcTJ75U/ute6R6KOgfp6UzT
	WH+obYFxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX7S0-00H5rz-IO; Thu, 15 Apr 2021 19:14:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX7Ry-00H5rJ-6h
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 19:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=J+i8x2/gEGoWo6ipQ2boigJct7rq7QS+7K9unXLqRvg=; b=G8vAdaOcYRvnmL973U7mftxzVu
 tKmkBCd94DMWtuZqPsSec5yN3++Psagf5FQD5UncPHfPvIMIfLBOcDXPkB/2t6Cqh63z5s4bgpNCL
 6k7u5omTgZsqxu+3MG9bqTGvRpmjdSfnFuVRLAqcZZRAzfy7OgUt4F50CdZLYLZ1WqeggnOK/yRwv
 B88POIzc+6LZa5VWQOJSOTAGCehTEr0erORLM20kgZjICgvVWfVD9gn60Ir7FQxnMIEGIb0SQL8dy
 Q5gop/QTXdS2e+KBKNdQMvc5BWkRRakP+F2971y8fcItwgieyNA78r7tGgRzjdnm6vDatDBthC07f
 Xi6qWHFg==;
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX7Rv-008q1t-Ku
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 19:14:48 +0000
Received: by mail-qt1-x82c.google.com with SMTP id m16so18403746qtx.9
 for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2021 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+i8x2/gEGoWo6ipQ2boigJct7rq7QS+7K9unXLqRvg=;
 b=Syw/7thnSFkYEW6RTzvZHAJQIwBOEgQddwfFN1Ky6/Mq/v+y3XsanH1KRa1kQfFQuS
 wkNuL4OCdUdWLBNMChEhTJbjmsBWHgg5UpdOXoGt/IzSp9PzYNhz3EYdOpRKjwfYOiMR
 iX40nlVPxOa6TXj+kUU7Dfq5BhSHg+ouCiiZg9dCe1E985vHs9Uoff9yObfo1/qANmrA
 3/AHNJltLbKequ+Lma54yj85AT6LUVolDEoi7OWFxJ5b6gsf0zfn79Z60uWV9e4x376T
 WKYOlv8eblrW3O/BSyuD40mqZ1d7XMEsoESryvPdLzwJYMSzbxjr4HJfnqC1ZPBu2MDk
 BdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+i8x2/gEGoWo6ipQ2boigJct7rq7QS+7K9unXLqRvg=;
 b=n96XDTKM+Z3oL99ZxDUTkq+1yDMM/dgsco9vobZv+UW8dMdUd7Dnb03tp9j78CVzpm
 b2CmrqibK3w04vs/OQ/Qza/2hJlmIiyPjRW8RdWiEPU0NxO8U4xEc3IMLFvCjtk13rzG
 Uf7eh86tvbF+EIQJ99xcizFuf6ymIXWm4ghXRuV5KycRBMLxG4VPOD+lyYT3RfpUlhCl
 klX2r6A2kF0npriWHc9Kf+bw/Bd6MK2nDT8zJRUdVZa7berH8lrqRWeSS18WLsjJypaf
 M7Amhp4dolpuTfPKDbjnLn9O73TvmAIWej8T4qIYydz/4KAayLj3Mjz9bEy8BxfZloOb
 54UQ==
X-Gm-Message-State: AOAM532WzvZTFv32gm/83q0LENMrmLNeKk60QmOS1oM1ja3UGLI+1+eR
 QfsY6FYplPaphvTM7ULa6y98BMtgNGiS1HDvrSs=
X-Google-Smtp-Source: ABdhPJxqw5MtgSKN0oXi0husBdWldduwvxYs6EzHUsCTexIqg/1e4xdCCdYtmOaLQ1U0/qbrliv/HSp3riWkRlrpqIE=
X-Received: by 2002:ac8:768a:: with SMTP id g10mr4337696qtr.245.1618514086605; 
 Thu, 15 Apr 2021 12:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <796d9f27-5408-eca7-a6c8-b6131e824837@microchip.com>
In-Reply-To: <796d9f27-5408-eca7-a6c8-b6131e824837@microchip.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 15 Apr 2021 21:14:35 +0200
Message-ID: <CAFLxGvwTMwjhUDEaKMw=M5EE-0+idcAX9A79=QLK-=J07NLp_g@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for v5.13
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, michael@walle.cc, 
 Pratyush Yadav <p.yadav@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_121447_703614_E0C283B9 
X-CRM114-Status: GOOD (  13.12  )
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

On Sun, Apr 11, 2021 at 10:16 AM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi,
>
> This is the SPI NOR PR for v5.13.
> I would like to thank Michael and Pratyush for accepting to take more
> responsibilities in the SPI NOR subsystem. Your efforts are much
> appreciated. Welcome and good luck!
>
> Cheers,
> ta
>
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
>
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.13

Pulled, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
