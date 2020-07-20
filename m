Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F54AC433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 12:38:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E22E2070A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 12:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AYdorFCC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E22E2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynoZsa3fgsKKXfuZYBw/R1/qLaIHgDcesetzTLPm7ro=; b=AYdorFCCz6Ru9tApWIMFSYQoZO
	498GkH8kbyGF+BI7DcnKMIlA421u5CeS6fXark1+OQVETUpggaOqLihtP4OXi1q5DvRv2wusAv2eP
	v+HZmA6zBNU/rsYtsUvep9n8msMymbcldbyf1vlbg/GEaAP5B0PfvoY3LW813x6hEdin/bb8XkjZw
	GmT3gT+/cCh2+21ejGFXK1vxOGT5/gNEf5Yv6naCYijomk1FTQcoLAYYprCeotY1SEjIWmdyCfiWd
	Jz6QW4DKkNtO0E6qcxcYA6SNq32cPU5U3/glK8qUwJovqMUbkiv6GAscBasfZ8hV1+WwL4l1X5//N
	emtE04aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxV2o-0001eT-UW; Mon, 20 Jul 2020 12:37:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxV2n-0001cp-65
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 12:37:22 +0000
IronPort-SDR: 1nl7CX02odEyk1nzsENmKn6f+BhbtQBj6bGIJtl7kXYUh35bbmBObGDHy2596T+YpFWGxVzumY
 EQ7UklG7Ru/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="137380390"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="137380390"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 05:37:15 -0700
IronPort-SDR: 7deXD1XW+A1Hva+QiCJdaK4EIpnjzCtylsXLbkZMEWcV3EA4SSFqyWHsLulKcoOBu1VF1DCfC/
 jsIW9xbLx4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="487228228"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2020 05:37:15 -0700
Received: from abityuts-desk1.fi.intel.com (abityuts-desk1.fi.intel.com
 [10.237.72.186])
 by linux.intel.com (Postfix) with ESMTP id A1092580299;
 Mon, 20 Jul 2020 05:37:11 -0700 (PDT)
Message-ID: <2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
Subject: Re: [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christoph Hellwig <hch@lst.de>, Richard Weinberger
 <richard.weinberger@gmail.com>
Date: Mon, 20 Jul 2020 15:37:10 +0300
In-Reply-To: <20200720120734.GA29061@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
 <20200720075148.172156-5-hch@lst.de>
 <CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
 <20200720120734.GA29061@lst.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_083721_380424_BF3B2D52 
X-CRM114-Status: UNSURE (   8.35  )
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
Reply-To: dedekind1@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 device-mapper development <dm-devel@redhat.com>, linux-mtd@lists.infradead.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 cgroups mailinglist <cgroups@vger.kernel.org>, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-20 at 14:07 +0200, Christoph Hellwig wrote:
> What about jffs2 and blk2mtd raw block devices?

If my memory serves me correctly JFFS2 did not mind readahead.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
