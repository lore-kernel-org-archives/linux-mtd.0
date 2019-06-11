Return-Path: <SRS0=yQQQ=UK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E07C43218
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 10:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90E9205F4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 10:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L+Uws/dD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhioBOZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90E9205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2UA+b0Zc5P6342uSuQacC8uHaoEn5x2ZQlc0aG8TJyw=; b=L+U
	ws/dDGyQSkGUtFcDVjm4QueuXzWPNjs9s8wL9GwVif5xTEAKpxztX4QtS+TIAoP+81YRhxWAMg0dF
	D6bx61riwXyjaUyoJxZ2mCGUqlGMDiYeS9u2IyLOWlk/AnjoMTx9YQmhXoXsR+raVpx9ipxLBf7ag
	6WXBwz69NwRzTWn5EWWK7StzfVKeqwWqbTIkLAeC8iO9KiZXqBCVdhqkbbIOC7okxPw77daS0ATQ1
	YqintbT21EZnUIDOi52u5eigbLZSAOOVWdtP/ceGJdbSbFf5P8ufVXXTbLiMLHMaOw2ZzLz0mqf4R
	cYgY28pVnhCQfsUPhcLWWvvCkjyNkZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hadt8-0005I3-ES; Tue, 11 Jun 2019 10:20:22 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hadqH-0001XR-49
 for linux-mtd@lists.infradead.org; Tue, 11 Jun 2019 10:17:30 +0000
Received: by mail-io1-xd2f.google.com with SMTP id e5so9405072iok.4
 for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2019 03:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XlFqX+W8ezv9q+KdAW1Rh41VCCDjZ70TEhiepSkQ4Tk=;
 b=PhioBOZjZddFGpbykCMJTC/aRgMTagi3hMSj8fZ5qXnKAh+hv5tVwHw7o8OrN+poHy
 nRyU35XoAHNTiqVib2duzkpxLDy3paKe/ac+zj4MKoE1IV36cuQbGa/uKfEprL6hFhDJ
 kQfIg0MlikzkstNAyFHiQt1+WQMa3FnQMoGRmC57RW5n7fP7A8f+3aF1vstj5vWQPuFn
 OmGidCV+KEUALffuuREAUaGJUWmDIJGB9hCuiWA7Zw9wCB7uYPx6y9bFo8O5z3tEiCcF
 kr8s8DlpW7dRd2xcUlyXwuPema3O/AoFFf9xWOLTy5dLpWAsiIeLLxZFVX7aGrRYaTZ3
 wSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XlFqX+W8ezv9q+KdAW1Rh41VCCDjZ70TEhiepSkQ4Tk=;
 b=KoxxH/eqEQDyW0neKkh7BXlV/PUMd3YRrII+BXUbxktg1ynnxFTMH3yPqkJZC+quWY
 yQbektxRNaLgl7iwV+YX8nB/iHYU13otaBWxCQK6AigjwpzsrAmPgQGXgPPrHdPyUCly
 itV132NyVMXvLf5dktglt70fcKzGuToXfa3tBKQe7DVW2KiCj81IsL3Od0gPIE8clJQ1
 PTqCH4PC0CwGUtwb5d7rsURGXC/U4x7XCP2+j/bttSVvjcuuqSiJrXO5+Nfp/r9isPHv
 HrV7gyYftE5mUgIjFzzEon1VDj8Xj4tgH6x0gXyOuuUsUtwpKMIgd6qq7SPxOZL5XSQT
 kk6g==
X-Gm-Message-State: APjAAAVQ+4cPLoBFGmE6heSj1b6K9dxGvYi6qdhguxMo1ddT4iruPSFT
 IIHLli7FwCLNDPwdMtpa7LY0R1q8IP+acCI7SySHjFJH
X-Google-Smtp-Source: APXvYqxU0F/U7txSz1CwoZViZ2THew/cSnuEaOdOeuQYz56ZBilpeAjqcdDHqRA9jaNoJXZj7SWvUvShnqTD5G75suE=
X-Received: by 2002:a6b:8b51:: with SMTP id n78mr49541299iod.192.1560248242035; 
 Tue, 11 Jun 2019 03:17:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:92cf:0:0:0:0:0 with HTTP; Tue, 11 Jun 2019 03:17:21
 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 11 Jun 2019 20:17:21 +1000
Message-ID: <CAA=hcWSKQ4+BsQ9XPEhP+f=-oTA7CnbJ6=4upRZughg8mOUSUw@mail.gmail.com>
Subject: NAND user space program
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_031725_232016_141E7174 
X-CRM114-Status: UNSURE (   6.08  )
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

In NOR flash, access flash in user space is integrated to the Linux
system read / write, is it the same story for NAND flash? I installed
mtd-utils, but not sure if I can still use Linux system read / write
to access NAND flash or not.

Thank you.

Kind regards,

- JH

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
