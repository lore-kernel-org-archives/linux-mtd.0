Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60818C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgZQUoC3qcar2qPm0OJVcO4I9DBne+rN+a/mSwaH+5w=; b=gUx7sJ9/nN2YXi
	0ubfxDV4j+Cqp8eMIaBgBuQK9G7uGCPLGnYWJe3WpGR1MMaHox7bnGMYldeUiUIeEhRqVk/D6n8qj
	o6jE6ECWtV8eMS2cpZ+1LAyH87dRoyXLmJnV6/+xq2AnfmXvgxSiQjqNitWFaqtSH+gj5XIPwlDt/
	dOwv1HDhq78ayrHRZaN3pUusmw+4NspRJ64vqy3LSV5Wn2eqMgD7kDVoY5Dz8UbqIcg4dBBCbry2G
	5lTCrd6VGwgs1EFcLkCJyrf9Hn/8BRasBpvIgzbd3bU4s3ca/26WoatVBenp9C8dxQ7NTxjDpgXev
	KV1E0P2DYtYibvhHR7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nERgv-008POD-F1; Mon, 31 Jan 2022 08:05:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nERgd-008PH3-HG
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 08:05:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r7so9572672wmq.5
 for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2022 00:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R+SBQZvuQCjJKBvLP1leTLpUhRdrBYluyYBZRqvLjBo=;
 b=11Oj5JJeMdOTuOsk96ZbCqZqlz9IyD99aOIMhG5Em+2J8gnX1fHNZiIKeHenHM+3nj
 mosWbfJy3QXVrfXiUsXYbWqipuZreEKc+G5LcoPK+J4ciscL8EJsJIJKobi78CayVAQJ
 U6l2NdQc5qIne127aOFtOFzUuR+r9V7FtB1rWfBtJbL+ciAuKuKDHMoBqlc/4X36tWXp
 tg9PWIb3NNDzv56ZoeUbX7AQoe30nvmUp3f4qaPZsoHexsYNcoVm/uzPrjxYdUHe+cqx
 99WlAdAnFp2YxbU0Cnqjz3eU6j+45HfHE5vrHbpM+tSkATPxz4yd8Qz9mKiOTKDIbi5+
 aKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R+SBQZvuQCjJKBvLP1leTLpUhRdrBYluyYBZRqvLjBo=;
 b=wt1QMiPyhrIDqkGQ7D3LfEnKv4b1u2JKtFh0CUBBU0hB9BXKSJ2qPE8OJR9oDi2/ds
 aHSQ5xjerwyZ+K3t999KkopAccySr49rM3UyneBZLB8mYHNoC1+tNIjqfKMtuTyckUxY
 GCHIF74KRcOAXbXXQwE4C7OVa9PFWgeGU2pMLQY2/gkTvGaMQPcfMaJgY+9vfj79MXMV
 rtPdB48waP0G70PD6vE1Xq82tzPutcDHnejk7vwHsju7m/Tq5aqgclRZgqY7IqppEueI
 OyVDP9whDnNRkFeP3enTdQmV7OsygCy8ksnDLZtbpN38mT8pGbvjxtl5d/ar/niBh0tB
 1VQw==
X-Gm-Message-State: AOAM531Izgyi9Pa4z220SVScBbGMd48V6Zu9Al8d3FZMx+DulTW2CuIy
 IoDyBKSQPeFlUXqvBSc0NpoKYA==
X-Google-Smtp-Source: ABdhPJxPlvY68Z9GPD9YGbQrcOzvI3xBdrGMW2TPOjD9Pzaj9EAABf3vJ+HFA2jD71yy6cIk3IFEhA==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr17174881wmq.48.1643616316946; 
 Mon, 31 Jan 2022 00:05:16 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id n11sm9933485wms.3.2022.01.31.00.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 00:05:16 -0800 (PST)
Date: Mon, 31 Jan 2022 09:05:14 +0100
From: LABBE Corentin <clabbe@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
 vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Message-ID: <YfeYOsFLBeu+tLLE@Red>
References: <20220127200310.4150981-1-clabbe@baylibre.com>
 <CACRpkdY7O=KjhbeBZiokchFhSo8dTM+JAeBOTq+qkKE7-63jPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdY7O=KjhbeBZiokchFhSo8dTM+JAeBOTq+qkKE7-63jPw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_000519_610425_B643EF05 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Le Fri, Jan 28, 2022 at 01:18:55AM +0100, Linus Walleij a =E9crit :
> On Thu, Jan 27, 2022 at 9:03 PM Corentin Labbe <clabbe@baylibre.com> wrot=
e:
> =

> > Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
> > Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> >
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> =

> Thanks for fixing this Corentin!
> =

> > +      $ref: /schemas/types.yaml#/definitions/phandle
> > +      description:
> > +        Phandle to the syscom controller
> =

> syscon?
> =


Hello

I will fix it in v2.

Thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
