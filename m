Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DD4C54EE9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Sep 2022 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKdlLlz/O4j5Hz/grsaXnTmafWAfhYtmcpBGcher1N8=; b=GHJvaZSoLFWvIN
	sGmWyq+JET8x7fCEugqfDtdXzJuxIdbcPMa5rnp7OnG+Tw7C5VHe91eSCV98SVPnLqnT0dm2X4d8F
	UwwHr9tVc5jiBM5fHIWfKF8jrvIgodw1oWeW5JvmgVMQtY60CvSGoUgp0t25/iz1osM4jOnY51ITT
	c9ljYsr7eC+RrbqRh3cZQCwUQbjGxJFVBP1nGo3o6L9NanE/pGGFC5XXfhlHqnQOc5Nq6/abxcVYg
	DRqdSdLRrfl3fjMhffqTLC5ys77VV1sC9TCfJ1+58ud0mZvvvTD0NQzGLQY8oBwsFo6smdOIIigHJ
	qexFbOpav1WWogcO3azQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9n1-00CplL-37; Fri, 16 Sep 2022 11:45:47 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9mx-00Cpgp-Nm
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2022 11:45:45 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id A086A580A5C;
	Fri, 16 Sep 2022 07:45:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 16 Sep 2022 07:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663328739; x=1663332339; bh=eM0zkrYKkb
	R1hHKUibwuksFexdGqU5ZZzCGObF1lj10=; b=aRC0gB+jlHnZIwJHvjm4H8il/A
	gXfQ7KHQTRCm52vJyltXqZYxZYeYdPKbby5RerDJ0Ox/lB+4hs6NIse59JY9WCvP
	/3peHYH8Uw1dMerZoJABUIbDYK4EJ2ylcydd109ofUXH90ncF6k1EqhZR5hrI3Xd
	0z5g3jIEGTSKAOjHlCGn00kUg3EQ7M5X3DShg9Q2MKMYjibk3+yeOunpR3LpQY2d
	rsDSjqt8Ge1AYvivgckhDRTMH/bfOLa/GrfHyhprKTctqfIyN8YkliDRcetqbP63
	R5lbQ0usBF8lCF+Ow+uKBzvQFYCvoKZyNnq4/KQ/jUtdUoGB8tpOpLtTGGJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663328739; x=1663332339; bh=eM0zkrYKkbR1hHKUibwuksFexdGq
	U5ZZzCGObF1lj10=; b=CWVkr1e0IseTqGS4lGkkC4NJjvyK6Hz35gN9o1vvIThM
	z7cMxLTIQMl3fqFyieZHHtnQ2hhifyzAsts+OBE3MGWRbTJZk4I0K/5g9sj7cQIo
	iFThSIXeVRmqXP8QAoSP96+OaTzAEVaZ5TGVfAnIztSuMaD5cMvXuDo25Mr7x9ro
	hlI3iG3UgRgInMh+OnoKJI/C9ShWhvgVtT1WB6ihrVSOUC3bKgdsBUzhzx2Nofan
	agTudrwcnw3m7dLeD9sthMwwWUo6Qf5xTOvCwpqBJRkhA8zOnQoUVdf+QhUuafLU
	qpvcnGb/ATs8FNOSmJKfNAAbuPMp9EwbDEqQrgawsw==
X-ME-Sender: <xms:42EkYy4BoFbsuqGxgexhyDOd8zPHx1pF9aL4VVxi5aH443HTmpnnnA>
    <xme:42EkY77wjeXNDFm0ZaZrteGP0LrB7X2exmSC2_L2ynSnP6WIQJXLOb4nalNk7wcH6
    MQz9fLQLFCuE8qTBac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvtddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:42EkYxeNQu5wtCN-yTKSohy42A2Q7ZTnCtzjLODiDkQceW4cT7UfrA>
    <xmx:42EkY_IoMIWXfhzVi3LUl2Za_sVqfJreBElPWnwKZpHFip4BIzhFGw>
    <xmx:42EkY2KfptFlhY08pbiyzM12U0JquQRMmDb79jmaO-nhX_dg4jLInA>
    <xmx:42EkY1_pGspje9SQ6daHcyZbVpK1E6VzQgLzC30aJmUk0EWq5d66Ng>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 183F5B60086; Fri, 16 Sep 2022 07:45:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <c243fd70-782c-4663-b08d-99f44ae55fc3@www.fastmail.com>
In-Reply-To: <632455db.df0a0220.9684.aafc@mx.google.com>
References: <20220916001038.11147-1-ansuelsmth@gmail.com>
 <4dcb0e76-b965-42da-b637-751d2f8e1c51@www.fastmail.com>
 <632455db.df0a0220.9684.aafc@mx.google.com>
Date: Fri, 16 Sep 2022 13:45:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: handle error pointer from adm
 prep_slave_sg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_044544_113685_173B70DC 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 16, 2022, at 5:11 AM, Christian Marangi wrote:
> On Fri, Sep 16, 2022 at 11:01:11AM +0200, Arnd Bergmann wrote:
>
> Thanks for the review and the clarification!
> (Also extra point the fixes tag will match the driver)

Regarding the fixes tag, how did you actually get to my patch?
While it's possible that it caused the regression, it did not
introduce the ERR_PTR() usage that was already there in
5c9f8c2dbdbe ("dmaengine: qcom: Add ADM driver").

Maybe there is another bug that needs to be addressed in this
driver?

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
