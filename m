Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcBcf-00055z-7p
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 05:48:29 +0000
Received: by fxm1 with SMTP id 1so2156151fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 21:48:21 -0800 (PST)
Subject: Re: [PATCH 1/2] let MTD_XIP depend on XIP_KERNEL or ROMKERNEL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Barry Song <21cnbao@gmail.com>
In-Reply-To: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
References: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 07:48:17 +0200
Message-Id: <1265089697.2517.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-15 at 15:50 +0800, Barry Song wrote:
> Some architectures like blackfin,h8300,m68k use ROMKERNEL to describe
> kernel XIP, not like arm which uses XIP_KERNEL
> 
> Signed-off-by: Barry Song <21cnbao@gmail.com>

I've pushed these 2 patches to my l2-mtd-2.6 / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
