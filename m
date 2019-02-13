Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB7FC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 21:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8E0222C9
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 21:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LkAVbXoW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8E0222C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIcFgLW4fjlN8MgzvRNjR66ieeQ6kmf2Xb+4KFpAZMM=; b=LkAVbXoWVzc+wg
	GwS2HzWnAYEs+93wasdJ+l7jf5yQboBJO4thM/DS54RdYxRHBP8t06dTSA5qynGhoB0cn2wb4BkYl
	aLccDckxnmKuSe6SpOVhFPIOnF9zNmkH5OPci8r9rZgW7tkYz567XXsVR0Ijtdv+wNjCi5zGnU2bl
	Zr1GowUl/gfmAhUE8M0ZL88J13QqqlnYJlUWjPt1Y61iIYVR0uIBgP/9IzASGvPiLXFed24oF4n+i
	C38yPTXgkwHK0ghmJRcM2Hd9QB8OZ3cQlQYyws2ghCkwhsymwQYTikYIORaVRMMDVAyDzjEnJ+Mpp
	cUA5zvLcCnQryrfJ1zDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu2MK-0000wL-9r; Wed, 13 Feb 2019 21:46:24 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu2MH-0000vY-QV
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 21:46:23 +0000
Received: by mail-ot1-f67.google.com with SMTP id s5so6975829oth.7
 for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2019 13:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lZssmK74WEYiqr7XD9J9iizRSLq1vzrhAaivAYlZdUk=;
 b=hhs0yQ1n4jB+x4kiJQKDMyDJnfgIyxp2l8nXvpO+sZkbIBQ7NSY5ACKtnzJiL9KCoP
 vIjwPAt4BRn26PehigsctEj/bVtuan0zDbdERoCcXZKXiYeYyA1KJbYIttkrdXV4vnlF
 CYOJukbpgq8TawiG+9DiWXJQvYfv7Jhbg8KUswo26vjQ4NAGJmIeU1pVKLOZTKGGgz8c
 x5mM7GGvPg4Hnyfvv0jeQv64CauM+cGoV04dbUsUaYJCVERfUrFAwuzakxVFhRSf4Pi1
 nufqn7LSQXkkH4Jy+Xbr38DCEnZ/03HyN7P7z11ggNoyAFcSNoMciSFj17OmjB6P48ae
 Webw==
X-Gm-Message-State: AHQUAubHxQ2ln5X9Uwj8BVWXJyTT2j69Z+cLvRmQl3O8ou+UkBjXI3K0
 6sRwUaMT3OJpB060HVeTMg==
X-Google-Smtp-Source: AHgI3IYmyj2B8Wnq4mhjFmt/gcl9bgzukHwq6jxmNSMsMf0LZvNKkqMno7P2Iqvhb/n07kiOnETjZg==
X-Received: by 2002:aca:51d3:: with SMTP id f202mr210826oib.114.1550094381064; 
 Wed, 13 Feb 2019 13:46:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j5sm224340otc.54.2019.02.13.13.46.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Feb 2019 13:46:20 -0800 (PST)
Date: Wed, 13 Feb 2019 15:46:19 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
Message-ID: <20190213214619.GA3175@bogus>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190209192305.4434-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_134621_854983_1229845D 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marek.vasut@gmail.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  9 Feb 2019 16:22:58 -0300, Paul Cercueil wrote:
> The JZ4740 ECC hardware is not BCH but Reed-Solomon, so it makes more
> sense to use the more generic ECC term.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v3: New patch
> 
> v4: No change
> 
>  .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt    | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
