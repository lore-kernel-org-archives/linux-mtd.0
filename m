Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C85C10F1E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJeTKUbT0eIpRRU+RtshQD/legO7fq6qCQAmi66KcAQ=; b=QtZRP9JIbC/orE
	j2QD409GmOyXxOmFFtdS1uZL7yWAgpVawYjjmqc7vVxToIH1xwfcXjLccASAzSfCDrYv7yQbOKXNY
	s2dWG5g8kaRs/Q49W94li23291NXZntQz7ZiN3ybP5aMBX3YR0gQqPslPzk2e5pvZd4FaBvsE8KZf
	w+2vTao1BNZjE0wvfffjSs2AY/dUOu0LOC+/VAu6RtekrAMc2mGl+OSzIFMZ+1XKIrAQOX4j/U53Z
	TDRmiQIzsndhZiyLXEKSLwe6YL9+4w3+34LkJbDgfs390L6ovAuIEpd/ibOKZpj1jhhlyyhqDN8pc
	m5hfZ8Yiy+pbbsLfHQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ebF-00HQ7E-1W; Tue, 20 Dec 2022 15:32:13 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7doY-00Gsc1-BP
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2022 14:41:56 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id AC73C320046E;
	Tue, 20 Dec 2022 09:41:46 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 20 Dec 2022 09:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1671547306; x=1671633706; bh=iClaCkki3v
	9TPMge0vG+JPP+v5Fih+a6PrGlURk2qMw=; b=uPvgbxBl+RLNwBRhA3s2XMwpGZ
	adg3K4GH55BD0Uu8mXlm0O8eOfygPTlOCsQxuFjZWdoTsYZWaAzAU74mpnxERt4S
	sFpIuH/dyJUhjn9bKKciqwvGxQ6po+4G9f60Uow5107Rpb8L+SchjQDFGObo0tKr
	iDEJjRXWIGM5B9uaTuD/buHrSX27oacKqn51BeDOEbS9aOHvUbUS0gfZVXYV0jh/
	VAkks0FIjdqjRg5xFX25g0YWxfTEjd029WDiy/k84yWdjAxEUXyCgPAWsxrRqz5f
	BYbLhqLGcMhqtsTbk3tBfVyBR0Cd0reH1oaWGjC6T2hMXTV5K7+tbJjkmLYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671547306; x=1671633706; bh=iClaCkki3v9TPMge0vG+JPP+v5Fi
	h+a6PrGlURk2qMw=; b=MpCozFlq5uZQhmz/uQRiZzbJd1WOFsKMBoeeJ6d+ttTu
	J+LfBtyv2G1SGSW3Gq2dK3Agg3ovKAr4MG0ZV0pnNunWATmOW2SgBB7IdagJ/O3q
	ndEwPeBbPGaDR/3IK6Z7YHA0c7sRnWWAoKUCrM8FCIKqHvIS9pq+vU5H08wwTmsI
	2CeiLdGm7+NTeBk9IOX5VkbmMeReOSo1N6UvEB+l0C9P5AEpMfHYAmQZ3feBL0LK
	TrpADovj8/fVDXjFmHH0jxyMbtopuQOl3GAptgV0izp4PoXUY6DeWwec4DzD5Xnt
	B/PqcaL7mT9t4VohYpeVhu2i10iUM+nJZ3c/WMMdyA==
X-ME-Sender: <xms:qcmhY6RMQ-E6Dngr8oC96y6hvH8r9os_hEgAPgCYO19LzptbPE14-g>
    <xme:qcmhY_wVqYf2HGfZeWnZbtnGfhSh7AcQjRawstDFVnUKlnPiEjHbPNFMF6r3V6QNt
    iSmfbXejq-XjWICUlU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeigdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:qcmhY30cb3AK0I4NYjwOGKAQiIGT-xwHsz9gOQSandWRoDwkFRsotg>
    <xmx:qcmhY2DbBqGyDbqvqUwyrub4zc5fj5cmtS4uYLmUNImwvpFf7fSDyg>
    <xmx:qcmhYzhsx3GqcH2D9VS3GG0jhMTnZug0Y7oB5yXuWIE6OXjCc7Td1w>
    <xmx:qsmhY4Z8QQz53oEkfqoZcsuEmLUurIb4_3_XdGuLOVA63RfiBo33uw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7E8C0B60086; Tue, 20 Dec 2022 09:41:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <b543cdaa-f880-4413-bdb0-80e9a94d03c4@app.fastmail.com>
In-Reply-To: <4a378429-9a23-13a2-5837-512823e182c3@linaro.org>
References: <20221215163950.649791-1-arnd@kernel.org>
 <d68c9137-f485-e0a0-dfc3-c72c26d0433a@gmail.com>
 <4a378429-9a23-13a2-5837-512823e182c3@linaro.org>
Date: Tue, 20 Dec 2022 15:41:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Tokunori Ikegami" <ikegami.t@gmail.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Lee Jones" <lee.jones@linaro.org>,
 "Mauro Lima" <mauro.lima@eclypsium.com>,
 "Tudor Ambarus" <tudor.ambarus@microchip.com>,
 "Mika Westerberg" <mika.westerberg@linux.intel.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: allow building spi-intel standalone
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_064154_987293_E4C5EF3C 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, Dec 20, 2022, at 06:51, Tudor Ambarus wrote:
> On 19.12.2022 17:12, Tokunori Ikegami wrote:
>> 
>> On 2022/12/16 1:39, Arnd Bergmann wrote:
>>> From: Arnd Bergmann<arnd@arndb.de>
>>>
>>> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
>>> fails to build, as it includes the shared CFI header:
>> The header file linux/mtd/cfi.h is included by the head file 
>> linux/mtd/spi-nor.h so seems the warning caused.
>> Is it really necessary to inculude linux/mtd/cfi.h from 
>> linux/mtd/spi-nor.h?
>> (It seems that it can be resolved the issue by removing the including 
>> cfi.h from spi-nor.h if unnecessary.)
>
> SPI NOR does not depend on CFI. cfi.h shouldn't be included by
> spi-nor.h, indeed.

Right, I sent v2 now doing this instead.

    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
