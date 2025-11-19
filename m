Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269B4CF397E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nk1kXgFD25008xVhLujynC/b0NPMp/WluwTC+MjXPXA=; b=jiGkxcTuTLNe7r
	vnI72rWjFxa2AVW7tvj/M4O2NeD1gh+xjDo+wWScFl7M82mMpSB/8XP4Wvu7cDx6ZZ06tZLdwoTZ5
	jW4U2oxc0JgUzOJF7kxxK7FanfT2XroaKHWX2Um8myIddZQtU8s1E7yOjmf9wPVsscGv/C4/UevCO
	OFaElGpqN70GQ6sqo/Z6+iNkj5ubb8Te9tmjVgzjQMqfAFtDsvHOO97/SKc0cIp+zC4KnoPRIvCGJ
	us2yg5UpwBkpmjil94F8kNV1B0RRQCaUuWlOfGZEfUbuIcKiGbzbguO9s7kKsaein/ozavmjkEcUi
	CeJSmyyFwanlmifgne7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlvL-0000000447G-45sm;
	Wed, 19 Nov 2025 17:24:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlvJ-0000000445G-2LJV
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 17:24:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F2854E41786;
	Wed, 19 Nov 2025 17:24:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 052E260699;
	Wed, 19 Nov 2025 17:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E27E1037173A;
	Wed, 19 Nov 2025 18:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763573090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=StwFp1RiLdLsJV9cLt0jptBNtH9OxMuPJ8PmQfC0ajY=;
	b=gkpacRvBxMVaOw1bdmg1zk40Nb+fYkvbBLR/Kio2f7TMvdDcz1yyXLFXb1MVWcLMultBh8
	Di5rM5Aq0PmRPBacR3aXAuqcey1rfB7rd0h3hbZl6yjXlTRPvPrTOH06AQJrT8UAHegb6Q
	mrsyHOdD23cx7P/NFB5Z4P/jSqdB4jp8W16REiwO1xO+zyR4w7Io82s9J+tXPx8ScOC0Ni
	kPbnOR78WoREDv8jZffVSyavy5fYFKiLIVzsiwc+aajHXwqO62yXAas++f8aAufYHSdWEi
	97H+Zo1y0cWCwdGfpkNilxlOIdlSr/FkN4TfEaHVljtE55a4HU9RbMJ3fvCixg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K <s-k6@ti.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 11/28] mtd: spinand: Convert vendor drivers to SPINAND_OP()
In-Reply-To: <d77310d9-f865-45cf-90ae-ff542cd1140f@linaro.org> (Tudor
	Ambarus's message of "Wed, 5 Nov 2025 17:30:20 +0100")
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
	<20251031-winbond-v6-17-rc1-oddr-v1-11-be42de23ebf1@bootlin.com>
	<d77310d9-f865-45cf-90ae-ff542cd1140f@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:24:47 +0100
Message-ID: <87ecpuaqao.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_092453_748268_95CCD486 
X-CRM114-Status: UNSURE (   9.22  )
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

On 05/11/2025 at 17:30:20 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 10/31/25 6:26 PM, Miquel Raynal wrote:
>> This macro allows to silently switch bus interfaces, use it outside of
>> the core in all places that can be trivially converted.
>> 
>> At this stage there is no functional change expected, until octal DTR
>> support gets added.
>> 
>
> Shouldn't this be squashed to the previous patch?

That's right, there is no strong reason to do it in two patches. I think
this comes from the order in which I progressively converted the
drivers, I'll squash.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
