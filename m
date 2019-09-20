Return-Path: <SRS0=rWZ+=XP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC7EC49ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 11:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DDD220882
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 11:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GFlZTMU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DDD220882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jroMP2u6+yrxA3LIzwgGZ9/gjhwRcl8vh/cd5NfBslc=; b=GFlZTMU7qejVj7
	isbZ7dqaz/RLL5+t2+T2hc6bV2nu1QG/jQm6lW93SGmT6cdCm/XprgMSdfZKDZbmrzJBSbWBP8NOq
	xP1DEgPnbxopGmBxm7Re6pXt15UjxdPiW2O7v1AJpq/LWtlU5IEJwaCUVXRgFVt+lCTenpRA7wABS
	EN8EybTbQag4x6ZHYlZE8cC9LhU78+MI1ux5JOgi7S6eVd6Ibe1utsaexFrlkblAFAgHSzhS+TDAc
	YbzE5wGHyxps2Ovcb2dU6to+izYuZPD0lnnqaNpCjRZVoeGvFabTebkvhY9KreOKNHWoctBk6hAw7
	QyM6uBk9q/wJWKwjYOyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBHMh-0000xq-S4; Fri, 20 Sep 2019 11:46:19 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBHMf-00075C-3r
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2019 11:46:18 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.2 #3 (Red Hat
 Linux)) id 1iBHK4-00043M-D1; Fri, 20 Sep 2019 11:43:36 +0000
Date: Fri, 20 Sep 2019 12:43:36 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH] jffs2:freely allocate memory when parameters are invalid
Message-ID: <20190920114336.GM1131@ZenIV.linux.org.uk>
References: <1568962478-126260-1-git-send-email-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568962478-126260-1-git-send-email-nixiaoming@huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_044617_157715_0E9468F1 
X-CRM114-Status: UNSURE (   4.28  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, dilinger@queued.net,
 linux-kernel@vger.kernel.org, daniel.santos@pobox.com,
 linux-mtd@lists.infradead.org, houtao1@huawei.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 20, 2019 at 02:54:38PM +0800, Xiaoming Ni wrote:
> Use kzalloc() to allocate memory in jffs2_fill_super().
> Freeing memory when jffs2_parse_options() fails will cause
> use-after-free and double-free in jffs2_kill_sb()

... so we are not freeing it there.  What's the problem?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
