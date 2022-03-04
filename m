Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B63DC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALQ//ktIOndRNMueksu6YxE1FRwdPgpezOwPSBYpEqs=; b=hwvjh9mMvcHMzs
	Ek12hpXE7Yny+E3wdfggsChvaTl2MQaXodmfciQCQnEOOR/No9tBLh60sij6hDTeGQsI/asPO7M2Q
	nqGr2OjWnsPxqzwsJ9OkS7Wjb0PmgiRrgWvpRjdej4u9XVkYqLfyh5asJdPhavvArR/jwbne/qSS9
	iynyTWQzjNvRBkhhggquLAQEEjn1aj8Ilu7eYgORt7Y+jLMf1qj86Jp83c2ZabsCTjgsXVlSvdvjZ
	wv8QilzO5iJX67ufN6LwthWfJQ3cZ6vz+4INIAdyeGQxD6jVtFar7L1l47knrLU+IYcorA9d/zoJF
	3sBk3kycKekFtnVO3M+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ21l-008iRV-FB; Fri, 04 Mar 2022 07:07:01 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ21i-008iR8-Jy
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 07:07:00 +0000
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nQ21e-0004zJ-Io; Fri, 04 Mar 2022 08:06:54 +0100
Message-ID: <f1b44e87-e457-7783-d46e-0d577cea3b72@leemhuis.info>
Date: Fri, 4 Mar 2022 08:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 stable@vger.kernel.org
References: <20220214182011.8493-1-ikegami.t@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220214182011.8493-1-ikegami.t@gmail.com>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1646377618;
 3428ebfe; 
X-HE-SMSGID: 1nQ21e-0004zJ-Io
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_230658_858822_89D32ECA 
X-CRM114-Status: GOOD (  14.78  )
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

Hi, this is your Linux kernel regression tracker.

On 14.02.22 19:20, Tokunori Ikegami wrote:
> The regression issue has been caused on S29GL064N and reported it.
> Also the change mentioned is to use chip_good() for buffered write.
> So disable the change on S29GL064N and use chip_ready() as before.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org

This is missing a "Link:" tag pointing to the report:

Link:
https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst' explain this in more detail. Such
tags are important for me, as it allows my regression tracking bot to
connect the report with any patches posted or committed to fix the
issue; this again allows the bot to show the current status of
regressions and automatically resolve the issue when the fix hits the
right tree.

BTW, what's the status of getting an improved fix merged? It seems the
progress slowed down quite a bit.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

#regzbot ^backmonitor:
https://lore.kernel.org/lkml/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
