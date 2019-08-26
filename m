Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C3CC3A5A1
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 00:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2C622D37
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 00:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HyWn+A7r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="Mbj0yx4+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W2GWZAWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B2C622D37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Io/2no8tEw7e6vRrT33aRkmgD3L78QBFwytNtj2VaBo=; b=HyWn+A7r4/tSMV
	Rd/wQnoCwZYdKPx93VqZW5Cw7CjbkULbkfSiax4VgCV/wnQ5C829+5dfek9qvdZ+Yp+iCp3CZRVNS
	0Q86baafQ2OJly0aU6amA4v4O80C3t3ZP4xOD/rakMzcx/cmVISOI12Ba2CjUgJUn1tnJrvJ6H/ZT
	Hk0ht46k2unHrR89KWLv5O1odRx50GH85+jT266DIRFE1ZqInmzVoY6GBneP3bLta3/CDfL2MX2a0
	iIhE31IzeVQUGlyx5VrCptCqf4ORGTsPddL4SGc0P4ed8AsXqXwvXWfAmKJ0qRCIhYgCI8Wi/pFJn
	TIXzvVTs2nSq3OP1olUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i22wJ-0006we-HY; Mon, 26 Aug 2019 00:32:55 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i22wG-0006vv-6z
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 00:32:53 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D7AD1361;
 Sun, 25 Aug 2019 20:32:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 20:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=KNHLr7FpZDkONrdrTMfgmWkJVs32l5q
 8UBEbVZ4NYT8=; b=Mbj0yx4+wNqHRoHG+iAspGJVik+Psof6M2v51rjkPWup/po
 lhjMguKxq16rsanQPp9T+k9GRZ0FQ0TW0+2o3PzZoDjNoSC4U+H5Y3yQlRX2isJC
 0llXpS/z4f21JP0UYgJ1QoD6PspmE4MhEu+9WKBJmUxP/vmc/ORVf1zAue3MVfQ9
 l1x5ll4QNg+ldtLjdYsx/irC9ZiMN+X+AhOBbkO6oFnmIwxMbEg088VENGcmRLtO
 Bug+Th2q1pk+JlwdAryjmCSF/fw1n5mLs8utcZPONDPw4chby6X4WkYhnPoi49+y
 8W9Rr3cF1xUh0+bNRrmpCdx90ePQIj2gPMerI1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KNHLr7
 FpZDkONrdrTMfgmWkJVs32l5q8UBEbVZ4NYT8=; b=W2GWZAWE661SpzT+G/2dUk
 LcBxzHhqno7+cBAZyD3dKAwG1X25cjzISVqvcc+pmfjiYMS3+5mG6l/htEp5jCcI
 Ax+d4ffu4GxEaqli1zY6DYG9Cfv7og+zN9zYytkWC1BCqgKp3HehDRHolWKkkY+D
 H6vSU6qXZ1PDvx6e1YvPTUS1h/2Fvde5L1chreamWJjm+pzChzBanOd5f3XgnJkY
 v790OiNDmPXMM3cv5oIPKhIkjD//7o+1jFsiLYzCMtF/mfJThethgiIn//1JXuLT
 QbKlj+HRARF/yDXGVToHWmRHNNHFALOUDD2Fo/iHg0MHF8PXVM86/3K3d5FLFs5w
 ==
X-ME-Sender: <xms:qShjXQ0o5rrKpbIUP2-vaEi52kayCGyE0j7In7aTXbM4l7VLA9LpLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehfedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:qShjXTv_RIXNn0ZVxUfIqUll46rQ1ukejRaF-7yKxPGV9pmX0l642g>
 <xmx:qShjXQWB-CaQJjdIpirzWdLz9a8ds68nebKqKPImJEAVJvNMcJagTg>
 <xmx:qShjXTyIIPKpeqJfpmhKpvgF0MMbiaOJWIovEpKg_Ma-aPzA4ZpCRA>
 <xmx:qihjXVudugTCHyi1VSVKdCsLpbS7nmXOxj56_VKZPJHPuCMMVAGscQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F39B0E00A3; Sun, 25 Aug 2019 20:32:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <ba3f204a-aa11-4a81-97ab-cf8e7eca7e94@www.fastmail.com>
In-Reply-To: <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
Date: Mon, 26 Aug 2019 10:03:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Richard Weinberger" <richard.weinberger@gmail.com>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_173252_370658_A7F9DF98 
X-CRM114-Status: UNSURE (   5.84  )
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
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On Mon, 26 Aug 2019, at 04:53, Richard Weinberger wrote:
> On Wed, Aug 21, 2019 at 2:06 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > Looks like a lack of robustness to filesystem corruption to me. LWN
> 
> What exactly makes you think so?

It was a bit of guess from a brief inspection of the stack trace (that was probably
unhelpful in the overall scheme of things). Sorry for the noise.

Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
