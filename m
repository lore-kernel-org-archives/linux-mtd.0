Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6A2C61D92
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad84sc0w+Z2lsbfqnlibBcpW9xcTEYUmNxKh/LWZtLA=; b=ykq2gHv16OAOCQ
	Zg5XcZHJ1gJVO05YhIo2sS5QQUl7nsPNkuTWnEBIgMYr18Zyc39/ostKWJbHNNI4zLX5pL7lGANaV
	ykZhZnEInBi/qM/tlJ/9OL7RGhS1E9bzAbEjubfyt1BgOeL72+3v2wPLavQUSYwyi8YGD0NJuAyZ6
	FyV6ra9M8ikbJTtqDvUij1Kw8eZZXflBBWT8fIni9tIs9LEDqOptOoM910Tc+g3p4qA6jnUlS4bh0
	N0WNCLhHOuSbu2dxV9+8fUzky/2ZHT4Y3pZbALk4E1yCs6/AXm0w8OyXYtVaUKi0t/Iu1B0757J9m
	/TK2rfgMtH1v34K5JDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QYj-00GnNl-1N;
	Tue, 21 Nov 2023 13:12:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QYh-00GnNH-0k
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 13:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F3874B821CB;
	Tue, 21 Nov 2023 13:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D1CC433C8;
	Tue, 21 Nov 2023 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700572372;
	bh=w+KuSoXz8VgiygUzSpg5nY9w2kQX+9gSp6q4pa7y6gI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GvcLGCuZg5BeO/tEh1VSVQb03ISqEa+Oi36+d0umzvVzY+KGMgNDQfJgZTV6WeLNU
	 jUxdgPHcRnmGwkGkR4v6p82cDq6WjyGYXwBRw0d53sRjDGa7KFcSfkACO7zlC59YeA
	 +wWRljjn1q2sHMAxKIv6p+cQ/txQBVq4u8bi5+QEZ+OaA8VffPSjRlzPatfxBG7dj7
	 CyusWIqooV3HatE6+4qJUWUJK5CmO70a0qSfEcNMDEbQLUYyeLCd4RFtXPrIDqm83r
	 mdqyD3JtO5y5FiVL7GeVzVWNnIc5cEWq1fVnpu4dbUKWB6eQis+qQwkC4QLKqEPlj7
	 zZoXFZ+nTwgMw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: spi-nor: add myself as maintainer
In-Reply-To: <20231121122134.1952738-1-michael@walle.cc> (Michael Walle's
	message of "Tue, 21 Nov 2023 13:21:34 +0100")
References: <20231121122134.1952738-1-michael@walle.cc>
Date: Tue, 21 Nov 2023 14:12:49 +0100
Message-ID: <mafs0msv7s10u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_051255_571940_3F30E658 
X-CRM114-Status: UNSURE (   6.65  )
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

On Tue, Nov 21 2023, Michael Walle wrote:

> After being a reviewer for a while, add myself as a maintainer for the
> spi-nor subsystem.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Thanks for all your work on SPI NOR :-)

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
