Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEDDC43460
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:23:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5866121E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5866121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYmXz+cxiP3h99wUcwG9LZKsGMBq5ismKC4W6rn12Ps=; b=idDRzffZuO9w53tKT+zQfZcOEZ
	D3a+QA/bPNZf5W+qAMaVhm6h7jR2lQqMe47oV0daml8icaV8CQdeYBBQQiuhGvLhccg+sIUUsYtI4
	NyS0Y/lTqsEpUYHGu7SOdCOAZ6k+VQ4mTQzpF3QG30TB5+5kaZMiwBFE5cJxjadP+2FV071ZxCNhr
	W/KhwXo6JSD3ZWNwaq+PionH99cRGLp6FYujxgJr0fAl0oZo1uls+2EgMpMQ1WDzBntMobXuM6tgz
	M4cI9FYse/SJJhX6k801U400eQl5GuYxizwmdOZkLCuwdWYxDmtWVvG2Uxm5tOC0v6uQbfjFPLMPG
	ar1xVGyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljkUZ-001emd-7D; Thu, 20 May 2021 15:21:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljkUW-001el6-5q
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 15:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9wXtqm14Wbu6rfbbtrQdMFuhBEzsDRjQL4crStL4YEg=; b=mXZwkeqqvY/Sse8342+zK0NJhE
 WVIZ+hk22q5LPVGCrjfH8mbOBs3VIwq8Gz+4A/7q2FeZa9ZD/kzHMHEAghEb+m5OTInzPnNNYPeal
 Ij1nQfUcL0vRSrBKrGNv7K53eILHjXBHIvT72aDJQ2JGeNiV/l8nBgvR1K6znRoaBcKFMqNSxXTaG
 yyaF9Y/fpLFFdBp+7BPDdt7sJ+WZ0JqlvKJPkkDKtMGDc2IZafyg2LpdH7iK4HAWOBG8T0xUNaqaA
 vk2OqMlNtJxyi0kWR4/A5ytf/930W7GvdbEkdsW0+KWivCkJMglg1dMsDpNWtO2KPLhYQtFzsC3T8
 5PAWcvow==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljkUT-00GSdU-Cz
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 15:21:38 +0000
Received: by mail-lf1-x134.google.com with SMTP id r5so25082095lfr.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9wXtqm14Wbu6rfbbtrQdMFuhBEzsDRjQL4crStL4YEg=;
 b=DB9QPQRuBpRsNARyN51Fm2bzdCuEY3PF4tDqklHdMs+JmfDMNS3xwDAPOAMVWA3NMa
 zrU4dXoE9kzMGnXhrBku3RO4+gaVQvwgLYtc9zDQx12qTivqV1meRIGIqnmnJDSNC7vv
 7w8qT5pd4OVTSJMWn72xZ5Le8JkjvEgojHfRyTtYJCort1L9T2Qp7+LZkJs/zD6Ajorx
 IS+yFCw7eVbuptb1LCfigkNsEtaIHsiX4d3KGNBofS18UiwyusmFySW6+fio7atfIFFi
 tP3Tqmh+aqLhl124QTmKvmo7w0cW5EXCRIeklFqCy4k67xZ7a16EtQyLIT6H6QyccXb3
 vuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9wXtqm14Wbu6rfbbtrQdMFuhBEzsDRjQL4crStL4YEg=;
 b=aRQxZDMzohyltHfXKQvQ90S1ltAb+znvfOGGidvr9mmxkiYj5xc4PrPgo6kDuPzZgg
 4mwkWham6yF6nBhf8zX5TqPaLPwBhJAPMDUB1gUJK+JuoddxMpXp7T7v/yx+9g1h+Apc
 ZRrpZwGxzHBBY7EkGBK1AYH79eIaxJ+VE4UnHSVwPNu/wLBTSFacJARqBgA/K/LxMY6t
 KR/Ltr7ycDQx4Y6yp/hKp20swTDLFxYSeoChPfWWxF3kqS+lMWgM7qlD/JSXamBqbCdH
 BfEyCTM58aszOOd++AlbM6I8Bit+OqfEhu3rAxZvZsjvzkWEu0qJ6MAD4OHrH5Q1bcUx
 vH0g==
X-Gm-Message-State: AOAM530sp7xEuF9aRDS/n6iI+1I9hyCRcn5a6/UelqHVG4v5URhzB2h8
 BfN1p/H2fLY9wQU6ZgiPq1m1KHIKeTUY3DU0s3I5Qg==
X-Google-Smtp-Source: ABdhPJzslU04TJeolVlaOp+ZuFB9uo/a8ecihYI20CmBibMH2Igfeq53XkdEw+y+JwhX/G8F/XxqEdbA/nlrW7J9TPI=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr3633913lfn.465.1621524095168; 
 Thu, 20 May 2021 08:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210520114851.1274609-1-clabbe@baylibre.com>
In-Reply-To: <20210520114851.1274609-1-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 May 2021 17:21:24 +0200
Message-ID: <CACRpkdZPZedyuCjXN6C6NF6y8xh-fC40JQSbnqZK1EEoUNUDMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: partitions: redboot: seek fis-index-block in the
 right node
To: Corentin Labbe <clabbe@baylibre.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, 
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_082137_489758_DB703B63 
X-CRM114-Status: GOOD (  11.03  )
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

On Thu, May 20, 2021 at 1:49 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> fis-index-block is seeked in the master node and not in the partitions node.
> For following binding and current usage, the driver need to check the
> partitions subnode.
>
> Fixes: c0e118c8a1a3 ("mtd: partitions: Add OF support to RedBoot partitions")
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
