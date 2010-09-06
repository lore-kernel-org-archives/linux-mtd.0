Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsUQI-0001jZ-MN
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 05:39:19 +0000
Received: by bwz13 with SMTP id 13so4120473bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 05 Sep 2010 22:39:17 -0700 (PDT)
Subject: RE: [PATCH 1/1]nand/denali: Add runtime pm framework for MRST
	Denali NAND controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
In-Reply-To: <5D8008F58939784290FAB48F54975198278A379469@shsmsx502.ccr.corp.intel.com>
References: <20100826081201.GA11565@intel.com>
	<1283172159.12995.64.camel@brekeke>
	<5D8008F58939784290FAB48F54975198278A379469@shsmsx502.ccr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Sep 2010 08:39:13 +0300
Message-ID: <1283751553.2061.1.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Van De Ven,
	Arjan" <arjan.van.de.ven@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-06 at 10:05 +0800, Dong, Chuanxiao wrote:
> Hi Artem
> Thanks for your comment. Except the DENALI_PM macro problem, do you have any other comment
> about the implement of runtime pm?

No, I did not really review the patch, just looked at it briefly.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
