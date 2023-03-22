Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48DDC761AF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGm+BbTO/qqh3s370Zv7cfxQGnl0/j47TjBmCfN/OAw=; b=0fPVOobIGwukvm
	9JkUQ9R6MVbiLiV+/z93BBYX8Z+rMEI4EJfi1pak95xOnYrlj2eaaFXa8e1bbVQSjQXelxdB43Dcb
	yZS6AFtk2hqT6rN9rOqHonpAyluZM0gTa1mDBtRidE+mPgPzs1ISJAqrMHRHWtFAQ5/jMPmn05K2a
	zYVUh8Y3/EvquPeJa7TIg6d4ziLv4ualABmO+r+f4Tobs7Bu6DRZaLJ1dvoGfHOtdNA005p7TSO7a
	tmFoa4cbKMH7eqBrKMtp//unkS+tEd5n/bAhVhbBtFsH4EAPpAs7tpCG1lBepJKqr06rZcBtadtG6
	EF5OEMqk8EKgR3edYkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10a-00GbLK-1f;
	Wed, 22 Mar 2023 16:08:16 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10V-00GbFe-2J
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 16:08:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 353DF240004;
	Wed, 22 Mar 2023 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRHiruRHD09dsVz3xB7VqxnrO35/Pw0ZmK+hXqwrLL8=;
	b=Ws2zcO5hdh2g4Y7I+e4Y3mWR3i/5rzpHsix8CyMY+zyNRJZSQKbdU+TRmPI+Sacd7BkuZq
	F2zMGqSk+heEB8yMhUkzaAIspY0Jm6vVrtYf9eDuiE4a20oKrcc89kmTHeFgi2pCXZeEg2
	q7UO6lEvJ5An9ZD31Bcqomrn2rUw/o9Xx0hO5v9mkCKydVak1zHWsN/NYHI255ZswNBdUU
	Itcmqh41ZMIcaH67ZUEJAv05sgxUddV5Y+H/fcwgv7iCWiu3am4A0MVDSfScK4kfasXWLw
	KTB+O5FZdylMpBfU2667sfxhz9nGoavzaSjJcTdyGQxj8Up90+LFIMfnH6CcFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH] mtd: rawnand: nandsim: Artificially prevent sequential page reads
Date: Wed, 22 Mar 2023 17:07:59 +0100
Message-Id: <20230322160759.2232642-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310085452.1368716-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9b043c649022ec55040aa9315cc72059c4ec254c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090812_133139_88D5289A 
X-CRM114-Status: GOOD (  21.37  )
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

On Fri, 2023-03-10 at 08:54:52 UTC, Miquel Raynal wrote:
> The continuous read support added recently makes nandsim
> unhappy. Indeed, all the supported commands should be re-encoded into
> internal commands, so of course there is currently no support for the
> commands and patterns needed for continuous reads to work.
> 
> I tried to add support for them but nandsim (which is more a tool to
> develop/debug upper layers rather than the raw NAND core) suffers from a
> big limitation: it's internal parser needs to know what exact operation
> is happening when the address cycles are performed. The research is then
> sequential from the start up to the address cycles, but does not check
> what's coming next even though the information is available. This is a
> limitation which is related to the old API used by the core which kind
> of forced the controllers to guess what operation was being performed
> rather early. Today the core uses a more transparent API called
> ->exec_op() which no longer requires controller drivers to do any more
> guessing, but despite being updated to ->exec_op(), nandsim is still a
> bit constrained on this regard and thus cannot handle sequential page
> reads because the start sequence beginning is identical to a regular
> page read.
> 
> If the internal algorithm is updated some day, it should be possible to
> make it support sequential page reads by adding something like:
> 
>        /* Large page devices continuous read page start */
>        {OPT_LARGEPAGE, {STATE_CMD_READ0, STATE_ADDR_PAGE, STATE_CMD_READSTART,
>                         STATE_CMD_READCACHESEQ | ACTION_CPY, STATE_DATAOUT,
>                         STATE_READY}},
>        /* Large page devices continuous read page continue */
>        {OPT_LARGEPAGE, {STATE_CMD_READCACHESEQ | ACTION_CPY_NEXT, STATE_DATAOUT,
>                         STATE_READY}},
>        /* Large page devices continuous read page end */
>        {OPT_LARGEPAGE, {STATE_CMD_READCACHEEND | ACTION_CPY_NEXT, STATE_DATAOUT,
>                         STATE_READY}},
> 
> For now, we just return -EOPNOTSUPP when the core asks controller
> drivers if they support the feature in order to prevent any further use
> of these opcodes.
> 
> Note: This is a hack, ->exec_op() is not supposed to check against the
> COMMAND opcodes unless _really_ needed.
> 
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Reported-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Link: https://lore.kernel.org/linux-mtd/fd34fe55-7f4a-030d-8653-9bb9cf08410d@huawei.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Acked-by: Richard Weinberger <richard@nod.at>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
