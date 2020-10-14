Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6CFC433E7
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 12:30:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B947320848
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 12:30:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ut8MHeBC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uNUZMjRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B947320848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N3N53SrfynWWsmaAn0mHFzIHE+mb61wEF6B7IuR8404=; b=Ut8MHeBCbhXrGZIAqT5a6IuFs
	MDx2FFy304nWOS/U2xydG+WzpbrrxW39zgD4zK0zD2pTpxin+r2t2V0ZM0uKk4Bsm/iv2PqV7sv+J
	OQbY/hAO6XrAxKddsHIP9Oum7KkmZkceZdli82qi4fdNkEEIwQA2JUgHWSvmsXTqK4u9CEFEz5QzN
	ZqHdf9901QAIzQyRvkOeBddL/t9fKl5vUj4QxEbFZOa7tfGWSqWYPl7CDr4wn+Q6vcfYXU2TK+H0i
	G+SB2P+Q5315QE5e3qyg4JiokjCJu/1qastFmYf5HDuQ9sk3KgaZLoS26zbnKLJWgIIBeDF58INvZ
	H/+KFrqmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSftx-00052s-3F; Wed, 14 Oct 2020 12:29:05 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSftu-000510-Ue
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2020 12:29:03 +0000
Received: by mail-lj1-x244.google.com with SMTP id f29so3002062ljo.3
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2020 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xtG/gwsTp/QhF3XrG67M9zGwKAJ8eN3YqnpNRk6BF4U=;
 b=uNUZMjRSap8H/u2m/asyiiVUQkHD9zJpWjpIoV35cXL/Dhr49H6Q7ybLUwt4m3yQKP
 dX4BCe24Zxu332bgNbY7UxDK5N4uP/NxF4mtEYH+ucfkEypyIZ9id0/kkg7j4+W1QzKP
 xKjhEYktxvhXEilqc0GIOlqxO00OoC7ORtuJgrLD2pVpYco8iSct0nfsM8nJFajXV/mZ
 dYhkFnXEeOzQaosyd7KwRtaSo8LMDMYhe5IAmiVyHVTOWnMoT9g2jIDrkCnzjAwZmrkf
 sgs847rPzMIM/wdGeqHC+TtYFoA3OURK/ZUaIqyywiM7YpeAfAwFHvbpfo7RB+GbtMw8
 zTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xtG/gwsTp/QhF3XrG67M9zGwKAJ8eN3YqnpNRk6BF4U=;
 b=NVXhBXBGmnqGge31y3p/LMDqhKzQsqTzmB0hbUUtO1WxViP5IDWerhXpcF7Du/KEHv
 15WwCoyMazXGpvJx7Bbw8lNy093wwL+OD2FmHGYH6Y9iy1gMQJ9MTzykwTo45att5sUG
 YRaI0ZLnC4t87PEBrVd9krU0EcgWjmpWhxnBKGKLz12ELPxJNaliC3dB2cfsJ1ulv+H0
 UsF6D+ySSC0m46VZP6LBKyO9m5swBamEbEBokBdV2LhWpFV+kA6tBCHDH7y5cIMr9xo6
 leCfjk4Ya6neVq+NiZj2GzUbR+z5oWVu9tUTzAO2fNns+2e8WsA3LaTfeeiSrTDrQkde
 uv1g==
X-Gm-Message-State: AOAM532ISW60DPoMqY4GNM3I9MzVqDJkHrLAeJDZYVoXjGVWVAx3sKgU
 Af6B66791jrNI460Pc64VeoLHzH7wwLXpdb7lhg=
X-Google-Smtp-Source: ABdhPJwwcXa0eznaW8aSEwQEZZO7J2RVs3BEWKBFhgzX1yF1g22CuKEtKkJjzK+eCrn3V4OhjPkwYiOG4iypM8jxWGU=
X-Received: by 2002:a2e:9ed5:: with SMTP id h21mr1585898ljk.178.1602678541301; 
 Wed, 14 Oct 2020 05:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
 <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
 <20201011055258.22337d66@canb.auug.org.au>
 <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
 <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
In-Reply-To: <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Oct 2020 09:28:49 -0300
Message-ID: <CAOMZO5DxVQ1va4aviTkgC0O6+KmpkYvYDVPh7v2Ajqggq7aoow@mail.gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_082903_035173_3AAD7CEF 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, lkft-triage@lists.linaro.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 abhimanyu.saini@nxp.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, masonccyang@mxic.com.tw,
 Poonam Aggrwal <poonam.aggrwal@nxp.com>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, open list <linux-kernel@vger.kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Suram Suram <suram@nxp.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Florian,

On Sun, Oct 11, 2020 at 6:59 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> however the NAND warning still remains. Someone else familiar with these
> NXP development boards should fix the DTS so as to provide the require
> ECC strength property.

The ECC NAND warning looks like a regression.

I had originally reported it for an imx27 board and now I also pointed
out that it also affects Layerscape:
https://lore.kernel.org/linux-mtd/20201013193652.0c535c7c@xps13/T/#m09fad7eacdf86aee0834bbd8863d6d5ee2e69f8c

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
