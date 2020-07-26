Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5384C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 09:03:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2EC2065C
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 09:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QxkIc2Ui"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E2EC2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=youngman.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5dl5fZrIU0adoLSMW161QUvSNEhqz0IVNw0S2qscOI=; b=QxkIc2Uibj8PDWqGhwSrfB7CB
	iKL88TBVlNvrJFJe2r/GUn8bjRtuXVWGErzCqupwsdjkU5pc3lYeE1CSG+dFHLL2nms0z8XR8xUgl
	PO38ark2Tj+AxzBPWZCSpBojQ0WMqn+iZjaP4kbmMXTgyZN3bgL8FkOLLZFDPrq1ghLifJhi8a88B
	rYSvcIZzYvD3iNOmW+Aexg6CJZw1PIkW2VLWUeR2o96YH28myqQdOlYPW+4gczGQEGK6QQKjB7s8x
	Ap7VaZmQ/yI4RYotDIhZvgFieBhoXyWQuR9Yem4ExuuQB7afkMdiGHeQRjSbp14mT8k55otI90LnZ
	B1IDzTTJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzcXZ-00066h-Cw; Sun, 26 Jul 2020 09:01:53 +0000
Received: from smtp.hosts.co.uk ([85.233.160.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzcXW-00063Z-Vp
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2020 09:01:51 +0000
Received: from host86-157-100-178.range86-157.btcentralplus.com
 ([86.157.100.178] helo=[192.168.1.64])
 by smtp.hosts.co.uk with esmtpa (Exim)
 (envelope-from <antlists@youngman.org.uk>)
 id 1jzcXM-000AVu-50; Sun, 26 Jul 2020 10:01:40 +0100
Subject: Re: [PATCH 09/14] bdi: remove BDI_CAP_CGROUP_WRITEBACK
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200722062552.212200-1-hch@lst.de>
 <20200722062552.212200-10-hch@lst.de>
 <SN4PR0401MB35988BC2003CCDFC7CE8258F9B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
From: Wols Lists <antlists@youngman.org.uk>
Message-ID: <5F1D4671.5060708@youngman.org.uk>
Date: Sun, 26 Jul 2020 10:01:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <SN4PR0401MB35988BC2003CCDFC7CE8258F9B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_050151_053463_DB740BA7 
X-CRM114-Status: UNSURE (   7.49  )
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
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/07/20 08:45, Johannes Thumshirn wrote:
> On 22/07/2020 08:27, Christoph Hellwig wrote:
>> it is know to support cgroup writeback, or the bdi comes from the block
> knwon  ~^
> 
Whoops - "known"

> Apart from that,
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> 
Cheers,
Wol

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
