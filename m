Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2121C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 16:15:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7C2613CD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 16:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B7C2613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAFOBaoBLBEoYWd1qYb4VwhrfDLE8Boq1f72jhjm0c4=; b=05fr4kK0Yh3Vvu
	xp9vauPLSMWu4e10pTSUnJVw8eTgFte2gQiKVnob3dmV3deXJcO6sduq7yebt76dX7T5t4LtHAHqi
	E4bxFi7vxWZaHM+6kJFFWChaddnK8VHAmsKjgqFbxPMDoPEzfqrQei9DdNuxN4hV2zV74Sk8dzLcU
	93ELR3aQTwqREMkj3g6nlhV3k+Yfxjfd4mdr0Rjsv+GF7EF1FqyKHp/z8cUm9c0v3vZJvM9pWb+Cv
	LsU3bxholYxaK45CoC6EAW+OdaYrjeO/PrbEspdbFlYm11ncRQPFwuysBEeAz6h1NZQk5kIpxOJ/d
	TIqr4otcTCYZd5ZVS/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mICam-00HYJv-AB; Mon, 23 Aug 2021 16:14:32 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mICaf-00HYHs-OM
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 16:14:29 +0000
Received: by mail-qk1-x72d.google.com with SMTP id y144so19764435qkb.6
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQYAWXyVXeAmMCmsXp8rKcBE+h+Z0WB7Z2sV5nVbunQ=;
 b=OXZRLQaaHAFk9vl2c5Iqw6BB0HgA9JNnvlQB2uveNK8aIYWLQDdFgYgl1Zyxy9cmuJ
 3ijfSGqkCjlPOmCv0trXq+Ahxl5CbKuBWvVZvPsFzTjtttQu4xWAbtlnRhcU/LhXBz80
 fv71f5h+F1HHKmU/MnV+XvU69eKa3euEbLE5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQYAWXyVXeAmMCmsXp8rKcBE+h+Z0WB7Z2sV5nVbunQ=;
 b=DXuPmjNnMI45zxwiRlumoaCW4C9HPgIItc7iqrcA8R3QusMXuAx2YWp1xxwD84Z6vn
 G5jtjaMn6c1YaJuIqOr6Br/o1Q0dwqUxdcE3Bw1tOQ2cIK5GEuy7eRLsYbdIDtF7q2jv
 NHP+FlG93T2Rzgo1WrJzSZCnXoa6QNmP/ERU3c+H6mqUwK+TzjEaGlalCjTGdF++b8oN
 0LNOzLTbS1i65+6LY7r3PrElnwX/y7TSDA3bG+3ijOKdJOnikSdJSXfCWvbNf9KoeM6C
 XrMdNh2aE6Lojj0hmBuOXGq+wz9bgVVGqWawges84LsR76G6U+fVB2IOsi5xaKQEj1QT
 oEfg==
X-Gm-Message-State: AOAM531RTX5ZxEWzrhWF/zyPLRPow4xl5zZAsjGxf4CJaBxCPqfFWJNm
 owyHMTCLjEMhUgUYEFZrWzEGVZAf0mW73yfPwO2Pkg==
X-Google-Smtp-Source: ABdhPJzG5V1/DgWRHqVfKGJ7gv7zrPwRk9I3szNGp50DeenIGzSdxip4c7soAwDux0nyH+51Tp9A8GRiT4++fkx3fyQ=
X-Received: by 2002:ae9:e84a:: with SMTP id a71mr22043868qkg.159.1629735264120; 
 Mon, 23 Aug 2021 09:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210811084924.52293-1-daniel@0x0f.com>
 <20210816101143.2a64d7b9@xps13>
 <CAFr9PXnna+b3ChVUftT7YbU1kYR=5JDcik3bMNqzKK-LW=GQzw@mail.gmail.com>
 <20210823162148.35a24183@xps13>
 <CAFr9PXkSeeHNn-KVyrVxp6RRdLYExTgWpheWKLLSZqEo_EHvRg@mail.gmail.com>
 <20210823170354.2dccabd5@xps13>
In-Reply-To: <20210823170354.2dccabd5@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 24 Aug 2021 01:16:58 +0900
Message-ID: <CAFr9PXk3bUU+7gu2DJL_OrW3AwiG2YaTUot4Q-_9BJ0cKQ_pQQ@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spinand: add support for Foresee FS35ND0*G parts
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_091425_973083_EB8B91DE 
X-CRM114-Status: GOOD (  15.48  )
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

Thank you for your patience on this..

On Tue, 24 Aug 2021 at 00:03, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > ECC: 3 corrected bitflip(s) at offset 0x08000000
> > 0x08000000: fe ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
>
> How is this result possible? You are dumping with the ECC engine
> enabled, it reports 3 bf (meaning that it is actually running, at least
> the software really thinks there is an on-die engine enabled) but the
> data has not been corrected. I expect the first byte to be 0xFF after
> correction. Only with -n (raw dump) we should see this.

I did a bit of searching to see if a newer/more detailed datasheet has
come about and found some vendor code I hadn't seen before:

https://github.com/100askTeam/NezaD1_u-boot-2018/blob/1f8b282626f0b9f29f96c57d6b1a5d728e523893/drivers/mtd/awnand/spinand/physic/core.c#L46

This says the ECC enable bit is non-standard and in a register that
isn't documented at all in the datasheet.

I guess the spi nand core isn't able to actually control the ECC on
these chips at the moment and flipping the bits is updating the ECC
too.
Or the ECC isn't enabled at all.

I couldn't see an easy way of overriding which register gets updated
so I haven't tried it yet.

Cheers,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
