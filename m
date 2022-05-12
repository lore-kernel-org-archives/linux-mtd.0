Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF612C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sUoWmIkWhhXF+BJu5dM9VUZ1qL/O9GPydxCTt9HJV8=; b=uVMG/nzKsKcFZTClGvHpMkZJj0
	cgHSKi8Jiv8E5WB6YJimGMZCsPI2kNaPfKpOw26fpIfvMRDAVSdrsnV772yn0DVh1dGlS1mtoswlD
	+JSzjKhtRC56RguaKLoz9gYNgVtn2BH8xqt/wGjLETf7q/KeMGtn9gjAIxqu6xzMO8xcZfR0jtLdp
	bjZ0eYWxsSvuz2JYy/YIy+doRVqUZQu20B839meYxPIG+snsLJHffcv5ODjPKjNPsrxzrcB9CCxew
	Kk8ZCsP6l+vj0rlnT2Z73alK5gHVSbBGTDXpBPV+QY06VX7LXvqOiABnwqVHDNLRtUpeY7TyAq/H5
	vrMyBfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npGGm-00Dari-68; Thu, 12 May 2022 21:22:48 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npGGk-00DarH-6g
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 21:22:47 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DE3822223A;
 Thu, 12 May 2022 23:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652390564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EUSgAI+4EbRG3zlgjxicnUqW132oAIQ3UJGFON6uNM=;
 b=b5t7gUAQMVQBjJdQXcJxCPDxgF+/Eqn7QEgHrNQzXmZbABcjLZrJd6q0yXuhA227YlR5Hn
 d/YHApdnwyEeYjiVcX+i0E2BBA+dw302ztt2QXyFBmP8lnhf5rrRgW2lvB9xsaNfOxCwOi
 /06AxCJQp33MYlUBPN87wc8TTXa85Zw=
MIME-Version: 1.0
Date: Thu, 12 May 2022 23:22:43 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com
Subject: Re: [PATCH v15 2/8] mtd: spi-nor: core: Shrink the storage size of
 the flash_info's addr_nbytes
In-Reply-To: <fe4cfd3586b9a050c6acde7675a43b8a2d47ea8e.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <fe4cfd3586b9a050c6acde7675a43b8a2d47ea8e.1652063152.git.Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <cd64a1a898f20c4f047b9a594035dae8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_142246_448174_78B473DC 
X-CRM114-Status: UNSURE (   6.36  )
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

Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The maximum number of address bytes in SPI NOR is 4. Shrink the storage
> size of the flash_info's addr_nbytes.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

I'm not even sure if this actually shrink the size due to
alignments of the members by the compiler, nor do I see any
value in saving one byte. But anyway:

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
