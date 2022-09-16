Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7C1C6FA90
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Sep 2022 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woKcXGOnR57cxmXL8iPQD9H8uxqcOzzw60NOEsZShn4=; b=psYpfMbBHRkAzE
	qOhRNDQwFrP0EyVqecQF5cOYmFqsd+IFvIvsLSgi6ygi5+dGPdhoA8NShOW0sxZlfzvjiTZRTXvHG
	8N2BHBOBDzNh01QFVMhE6L/sIOHQGc8f+toAWj+as4jcQxqiZJU4IaLknFOP4IZvYFXqrU7clz9y7
	oJ1V79sDgIuuA6unZYifkGBMes64nl8T3V0xp06pObMa4BlYmso7Jq43MKm9yEWLfpWzY4JKtJlpK
	fqy/RO0mJcoGAcuy2YTSO41X/wZmHAtkvxo+XRUYdeVkEqCEChEI0e47CVhvYgNPTvTiTPYKAW+0o
	ticfQZ+R7uo5jk74VC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7Fa-00BTwy-Im; Fri, 16 Sep 2022 09:03:06 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7EA-00BT1k-Gd
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2022 09:01:44 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 916DE580E9B;
	Fri, 16 Sep 2022 05:01:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 16 Sep 2022 05:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663318892; x=1663322492; bh=eSy6TVmDPq
	cwPJ8Iryb7Xwdk6oM2vvcqIdcjswH4P9E=; b=rHo2dTf9SE9S0gj2sOVe8pVO0W
	Td7NhKdEevcRMSDxrlt5f6VZe80+19QkGriim8Fmm6LnbygI6ZZlbqmXF562LBK/
	0RlGKgsVwYBRMFQfSYn6mu/yXAv7+PGopEYhS0kdjBDCR6koWscqVFJbqhfJaFD9
	eTr1x7iI2tcXcAvVVYKlHK3BOfCeurroaxfrSFGsKecX6j6L+kNKbzF4E/9kYNcc
	EtBzTcyPTiieH3falT3odzwFJflCJRGX+1WkFUE0eMWiaIWYOYssobHpWxbhHzMi
	IuIDW39V4eJmcivJzq8bZ+ij/N+mVSTk8IWTYIkq1Z+Kz8hPWpy/Pq+VTCXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663318892; x=1663322492; bh=eSy6TVmDPqcwPJ8Iryb7Xwdk6oM2
	vvcqIdcjswH4P9E=; b=rYMcLawC1WVkZQ5ZsW2j7sIZ7s2vguyxJM6ld7kKlR1o
	O3igcFxjFQ9aQ+XQH5sV3A7mw1uTWU6slKTdbBmXIGBs725N/yVP5DMR/vXS4Psp
	kG8iNsh0q2wqBe6FX83eGCCLZdZxn0jddAgIGuOuxTljuz5XMLbJR65jlGtnf7yD
	y22IS59O3cvlQVxXJ0s8TDNMhE+TDJBVtZ/aJHVzt/7BI5FkEcqbsfBzn9reOtFz
	r8/w4irSp0HGH5jban+7wZauToQ3uRRt/WeXKg8Gxz/X32L33nsSrHxT3FVfJdof
	Tc+VK5S51J43zho/10TtaTLW/fYTnf+51hICEdiEFA==
X-ME-Sender: <xms:bDskYzJ8ujs6qb8cpws1p2sQdxdIUNBVebt7AGW8awR-x1TPHGMwaA>
    <xme:bDskY3LpCRzh8rHB-CiHP6350nPWwIqjnZqjbL5rVMLqf_z_LRVU4L_dmpc77rMpL
    N1bB1bu0us_ErcE71I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvtddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:bDskY7spbeCsSuJuDUkb7m3M8dfKgweKqqDMsV4lMlElBnxGZxTY9g>
    <xmx:bDskY8YyQImQsG7U0ohA7BcYMs6KtM05Ap7DIzCnvrcc30Htx7JtJA>
    <xmx:bDskY6ZGv9z8vadTzXkJtkoIExr5VRBYMZ6rhHNCBUaMlUbLGOIAxg>
    <xmx:bDskYwP3dRa-ntBz4APv2sLSWGgP6GwdMsyCVym_q3hR00_zoQxASw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 274D0B60086; Fri, 16 Sep 2022 05:01:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <4dcb0e76-b965-42da-b637-751d2f8e1c51@www.fastmail.com>
In-Reply-To: <20220916001038.11147-1-ansuelsmth@gmail.com>
References: <20220916001038.11147-1-ansuelsmth@gmail.com>
Date: Fri, 16 Sep 2022 11:01:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Marangi" <ansuelsmth@gmail.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: handle error pointer from adm
 prep_slave_sg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_020138_684520_AD97DAAF 
X-CRM114-Status: GOOD (  12.01  )
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

On Fri, Sep 16, 2022, at 2:10 AM, Christian Marangi wrote:
> ADM dma engine has changed to also provide error pointer instaed of
> plain NULL pointer on invalid configuration of prep_slave_sg function.
> Currently this is not handled and an error pointer is detected as a
> valid dma_desc. This cause kernel panic as the driver doesn't fail
> with an invalid dma engine configuration.
>
> Correctly handle this case by checking if dma_desc is NULL or IS_ERR.

Using IS_ERR_OR_NULL() is almost never a correct solution. I think
in this case the problem is the adm_prep_slave_sg() function
that returns an invalid error code.

While error pointers are often better than NULL pointers for
passing information to the caller, a driver can't just change
the calling conventions on its own. If we want to change
the dmaengine_prep_slave_sg() API, I would suggest coming
up with a new name for a replacement interface that uses
error pointers instead of NULL first, and then changing
all callers to the new interface.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
