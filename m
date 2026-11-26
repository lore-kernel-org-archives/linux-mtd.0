Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7E606A323
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HGx5zci8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XCjNZe7u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CjL+K7IDGxsi81VMINO//n9FNcBu3ULFJYn8zuqQWQo=; b=HGx5zci89Kx4AzvUg7mONypYup
	28tbx9gJUtL5gHwnRlEVS2X1iAAFMcF4ZBWZHbNprdaHhw7OASPha6Ohno7Irz4MDGUpaHl5F9ARx
	3YA1oBAaM450XG4xEde/FJwoXkvyUQw6sGnoGiJUnn/3Lt0jdMfy0SojL2jz+ySjHstA9qZsI6UE8
	wV4LKgbCAtAsrwmBLIIW6YmllUCTd1UV9UqH9ApwMPCRNcExd88phKBuz9RuZPmtovyAb/amw4bk8
	UKRIvUWE6oK6owICGgmX6eDVdI2Xp1Aj3KGPq7wfJVKXVuLrIx6Nv7vV3CSketzIZ1+Mj/zMIeYvQ
	Lzgq9crA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWw-0000000DLya-1G32;
	Thu, 26 Nov 2026 13:28:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWm-0000000DLjW-3Maw
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 13:28:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15C591A1814;
	Thu, 26 Nov 2026 13:28:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8824604ED;
	Thu, 26 Nov 2026 13:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31F3711E68181;
	Thu, 26 Nov 2026 14:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795699720; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=HlSnUqYSq8NTmz7Xjml8F8b9Z1YROOAV9ZRHKtryZS8=;
	b=XCjNZe7ulzcHLS2ZJwG5KqJTmO/9QTXz18jXAJuTmeYIJ0yBLU8L/gAqLBvDae3wxFsuQm
	ffefG2NS778v4+hNjmSnxA40/r/CIuG8l42m66p25CtsiI7Y+HTisCgNXYrlqNNiSbNcI7
	IcsxtNsqk49SVbiCHVw8tOiqqJcC5vtD3xeb8Ka8GBm5xeA7gxY1ko/BEf9wHWYLAYVViW
	vqe3OUWN4gBD/OgLE/pZ60c1WExMoHn3ZBRUyjuQL6lwT4Y468ML9yAJHT+pLsyrrZycak
	KB4vtJBRj/neVAj74C6jXyWZkretjjx+gYTww7WsG2xJ/W5uHXxuAlc313SjpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261126112409.8491-1-leeonion.muyu@gmail.com> (Ping Li's
	message of "Thu, 26 Nov 2026 19:24:09 +0800")
References: <878q2fyhvm.fsf@bootlin.com>
	<20261126112409.8491-1-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 14:28:37 +0100
Message-ID: <87fqwnwwl6.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052845_526994_46BB7EE2 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> Hi Miquel,
>
> Thanks for the reminder about the threading, and thanks a lot for
> your guidance on this series.
>
> By the way, if you have some time to spare, I would appreciate if
> you could also have a look at the kvmalloc RFC this series came
> from:

I gave feedback 3 days ago. I am litteraly spending hours every day
reviewing AI generated patchsets like yours and you dare asking if I
have "some time to spare"? because your v2 has been waiting for 2 days?
:-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
