Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97796C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 09:14:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB1E20715
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 09:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVqHj2g2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB1E20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GWRWOIcWTTaKMMx03lO0W/RN+07IECwdwOkOcEsfUHg=; b=ZVqHj2g21vZEn8Lybj55t0tOW
	hp5utYjn8fqiT7VBkYcpUlgsHzbFnB+3NCi/Ct+QA191ptPTHzCdZG64IvJ6VaCRl2lyVFn+xlrAK
	xOQexudEOyaa+8sM7LPj/gvT11QPJ4+1BYQzQ3pNdthMfOK1h4FrBcFY6/TirT9JvjZkrRyPH8Z3I
	dYj+dLpepEhuFA+Wd9Hi6fv93aNpAbQoK++WflHvk5oML3uZAdgoeT6QPMV7lidkSvCPe103fr4ID
	5v9CnvmsF3pc+EEVuu9NmvLklshmnH3qPKgE8FPqZ1DYWw1O1slHEuHsdTbOBvH/tlj1bxCRD/LQN
	EXVQ34+Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZVuc-0005Od-5j; Mon, 02 Nov 2020 09:14:02 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZVuY-0005Nq-Nu
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 09:14:00 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPnK81phMzLscn;
 Mon,  2 Nov 2020 17:13:48 +0800 (CST)
Received: from DESKTOP-2DH7KI2.china.huawei.com (10.67.101.108) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 17:13:40 +0800
From: Chengsong Ke <kechengsong@huawei.com>
To: <richard@nod.at>
Subject: Re: [PATCH v2] ubifs: Fix the printing type of c->big_lpt
Date: Mon, 2 Nov 2020 17:13:40 +0800
Message-ID: <20201102091340.30712-1-kechengsong@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20201031085420.1316-1-kechengsong@huawei.com>
References: <20201031085420.1316-1-kechengsong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_041359_548823_1A67B752 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangfangpeng1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 9:56 AM Chengsong Ke <kechengsong@huawei.com> wrote:
>
> Ubifs uses %d to print c->big_lpt, but c->big_lpt is a variable of 
> type unsigned int and should be printed with %u.
>
> Well, it is:
> unsigned int big_lpt:1;
> So, either 0 or 1.
> 
> Does changing it to %u silence some static checker or is there some 
> other problem I don't see right now? :-)
> 
> Thanks,
> //Richard

This is just a coding style issue, I found in the ubifs code. :-) 
Thanks, 
//Chengsong Ke

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
