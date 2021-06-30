Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EDCC11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 07:45:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F866162C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 07:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F866162C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CB5QcwLHaiX4kbBu+HK102qMjj4bxB5eVxG9dNprfm0=; b=GxG
	pZQE+a2pNlxlf/UXjcT1QuHArYsdC5k2mTYXXFLi7zaNtlbI0p9AJXJnxzX93ihV5pDWhx8ghZybc
	50OU9l2vdFk5F1GMvo7yLQg0d13h+uTH8j2xz+9TeH9dDyaH5oIDD/ZfHQySeo2cuSmSQ3prVdYvQ
	7qPV8VKPZMmU1g2J4zSV8T7TSpBTwcoJrkOk79O4/k7r+JfuOh/IIpv3Q5ab9onFimsRr0jLxMxB+
	+d71xk/sVPEhZD3EKtVzItS53VPcb1pGpVHcguDUHyyN/aN2+pZ7tbkK+r0SEAXOwTdzeNX4dkAVM
	qjEMfvpZNVW5eVNViGtOQK9WJisu3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUuE-00DB8b-EU; Wed, 30 Jun 2021 07:45:10 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUuB-00DB7L-Ch
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 07:45:08 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id
 l26-20020a4ac61a0000b029024c94215d77so395842ooq.11
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jun 2021 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2KT7T4tw5fFaPrLpwVwtyhErrVu0NKL90r7qRG/s/l8=;
 b=qsUObKa/16PG8vXJQmLsapHRfqHdN0m9WW0LqkQxMgynCB9fAVlLlZ8Pn0ZGJNjr/h
 o1gcMW6hPkCGAZ2SxlndUXLsoF/QbMS4l4rGfoq+u6PbnR5q5TbEUz5Rw9XFxZE+iemu
 nOjlqO/T6KKTJNaVU0oUCrB4dQmH1RAbi+EfNXu6nqmyRreFg/w4jlmOgoPGA4VwX9vg
 Odg2ThQWRuIiTbdyo0ioXzB5/0jZosNNvBkZEUUJWfoibXC6Ki7YmJAPsDOuDlC+h9QK
 pMl3ky/xykPYIoexpbrJSc78693WEDnGdcBtW62C3Cs/l+UnIPAWbzuYMp/j402g8omE
 DEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2KT7T4tw5fFaPrLpwVwtyhErrVu0NKL90r7qRG/s/l8=;
 b=htqtiFqyKw38oi6j00+5DEN2oFTWd6MzbmX1OarBMcDX39ikl6DgBfn1n6LpamExke
 j8miNqUJ88iwkNfaAaQl/SaI4SP9dUdXkum7koZUPAF0/tap3spiIj+yC5kwWhyTwRGj
 vQDcpn0iNhwFnvER9LMYvH01qh+QJnOWr6WlW7UFA2/4bWwcltCqGRzHCNh1m//MK6vf
 dlU81u9BV9/c21P3dmUz3znijyGvGxZVCbJN55StJdgJ4vKQqCGFTulQt7bHmyrtyW3l
 65swutW5rt6FQu75npgeGv8RQnAeZxP3WEMVE5PgXc7m6siP9dkKPnUWW6zZWHkYAVki
 ABbw==
X-Gm-Message-State: AOAM5305x+u/0M02eh+hlP+F26wgkfp6TdjxjlLgR3mXbhZjZ7flebLp
 AiPXvczHlYNFHJo/h9A3993WUwgdtATJUxDs2WnBRB5ve6IBXQ==
X-Google-Smtp-Source: ABdhPJz1J6qYxwLdQpNZ4z8w2PuNi9ZhjNopO74USG8EhZQvm50/E2RdaK6ZhY8Ol1ktrQu/WYhjnrWPs7Yzi7OvOZQ=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr7472338ooj.85.1625039105872; 
 Wed, 30 Jun 2021 00:45:05 -0700 (PDT)
MIME-Version: 1.0
From: Ayman Bahouth <abahouth@gmail.com>
Date: Wed, 30 Jun 2021 10:44:55 +0300
Message-ID: <CAPczDNdZK2iFnrXc_JaLUn57MR21nQ8_NnRUuOPoi2EjaecKmA@mail.gmail.com>
Subject: Continuous Mode Support For Winbond W25Nxx NAND Flash Family
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_004507_526923_5DFE4501 
X-CRM114-Status: UNSURE (   5.25  )
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

Hi,



I want to enable the Continuous Read Mode in Winbond W25Nxx NAND flash
family, and I want to know the best way to implement it?



Regards,

   AymanB.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
