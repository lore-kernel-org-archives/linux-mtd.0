Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA08C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Sr0l/fx3P3EVqiSddGoLQbu+hx+qvBfAnJqkgqQDv9s=; b=lsO
	qr+EN0tdhtbunPhl3FuLUbfPW8ycpLWI/OcjC5WZ/2/Lh5qKc7K/R6T5c/dJR41k5TkBKmX2fHAL7
	1HBtMCDa+ijETGVQHP2jPioW/oWnhnX3r0b7dNKu1Wshw3jJujOxTDP+G39qs8BblDf/hnmtpTNjx
	OOHOC8TZNSHxLLb6KYnAfJM+teGNwjSY66HRiOFIrCYFt/B//MyCvc4fo+j9MbRisKfXAraTOeSAz
	9zcqYopVrok6HTVbeC1Psy5zLdIKS4WrtIfFwvzCu4x4EGmk7iy491tJupwrHTjYvlUJRzdxqTDcp
	DmNnZxzbJng4+iu6w/wWW2kJhmgmASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2WhK-002exk-V6; Wed, 29 Dec 2021 11:00:47 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2WhI-002exJ-92
 for linux-mtd@lists.infradead.org; Wed, 29 Dec 2021 11:00:45 +0000
Received: by mail-ua1-x92c.google.com with SMTP id i6so36410392uae.6
 for <linux-mtd@lists.infradead.org>; Wed, 29 Dec 2021 03:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=3XtcaXXG9J6wQQUUdPkLKubcaSqUC2pEQv250/+4xGU=;
 b=cZiqOWohDELRFK4AbaQfHnTwYGskal/WJEn5uJmUnBhdA7FZYAaxARKnpawq7JkMqL
 IHn/vAyujEcp9pcLmISfbo2FdrziNxJ6iIEeBKKDz4vpwMdlVFVJl2s5YUec3B345HNr
 GL7jFX5wDPZdg1PNQ9uGC69vsku216IuHr7bKjQnjuyJ1NHcUxj3f2Ia48tJOxLR8jei
 c9bHzhtboROu8+73iim/r0u2QGUVM/XBPyKzEJs3wUGgI0JRojxVa2vRNyXS6VjO7zHh
 D2uHrfZ9sJYW/Gl23Elp0Eqm3ed5vsSFzsODPuEq0zo5HkSrqDcO2G6LOOACBpFJv0pN
 w/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3XtcaXXG9J6wQQUUdPkLKubcaSqUC2pEQv250/+4xGU=;
 b=3bT+AWoDxo94+lENr6R/ZoNgOtF3zmwkbS0tGrCArbMoRsTViwoJ1NoFwkK9RYvaIb
 ZOw1JY+FZSD2JGDhVb8byccT9HQUN4Hz+oWhuCtKKUTxrY5Xi4iA8Wt/iLxg1j8tFHSP
 dw1Rxaah/UMI8UpfdIorWslFqYrKNFhzRlD1PYr8z48UWiwR2qWYBQNgHm0v+WSjYTpm
 X22XN3XUyqLZ9nx2nePCwzjyHyJ5EPnAd1MkOyDvjeqUdjF5eMTGQ1VY/UNAhLZAHOuv
 P8ZBjywGIreNO30QJXwlbkYDJ4LvhaRSoB7DnDfxral8TVxMbp6lf/kpuiKWAp351rIs
 wzyA==
X-Gm-Message-State: AOAM533owHZ4WjEuM+R8Q+pOe6liWIF6Ry5KwtgzF+mLSrD3xhulSFh8
 Kpv5Nv4Q0o1UPKKwqCkA20L9eDqboawBDzJXNuNAykntfl9mxg==
X-Google-Smtp-Source: ABdhPJxcC/Kw2xd2MT0ECggxyOF+drXfti0u7zj/QYpXrCQaUg0lWzvlplQVavE8Q6MhDUkDCKDj1C+ONQHmjxW1j+M=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr8139873uai.89.1640775642647;
 Wed, 29 Dec 2021 03:00:42 -0800 (PST)
MIME-Version: 1.0
From: "spiekermann.it" <spiekermann.it@gmail.com>
Date: Wed, 29 Dec 2021 12:00:32 +0100
Message-ID: <CAF1tiJV+tRrvYSCmi_O9payeC-d4pVGwjLWoy5nOCS+mHLZayA@mail.gmail.com>
Subject: Issues analyzing a UBI-Image
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_030044_361202_A0CFCBAD 
X-CRM114-Status: GOOD (  11.58  )
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

Hi all,

I have an UBI-Image extracted from a smart home device. I try to
analyze this image, but I have different issues regarding this image.
1.) How can I determine the version of the kernel, which was used to
create the image? if I understand the documentation correctly, the
structure of the VID-Header has changed from kernel 2.6.x to the
current version. (Just checked this version due to some issues with
some pdf-files I found in the web)
2.) I find some structures (UBI# and UBI!) in the image, but due to
the aforementioned problem, I am not able to understand the following
structure of the header (and, because of this, I am unable to detect
files in the image). Which information can be used to investigate the
image?


I found a blocksize of 4320 byte and can extract different information
by this, but there is no real breakthrough in my investigation.

If you need additional information, please let me know

Thanks in advance
Dan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
