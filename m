Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFF7C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 13:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25EE92083E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 13:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HYWmSn5h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=email.cz header.i=@email.cz header.b="X4IR9oIB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25EE92083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=email.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K9mAIB18RD+ZrsEa2HWMqqcysO/aviC7IXe5j8hl3qI=; b=HYWmSn5hsK3Fkv
	xNUPBKy2MAUoZEuMiYw1gUyubSf5a96ljWjS+AqWbFuhNaIYBU3u67BHIbt1rhPjxpzFSwj3Gtg48
	wmX9JPUAWzyVykCB+iRiqHDdMFoPlTjg4SUHSMLMl271Hpk2QMfRZ4JrnOUyoinZrOPZla3ZhnB0g
	r/D0nwtJw/iwpqE2ReTAkBdgpB5mbJ25HFGKJoustqYu9t2CLdUu0RNarujWwLVxBQVvLps6tQzkI
	2YQBvnlUeZPAw7Vy4p36vz6Xz8K9G9yYMuB72X/GdSQdJeb8/ltiseJErCrORUO9c4it12yu3oeHk
	4mK9OetizboImhom9a3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHp94-0005Hf-8X; Fri, 27 Mar 2020 13:35:34 +0000
Received: from mxa2.seznam.cz ([2a02:598:2::90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHp91-0005Gh-4v
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 13:35:33 +0000
Received: from email.seznam.cz
 by email-smtpc21b.ng.seznam.cz (email-smtpc21b.ng.seznam.cz [10.23.18.27])
 id 4574902fc593fab24700ae41; Fri, 27 Mar 2020 14:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1585316124; bh=EsG0O6a0o5uQtLILAzf+BoQIJ+R+xhCc62OofFmrjpI=;
 h=Received:To:From:Subject:Message-ID:Date:User-Agent:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-Language;
 b=X4IR9oIBrm4x9ASL0xq93wCLnAivrRtWDIUXrao+fo/om9UlVvl59+1SRVkW+hXTX
 8RuTrI9YDEjGugp5f5PLURcpuXopy9sQErDC61ljBM0YUzljUlhdsHSCb8exRIDU/d
 UOgtpJtzq+pRle2q+giEpMy4pVqVx6pS437wrGso=
Received: from [192.168.0.140] (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay14.ng.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
 Fri, 27 Mar 2020 14:35:22 +0100 (CET)  
To: linux-mtd@lists.infradead.org
From: Jan Havran <havran.jan@email.cz>
Subject: jffs2reader: catfile writes only the first inode
Message-ID: <9fef7d91-ff84-3a3b-2b26-06e514f54a63@email.cz>
Date: Fri, 27 Mar 2020 14:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_063531_495019_7B1B50EA 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

during my work with mtd-utils I found out that dumping the file from 
JFFS2 dump via jffs2reader is not fully implemented - it dumps only the 
content of the first inode. I found thread here, in the mailing list, 
about it [1], where the guy refers to one fork at github which has this 
feature implemented [2]. What do you think, could it be merged in 
upstream or does it need more work (I might give it some time to work on 
it)?

[1] https://lists.infradead.org/pipermail/linux-mtd/2015-June/059804.html
[2] 
https://github.com/vamanea/mtd-utils/commit/967e4065c887f410bd9be76306f382664221ce30


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
