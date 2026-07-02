Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76060C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 02:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpYqxxSk+0lXT2TqAJGzUlQM9OfN9HuCvvA2Z8vb10I=; b=oP2uvqCGv2zU4K
	szC3A9EKV+AHNidqy/r7v1EESeG7ffF5yOhSBJ5Owj4Iydi+1yTfcyd2bT++xXaTaeIRyYN/TP8Zu
	itZJ3Xo7SUxHS39pUGIRLrZPrPzukiKuTwt5GcrOg2ZgDjcgYVfGWl2YAmx6kD3V/BvsBFnO33wMI
	CDBTNNlRBOHb+5MWxPqFTYwfoXR6EakE8xq+MB9bX1zS6S3bGdHWILgBZirb/YAJy5DS53C17AIjM
	/ActA/xwdcAR3GjsWvIlXQvwUqqw5+FtK8ReUwwLoDvhFnHmo0NyRwrl/1ZP9+aqOigthEvYKo8c6
	qKRJEZP10qdoHeU8hKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7MU-00000003RN4-45E9;
	Thu, 02 Jul 2026 02:41:10 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7MS-00000003RMg-3VOI
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 02:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1782960069; x=1814496069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nme8sDk+qKnn9KhSg6pks9OQW5XRewRrbivBB4oh/sc=;
  b=Rh3iNr7M0uofeVohhZmQ6dztXEDnmH3D79Hywr98VOMNPEGNzTDhIktA
   HJSu9pp3LbVi5E2NbmUV7P9hiGq0Mbghs+AJfr1Mi1FOnh6TafchI9GXE
   ypjWtnXoRXtGxhcNi5f22M6sxDsX9lrQA9TfohnX3zM5Zkro/INGPvW6v
   0=;
X-CSE-ConnectionGUID: 12BUoN3MQhiir6pJ/KxZmw==
X-CSE-MsgGUID: 89RQFFwvTLCOybx0yo8jvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="149902213"
X-IronPort-AV: E=Sophos;i="6.25,142,1779141600"; 
   d="scan'208";a="149902213"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:41:07 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 2 Jul
 2026 04:41:06 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE815.infineon.com
 (172.23.29.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 2 Jul
 2026 04:41:05 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.043; Thu, 2 Jul 2026 04:41:05 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <Ronan.Dalton@alliedtelesis.co.nz>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <pratyush@kernel.org>,
	<linux-kernel@vger.kernel.org>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <mwalle@kernel.org>,
	<Aryan.Srivastava@alliedtelesis.co.nz>, <Chris.Packham@alliedtelesis.co.nz>
Subject: RE: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRKBdcAN9mfv+k6bdaeZDwvjfLZWt11QgADFb4CAAFitgP//+/8AgACbEMCAAOoHAIAAKPSA
Date: Thu, 2 Jul 2026 02:41:05 +0000
Message-ID: <99731a393e5649e692afe57f59d5926b@infineon.com>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
	 <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
	 <490fc98b2996487fba3abd62176bb1dd@infineon.com>
 <8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz>
In-Reply-To: <8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_194109_193357_15D3A9DE 
X-CRM114-Status: GOOD (  11.76  )
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

Hi Ronan,
 
> Hi Takahiro,
> 
> On Wed, 2026-07-01 at 09:49 +0000, Takahiro.Kuwano@infineon.com wrote:
> >
> > I didn't mean any kernel features, but we can dump tmpfs contents
> > from/to FRAM chip (exposed as NVMEM device) by 'dd'. Doesn't it meet
> > your system's requirement?
> 
> Do you mean something like creating a tmpfs and then say, using `tar`
> and copying the data to nvmem with dd and restoring this data at boot?

Yes, I meant something like that (sorry, my comment was still not clear).
Hope that's worth considering.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
