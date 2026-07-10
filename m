Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A817FC44506
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jul 2026 02:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LbSsXfhya2ld407Nxl0VyaICMYHTTDFkuvSVZLSwpg=; b=axLY5PnH4p1gcq
	FcdBsW1OlhfAx0UFBQ8E3UnMShMsmk2sXJmPftpN0DgnW2LNsyw9z9pL7K0LEswQ7eaXlmU8tp4p0
	leHYXsLIp7EoYzroNW46XNHSojGFfsRl3GtGuEHR2tzvtZu5RK5oPJg+sQdPojfAddpd+Y0aCFOG0
	OFj3cmBvswZ/PLOkwiXNp1fWrnXxJrXV9yReHw0XUuHObLlMN8DkLBptOdNITPpDSsi/4zAYxdcEs
	WYDH39qJAaHaeTz/i3W1TReoGvyudmc/dCJ8yrg75qSpO0HJ14g7KLNPEY3yEu3ohulcoUUjrQSKR
	IfMKx0asBf5AKcsTL8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1QH-000000040fQ-0YRB;
	Fri, 10 Jul 2026 02:57:05 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1QD-000000040ez-30ob
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jul 2026 02:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1783652222; x=1815188222;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Gyq1qOWvljfJQdlrHQ7yHWyNU8IHLJa8f/3GJWzfl2g=;
  b=kHMRcPXYEKtA8MPVwgwWGjH1G9gp2qoWnuzlYVoN5/S8NS1ySDx+RCEy
   kOdsggfDJAQCC1gboMgNrwTAiMFzmHr//tUjTIwiv/pXi95ld1RfolKqB
   k1Rs/5QoDHqGWq1h5i+giAI1IZ6f6YPC6JZLxmsLk78wKsFMqAc5MmxTA
   0=;
X-CSE-ConnectionGUID: 9ar2FVaIS26DIRQJ9JK4hA==
X-CSE-MsgGUID: bTDbh0HZTYiscX2PdGFdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="100411348"
X-IronPort-AV: E=Sophos;i="6.25,154,1779141600"; 
   d="scan'208";a="100411348"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 04:56:00 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 10 Jul
 2026 04:55:59 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 10 Jul
 2026 04:55:58 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.043; Fri, 10 Jul 2026 04:55:58 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <miquel.raynal@bootlin.com>
CC: <pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Sashiko to track linux-mtd
Thread-Topic: Sashiko to track linux-mtd
Thread-Index: AQHdA6z+zQDJzP5BH0+i5EcNLx8rzbZNZ7CNgAhEU1WAAoKYgIAN9y/A
Date: Fri, 10 Jul 2026 02:55:58 +0000
Message-ID: <b224c6938e084763b017c63e0aa3fa3f@infineon.com>
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
 <87pl19s7ng.fsf@bootlin.com> <0fe3140096bc48a8e71838362220d9f8@kernel.org>
In-Reply-To: <0fe3140096bc48a8e71838362220d9f8@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_195702_107172_88EA42ED 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Hi,
> 
> >>> https://github.com/sashiko-dev/sashiko/blob/main/MAINTAINERS_GUIDE.md
> >
> > There are a couple more questions we should answer regarding e-mail
> > delivery:
> >
> > - Shall Sashiko reply to all/just the author/a list of individuals?
> >
> >   If we go for e-mails, I'd answer to the thread, so "reply_all". But
> >   I'm open.
> 
> I'd go to let it only reply to us, which will review the comments
> and forward them (or mention them with a link to the webinterface).

I'd lean toward 'only reply to us'.

> But I'm open to just use reply_all, I just fear that a submitter will
> reply to useless/wrong suggestions.
> 
> > - Shall we set an embargo?
> >
> >   I'd be tempted to say "no").
> 
> Whatever that is and how it will work with the reply_all option?
> 
> > - Shall Sashiko send a positive review in case nothing was spot?
> >
> >   If we enable e-mails, I'd be tempted to say "yes".
> 
> yeah probably.
> 
> -michael

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
