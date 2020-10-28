Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11275C388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:18:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389CC2468F
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ix19LJXt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389CC2468F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1qDUFhFUa0zd/4iAGbmH4RQ08gwn+jQZtFExWGxo3I=; b=Ix19LJXtm0TFF3927mKQZ5P+11
	UM1JYfuYhkFtiycVhNEtJau2tmFBrM9l4iT6+Mwzhe+gN/nRwWFiIummymBrxKnZS/OmJBW7k2VS+
	QqdquTAaDeseHUzOsQGNI6lh5wdaNPVpP6oCPVbQwmOS4xrRP64nxT2UK5QRli+wZSjaE6bi7qJq8
	6lc4WcnzxZ5Ci5JvPQppdz0BA+ZgyXk4voHVt8FA1kNQ9HGG6LFGUZ4vPPbS8eJ0NUE3UFZwhZsm2
	ZtGGmGAmFStp5iWtvwNBNSxbfB0FWhG01qgE0s6hZ8gB5iJeRgx4gDwlMOWjAp61LyCsVOqngfJb6
	eRau4O9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXhaJ-0000Qe-TK; Wed, 28 Oct 2020 09:17:35 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXhaG-0000Q0-Q2
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 09:17:34 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CLjdf6FSJzLnLV
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2020 17:17:26 +0800 (CST)
Received: from [10.108.148.36] (10.108.148.36) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 17:17:16 +0800
To: <linux-mtd@lists.infradead.org>
From: Junling Zheng <zhengjunling@huawei.com>
Subject: [RFC] mtd-utils: tag for previous release versions
Message-ID: <2bbc8a93-42db-163e-daa7-467cdfa5ed66@huawei.com>
Date: Wed, 28 Oct 2020 17:17:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.108.148.36]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_051733_644015_305D81A5 
X-CRM114-Status: UNSURE (   5.54  )
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
Cc: hukeping <hukeping@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I note that there are no Tags in the mtd-utils repository for v2.1.1 and previous versions.

Do we have any plans to tag them for convenience?

Cheers,

Junling

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
