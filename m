Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5030FC7EE2D
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Feb 2023 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:
	From:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58Y5qEjFeOcYIwoKD7PToc5/IsSl5fokYiM+Dd9Spe8=; b=KY91FUEsngLk7S
	4V8wIiOvOFalQhDnxrx2qVDm4Rf7H9rMn3iC7sZYQWwagNs+AScyNNfDIydONZrmj8lI2uCfdW7JK
	jmntviOECA7R03SSJTrXK+2HF9/2LDKx5KBWgL2pQBgCAadz4HBAH9eIyrZ8h0GnJ9XkAJj3cjuYN
	1QuuGoOJZxugLNTfH09PIs3BQxOHPxSKy7Nkr1fhRuyh/1OqLJpAiNv3CMDXi7SXIDQxwP/x3I21n
	D8kMV9aNKlzPdsdTj1zAeqk9Wm7rNcFWoTkwLPvINGXY+jOSDdWBy5Gc+BTu2QAUe4hbW+sKyZUXk
	X5AMuyuHNnRBGfJn3g0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaj2-0034sx-R6; Fri, 24 Feb 2023 16:15:12 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaiz-0034re-LU
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2023 16:15:11 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pVair-0005aa-Or; Fri, 24 Feb 2023 17:15:01 +0100
Message-ID: <1209941d-a3cb-6eb3-4fb7-0e09a8c32197@leemhuis.info>
Date: Fri, 24 Feb 2023 17:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Fwd: nvmem-cells regression after adding 'call
 of_platform_populate() for MTD partitions'
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Maxim Kiselev <bigunclemax@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
 <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
In-Reply-To: <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677255309;f85d2906;
X-HE-SMSGID: 1pVair-0005aa-Or
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_081509_899068_F352B768 
X-CRM114-Status: UNSURE (   9.17  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 10.12.22 13:35, Thorsten Leemhuis wrote:
> [...]
> P.P.S.: let me add this to the regression tracking:
> 
> #regzbot ^introduced bcdf0315
> #regzbot title mtd: ethernet device can't be probed anymore due to
> broken nvmem-cells dep
> #regzbot monitor: https://lore.kernel.org/all/Yyj7wJlqJkCwObRn@lx2k/
> #regzbot ignore-activity

#regzbot fix: mtd: mtdpart: Don't create platform device that'll never probe
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
