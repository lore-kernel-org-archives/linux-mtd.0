Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B888EC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 11:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872732083D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 11:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r8t+sFzY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4CKRJ8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872732083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAuWbQ7sebuWIywZP0M1bsc4txIZgghTNMdf2D0vuB8=; b=r8t+sFzYV17USd
	pVf86WhkZVz+CGnB4WiZxzTXuN3bp5aNV7A/1nChO5fDEJGERx6b64VYP/gzoBb8IhElpKLvxjEag
	JsrcvgLLo+QuMBU5O9fEj76GQoPOJHor7rkICu9GqWNV0ciToL2hSfdfVetus8SQDUGBdaGWoKm2J
	AN1SCDwhjbWYc1MFE0+8JA3pQdVdLeS8OLWLaIkqQ96XtXtCQF3iV+eV6D8LhsDbH3Hm/4kk5WoiI
	KFhEZLGHDQjtC/D24t7FAzWl1fUKQl2gCCI8VtC3NYFPKOMsrtpFnYjQix3Gld4C2JlFJuw5lc9TI
	TD/RRwoVEsr/3cR49dOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyEQy-0004p6-RR; Mon, 25 Feb 2019 11:28:32 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyEQv-0004og-JR
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 11:28:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id v26so7686273wmh.3
 for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2019 03:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0vgsFSU6Bhl8mBC3uOGoB/E/omwDE4oHvg1YIBbnkng=;
 b=h4CKRJ8GMfJb1JI7eQliibHGhBL3TDTWVN3USNPkGEImK1DYEiAt9tnbsWmMkn0mQB
 qYexeCZrYlMXZN+h5YsWQ73bw0bM0XIWHIWW2BuOp9CKPwfzzikLZgwxm440EQ98BVcf
 EYS7bL1B5clz3gqaTKKR0lmE1t3g01lEz7aJ/Fmlk8XspbFHhPqc3cHOTUuCoDE91J7T
 QJ1VTVNe1gvtKjihw4PYtydVW5RIzsjmNUf7tCzAVoKJe3kHOEWUZACFjBvKwcwsqd0u
 QVUi0zFzQ8ksbYkfrD5Hxs9Vv4p859ypRCM5uIPNgWECZ5Af+tCNm0h+BlnSgF2LfWyz
 WLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0vgsFSU6Bhl8mBC3uOGoB/E/omwDE4oHvg1YIBbnkng=;
 b=GQ0B+Arvi+oNh8XU4GIb79EDzom998RBVKaugWP+0NP8FmyO6QWnDB3W577gD3AOPc
 Uv/Uo5+3A9J9khZI9jDvq7MrwBINOqGgA7wtig3BwvAn3omXhFt+XFv+gCMs6EoG/5Kl
 GL3vHWSNW2iDAH20VA5WWrN1lFTEyEZ57KQclI0ehezVIvYajOFgnLUs4REOKC+R1xUa
 PcQkmnOaXW1/VFgRj5ljJyVIIJ4Od18qht3LVx7kquY5RLqUv0A8kmJgCTZcGlQHKhjb
 DFQAnoCM06dOIncCa1VFooyzkhvERg/3onyz1GVeiEhkg4h3sBRM+RFjCBlX1QIUADdd
 8K3g==
X-Gm-Message-State: AHQUAuY77Q3Af5P7tAEeoDh70bEJS51Q2e1U4Jp3Tf1k41b+pf1oE43W
 ziTOK6Es7X0PmX2mcXJKdsqc8/XeK8VegtF7BDM=
X-Google-Smtp-Source: AHgI3IbP1v8B8SSLivFEgQpdE1/lUhN/+sO4CqRu6KaiAdBwYZWHDNdwhqjMdCsGFRhM9aa8TSYKAB/iqfi+N5Y4bgg=
X-Received: by 2002:a1c:be04:: with SMTP id o4mr10034778wmf.19.1551094107049; 
 Mon, 25 Feb 2019 03:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
 <20190225085631.ddsodh7x3kaofer5@pengutronix.de>
In-Reply-To: <20190225085631.ddsodh7x3kaofer5@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 25 Feb 2019 12:28:15 +0100
Message-ID: <CAFLxGvxcck2mhKA1_20Q3p1FD9MHTrcy-yfi8RxkwTgrwa5j-A@mail.gmail.com>
Subject: Re: Prevent Nand page writes on Power failure
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_032829_642849_0D8C1F2D 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 25, 2019 at 9:56 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> +static irqreturn_t gpmi_pwr_good_irq(int irq, void *dev_id)
> +{
> +       struct gpmi_nand_data *this = dev_id;
> +       int level;
> +
> +       level = gpiod_get_value_cansleep(this->pwrgood_gpio);
> +       if (level) {
> +               mutex_lock(&this->nand.power_lock);
> +       } else {
> +               mutex_unlock(&this->nand.power_lock);
> +               dev_info(this->dev, "Spurious Power Failure detected\n");
> +       }

Hmm, not sure if it is wise to unlock after the power-low pin was toggled.
Do you have a guarantee that the system, and most important the NAND chip,
is in a well defined state after the power returns?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
