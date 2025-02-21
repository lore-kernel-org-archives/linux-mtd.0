Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5EAC021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PGneU0TreW99SAxZOWXP9iwGvBeYciD4GW2NgUPOje0=; b=Jbrf2fOuUvHfwbaaQHETvG+UHb
	2SUyvcAzoC7ES3B+RgdTx/Hx+7JA2Kq+LCI/+nUJRY1TVx0/pSe5uMAetoQiENBeDNtvybc/SAcRX
	OIC2UCEyukLI8dSiKaSxiZSNzca6UV3jOEB//6F6LAG9cVD5EykSaEBvTz5pY3H0n6h4O288kNnT2
	JVcRsjcIVlmWEtJFwL3kJg+x+mFBe/xWCvyI8ZjoQJKTCQFk+eFi5Y0NdvyW9Dnv1gVEejLzw0ipy
	nRJMup7dJfXyQbNhTo4nWOJb4R32cHHQsj4UIe1pqwzRpAGa34wukkGQA6QR4v7kI+3MY4E2CTWSW
	cR9ACHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVAL-000000061CE-2Cl2;
	Fri, 21 Feb 2025 15:42:13 +0000
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVAI-0000000619v-39Dv
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 15:42:12 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailflow.phl.internal (Postfix) with ESMTP id 68A162008E9;
	Fri, 21 Feb 2025 10:42:07 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Fri, 21 Feb 2025 10:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740152527;
	 x=1740159727; bh=Zogi8f8M8Um40C2L5aiooebB5l2P6zGuaVkKnMZ0aqo=; b=
	Aua5F14vWebL0DOxXVcNVFiZkYyvO+ZDn0lBIGthpSro7L8yySiSiaVg08WR7pLs
	JojgEjUtKFzq3p96R+2HmZUtkfnB835nBY2UB1NRwsKhE3G6/KpCcrJCM9nOPLjg
	2axdv5yBZa5jZAlSVtFXsSKh6/ocWFYVTAyli8xq5LHUWD1AKQJ5G4+Mr/4ewUSx
	Yn/azkxhSGwazkgtAuJI1r5HiztAgb54Hy57zjASBXgbNstUSX1FQ056H8+WzBWb
	bY73DEtylf/GOrATlkUX6KJLQyEzNftkEsaFLVyJSfRZdT3QoOtN3rFZ19iqpA5R
	KJtz9HVtMoMVC5CtzTJTYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740152527; x=
	1740159727; bh=Zogi8f8M8Um40C2L5aiooebB5l2P6zGuaVkKnMZ0aqo=; b=h
	K/x4O6oyNBPbMt/oANZVu7iwmMXMPEIsjZuQL8HZIOTsUUJO7Auhm1hFIArdijoJ
	AB7VBKyq2IuRmCYnjPjcsdGs9S/cnI6aMm4jXLNLxVrlFDCnDgv/of6zLAJcxDcI
	eL4AzPwv+QV8bY2ycaIOH64w/uZlZdCJ8e62DGEoD1siZA0vWqTZ/ReNgiqYKlv1
	mihPOMp/ykpji+1Q19VspQRFz5r4aZTlYen0gNe9e7yhu15yzjE/MGurq1TMqurP
	hR+5nH3l3BZzUbTYF6NMvpDtU6o63shcpD1jG8+Rp04xMu2H9dbuLLoa9S/eymhA
	yXXAttMvAK8zmGaHmjzhA==
X-ME-Sender: <xms:zJ64Z_O-mJRwvj1sCRG9GGTKNu1XV-MwxBvTkYAwkyjdP5scRxTp6w>
    <xme:zJ64Z5-7kYr4fO9OJH0gelcDWR2xhP9EYBEJ8--FzYH7AgrGrnjPAP3VTDrGorGbV
    -A7lGF4HomKqch4ruc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtdegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeg
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihse
    grrhhmrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthho
    pehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepug
    grvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnphhighhgihhnsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepgihihihouhdrfigrnhhgtghonhhgsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohephhgvrhgsvghrthesghhonhguohhrrdgrphgrnhgrrdho
    rhhgrdgruhdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepiihijhhunhgphhhusehitghlohhuugdrtghomh
X-ME-Proxy: <xmx:zJ64Z-QUkr7NyVicJsKDYCmEUML1cB41zvxitesRRl9w-vpZ4FIx9Q>
    <xmx:zJ64ZzspC6JLy2xq6-H8dKC9b0W5UnN9XvAeR1biFGIhHAZHAhfaHQ>
    <xmx:zJ64Z3dUc26wh_PxcfOohxsJWUrbvmi2AkE15Toc-0r6NXyMPFxzTg>
    <xmx:zJ64Z_18mDWkVYuOyPdwsKM_ggsOAz5LQTjd3DnTKUlYpcS_8aoEYw>
    <xmx:z564Z_SJKpL1igBqLIymTzZOJvFYGQRqn-AF7i_kx_KjtJ_VxT8ih3L7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 469352220072; Fri, 21 Feb 2025 10:42:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 21 Feb 2025 16:40:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zijun Hu" <quic_zijuhu@quicinc.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Will Deacon" <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Jamal Hadi Salim" <jhs@mojatatu.com>,
 "Cong Wang" <xiyou.wangcong@gmail.com>, "Jiri Pirko" <jiri@resnulli.us>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Lee Jones" <lee@kernel.org>,
 "Thomas Graf" <tgraf@suug.ch>, "Christoph Hellwig" <hch@lst.de>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Zijun Hu" <zijun_hu@icloud.com>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-wireless@vger.kernel.org, linux-rdma@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-mtd@lists.infradead.org
Message-Id: <5d662c4c-76f7-4e5c-82f3-2aeeaf9e3311@app.fastmail.com>
In-Reply-To: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void APIs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_074211_168009_A459A640 
X-CRM114-Status: GOOD (  11.07  )
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

On Fri, Feb 21, 2025, at 14:02, Zijun Hu wrote:
> This patch series is to remove weird and needless 'return' for
> void APIs under include/ with the following pattern:
>
> api_header.h:
>
> void api_func_a(...);
>
> static inline void api_func_b(...)
> {
> 	return api_func_a(...);
> }
>
> Remove the needless 'return' in api_func_b().
>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>

I have no objection to the changes, but I think you should
describe the motivation for them beyond them being 'weird'.

Do these 'return' statements get in the way of some other
work you are doing? Is there a compiler warning you want
to enable to ensure they don't come back? Is this all of
the instances in the kernel or just the ones you found by
inspection?

    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
