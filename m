Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A76C4363D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 14:22:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFDAF2076C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 14:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DS9YI7LU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=robart.cc header.i=@robart.cc header.b="bPVuqOML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFDAF2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robart.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c2z5TtQZnG1J32d1JgnXmVSSGYW+1zyxbs/v4jbZKNY=; b=DS9YI7LUo4hsQQ2qOFEz7Aiog
	cbJJyLMrxaTKBqyjf4p4/07op3cL7tr03k3SU/0pMBStoWvSNoqGKxG97WQZE9k1K40U9nb2b+Qwd
	JMA6XxsRXJQH1H1ih4vX/HcD3ImkbwZxQW5ocWsDbA51YOgv5JspTWGiJn9xHBx08SA9D4GT9/S5Q
	FBwfy/ahdkG74uLm6Gs0UNDerF2aPktiJOhl0bpTuxTHpwGebnALEiKyDZIJyJDQBuZ5pm6Zs77aE
	HyFDAHx7x+EuEObSs6R2NRcaV1mHV0REB8cD6LZ7aLQRTwc0e2sC7TGQe0uluZEk2jWoNyEOCyVd0
	qQXVo+7Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQAJi-0003HT-L1; Wed, 07 Oct 2020 14:21:18 +0000
Received: from srv-mta-01.robart.cc ([80.123.245.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQAJf-0003Gg-Ea
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 14:21:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id AFDF11C0DE1;
 Wed,  7 Oct 2020 16:21:12 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6Fb8rWMe4g9I; Wed,  7 Oct 2020 16:21:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 7FCF11C0DDE;
 Wed,  7 Oct 2020 16:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc 7FCF11C0DDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
 s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1602080472;
 bh=mRHwhnGOWYgwCBjKMr/qcMVI2ErVNkZ5+hglzzjkwhk=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=bPVuqOMLD4+Piy/9MrhBlAopvuG2YoU3kJZ5EtdUsW72LOXZxKqNpmTV2IxGIkTnk
 cFI+P2ZMQ54EYch+rntZVz1yBpLbnC9UCtDFBq6MjFQ1k+LPzCVVxclss8vAKRZlcS
 EKokfs/AehsqjWQItZfzVoo4PKsu1s6+6DlUHg6mpZMLZanYJ9IVSBNbPRW/vy2nGm
 m5/3NafysPGwxhSPvMBrFNlIIp/SXGsiydl3G1jJH22/e9ro8+oWcsiO6fTC/b9HG3
 Qm4uwOSpzARplFkiNq7ZSJ8qV342VppyyCu1Xjei2Sot/ODSbjMiWO03AXt2rGO1df
 iWnDgThAlAFrg==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oiOe4kGyCOWB; Wed,  7 Oct 2020 16:21:12 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.robart.cc [10.0.10.21])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 51DD31C0DE1;
 Wed,  7 Oct 2020 16:21:12 +0200 (CEST)
Date: Wed, 7 Oct 2020 16:21:11 +0200 (CEST)
From: Manuel Dipolt <mdipolt@robart.cc>
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <362437696.773271.1602080471860.JavaMail.zimbra@robart.cc>
In-Reply-To: <20201007150258.00baf8c7@collabora.com>
References: <1203329103.515411.1601900419875.JavaMail.zimbra@robart.cc>
 <20201005150912.65619ca2@collabora.com>
 <1690133500.668948.1602004808077.JavaMail.zimbra@robart.cc>
 <20201007150258.00baf8c7@collabora.com>
Subject: Re: [PATCH v3] mtd: sunxi-nand: add dma support for allwinner h3 -
 review changes
MIME-Version: 1.0
X-Originating-IP: [10.0.20.40]
X-Mailer: Zimbra 8.8.15_GA_3959 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: sunxi-nand: add dma support for allwinner h3 - review changes
Thread-Index: FXmkaB5aOM21V9kVcuCtWWs/+qKARA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_102115_909963_5109287A 
X-CRM114-Status: UNSURE (   8.45  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 bbrezillon <bbrezillon@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 maxime <maxime@cerno.tech>, miquel raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Will post it again as V4 where V1-V3 are together

----- Original Message -----
From: "Boris Brezillon" <boris.brezillon@collabora.com>
To: "Manuel Dipolt" <mdipolt@robart.cc>
Cc: "linux-mtd" <linux-mtd@lists.infradead.org>, "Roland Ruckerbauer" <rruckerbauer@robart.cc>, "miquel raynal" <miquel.raynal@bootlin.com>, "maxime" <maxime@cerno.tech>, "bbrezillon" <bbrezillon@kernel.org>
Sent: Wednesday, October 7, 2020 3:02:58 PM
Subject: Re: [PATCH v3] mtd: sunxi-nand: add dma support for allwinner h3 - review changes

On Tue, 6 Oct 2020 19:20:08 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> hi Boris,
> 
> thanks for the fast review,
> applied the suggested changes and answered your question,
> please take a look if its okay

Please submit a new patch with a proper commit message instead of
replying to the existing thread and pasting the new version at the end.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
