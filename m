Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1lIu-00069Q-1B
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 19:30:01 +0000
Received: by bwz19 with SMTP id 19so3277822bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Oct 2010 12:29:10 -0700 (PDT)
Subject: Re: [PATCH 15/18] mtd: Fix endianness issues from device tree
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ian Munsie <imunsie@au1.ibm.com>
In-Reply-To: <1285916771-18033-16-git-send-email-imunsie@au1.ibm.com>
References: <1285916771-18033-1-git-send-email-imunsie@au1.ibm.com>
	<1285916771-18033-16-git-send-email-imunsie@au1.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Oct 2010 22:29:06 +0300
Message-ID: <1285961346.32172.10.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	paulus@samba.org, linux-mtd@lists.infradead.org,
	Sean MacLennan <smaclennan@pikatech.com>,
	Tejun Heo <tj@kernel.org>, Julia Lawall <julia@diku.dk>,
	Steve Deiters <SteveDeiters@basler.com>,
	Anatolij Gustschin <agust@denx.de>, David Woodhouse <dwmw2@infradead.org>,
	"David S. Miller" <davem@davemloft.net>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-01 at 17:06 +1000, Ian Munsie wrote:
> From: Ian Munsie <imunsie@au1.ibm.com>
> 
> This patch adds the appropriate conversions to correct the endianness
> issues in the MTD driver whenever it accesses the device tree (which is
> always big endian).
> 
> Signed-off-by: Ian Munsie <imunsie@au1.ibm.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
