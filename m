Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F02AE7FDF3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOAqyyUhyM9P+9rQbiurg/ZfdEryDsKqAw0J5jWQGqs=; b=u89t6YuLahg36a
	8kW1qWqL71veS2C7+nWlKLN9Z0dqCoSfPOCcFDckOBThXRQlax7GOCieJrQyaBR0hI29gUocgDZxm
	puB6yvx1khDFd0VdJfSZYNHC6g0vqAlgNUKQ8zoLRMjJ2UkEMfxT0dzFcJ5ddN6IA2A5v94rlagFO
	bKgjDi/5z5iQ/hEm0bHqhjOYZHDItxn3IqhhKiFjJat2+g6iUtDUmkS4J6fNxiyWY+9KplAO1yUyu
	BJN59l8Sc6radiVdap5jhCat7sgccoV9ze30Zw1jjVomOpTCYWze35o2CQJefe6hO6WNQbOF9qfVX
	UZZdlRj4MkRCrWC7WMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn52W-00000005qBn-1maQ;
	Tue, 03 Feb 2026 01:17:12 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn52S-00000005qBN-26sw
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 01:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770081428; x=1801617428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HNtWE7lfa7cYgegSDE0YZ/eZHLbb1ZVDQoR2C5J37y8=;
  b=EyhAXlew826AQLUw9TIEcE879wxvrtGhD+iShJ8/md8Bh2xR9pckvA1g
   abEI/7ntPdoLpy7VfJYL8ZL7QRUTZhzE6bk0c4KZuXikxmSBhrzXA/0NE
   RkidwDMiwZ2MIfgbs73uPbxms4zHMtp72V8Uv9461car4CUYW3UJhqwY7
   YYrOIlkuh3pCGp2/nabzOia/agjNju8qNtYQV8whXZQswJsFmNohJqvmg
   Sixbe3x51BOiedY7U5Rmx5utKOihZ73Woq+W2geLwcpeWTu8uXYMOeTqZ
   t6C/L7AOaAEPWWvFobJtcXPGQl5VugddzIu4llkVobZDaMdOzwZCpCJes
   w==;
X-CSE-ConnectionGUID: m3iD+puVSAmmeonbddqISg==
X-CSE-MsgGUID: 0PoeMTTgTkWEIeiqXT0naA==
X-IronPort-AV: E=Sophos;i="6.21,269,1763424000"; 
   d="scan'208";a="12148779"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:17:05 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:30607]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.153:2525] with esmtp (Farcaster)
 id 1d855486-4d88-494b-8136-ae1d265fa9d6; Tue, 3 Feb 2026 01:17:04 +0000 (UTC)
X-Farcaster-Flow-ID: 1d855486-4d88-494b-8136-ae1d265fa9d6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Tue, 3 Feb 2026 01:17:01 +0000
Received: from 842f574e803f.amazon.com (10.135.226.7) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Tue, 3 Feb 2026 01:17:00 +0000
From: David LaPorte <dalaport@amazon.com>
To: <mikhail.kshevetskiy@iopsys.eu>
CC: <chengminglin@mxic.com.tw>, <dalaport@amazon.com>, <gunnarku@amazon.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>, <mmkurbanov@salutedevices.com>,
	<pratyush@kernel.org>, <richard@nod.at>, <tudor.ambarus@linaro.org>,
	<vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Disable continuous read during probe
Date: Mon, 2 Feb 2026 17:16:54 -0800
Message-ID: <20260203011654.95100-1-dalaport@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <9e5408bc-3209-4a55-9640-e5985b6faf08@iopsys.eu>
References: <9e5408bc-3209-4a55-9640-e5985b6faf08@iopsys.eu>
MIME-Version: 1.0
X-Originating-IP: [10.135.226.7]
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_171708_629166_5A233141 
X-CRM114-Status: UNSURE (   5.85  )
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

On Thu, Jan 30, 2026 at 02:21:30PM +0000, Mikhail Kshevetskiy wrote:
> Could you submit the same to u-boot?

Yes, I'll prepare a patch for u-boot as well.

Thanks,
David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
