Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63E7C369D7
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmS6bRc2dEoKD0G7WSX2CeFAFpYz0mIy7r/towVvsRE=; b=lr2M4PetsrfX4d
	khQ4nbKSz3D5cftBbg5ga9qqChS+W4D99Z20gxF6hRWKTgmrFPA1asEvDl+g+uv6Li2IeM3iqPhQz
	5ZrQfwn67yj71tGi/UxwJqzcwnuWERc3I8PVTnubVal/WELswvnC3XBE8yHk85EiXi6WviDrPun16
	hINv1spBkPML1Gx7Lm+vrbOZnMR1g1zPjfUrh9BjuejrAIkbKcVzqlTcHdpIkJ0yZ42DfjPHxY5w2
	kC+o76N7aOWBuJYYgZXr1GM7C2o1iqkVtlThuhdKnOmtc2RoyUrwzapmorplZPyokbBpZ8QwkPJV4
	bKHXXyqCl9jiLE6dUH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IwT-0000000HFW8-38SQ;
	Fri, 25 Apr 2025 13:18:09 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IAp-0000000H7uP-24DF
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 12:28:56 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 76B3D114021B;
	Fri, 25 Apr 2025 08:28:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 25 Apr 2025 08:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1745584133; x=
	1745670533; bh=oDNpPryBrsrLI6MNT652iy7u9ZryJF8wQVHOnmOUp+k=; b=d
	QLZS1vHt7XLg7laxQNs3/RSjp2nYQx2mnXx61t4OGwllZ2Yk1qGJb2IrDw1LlhIN
	nwzrGSD2LxB+pDkOxUKrppjFqtHvYzMWPN0VXHScOfh7L5VXWUAGa9nlNDoKm9uK
	/xPjCvnNu9zwVwu268/FYsOdS/h1J/QOo7Gjw/JNAPmTX453++t21Hn+94mXZuNI
	1fPywjoctp8apcCcNQ8pTAWepIrpit/LFpG9kR49XRdbSQpVgLa1ZngkxRYI07J3
	Mmfqvowwz8LxXp2J06/Uoh9Drclbsn749kjx9OZgGnlgN0Ico0Wrl/j/tS2HJcyo
	l6AJHuPvDnNihSt+U9vEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1745584133; x=1745670533; bh=oDNpPryBrsrLI6MNT652iy7u9ZryJF8wQVH
	OnmOUp+k=; b=n9Yspg5xZCHkbVLlFEM7+UfoJiUJLX6/+6E3pB6Xyfcxef89b4b
	/19hzcDppt3Oh0582KczHBgO5sb8G+e4DP83k7KshsNZ51K9Tvg5O+gw8dRhvfrv
	MCUOGeXa67ZlAp2oIuFXoQTsKdfAE6N/sYeVY6sruLfubmlWvEcGA0D4aLbIXTiN
	Kzt72b8nrE9mwqemVsLD8ZZBQn8JeGjO+eYo0Et/Bo3ANzYgCqsXj+i7gpdUrv37
	saRJ9fkIBSJ5lUdIi9Nm+Mxi5R2aBq1oupUQHrbNeau2HgEQgrGApGnciD/ZAyni
	qkJ8IgcnxsEgV5vWvWaZQjAXYllHvH3JItA==
X-ME-Sender: <xms:BIALaBwbI7RNIZkzSUkRqcF85j_JdkpB3AoGf95xIZEBHEukpWIPcg>
    <xme:BIALaBTPE8uTm3KMrreJFpdrRGn1jwWnOftSVWsQBYSF52rrVmu0S5Sh255EoLm9_
    QYYm-oFz4svhZpFaXU>
X-ME-Received: <xmr:BIALaLV7S3lw3nKMDYt44ugtBzMjG8qkD8u6OfJNd7RGnR4icilx01iecleA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddt
    jeenucfhrhhomhepufgrsghrihhnrgcuffhusghrohgtrgcuoehsugesqhhuvggrshihsh
    hnrghilhdrnhgvtheqnecuggftrfgrthhtvghrnhepjeekleevleekfefgueehveejueek
    vdehvdeugedvkeelgefhleegieevffdtuedunecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgusehquhgvrghshihsnhgrihhlrdhnvghtpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgvrh
    gsvghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehlihhn
    uhigqdgtrhihphhtohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrih
    gthhgrrhgusehnohgurdgrthdprhgtphhtthhopegthhgvnhhgiihhihhhrghoudeshhhu
    rgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgrvhgvlhesuhgtfidrtgiipdhrtghpthhtoheplhhinhhugidqph
    hmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtvghffhgvnhdrkhhl
    rghsshgvrhhtsehsvggtuhhnvghtrdgtohhm
X-ME-Proxy: <xmx:BIALaDi2B7zCD1xIfS789Vp3Zl0ypkFSvqJIl-8By3nbbu5P5m-frg>
    <xmx:BIALaDCq4sTkjFppwq-q_GGh3p_n4BYrxCYASJhM18McRJx-5UgMIA>
    <xmx:BIALaMIykH5GVHTlYxktpiQyupiQobkz4UHdkomjPKwmTqsMpX1low>
    <xmx:BIALaCB6deqlUAKFo3DHVX-0ixnnUqO6_mMpdkeaqJ8-2_pct678fw>
    <xmx:BYALaJIvyXovcrkjbdwJKw4DsG-aXUoG53dlaE-zhb-I9gLORb42TQHu>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Apr 2025 08:28:51 -0400 (EDT)
Date: Fri, 25 Apr 2025 14:28:49 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v5 PATCH 11/14] xfrm: ipcomp: Use crypto_acomp interface
Message-ID: <aAuAAVOvfcTeZJbY@krikkit>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
 <d7bccafdf38259c2b820be79763f66bfaad1497e.1742034499.git.herbert@gondor.apana.org.au>
 <aAt8AIiFWZZwgCyj@krikkit>
 <aAt-GiUloeLEfu7O@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aAt-GiUloeLEfu7O@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_052855_717418_E9983D51 
X-CRM114-Status: GOOD (  12.41  )
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

2025-04-25, 20:20:42 +0800, Herbert Xu wrote:
> On Fri, Apr 25, 2025 at 02:11:44PM +0200, Sabrina Dubroca wrote:
> >
> > The splat goes away with
> > 
> >  	/* Only update truesize on input. */
> >  	if (!hlen)
> > -		skb->truesize += dlen - plen;
> > +		skb->truesize += dlen;
> >  	skb->data_len = dlen;
> >  	skb->len += dlen;
> > 
> > pskb_trim_unique ends up calling skb_condense, which seems to adjust
> > the truesize to account for all frags being dropped.
> > 
> > Does that look like the right fix to you?
> 
> You're right.  I must've missed the truesize update in skb_condense
> when writing this.

Ok, I'll submit the patch in a bit. Thanks.

-- 
Sabrina

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
