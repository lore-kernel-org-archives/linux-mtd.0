Return-Path: <SRS0=KHzd=5S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180A8C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9B220857
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lMSM7nbQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="xtZ1MUye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9B220857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b5otli2AGz4wtDF8OSpwIY/E+78pXXBHtoCrSU5dxuI=; b=lMSM7nbQ3BwV7+
	SNH7kQsH8WZ3RzNzLrO6jJxNixrOfmaOz8kiSQMLa4x3IQrP7/B1niRloR2uqiS5qHl+7ZCfLRA0L
	J2LdpyWRBgyoxc2uRcExqOev+EL21aP9gemv3LgHyrXmY9L+i/QCMFkX2HT+zLaRCcTsKZ5ULw7mB
	PW5Q+/Rh2n7+xx7WDU9cXsj0snT02NAhlvxIt6JfMOBr+zRsmPCuOHz9KFieRtiCOqySCpuPaVb6z
	Ih6gcvXmlzV6+slO9uzSBEVZbsRKM+ziTxggzcOwPFQezlxykRzo1NVZfvPNFiSuDu8mMwqHVVBmk
	rMYts5kJksla3yxNE8Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7VH-0006Hf-85; Thu, 02 Apr 2020 21:35:59 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7VE-0006H5-J8
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2020 21:35:57 +0000
Received: by mail-lj1-x244.google.com with SMTP id p14so4839594lji.11
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2020 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=+CxOhu+pFWBDIdguaGLgp9m4PZZ22kPViTa/U1SaLXs=;
 b=xtZ1MUyen5qytUGGIdsM/Z6+qVb3ViIBP5x5dPsNwhKgUV3gxA/4C7hm3x80U8IrHN
 KkrXmPzNdfq7iPUpyV87RioIGHOgdhxFe0E/CqE1GFlbUW+1Uj6hYe5dwHySAHQ+djxV
 d4139EGZyQkXMslfF5Yyeqwpz+JD7J/Ku1MJrQIgf4lT1PrLPgiIqCAGuVpFrNxd+cKe
 9Lm8h6cVa0URGaR/uCKMsgNJdxgCgLlbOW2Jg7oXSXDVezJGGAVF+h5BOT4jexRquYpW
 NYwTkk2LhysMuw5vBFlxdxrkDs+hbmVEDp4/luy9gQvYNoCkL7m6DKl1RSlO57P+Lfk5
 L/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=+CxOhu+pFWBDIdguaGLgp9m4PZZ22kPViTa/U1SaLXs=;
 b=lBKemQdm6DlOshR/rEpb73EyCewGPD+Arfx0UNmn0B2i6kl95qn8o8Os3hSc7TL3No
 ZMpiqR+Ayg6+LJKhatzJ1M2HQggbCMXkg2ZPoddb0N75Aa27z3WOjjerxRZQWxj5anYJ
 azXR0wvGyl0rkDtZbzWwxCmyrZp/asdRg1r+ESYL4ZKpexghOlH4I2YimExDg8g3l0az
 DbwmcJXzu0HhGHF+6yp2Yi2K/e7XTb4PYuVAyl6JRn9KQEfu6HLfq6l2xgtqjaL27ISa
 1He/LfpSrI0GUXBAZxA/+NYr80h0QKvbEZ+n5bkUZ3zCFgN5fJKvL0T3mUjUABZqTJLS
 xsZA==
X-Gm-Message-State: AGi0PuaUHhRjNKX3iRjRDtI4KdgQw5G9HxfvDtGwgzD5pXy/7etBStiz
 bu11qoEMpXcBbnnxCGs7jejFAg==
X-Google-Smtp-Source: APiQypL304eGbLAZVtM6sowT54sD2hFUDlDM0qTcOIC8Bzrryh+XFimacU9cnjpwHlrkrnNvkONXNw==
X-Received: by 2002:a05:651c:390:: with SMTP id
 e16mr2965512ljp.142.1585863350094; 
 Thu, 02 Apr 2020 14:35:50 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:638:9d01:50cb:2c0c:a09a:3ff3])
 by smtp.gmail.com with ESMTPSA id o16sm4183135ljp.53.2020.04.02.14.35.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 14:35:49 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/5] Fix kernel-doc comments for 'struct spi_nor'
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Organization: Cogent Embedded
Message-ID: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Date: Fri, 3 Apr 2020 00:35:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_143556_809212_03C1F23B 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

Here's a set of 5 patches against the 'spi-nor/next' branch of the MTD 'linux.git'
repo. I'm fixing a number of the kernel-doc comment to 'struct spi_nor' accumulated
since its creation. Instead of a single patch, I'm fixing the kernel-doc comment with
several patches, each fixing its own broken commit -- this simplifies porting to the
stable kernels (if that ever happens). :-)

[1/5] mtd: spi-nor: fix kernel-doc for 'struct spi_nor'
[2/5] mtd: spi-nor: fix kernel-doc for spi_nor::mtd
[3/5] mtd: spi-nor: fix kernel-doc for spi_nor::reg_proto
[4/5] mtd: spi-nor: fix kernel-doc for spi_nor::info
[5/5] mtd: spi-nor: fix kernel-doc for spi_nor::spimem

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
