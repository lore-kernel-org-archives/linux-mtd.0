Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99179C5ACB3
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 08:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIvxYHV37F48NZDEKso8BJSmDmgXl3YyBf2TtKnhlzs=; b=NQiASuplc7Z3sZpK0qwCrQHUN0
	MC0vlgvaxgI/7TGLgtjbtnZQq0qKgndTT2ra6S+c0YefcrkgQYLKfQIrP8aFe8m9cunfICZB2Y1WV
	GZ0sqZSACOSGLDxz2SgCh0+73PSE8t3AWVpxhRHOzo5717Dal4n9FyWnMGbof6gYW3DtCVmS3vPbw
	TV5MpOeP6H6JPJuiVIYXcWyg7LxQCPmektpL71XGPKjexOdR7Xn633NA6t+iYfanRItFo9TRbJBYT
	rrOVZBR82lFJ+Ceu6gawZRbSGrWiT+ZLXqzf4A7aUqlyQ2JxU+tPxYC/ewljGK8oONwCwW9PchFra
	aMI4XMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MTZ-00G336-2T;
	Tue, 21 Nov 2023 08:51:21 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MTX-00G32H-2a
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 08:51:21 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A61B8FF;
	Tue, 21 Nov 2023 09:51:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700556676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wV+xRrRtAJ7YNqwrLglaK2AelBYlngK2iWAmT82OvRU=;
	b=yuS/NoXeAFxsi8pAiSl1gBZ6ldXzq9V1D29QPXxE5EoBUxVS4L02U9AjEXjN3ddQgG5nVZ
	2nDvi3F0K1n0XTfM504dJXIdXKt7Yf30+n/4LnL0QPk6grom9Bw6E9CiAptn+a7mBosvlO
	nl/O0wIn6w03CFYNvsNZagGY5CqPAp2R+NH7sH9C+Qc2Ty9P845qxjSgPcBGT0lxNbFAYL
	v+z3GZxLWKwRY2zlhnYZqdEeaOwy1JIiZKMNGZquFcbkHOFIEYrvnA+cW9CXfDaB35wnNo
	VRiIjQuCNTIKuGf6gWt/bQLY3aL8huYAK5Y2EjMEWBFJNC3mt9G2ZWyLgRgjLw==
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 09:51:16 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <CAAQoYRkw5hUONJ32sGKxgv5XtO24Vc6=KojankTG73u5E7jPBw@mail.gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-7-jaimeliao.tw@gmail.com>
 <8eba400c77127b0df74d2a336561a49d@walle.cc>
 <CAAQoYRkw5hUONJ32sGKxgv5XtO24Vc6=KojankTG73u5E7jPBw@mail.gmail.com>
Message-ID: <844becc9c6fde66c4d60a621b5462998@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_005119_998786_BF856F2F 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jaime,

[please keep the CC list in replies].

>> and sometimes incorrect. Therefore, at least drop it and just list the
>> IDs.
> Could I know patch 6/6 only or patch 5/6 should remove name as well?

I'd say yes. Tudor? Pratyush? New flash additions without names?

As, mentioned last time, for OF we might introduce an of_compatible
(thats then ABI) - or - we can use the numeric ID in the device tree,
as it's already used for PHY IDs or PCI IDs.

Jaime, could you try to use

/* Apply vendor fixups */
{ .id = SNOR_ID(0xc2) }

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
