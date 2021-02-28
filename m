Return-Path: <SRS0=n0JE=H6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FECC433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Feb 2021 22:59:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A72664E38
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Feb 2021 22:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A72664E38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g8e2neCmOuZtEJdNniBh7KEKsVyyEsE6bnUy5449QeQ=; b=wmqDl5Br3TFpDRqH6kFZdwfxx
	LVscqmwZJmxdj/nsJJHV5Q/R6wrWe+FC0mA9WzTdVJvR0tJsG4QQ/5G91OUMm5I/Mac4d7sS104a2
	RM6s6vNj1JsrbdDfX9eiW3wKtao04mNS3lOCJdmdEIUkeQoNI4JZFedmUUTpLBGu/83kYaqoZwvHQ
	unoUuYOmuOKTIIbvr8oNuUH6pnzhOjjKHrWYyIaw5kc8aNvpGPpe3gLkB4N3cfKvOmYNqq4uqODaB
	K8Zyxir2M2xpp9HLtSwZmwNHfL3tvTXR98pKUvcC3rIouDVQVDFcxDlgdpOnbGqux/mvZ0DzqC28l
	+9Kwlex4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGV1F-0005zu-DO; Sun, 28 Feb 2021 22:58:33 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGV17-0005zW-PA
 for linux-mtd@lists.infradead.org; Sun, 28 Feb 2021 22:58:26 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id ABF4A18246EE7;
 Sun, 28 Feb 2021 23:58:15 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rM9IlBYKIiVr; Sun, 28 Feb 2021 23:58:15 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UY2Ex74laurz; Sun, 28 Feb 2021 23:58:15 +0100 (CET)
Subject: Re: [PATCH] mtd-utils: Use AC_SYS_LARGEFILE
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
References: <20210226102421.1480045-1-s.hauer@pengutronix.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Message-ID: <07f5cfd0-f57d-e9d5-2c9b-c644da4b7174@sigma-star.at>
Date: Sun, 28 Feb 2021 23:58:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226102421.1480045-1-s.hauer@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_175825_932229_F8948348 
X-CRM114-Status: UNSURE (   6.13  )
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

Aplied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
