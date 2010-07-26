Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdFKx-0000fz-9c
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 04:30:48 +0000
Subject: Re: [PATCH 1/2]  [MTD] nand/denali.c: fixed all checkpatch errors
	in denali.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
In-Reply-To: <5D8008F58939784290FAB48F549751981D10A98E53@shsmsx502.ccr.corp.intel.com>
References: <5D8008F58939784290FAB48F549751981D10A98E53@shsmsx502.ccr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 07:29:56 +0300
Message-ID: <1280118596.14917.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Yuan, Hang" <hang.yuan@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Woodhouse, David" <david.woodhouse@intel.com>, "Gao,
	Yunpeng" <yunpeng.gao@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-22 at 01:32 +0800, Dong, Chuanxiao wrote:
> Hi all
> There are 2 patches to fix checkpatch errors in nand/denali.c and nand/denali.h. Here is the first one.
> So can this patch be accepted or somebody give me some comments? I will be very glad to fix it.
> Thanks for your time to review. Looking forward any response.
> 
> From 9dff702725437433f6412760a9df492be66be6e1 Mon Sep 17 00:00:00 2001
> From: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Date: Thu, 22 Jul 2010 00:53:35 +0800
> Subject: [PATCH 1/2] [MTD] nand/denali.c: fixed checkpatch errors in denali.c
> 
> Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>

This patch is too huge and not reviewable. Please, split it on several
smaller patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
