Return-Path: <SRS0=qEsD=TR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5AEC04AB4
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 11:37:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE87E2087B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 11:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ai0N4hkA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr2tebjj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE87E2087B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/NSh035bRWh6/0aF+cPOnwDOP8wEa49yPjXQ9X3bGsk=; b=Ai0
	N4hkAnEzJbCK81YyK4Ff8v6UcBNlrW4Q9ut9z0snK5MQMMtozGjSIqjhZKhudgWswJxgLTbmIZx1/
	ZpXqyb+JCVDieOeG/wG4MPi1hAofCHdw3C3MBOv6wviwF6EvLJhCwQ48Pd3FSGMtDWRndSaWGG45f
	/65VO+GgeXkdpxo+fkGraKTI/8WZ4zY2CQ0pj/FGgM1Xar+8dVAYfwYICIGuhQ4tB2na2TdeaYfVo
	1e11NBmZPLrC4wsn/NQhj+CFyS+dHw6RoX0EpH4XFW8/AydMReoIL4MTYRLlIVYfdtJ9yZuUl7wfe
	kmAOkzxeaoRXEmpQO2FR88LQQrUF9Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRbAY-0005YH-C7; Fri, 17 May 2019 11:36:58 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRbAV-0005Xh-Qb
 for linux-mtd@lists.infradead.org; Fri, 17 May 2019 11:36:56 +0000
Received: by mail-lf1-x130.google.com with SMTP id u27so5070416lfg.10
 for <linux-mtd@lists.infradead.org>; Fri, 17 May 2019 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cq+/yNQZUNqGYLWGKHPNe5xT+ccWYiApg5fBm39X59k=;
 b=Pr2tebjjoAG3RS8Ju2gVttTBfAotrUmxL8sB317alSe0KSi4Ei68OYZjJFouyEUr9x
 kWUgwUtcJR7+By7v8wQPzymxbEt8MAcmgOTwfJSYo+m7xB6VHNTg3E1cTXVswA7NQfgb
 OD29nkJkwP1JIDY08h/U8pc/JmAmdcmXxOaqn3uUpoILHN3v/KBA1YzfmfhbY3jMG/ve
 STpwaf1kc+BiT1oiYax3FsxejVWqoMEmbhHNkgTdUCbq+tpIbayNlfCmBFN+RHoEs6gD
 aRr9dtoGvi7EcNVuG5u+wxLMCFgiJYIe9PaQJ3H7gA6yrjpb5JgPKwJXLmzG39VaPW5Q
 QIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cq+/yNQZUNqGYLWGKHPNe5xT+ccWYiApg5fBm39X59k=;
 b=TD/C/ZdmnZ0bjqn/VA5J+jhxkljQf27njLRJz15kJ7lVwqkkQ2K1tHA15Lbqy5YFoi
 GeAqoHUHOyNQaIt6EKojAEzV3z+O6nShmUAAVOCB106nHT4fjnT16Ur1m9c7Y3YHIKui
 yrcS5TyiXoj8nE8t0N/lUqhs8yNum0ZwM0bYiDhdYYbg4W31IoXcnGH64oiRb1PIaIPr
 qNSgssgAOiWwju2vwsbbqnr522VgOOJFDIIvwTBK3QarXvNDsH6iWyp/T1ZD2N0kPbvo
 OmNtlprd6nrWJY3cnfAbd04qZSuomvtB2YxOzAPzy8KzjRujexQmJm3yaMGvG1lf5wVr
 Eayw==
X-Gm-Message-State: APjAAAVMU5knXv6GV8ZLkRLcCSaZxSXEWBkpJJi9edyem6puzQD8Neqd
 KheJiNfl5fe4sYA6gzqUfGtBkXunSeCtyCoOkwM+t9Bftlo=
X-Google-Smtp-Source: APXvYqyhd9AoHO5Zf++6UMgCGw2LQ6kyEIwLehd8vvGx8v0AMw7VXnia/XqEVMs2fX2zvL8P8Wz9XM5WIv4/RQ0xXNs=
X-Received: by 2002:a19:4a04:: with SMTP id x4mr26726222lfa.124.1558093013218; 
 Fri, 17 May 2019 04:36:53 -0700 (PDT)
MIME-Version: 1.0
From: Shibin George <george.shibin1993@gmail.com>
Date: Fri, 17 May 2019 17:06:41 +0530
Message-ID: <CAGu8XfRM6MtAP7v2F2jp9CGYERj5niAvhHYtXQmpzOS0uHoUrg@mail.gmail.com>
Subject: File-compression on ubifs
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_043655_864446_480DEB7C 
X-CRM114-Status: UNSURE (   6.82  )
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

Hi everyone,

Had a query regarding mkfs.ubifs tool. I created an empty ubifs
filesystem using:

mkfs.ubifs -y /dev/ubiX_Y

I was wondering that if I now create a new file on this filesystem
(after mount()), would compression be enabled or disabled for that
file by-default? I am sorry but I could quite grasp this from the
mkfs.ubifs code.

Another query that I have is this:
Would ubifs do a better job at compression if it knows the root-dir
contents ahead of time? In other words, is on-the-fly compression of a
file (i.e. compression at the time of creating/writing to a file)
generally worse than when the same file is known to ubifs at the time
of image creation?

Thanks for your time!

Regards,
Shibin George

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
