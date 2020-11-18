Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B5BC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 14:45:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4CF22168B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 14:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OETgU/ds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4CF22168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y1Bfdw4625ckAGqrRa07VX3PIuMtHwB+0eYyiusvuJI=; b=OETgU/dsfdLyfMGksJJb1/aFT
	HfhiGLTjePJmC6anQNezU+rum7J4oaT9ToJAD1RSMBz5h0Rbnj1ynOOaxc9z1iIFJCkQCk3ueAHwn
	Un1kRxz5zGb69ANvEPiL7YJT+ncAJnIT1d4j+noQHQddJOyuF6ePqB4MWwo2sNUuDE54Pt4jzohOz
	Mikc2Gl4+Ln66g12/hxi5fO53Wda1Yv2VgmzdfQsfW0BeuNpQ+daHT78qZMyxK2mjm63d1sgeFdTy
	VgHuefYLPpdoGLp+SlN3zwiszwVxIPnQB0fA1r9jK3gmCsSPE7h62vKS4Xj9PPeE7oiL+BAtvEnUf
	c7LBA6bmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfOgd-0006uX-Fs; Wed, 18 Nov 2020 14:43:55 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfOgb-0006uC-AI
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 14:43:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 8B7B81809AD0B;
 Wed, 18 Nov 2020 15:43:50 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AKZUPPYghjqS; Wed, 18 Nov 2020 15:43:50 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KJOHNBwi9txs; Wed, 18 Nov 2020 15:43:50 +0100 (CET)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20201006091912.1139071-1-u.kleine-koenig@pengutronix.de>
 <20201116093935.zhf4bgiwggwrnnl2@pengutronix.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Subject: Re: [PATCH mtd-utils RFC] Add an ubifs mount helper
Message-ID: <a7d69e22-73b3-c960-5ff2-4c6bc56caf38@sigma-star.at>
Date: Wed, 18 Nov 2020 15:43:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116093935.zhf4bgiwggwrnnl2@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_094353_472506_EC2609D4 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 entwicklung@pengutronix.de
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/16/20 10:39 AM, Uwe Kleine-K=F6nig wrote:
> =

> I didn't hear any feedback here. Is reviewing this patch still on
> somebody's todo list?
> =


I compared this version against the one you linked to on IRC earlier, where
the idea itself seemed to be approved quite well.

I don't see any issue with this patch, but I was still waiting out for
maybe *somebody* else posting some kind comment or remark, if not outright
spotting an issue we missed when discussing it on IRC.

As there seem to be no objects, I applied it to mtd-utils.git master.

Greetings,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
