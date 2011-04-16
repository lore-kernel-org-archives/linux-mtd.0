Subject: Re: [PATCH 2/2] mtd: msm_nand: Add initial msm nand driver support.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali Nalajala <mnalajal@codeaurora.org>
In-Reply-To: <4DA96890.2070207@codeaurora.org>
References: <1298940450-27365-1-git-send-email-mnalajal@codeaurora.org>
	<1298940450-27365-2-git-send-email-mnalajal@codeaurora.org>
	<1302861097.3220.12.camel@localhost>  <4DA85B24.50807@codeaurora.org>
	<1302942029.2308.1.camel@koala>  <4DA96890.2070207@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Apr 2011 17:19:50 +0300
Message-ID: <1302963590.2308.9.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dima Zavin <dima@android.com>,
	Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
	linux-mtd@lists.infradead.org,
	Brian Swetland <swetland@google.com>, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Can i export this variable now?

I do not think so, we do not export random variables.

> What is your suggestion?

But I already did provide you suggestions - kill this global variable
completely. I provided the reasons:

1. It is error prone to hide functions behind something which looks like
a constant.
2. Multiple controllers with different base addresses wouldn't work -
your driver has to be able to at least theoretically handle multiple
controllers with different bases.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
