Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297F4C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:48:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A7060238
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56A7060238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UZEti0QRsoKgCDSZjPEfzKRVoUuC/cVzMJGjnbG5Jvs=; b=XLw/4bv56gn23Yf708ksZZd39
	yO3lc0bNUGghc5/gp605zt0eePKMaa2A6ZTprdiu5lgOuzgwiiELRmSRSmAePjl+ts3nj0mOQmu57
	Zt9p4re/1Ls1xMuhUTAwg/rPUT5t9kIFUEuJKwcf/7DCTZi6rzpBwwvZyxKLqWPzKHyFQPM8NLZor
	hjB6U8jCqMS5Kzy11hgfZPoAL8pq7lVoJ7NaiqarvqKtsNSO6kENTLuDC51NoLg6j3UUgXkr7TaAi
	hSosfPy/zKgsaUrT7L/n0LFUmu8trMsNALf2W2ZBzZPL5bjUSVljRfOHEMd8GChkNfWzqmajfu093
	HvkAfXMXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvzc-000w3l-WD; Mon, 29 Mar 2021 17:48:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQow6-000Zac-N9
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aYgtgpYf+wQKGjBbd4G04FPyyaLqR/Z18Zv/O3GVbHg=; b=OmoTllV8+yok8S1p++CTdfTuSv
 IssE5D3SZskhgA+m1JzlCGUfoJxkdya+DYouq7o8VJv1C8jtsRWEjmhf64ePeZLRc6YSqE335R/Yx
 cOppCbHf4UlnhU/THN+n4JVcSWE9auq7G0C5akWxhatrdJ+kEEMY+NeLka2TbBNnu6R+WSmIMAgDV
 yuU1dLKlT1oSAVuZF0fWCGGhwEoghhkY88WS+ahHgftWA5jIeL+HYyR/dSTV/738VzIsfqCuTD89e
 qq1wRcOg06TasuZmO9omeWwQ6/WSmZKqHff29MdQ35e03MBNJnBJFeNcxn2Lvpy4qX22FTEjeQ6/H
 SdIWWpwQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZ0G-000JmP-3t
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:15:14 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 46F98240003;
 Sun, 28 Mar 2021 17:14:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: menglong8.dong@gmail.com,
	miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhang Yunkai <zhang.yunkai@zte.com.cn>
Subject: Re: [PATCH] mtd:rawnand: remove duplicate include in rawnand.h
Date: Sun, 28 Mar 2021 19:14:45 +0200
Message-Id: <20210328171445.7646-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313105702.365878-1-zhang.yunkai@zte.com.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7a534c5e4159f9bbac9f3c146dc78e163d8858c2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181509_388715_6B6D9ED1 
X-CRM114-Status: UNSURE (   5.40  )
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

On Sat, 2021-03-13 at 10:57:02 UTC, menglong8.dong@gmail.com wrote:
> From: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> 
> 'linux/mtd/nand.h' included in 'rawnand.h' is duplicated.
> It is also included in the 17th line.
> 
> Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
