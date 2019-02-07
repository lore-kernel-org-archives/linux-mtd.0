Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F718C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 11:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FE6021907
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 11:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UzXNti49";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yqt5d2kE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FE6021907
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3Sv/9cvAAaSTSJJ0d0v5/hEmX0kOmOSXTtaHaoOZmU=; b=UzXNti49w0/W4s
	tgqcHQ79eFMTnsvPMb4iQis4JIIdAk9AyZNdqjhcMYiuBB3MJxXRuVdTQcisGMEKd2QjRRWP909CU
	nGAOerbZWhUmhub9wJwbk+BWiq0No0FNvkmKJ3r0zaHs4/kzSvIvNjkWUtkns1hWW+gZey+FEH3bB
	jjdHwfIWq6Bs5B1PqBp8yq9bqGSIUgtteqLuqeQcaRjialTmpoo5oTKWCd1hpI1vU7UAu++znHvvN
	FwrNHOzYPRmwhS/h53LJW5J7ycrDjm4n7TjhQy5gPquargzzqixtiaNL8wr4eTeldq1DWMPyFWswC
	B/7+srJqxVRN+kxPdSog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grhs6-0005gm-3s; Thu, 07 Feb 2019 11:29:34 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grhs3-0005gI-J6
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 11:29:32 +0000
Received: by mail-ot1-x343.google.com with SMTP id e24so8302290otp.11
 for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2019 03:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EXAqs9f3k2rb1fsX2Cf2qc4QqktNk4eShplnv6MGR50=;
 b=Yqt5d2kEwxzW1WTnTeHj0i1t8WK6kjcOsObKo/jOEzvBWDyKa97v8107/pXI5/P3Ns
 5FmYU9iOtdnBKxPAdzPF9FSAw6HQreEiEhITb2t6b2f9tssD9/ixrMyN+4WyAYyOj+IW
 hxiuGJRmGad0RxAsSMAJ7tfnbP/ydhUxT11g+U5L2OaXxOIRcHsZhl7wP5Mfipf5qOuX
 sHDpNXvfSRVh7oFgj7K0YOhh4Lpec2bv78pjkIsyPfU/xx0NxaaHS6POkmJlcLdK+Rr1
 Ix0ciSnXjHG5xVwuiBkR0wdq/wTo0UTi3H2vn/6UqGH+HPwXIORucNUrBW53bxouGHNk
 O7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXAqs9f3k2rb1fsX2Cf2qc4QqktNk4eShplnv6MGR50=;
 b=rZJEbk1cXBhVJzsKJMjtT/USSvPCDQ/FAk7fKgw1zQOGwxo4nw59b4mHjF22U791BP
 0r+W/5EW2dSygZruTpXoDTw1Wmi74LPNtHkNPaa40MhVGv3VWxocDRkUxBv16AlYt5Od
 +RSshU/27QP7Amn3wNgcSCbAxpSTTEZM4oSxNztTK3f2Oh4Z35cSQMI4jdpK4jKTw68z
 EZD7V0seWGBW4AtJ4x5CgcT2WCKJoX9IkbinSJAHIur07837zwp368y+hfsPQjet3cei
 lSiQqaG841pDGtGed5+RPv6jpRmwdCJEAf+B3LeLwLX/iN59NfQ6Q3AyjxtpSNNlHWpy
 L18g==
X-Gm-Message-State: AHQUAuaCJfrSRxPUKkTW12PMtQe3EDTg8HtdLZvY1aDORgfIeG+hWfCc
 aFSZBmc9FXnW12GBSz0Z+yoeaaRcpt/f0/VfFuY=
X-Google-Smtp-Source: AHgI3IZ2V8HvyUisAD9lohIn718Im6+oBfDhk5ZQH+YGcQAEmJhrP9o56QdGtprmaYNGExzHIWX2fecmFWPzhh1T/UI=
X-Received: by 2002:a9d:7285:: with SMTP id t5mr8854416otj.228.1549538970204; 
 Thu, 07 Feb 2019 03:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20190207105055.10860-1-festevam@gmail.com>
 <20190207120151.37b7bbd3@xps13>
In-Reply-To: <20190207120151.37b7bbd3@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 7 Feb 2019 09:29:17 -0200
Message-ID: <CAOMZO5AE_17jMDM0ozVhXUdQ7-QrOef8bYv=pHDq31K1+Ruoig@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Introduce GPMI_IS_MXS() macro
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_032931_656948_01612327 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: Han Xu <han.xu@nxp.com>,
 Martin Kepplinger <martin.kepplinger@ginzinger.com>,
 linux-mtd@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Thu, Feb 7, 2019 at 9:01 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> I'm fine with the patch but as this depends on the fix Boris just took I
> will apply it for 5.2.

That works, thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
