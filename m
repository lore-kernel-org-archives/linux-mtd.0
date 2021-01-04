Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A92FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 13:15:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4179520658
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 13:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4179520658
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ciIYMfNYfVjgfPBf7T7YjLBOsrRXhU6goyJ42y1SOak=; b=y2LIYb4y8LPUjac6/PBwDJfUW
	ON6vnebH/aLAJs7KN3PSyIDyzChunhvF1v7HRXBRhJlmg3hTSvKCNgJ+Xm3SQHG6FmGR/sM6ArtRJ
	L0g0QDxbycfcBHr1bGnaF07HDSA7EHOBbwZk5JnPsjgaZFjUDBloU8QBUXknKivKvHtAtHLp4bFDQ
	oH4y4crc6y/5kjCQIug5ZglI1SoLpGULLiBsOSd4h2Hjq9fGjWhBNa9JqMpolZZ6oK0MV+JXfeEWP
	NFbuOXItXtGc9oaZdNOrn86D6fbAkgrZ6VEPmgupM5Ffgp8vvRC8dPiFjNvhv4CndbTnOUyQo/ytG
	yesRPQzew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPfo-0003FY-RT; Mon, 04 Jan 2021 13:13:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPfm-00038t-9c
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 13:13:23 +0000
Received: by mail-ed1-x52c.google.com with SMTP id b73so27253595edf.13
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2021 05:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LmTnOyvAWkf1ZR5nEt8hocUqB4bK0OOI3ZU75pn4B8g=;
 b=rQ1aySv/Ai2QMmIOvi3obyVdHo4qx0sf1fjaXAS5KBnNL2y69Q3kw6Kt8L7cQLa39N
 OsTifxBviupCByOdGhSZm6kp9sLkZCz0Y2yuBf8cM8XeC7qHdJt3WaDkxzQ8qA6KKUkZ
 cf2ryOyKyRJluXcauzU6T3611yURcHWfKPyDwfg2zolvntSmEHLQOcD+tBFg9YUnXiRy
 01RsItPbMhQ2wg7nMK9JaxWukpnOa5e09tKuSHB+JKN+jgT3nZfZK0dEswu4kXTwUAmt
 p8f+miY70CWe2jdq/Rtwmg+d337ldJbMc4sJpOWYyUFBMbsZ3oCIdEk/AkbuXwUGX5K5
 FVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LmTnOyvAWkf1ZR5nEt8hocUqB4bK0OOI3ZU75pn4B8g=;
 b=Gmca7RCJojnyDiR/q95JcUBn3GKruNsKaK7SyGXFizEp9dZGfwXKrU9E25L49JOdqN
 EUww5beJ82TB5+y41SG/5oyaHp5QDcY3yyB8c6iaZb4q64m1RtMPQbUB+e4gKz3v/8dA
 RGo0X1bV8Oan+kY+ePeW37FqOvPTlqgyTSTot2QmDmJMg92VAhItnTZ77bVfkS2l2WmQ
 qkC7++cNijbRBeFuUgzPlCcCewZzGeq0KHZJs/aDCBNg7s85cN/iSqtib+ml2jQ0VzyL
 qCGdwO2CSvLBsalu1/w4nC4iYSM0E3tIi50dJ3hHEcVXRNddd/fRpKrsvEmvIjg7EwpM
 iq1g==
X-Gm-Message-State: AOAM532kk1MoRAbTvszF6QRlIByEk+JQFVNf+x2Z1y9EyZpEzbyDp+yI
 luEHcYp1KgqVThhFOVl8IHMxe9rbXmxj5eAhU/I=
X-Google-Smtp-Source: ABdhPJxCoesfWKWLGjDwujsOjYo8s+cdaJyZBKOpfJin4/auU3QNcr4Oqie33FxznE6OTDFJ6wuoJMoZXdFb1At8on4=
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr71508029edv.110.1609765995234; 
 Mon, 04 Jan 2021 05:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20201217221148.2877318-1-martin.blumenstingl@googlemail.com>
 <20210104094849.1850c993@xps13>
In-Reply-To: <20210104094849.1850c993@xps13>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Jan 2021 14:13:04 +0100
Message-ID: <CAFBinCDw_Zwwww88Vd2yU5sMZxYg-NQWHhLiuV7A5rhApeNroA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: intel: remove broken code
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_081322_369873_E828D399 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: vadivel.muruganx.ramuthevar@linux.intel.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org, richard@nod.at
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

thank you for looking into this

On Mon, Jan 4, 2021 at 9:48 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
[...]
> >       nand_set_flash_node(&ebu_host->chip, dev->of_node);
> > -     if (!mtd->name) {
> > -             dev_err(ebu_host->dev, "NAND label property is mandatory\n");
> > -             return -EINVAL;
> > -     }
>
> This is valid code, it's best to use a label = "my-storage"; property
> in your NAND DT node. Then mtd->name will be updated by
> nand_set_flash_node().
so you suggest moving the check instead?
the original code flow was:
  mtd = NULL;
  if (!mtd->name)
     return -EINVAL;
  mtd = nand_to_mtd(&ebu_host->chip);
  ...

by saying that the code itself is valid you're asking me to update the
flow to the following:
  mtd = nand_to_mtd(&ebu_host->chip);
  if (!mtd->name)
     return -EINVAL;


Best regards,
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
