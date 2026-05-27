Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D69CD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyjsQOInVf+P4p1YCeVh6d3UsMpNX5Gf254n7u4D9lA=; b=2nYdj3A+XBVYob
	YW3Ewfd370+NRzNEE2P5am5ycuAUi4xGhV31QjWY6ydwy9hV4ZY8csi7Dn9VdH/rfTzNOfO5uX2yk
	+Aet1jzflnx0CPSlnzNs5xjWmEanl1E73R7Nl4qN45NlCpBxIxQ0C/JXgpC3sOIn6Pid5UzM3g5Y8
	2LtYJLb1jteVqYt4Vfs4m4uHD19YflD3AsDAHcPynVmKCACHUodVgMivgvN+aonY/iT/VYnqOoDXK
	ixpHtwJdktEsO0IC6mlgQp5eEkbW3gj/17TTrD65Er/odzFGAyXM773nxKrlq3kd9Iq46q/mFTMLq
	AjOJrAFpTSJYoCp/LPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAXu-00000003dge-27HB;
	Wed, 27 May 2026 09:27:26 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAXs-00000003dTV-0Y9a
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1779874044; x=1811410044;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1QolZX3vpOtDkS+faEN64nRFtmlRk8SV0Sox8U8X4QQ=;
  b=jRm2AyLbSszWh2Oyi9y8WJPskImqf5OTRUEnID5/aRTitaXdhU/Bmhad
   E/D7m9PfoCjPKrOpT/mTnXPOKlMqVzMaPAgEDwHaX6Ey3JqH4ByaPilP3
   APBEui3RbeIUXhpEfnyS5TxD3PanvRJ6lo4PwjTqTD5zOJ59v8kJHdSpN
   0=;
X-CSE-ConnectionGUID: iv6mIhyERqyavZC0tEpstQ==
X-CSE-MsgGUID: vyqW5irgTBWRXr1TZG1ttg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="144842842"
X-IronPort-AV: E=Sophos;i="6.24,171,1774306800"; 
   d="scan'208";a="144842842"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 11:25:19 +0200
Received: from MUCSE817.infineon.com (172.23.29.43) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 11:25:18 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE817.infineon.com
 (172.23.29.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 11:25:17 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.037; Wed, 27 May 2026 11:25:17 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <pratyush@kernel.org>, <tkuw584924@gmail.com>
CC: <tudor.ambarus@linaro.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@kernel.org>
Subject: RE: [PATCH RESEND 0/2] mtd: spi-nor: spansion: fix die erase support
Thread-Topic: [PATCH RESEND 0/2] mtd: spi-nor: spansion: fix die erase support
Thread-Index: AQHc6cfrQV9HkP1AY0a27O5cfTaI0rYgKXhXgAF06GA=
Date: Wed, 27 May 2026 09:25:17 +0000
Message-ID: <79c8387432a64960a9433c00f4a6a20c@infineon.com>
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
 <2vxzv7ca4evk.fsf@kernel.org>
In-Reply-To: <2vxzv7ca4evk.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_022724_473562_7391D857 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

Hi Pratyush,

> From: Pratyush Yadav <pratyush@kernel.org>
> Sent: Tuesday, May 26, 2026 7:58 PM
> 
> Hi Takahiro,
> 
> This series is good to go except I can't apply it because the From
> header says "Takahiro Kuwano <tkuw584924@gmail.com>" and the signoff is
> from "Takahiro Kuwano <takahiro.kuwano@infineon.com>". Please fixup the
> commit author email or the signoff email and resend.

Thanks for pointing this out. I have sent v2 with correct author email.

Best Regards,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
