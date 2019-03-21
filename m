Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ACBC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 08:09:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51ED21873
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 08:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OP/RXsP2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51ED21873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtwHUiyGGkE/vf5HIKqs0rXgT6XZ2hph/set1GGigUk=; b=OP/RXsP2z5JdAR
	tV54rApcBY7IYueYL3X7ns83UNwekGADkUjEOWu6SvXum8+aRte4ouee0Ldtu/Tg9H3qq3Jydj7oI
	ydhb0HMBbuA3yp7CVxeD0lS4qtbK1VwIb+kLyoeJ4YBjP7nDquozNhQaUp1ZQ7Q8kdO2IPZDeIyck
	O6HCiFLGnkGmTkmUEcYYrcChJpzvtI58mo6q5bEy0UElSxRY3ILp4PH17sNfpyMI+dmoxtFMCN+xj
	RzzHLSTZjlc2lfkPQS/wn5PzWpc3oP1NERGnyVcXrSpMAnzvTMfP/6afOFK5O9S8tARixYkk3uMI7
	UHN3sMJpnB56pPME5VJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6sla-0006AU-Hj; Thu, 21 Mar 2019 08:09:34 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6slY-0006AB-00
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 08:09:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F1F7A609185A;
 Thu, 21 Mar 2019 09:09:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wdwSuQEe9G0W; Thu, 21 Mar 2019 09:09:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id ABBB3609187E;
 Thu, 21 Mar 2019 09:09:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WWftNVS9VFek; Thu, 21 Mar 2019 09:09:29 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 4B114609185A;
 Thu, 21 Mar 2019 09:09:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH -next] ubifs: remove unused function __ubifs_shash_final
Date: Thu, 21 Mar 2019 09:09:28 +0100
Message-ID: <24657306.kQxLvZqZK3@blindfold>
In-Reply-To: <289f9994-0980-081e-f913-5729b16d16f4@codeaurora.org>
References: <20190320140955.11576-1-yuehaibing@huawei.com>
 <2691086.gDEv9kBeKS@blindfold>
 <289f9994-0980-081e-f913-5729b16d16f4@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_010932_187377_887099D5 
X-CRM114-Status: UNSURE (   6.55  )
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
Cc: linux-kernel@vger.kernel.org, Yue Haibing <yuehaibing@huawei.com>,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 21. M=E4rz 2019, 08:54:55 CET schrieb Mukesh Ojha:
> >> Acked-by: Mukesh Ojha <mojha@codeaurora.org>
> > I guess you mean Reviewed-by?
> =

> As i am unsure about future scope of this func. i.e why Acked.

Acked-by is usually something I expect from the code author
or the person that owns the code.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
