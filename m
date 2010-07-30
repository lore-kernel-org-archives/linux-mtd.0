Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeiqB-0003oK-GZ
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 06:13:08 +0000
Received: by ewy9 with SMTP id 9so598521ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jul 2010 23:13:05 -0700 (PDT)
Subject: Re: [PATCH 1/6] mtd: denali.c: clean up all the whitespace in the
	end of some lines
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
In-Reply-To: <5D8008F58939784290FAB48F549751981D4E9692B6@shsmsx502.ccr.corp.intel.com>
References: <5D8008F58939784290FAB48F549751981D4E9692B6@shsmsx502.ccr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jul 2010 09:13:02 +0300
Message-Id: <1280470382.2838.7.camel@localhost.localdomain>
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

On Tue, 2010-07-27 at 11:58 +0800, Dong, Chuanxiao wrote:
> From 40023e3079bd84dc5437f2d59dc512d864c72837 Mon Sep 17 00:00:00 2001
> From: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Date: Mon, 26 Jul 2010 16:39:53 +0800
> Subject: [PATCH 1/6] mtd: denali.c: clean up all the whitespace in the end of some lines
> 
> Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>

I cannot apply this. Could you please:

1. create patches against my l2-mtd-2.6 tree:
   git://git.infradead.org/users/dedekind/l2-mtd-2.6.git
2. Do not send your patches to the mainling list, send them to yourself,
   then save, and try to apply with 'git am'
3. And only if that worked, send them to the mailing list.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
