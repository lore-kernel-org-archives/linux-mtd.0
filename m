Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB8EC47420
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:06:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A4220738
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yGYtbo+m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="WDQAU01V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A4220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6k7usVnJGwiWRDeP3MIJaWeOGDp5fk8qu/L3G/+aygM=; b=yGYtbo+mp6PeHchpLgh0KJEs+
	kk9ZrSdQ411+f9eChO/CjrnxLbUtSSLN5ouuWMwwMmdOsRA5r/9ibABjb0irNCUFfvkhu4EmmJdaz
	4bT5nhRjhMVzoh9GgyU9Txqb0tc/3XVvzcWcBqJ4fr1ZJG+0uxsqLGe7UMu6A7sDSOVEDVGH+Knfo
	PPlnYUnnY6x4PSKQcdNJajYhQnbtNDFqYdXGCOWUlbBjBZCvTChoPaNXH+gaT+JSbegTtx9NRTgV6
	4SCfNzbhtdeaAFMNofu0smozHv3KMv7sGHgl0sRaLaLN3PvLsXoN1GYeuRSMuNVZ59S09+z1Ah1P6
	5zyYKLPBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNbng-00065u-A5; Wed, 30 Sep 2020 13:05:40 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNbnb-00064P-Gn
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 13:05:39 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7E7804130F;
 Wed, 30 Sep 2020 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1601471133; x=1603285534; bh=uRgOOz6gHkYkqhMht+S6AJQ3u
 C1j/85HK5iKpP3tN3Q=; b=WDQAU01VhkwskLwjKCmu5k7pLrOTQQo2YVqpfdiUc
 OxDYf8jfLMRu+ekuVnpjfzOmDMBLRUyqtCjvi16vnhEiBcfFFBx8Yp/e0ozmyFxz
 JLXE7y8cV2FgwgkvGm4FuKDhEbZcVIV/Ac2N+s+jbGQLe1YHD14SeG1TWUzw2wTJ
 ho=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOafVfGaIrNy; Wed, 30 Sep 2020 16:05:33 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7384441207;
 Wed, 30 Sep 2020 16:05:33 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.122) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 30 Sep 2020 16:05:32 +0300
Message-ID: <f6d82a7a3411aed1f72f1ff3bb5f84426c44bda1.camel@yadro.com>
Subject: Re: [RESEND PATCH 2/2] mtd: spi-nor: enable lock interface for
 macronix chips
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Date: Wed, 30 Sep 2020 16:09:32 +0300
In-Reply-To: <cb47d79f-ecbb-f0ec-388e-b56ba740045e@ti.com>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
 <20200921112450.4824-3-i.mikhaylov@yadro.com>
 <cb47d79f-ecbb-f0ec-388e-b56ba740045e@ti.com>
Organization: YADRO
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-Originating-IP: [10.199.2.122]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_090535_709377_B38CAFA5 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-30 at 15:10 +0530, Vignesh Raghavendra wrote:
> Hi,
> 
> On 9/21/20 4:54 PM, Ivan Mikhaylov wrote:
> > Add locks for whole macronix chip series with BP0-2 and BP0-3 bits.
> > 
> > Tested with mx25l51245g(BP0-3).
> 
> Since you have only tested on flash that have 4bit BP, please don't
> modify flashes that have 3bit BP. Lets be conservative and enable only
> things that have been tested else we may end up with broken feature from
> day 1.
> 

Sure, will do then this way.

Thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
