Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6132DC35DF2
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 05:58:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37291222C2
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 05:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3Vw9UZn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJzaZynC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37291222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=g04H1xcuM6II9lGnGFs+wOKCJH/EvE/gQF1j9VHJnUk=; b=U3V
	w9UZnbPmc3lNzhRqJOtzIrCubPHMMvN0rrskbFXhU7DQDXCdwYSxU5hvNtEcMAgN4LBtAetgLDpQM
	wgLkwFwzSz1wQh0cnUKaWdPKSNqRA5+Uf1W8/DgrFyRxpACipeTiO9jrdTdExkhgJOSz1d7lCd5S6
	Sd13zYudrVeg1nVzwRuzkFEWHyr714M5/LrSe+70MhCH5VSNYwLmqSI5rJlYkQgCADmmvpuupr0Wu
	W7YC6S22LTd1+O7bLxkQyZAEX07lKrVEP5s0q4VUJpWWKtNVAOd1yrPiQ2O4mQ7sYu6+VOKnmR5Jv
	lukTp6GJG3HFnYcIvksv1gKzVAr7kKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6TER-00064o-Dv; Tue, 25 Feb 2020 05:58:11 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6TEO-00064X-LZ
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 05:58:10 +0000
Received: by mail-io1-xd2b.google.com with SMTP id m25so574315ioo.8
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2020 21:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8GrUqd3KtPiHfwuqPhsTvt4vEEbPNlZppG4xacEeb0s=;
 b=FJzaZynCTsB83+JxwxQjfPl/SrRtXOcrs4V5eN+0NrbGBfya4YZrar21rGQTs0Z5S4
 2Pt93w4uP+aHNenNWXg+IEmh5nnboMRtKb/skhu/D7sYOXrhPlWwQmcIZIKGoH0RNKjU
 VOxXrDBeAK50M/tOYJudvwzt+0n5Nus8gd12Daa8p/aW0lmAMVpWX95GZZKf5rmA+VDL
 a/6BJtOQfVP/b7G+I5HQQctFBLIzjPFs1XjYYAzt/ugdfv6euWVc18UMO841VmpW/iW2
 +sno2H0IFAtQsQR3FdEb4w80NO1k3d52fIp/KYtb+iqi603AZjDud5BFfeeAVPW76RNL
 B/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8GrUqd3KtPiHfwuqPhsTvt4vEEbPNlZppG4xacEeb0s=;
 b=r8LTEtIau8NQikl+Li0WIfp0bGrs3P+u9WcZbHX1w2281lLNeLhHWBiPe5hO4xUCMY
 fKva4Z4TeghYIWgC5z7khg3P7bI4lPL3PdMmYUPZmLmAarHLTvSlvJxzuGHEJ8sob/eA
 aAEwYqaxvJAkAVq+tZDuDGvK9AyINYm2HoLqjoMr+kDNZfMANzlBxn13prV+elgMBXUd
 GXH3DGP3c33pJxZRzv2H7T99BbnuKG2/pSF3nkV8pKUnMjlBW1t7Ad+fZy//7Gn0h2A0
 viJb7NCl7NFFRv6502m/4w+TN6Y934Ticot8uUxi8m2P79298dJK6BX2dzRjuLaSfKcA
 mROQ==
X-Gm-Message-State: APjAAAUb0eXiDo0XfDabBM7TvaUZ4y9ebn8koubUBLpvsaZ94AQRv7yE
 ZIutBhvIaoZZND3YJsPeqYYWW/8GJHZ4Fr3hM8ywGg==
X-Google-Smtp-Source: APXvYqztNLLGaihOw8gxRJsMVM9SSPL7295MtqR1GkkDIGvf6Dbcdykd8UXGSqKXG1un5N99Ltiws9XwfoQDlIkSU/8=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr52868441ioc.306.1582610287084; 
 Mon, 24 Feb 2020 21:58:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 24 Feb 2020 21:58:06
 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 25 Feb 2020 16:58:06 +1100
Message-ID: <CAA=hcWQOxh-FDU9iy-juGySDdxDRvj7nKDOWebQS7zF7RJ+fSQ@mail.gmail.com>
Subject: File IO write flush time span
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_215808_706939_8AE365E2 
X-CRM114-Status: UNSURE (   3.85  )
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

Hi,

If I write a file to a UBIFS volume, how long the mtd will write it
from cache to physical NAND? I try to understand in what time span
those IO writing in cache will be lost if the power is turned off
(lost power).

Thank you.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
