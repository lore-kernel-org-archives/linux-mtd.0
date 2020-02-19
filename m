Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23858C5ACC4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 23:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E679B206A5
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 23:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJagZT4d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU1uqUYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E679B206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byfrId2CcrP71Vg8KSW0VPKWbvWi7QtkzD7BUWUcmcE=; b=KJagZT4dYjTC+R
	pMiw7ufv99XqLgVbkP2yJCvlquphjRF7P6bZ3qbE3uP+CxWNYDLC32HZJD1kc1bpD9Llqcz3IB2uA
	T7AY5+AYXqlu0CLLg+wP6FYfQlaIr3FqsbKvAKfSc3Rvfh40dGg5X6NbtYE9Q52T4L5TkPortToIw
	jxWnAoIbX5Hzc15XvI0HKwsM28+z45FYqYRWkRmdjZm6UxOxjqFv6LOvIan9Qwq1GskJ71vDir15U
	HcSrd9Pq1vqGD2km7yGdGh9X3pNMKFRdHY/kSvs3Cq2TBYgPZhC9VfDcjbwR+6ou/ebPxkRtcWcAZ
	JZhC+UjrkT5/eiAlySlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ZEU-0004vZ-D4; Wed, 19 Feb 2020 23:58:22 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ZER-0004uF-5F; Wed, 19 Feb 2020 23:58:20 +0000
Received: by mail-oi1-x241.google.com with SMTP id c16so25737794oic.3;
 Wed, 19 Feb 2020 15:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BX9+oiU9NUzGK1+aV9/Uah0G+lhW9/DtCwBAHxWnn3I=;
 b=KU1uqUYVxkoQfS26YEi+ztZu7uQD6NmCYAjnD4WbMrS3FbUgBPMQxL4cToOQRD6Uov
 nHqZX7QwUxnmIRKEcKaP8NEsh/58I2e78+wWxDrpu1BXApMDiJMolk2hwg9CzqcOf9sW
 YE4tYRCZaEyh/x1674lcZY1l/H0F0ArPvwmZIxON3DfEjagSV1uN/AxJKPXKBeA241xL
 WqwyGwfYPVg0aO9XUojnJGQxro+u25NEoqXrbNR09NiA6eBYzNO4I80Q2dLPiRbdLZkb
 04tkTaqeTm6+rrMCyLbyFF+HCBtuFvxa0v0YSX5dAdbBWko9TEenvJpgjmfSY9CevQ+/
 hitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BX9+oiU9NUzGK1+aV9/Uah0G+lhW9/DtCwBAHxWnn3I=;
 b=uaHmbNI+fHWgYYRGZ/vrLituSI6l2iSFLq4EwM5G1NMTrrH1o0mvO2mn5kyOzE/26h
 1J27xxEyThzRnUzlbkn4d8+E2m6Tj53sidS9dT6hbWkX+FdLdgYsVbPXC5MysvkFZ9aZ
 +8fYXM7BnfrvGduD7cv4qkePBj4f4dLngNssUGMA5cf1EHc7WEzPCqCqzFmrG7dVOe56
 VMKT+LyXLd+mcrrlLG3ZdQIewwmNC0XniR3l2CNav2mj72a+7rEON7OtBmu/3rxsTTYt
 blkEoQhwNF9hNiKUnHWTQhAK1VVpiWIMaML6KrD5xfzOhcd8zYu75IZEiH5qckVCrY5Q
 /Z+w==
X-Gm-Message-State: APjAAAXQrA9GZR/2Bt6syu/PJkJRc0Za0Mpjrg9s9S6IPUtdZCHiv54w
 VWpoHI0CACsZBK5hLhvt1FZBQoPQZOfCEss5N1w=
X-Google-Smtp-Source: APXvYqwRxzwlvasanDAZCzqmiAcIi+8du+kTb0XmBWuXgm+lcYoRDBqJdLFMRLpwiKeOks5taARgUtmAle4aHBvqjI0=
X-Received: by 2002:aca:ddc2:: with SMTP id u185mr185041oig.24.1582156697455; 
 Wed, 19 Feb 2020 15:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20200215065826.739102-1-gch981213@gmail.com>
 <20200218125557.GD4232@sirena.org.uk>
In-Reply-To: <20200218125557.GD4232@sirena.org.uk>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 20 Feb 2020 07:58:06 +0800
Message-ID: <CAJsYDVL03KJv7eewGekBPCfpbOuTX0tJ6qZaydvJnBDzZ5vEwg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rewrite mtk-quadspi spi-nor driver with spi-mem
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_155819_225081_D5BA6EAD 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Tue, Feb 18, 2020 at 8:55 PM Mark Brown <broonie@kernel.org> wrote:
> This is an ABI break so you shouldn't be doing this, if the existing
> binding works it should continue to work.

The missing spi-max-frequency is the only part preventing old
device tree to work with this driver.
If the goal is to make existing dt binding work, I could patch dt using
of_add_property in v2. I saw similar device tree patching for legacy
bindings in pinctrl-single driver.

>
> > 3. removing the old driver. I'll create this commit after 1 and 2 are
> >    applied to avoid possible rebasing due to any changes in the old
> >    driver.
>
> This isn't great as it means we have a period with two drivers for the
> same thing in tree which is at best going to be confusing.  There's no
> advantage to splitting this out.

Got it. I'll add this patch in v2.

--
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
