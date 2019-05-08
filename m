Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831D5C04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 16:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E98208C3
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 16:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FApdcw5O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsM/s364"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E98208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4M89gYw6YUuEXUkrsiW/l5aFg9o3OCfl1tzCSTzpfuI=; b=FAp
	dcw5OOMvOj85vHTCcfqnAxbmC0C+6dad6dDffrmyWoVJJw8L/pso8hnLdXw5pDfRqU4KhvigNpUHl
	DTNYM9b9si3QGj4pwlqk593p6FKUdB/nxEXZT8ddug5Yf4ctyt3OurtEgvoGfLU1D6Ps6IlN/vuHA
	Cj+h3EFXzI6GYA+p3SKDYdgog2WN6Mkq57IRWhk7Kr2QGMFwiXGhHks7AjZU/etntxfLZNl2LJOOu
	7O+Quz5m9TSwnW6cgcvGv1bkiS/roqv6q5saaEZrvKRxlD9v4HU65U5e8xijWY9peZ0wsvIOKMXAF
	AhXTM0mGhHDMZUNocqf3hs9D6qr+aWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOPQJ-0008CT-BN; Wed, 08 May 2019 16:28:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOPQG-0008C8-Kz
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 16:28:01 +0000
Received: by mail-oi1-x234.google.com with SMTP id r136so6959148oie.7
 for <linux-mtd@lists.infradead.org>; Wed, 08 May 2019 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZL290jBUjMnWF6LLYVugl8HJm169wfnmtUev1GEJ9RQ=;
 b=TsM/s3648GqsDzDsC8ub9e+f4Hfr1ANdDEp0a7jFwCMyVufQEqUePYDSFg/Fkn+TSr
 Zy4wp6MkhXjZetPx7N/RD/m2PfJcezenv9bMbmryKxo2d4uqzeRMP97tBTNhcOYif+4C
 LqUq/9Mf4NvdSdn+Bws+NylS5khFyLCSKBSOGhLvFEQNo6bke3qu6iw9GtpZomCBSvnd
 pSiS5y0M+kFu/sRzBbJ8YyRC7NPA1h4JAF+mno6mXF1eTPoxdbhEB3Brt5+5i4ruyVzN
 K1cjstQTNPT2ogvQDGeHW2YNsxjXjMZnpslL6VmS3GiPkWFfwSXVW3PjLXowCkJWI6kL
 x6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZL290jBUjMnWF6LLYVugl8HJm169wfnmtUev1GEJ9RQ=;
 b=EIzqqyUK/XkPNXEuU5lAkOI3I0ESEo6j8i5BVxAGxTUyGyxJ1eMi43QnAXAaLCoKnR
 v8PWtL8rCyKXQSwfcueZQ0qmchvkzTiuDLbcH4qn/yIUnu60zSpRi64lx8ItIuLuZEPh
 l3Hov9ldrWh07qg7UjcsCyTffgpX4G7GLATXheswJHobAn1ViiRuEnz68eIVanMbO/Dl
 NLY3StgbUjxmCCHgQBghfJwkOHLeJDX1Qagmm7SkIdMeQfRh09dcojI9KdATVGiZrQUQ
 ZZ4WAaFQ9CLvOaDAh9ovMYUuAT0oEmxx2B2x0oQY9pqh8ITmf0GuNSx2oN1xv/fYs4ik
 NiKQ==
X-Gm-Message-State: APjAAAUthGRDYFxzt7uobexaWlLBCwr3EjIFf3HBPCbabKuXNlhKUBOK
 3dun3VQYrDrZNfTXf8yXsnvtY8BvigIqYRPerdMNBg==
X-Google-Smtp-Source: APXvYqxlQbBisfF6FypY288MTW8XBUOiZE578QEmIHETRpN284HHZ+NxE/SgSgXrFRuvdBuOdfC+3oDCt2q2uAtp9gw=
X-Received: by 2002:aca:b144:: with SMTP id a65mr2970068oif.128.1557332879314; 
 Wed, 08 May 2019 09:27:59 -0700 (PDT)
MIME-Version: 1.0
From: Fernando AE <fernando.ae2017@gmail.com>
Date: Wed, 8 May 2019 18:27:48 +0200
Message-ID: <CAK3Qp=Xr_XyDZMCoDL6fDAb58+e_Hi9ErgnT-yLbAmbSpzc8TA@mail.gmail.com>
Subject: Question: Appending data to a file is optimally handled by UBIFS?
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_092800_687025_720DAAC2 
X-CRM114-Status: UNSURE (   6.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hello,

I'm working with a UBI and UBIFS in a NAND flash with 2kB pages and
128 kB blocks.

My app is periodically appending 16 bytes to a file. I'm wondering if
UBIFS and/or underlying drivers will also append data to the same
flash page or if a new page must be allocated every time.

I'm aware that the kernel will buffer data in RAM before syncing to
the flash. In any case, assume that a fsync happens after each append.

Thanks for your help,
Fernando

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
