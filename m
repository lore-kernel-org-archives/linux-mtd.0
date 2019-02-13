Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB28C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 09:42:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECF8222BB
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 09:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/fAsNha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ECF8222BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66eoj5RHwafaDtCD9A9dHx3U28ZO41p9lFt/AxgN6kM=; b=K/fAsNhaS15z/U
	BsckQJU3akdORUTuz7QUAoDMXSXXQN0bbYfdPs+4TRTbJzx2EGImLOXEubB69Arbqmh5upy8H9/xY
	o/6xIG1DjO4Xt/4aLd2zNS3EqoND1QLg3nCZeTcAuXX4De1jTMihWH98usaBl4zIcjJUZX0Q72x+Z
	7pScaB6KhMF8RpDRtWVgG5K6DDc1WFXwqvWRrdn3oHWFICsHjY5EwVOGp2hwc62uCm6zi61frUGMn
	JN89vzs7I4jUoWBYnW/liBvy+2VtCBT+15Y3WVGIzNrICvrK1h+uyOVLn9/jQBt4+zcvRxHVndzy7
	Vl8Sj04KkAwogG2pC2jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtr3q-0004cj-DH; Wed, 13 Feb 2019 09:42:34 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtr3m-0004cC-KY
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 09:42:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3B549608A382;
 Wed, 13 Feb 2019 10:37:06 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2eKx4pIYlaIb; Wed, 13 Feb 2019 10:37:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F1F26608A389;
 Wed, 13 Feb 2019 10:37:05 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id x5aWgh5kPPTC; Wed, 13 Feb 2019 10:37:05 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id B12A6608A382;
 Wed, 13 Feb 2019 10:37:05 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Subject: Re: [PATCH] ubifs: reject unsupported ioctl flags explicitly
Date: Wed, 13 Feb 2019 10:37:05 +0100
Message-ID: <5542544.hSWd2mM4mz@blindfold>
In-Reply-To: <5a556b50-9af3-0f0d-7638-cfa808e31946@huawei.com>
References: <20190209085420.2375-1-houtao1@huawei.com>
 <5a556b50-9af3-0f0d-7638-cfa808e31946@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_014230_822908_A7728785 
X-CRM114-Status: UNSURE (   5.69  )
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
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com, dedekind1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 13. Februar 2019, 07:50:42 CET schrieb Hou Tao:
> ping ?

No need to panic. Just returned from vacation and still didn't reach
to bottom of my mail pile....
 
Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
