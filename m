Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B959BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUFbKrhY+SgYcS8FtfCJu8yqXNxUnHfTk//xGHCDXHA=; b=F/XhqYgIa+m6zB
	Ee3gmewqmjIiSuBdLc2S7pWmnqj3m3Gr9eYldVm1DQhCjpqIoZRYWGgB+OFrkTd86cnWYLdpknE//
	3oOIKewurSqOlfLISUUZSKWg8XTqhu8P5MIEhpXtWmVr2OjiyYp8E9EZhvPw6G+zk/NGAE/sgxStq
	x7mKpt2bwZucq5MNnq1tijuWukAf6zgqh2WGqrJGA7JeNBBXW4dQvNqcQH7ArQuyCCIRYJHn/tkvd
	9OoxWg1tVySRIhGk6QYAlCZryq92ubAhmSF7tcqh4h45rDbJWajU1ySzNbN07d0UdcsFxFa0YY6KN
	ZJMcMg86TVvokoKaxXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGWI-007TiN-Vy; Mon, 21 Mar 2022 11:48:19 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGWF-007ThV-Qy
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 11:48:17 +0000
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nWGWB-00063R-M4; Mon, 21 Mar 2022 12:48:11 +0100
Message-ID: <db755852-effe-c4ca-726c-200d28b0b8a5@leemhuis.info>
Date: Mon, 21 Mar 2022 12:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>, miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220316155455.162362-3-ikegami.t@gmail.com>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1647863295;
 aafd6725; 
X-HE-SMSGID: 1nWGWB-00063R-M4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_044816_068784_27DD07A4 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 16.03.22 16:54, Tokunori Ikegami wrote:
> As pointed out by this bug report [1], buffered writes are now broken on
> S29GL064N. This issue comes from a rework which switched from using chip_good()
> to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
> returned by chip_good(). One way to solve the issue is to revert the change
> partially to use chip_ready for S29GL064N.
> 
> [1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Why did you switch from the documented format for links you added on my
request (see
https://lore.kernel.org/stable/f1b44e87-e457-7783-d46e-0d577cea3b72@leemhuis.info/

) to v2 to something else that is not recognized by tools and scripts
that rely on proper link tags? You are making my and maybe other peoples
life unnecessary hard. :-((

FWIW, the proper style should support footnote style like this:

Link:
https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
 [1]

Ciao, Thorsten

#regzbot ^backmonitor:
https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
