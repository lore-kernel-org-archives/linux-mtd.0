Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA47606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 02:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cTS88A6/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hY7o3nl8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MxQd6/oASz0+uHDF/8T+RJia7fGZkXpTGYd4OD4G9LM=; b=cTS88A6/BFrnIAjSHJP/Xe14I8
	4jHImoXHjsc0dKWut/+4jQAT93FsI5U++dowAq8Ynec+2MtZIbcH4NmoRoZlu0VpqvI8X8uolnvrC
	DGti3mVxlwHUdYWpHUHf0aL5WOdG4kVE9okzZnGMCbLx+DWOq0hPApQ7hn3Mh9k9D3vnJ2+3DipuJ
	142Ns3MJr26YK0o+nsQaRp8O713vrDXXAYs5dM43XYaezAWO+fdROIgy4YH7Mjld28fU4QZh71u5Q
	CybS/7fT0a63OeqUPcBdi0TFl+1oYj6pSSdDveTUGWIPVgRHHucrHNzauMFTgfUq7xhI5DRhErbnR
	TNLG3eYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlKR-0000000El63-0vlh;
	Fri, 27 Nov 2026 02:04:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlKP-0000000El5Y-1IB8
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 02:04:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2f06ff94acfso33882605ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 18:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745084; x=1796349884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY72A3VkTpqQHLjZtoVYV5pa4ptzRiTxzbTv3ZjemY4=;
        b=hY7o3nl8TamGowDVc47iOYjAdMJBtIPayhhxQQ4kpXqTDN/omiEO7ZNQcIO+iBSOYn
         Lm+3RYW9KgKDj/VQ2qQ7o4+SgF4tKYPoKIsUizGEEs1TSxwUUOaZg+wU5l7fT4E86NPk
         2ytrJm3a0L1BCkfdc/NiMHBwOlROb/abpvuLw512XwRwClpMol/5Gj06DUYzPiSRiq7h
         t0IcgNtRMw4g9Ffvhuvh7cAG17If+M8+5/xiW9gYhSTqvE6wCl8O6UXFNyceSC6LlqVU
         5fOwb8DxzKAcGomujJJQR2mVQgKBJtacQN8gDluFnyTjucBFfXWYEBkiqyL52c665Uq1
         QOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745084; x=1796349884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YY72A3VkTpqQHLjZtoVYV5pa4ptzRiTxzbTv3ZjemY4=;
        b=jUrfXhPvBYlf+wMmJj/yNu7tbWyPGVpk4rRTuk+IX6EHM56W7tteKhKkcZxhK+WBEp
         8+YkIvuaQ7+fguPFDOtSF8dTS7/hdHpQfK/83vYFSrfgw6YciInrcJ8ieMyj3EHvFoXb
         wuuKRWwE1F/hDbQjsCJf0w0nqKSZqN48ogvvN2XB6CLMcqtuZJ08Solo8qCouuj9PE+i
         25X7LogYNzc+d2Ykr1ZdI6qYXJLKRgQNct6ds3D8H/WsPWPi/nuyxC01/Vl9tk2khJ8y
         x0kJWkZ7C8HjDJ0FR7brD3Op9ofsn2K8OJsQ8FDJ9KKfjv6kIJTq0toe8FjRBp9bVWqn
         IKzA==
X-Gm-Message-State: APuU4Z/zCJ0I2QjVF6qpusMursaVkwUX/7pwvQXIiSCWTheh5PLxPyUZ
	5dfSiECI95Vyp6j78GBI6siubna1zJj1VbSox7cIDd+UGlRyRgb3CukW
X-Gm-Gg: AZFdTZcrGg0WQy69CTkfqAQLqmVohIodbITjiStupi+CZyPwDOS+JFyXJI9Fq+Z2gag
	3+RLy5pJMqQAU7RQgDXZp0SoxuYLLheLFBx8bz/2TCC/rLjBLw2cbaYCxPEY1XIBahFdCKFqZku
	J2U44sU39NJ/sSRrBlkYEmqGk8l3t2n82tYCBokLXNlwMp4O86+YSmJVIllykbjJ4fglINtNqpf
	8tHtEpUpSIE+CPE9EJLrW0JVQ4BnxFnns7g/1QfppW8VU/GHqCuubAHkLJwGZCCvlcmNFPs+m5+
	868aiZM2beL0mYiJZc713TKqmSqSINSZve+lthVgfIpr81eCsZw0AY/KHASd4kLnpKeWyjYIHTj
	mD23elVcYfXavB9hQOAdDD8QKmiDCcgmIxK51C4Iu+f43IaOLOXrJcp4ALG7mUZFMhY32bYHMpz
	WSHhKyOqHFwHudhQ2JUVA3ShYfEII9gPzTrCAfs+EkKMzXDU0q/wOOIYm+pFnKe2NxkcW8gCCLd
	s81otYEde4KWF5Ecq6GNcg65UK4L16daXNKYBJCtYaphZaXGJ5vhpDnI51tqAQA/fHH3zTDvCpQ
	uubCrzMbNrS6zLCuDx55Zbvci/IFTEWGdg==
X-Received: by 2002:a17:903:2c50:b0:2e9:6972:54d7 with SMTP id d9443c01a7336-2f03f17e712mr197749485ad.52.1795745084230;
        Thu, 26 Nov 2026 18:04:44 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm110819175ad.7.2026.11.26.18.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:04:43 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Fri, 27 Nov 2026 10:04:39 +0800
Message-Id: <20261127020439.1732176-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87fqwnwwl6.fsf@bootlin.com>
References: <87fqwnwwl6.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_180445_350498_EEEED13D 
X-CRM114-Status: UNSURE (   5.93  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: leeonion.muyu@gmail.com

Hi Miquel,

Sorry for the noise on both topics -- I had not realized how much
review load AI-generated submissions have been putting on you.
And I admit the quality control on my side was not tight enough
in some places.

Thanks for your patience, and have a good day. :-)

Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
