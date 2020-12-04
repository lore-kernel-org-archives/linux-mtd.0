Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B4FC433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 17:37:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B26229C4
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 17:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57B26229C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sSXb3hvT8uECAbAMgOnNfCesxg7Xqb/hFdjTeRm2sZU=; b=zKs3wrACYevLxgtclKcSKA2hV
	EpsuAEt2Or2IRhNiNtGUyF6ClHmKU6LIx5Yzu9hanCdkhZm3/ULBc4LQX2EsY08K9K1EF+PPt9U+e
	A+BPRYH6QXcn75lJjmdWC3YWKr6ge03ZfhAFG+sz7rMw0SxhThLAb8Iofk8TPlNjXaYvddaqXXP12
	yZB9YqKTMwl97gBQiyoLLzumHz5/5WrHGXsQtz6n6E1Sb5FmZbsZO4kTNaFNH/Hk9VXknYFiIJszq
	G0NyZDleCNV2UHrzCrcs10R2DJYrlVvSKn7zgt4wZDxb6UI8Jw8EnPMLHVhDy6awx0A+XEX355xrS
	ZBYT0Zcwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klF0A-00047D-MG; Fri, 04 Dec 2020 17:36:14 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klF08-00046j-7w; Fri, 04 Dec 2020 17:36:13 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1klEzz-00AFJi-9k; Fri, 04 Dec 2020 18:36:03 +0100
Date: Fri, 4 Dec 2020 18:36:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Dahl <ada@thorsis.com>
Subject: Re: net: macb: fail when there's no PHY
Message-ID: <20201204173603.GE2400258@lunn.ch>
References: <20201202183531.GJ2324545@lunn.ch>
 <20201203214941.GA2409950@lunn.ch> <rqbobm$5qk$1@ciao.gmane.io>
 <3542036.FvJvBFsO4O@ada>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3542036.FvJvBFsO4O@ada>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_123612_302294_ADCBB6A7 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: netdev@vger.kernel.org, Grant Edwards <grant.b.edwards@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> > > 5.10 is LTS. Well, it will be, once it is actually released!
> > 
> > Convincing people to ship an unreleased kernel would be a whole
> > 'nother bucket of worms.
> 
> +1
> 
> Judging just from the release dates of the last LTS kernels, I would have 
> guessed v5.11 will get LTS.  But there has been no announcement yet and I 
> suppose there will be none before release?

It was announced a while ago. e.g:

https://itsfoss.com/kernel-5-10/

	Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
