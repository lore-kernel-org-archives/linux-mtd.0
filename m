Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KGrp-0007Ux-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2001 11:05:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4B0267.8DBE367@ridgerun.com> 
References: <3B4B0267.8DBE367@ridgerun.com>  <01071015225100.01159@ronin> 
To: Steve Kranz <skranz@ridgerun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Help: MTD & SmartMedia 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 11 Jul 2001 11:10:20 +0100
Message-ID: <26755.994846220@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

skranz@ridgerun.com said:
>   Should I use this combination?
>   vfat + MTD + nftl("user") + nand.c("driver")

Using nand.c as the driver is correct. However, the SmartMedia format is 
not NFTL. It looks like there's sufficient information at 
http://www.ssfdc.or.jp/spec/english/ to implement the appropriate 
translation layer code.

--
dwmw2
