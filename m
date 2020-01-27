Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80953C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E1F24679
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ieF5do5I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ljKgHzRG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E1F24679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9fSR1z4jkhQYmQFxY0fe/nYRD/Ker7lBkaE0ZMzL3s=; b=ieF5do5INl3kPS
	R49PES3IAU1EkTPp0C1dwLcC54LhskJ0xP46tljaFLcxnrqDH/AE7a2+eNh9L3mNExmG+olDpuh5U
	mT2Vskmt6rZkdNemomINRii5g/oe1JIm9SuGrS1pIK3zsLHzCfAMr06akyXktuoUEAX9hlF04HPa1
	3qb4cLGMoMNmXjtP+JInK4lfz+Lii3PZWmH7iKNADmSQfjtIO6qlMJLWfkRuKAi34RTxDnytW8JpG
	ezG1orCSWg3qnYg/Z5nGNdhDeI3lYvwwny/k4DUi39jtmP3dXXw1dcfgXCmVd03fH6oOoS5ksBU9f
	oRKYcWa7Q0XBWDSu7hrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwAsy-0001eM-Rc; Mon, 27 Jan 2020 20:21:28 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwAsv-0001dn-Cr
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 20:21:26 +0000
Received: by mail-lf1-x141.google.com with SMTP id n25so7272106lfl.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 12:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=qub5kHW9zrYTLLphN/OmRXdf8X3zjEgdE8JPeg/9OEc=;
 b=ljKgHzRG27XwoKemh7wSBSQRpDSrq93VtWy4kafXy32K2hak157o1LA14YkOr+X8dy
 KC5WrfJBsIqTfwIcI1UE5xqkn/zM7gmKYj54BycKcMd7SvnSLJXAZf0D65kMAI2ir3Pz
 l/3SM71lTVPN6QUo1Eob4o7oOmWwhilfLtm7YQr10WysOr2WMXeVP/Sgo2MMnIoZSCyH
 MFB2SwGG11UcgzHu8bz6RPFv+3xN45Ii9LxJusssxz5I4VVPM8wDG+/sFlwVgrtTu66d
 PZRYpSC/pkO+SXHEOtDAYoC+5+8Y3RlkBu3zdTpBHTZYn3XFdRGYIbhLrvhm+pJwhscp
 hSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=qub5kHW9zrYTLLphN/OmRXdf8X3zjEgdE8JPeg/9OEc=;
 b=pB/4Z7bVHVzRZc43lnuKbtjzJgL4hxJH/vWwICh+5IV2V8RYAZCT+MZl5ysPrGoU6B
 8hm3DVw57u0g73jvg8nc6bNk/rWaPhXT1A3xCMw8T/uviQ0TYBxnO2M9az4DMf27dCC6
 2f04CSgPRzcyLWAlsHzjkCizO9mBbkcl2tAVxZ+x7YzlR6WhbXkB5XdgG9kxtQxQaVnN
 yK4mErjP1MmNCU/hPy2wfvtxwThiKzLTvA1rTj3QY3xOqtNyTtjHxozDEf8QBlLWpO3l
 eGfF59QHi8U34zqZRWDZT0qbHnkoGQ7fqbRE4QBVncODE+nxRnbzAVEjCuCjbBE64Gfb
 KSLQ==
X-Gm-Message-State: APjAAAWNChCYgOoXWKlhWqdlvRXOwymwuNZ5t7tnYxFere8h/T6JjbMK
 q+2G5QrTKCKno+xdpD0BqJsfRyevs+o=
X-Google-Smtp-Source: APXvYqy8jX9taYbUYky188ShKp9xorfxLEu6G2ljSS4juTQiK9XJP2kD1N1aPu3WRrmUhZMfbTWF3A==
X-Received: by 2002:a19:cb17:: with SMTP id b23mr214450lfg.201.1580156482484; 
 Mon, 27 Jan 2020 12:21:22 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:848:32ac:5845:9fa3:1634:7984])
 by smtp.gmail.com with ESMTPSA id r26sm8646234lfm.82.2020.01.27.12.21.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 12:21:21 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 0/Hello2] mtd: spi-nor: use spi-mem dirmap API
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <cf44c0e7-4192-19c2-3447-6e7534c06370@cogentembedded.com>
Date: Mon, 27 Jan 2020 23:21:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_122125_583208_729BA380 
X-CRM114-Status: UNSURE (   8.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

Here's a set of 2 patches against the 'spi-nor/next' branch of the MTD 'linux.git'
repo. We make use of the spi-mem direct mapping API to let advanced controllers
optimize read/write operations when they support direct mapping. Previous versions
only had a single patch, in this version a preparatory patch was added.

[1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
[2/2] mtd: spi-nor: use spi-mem dirmap API

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
