Received: from msr88.hinet.net ([168.95.4.188] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cNuo-0000x0-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 11:19:43 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration 
Date: Wed, 7 Aug 2002 18:19:08 +0800
Message-ID: <002f01c23dfb$dea583f0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <32129.1028714730@redhat.com>
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

> > JFFS2 on NOR type flash does not use buffering, OOB check and bad 
> > block management, but it can be used now. I meant that 
> > CONFIG_JFFS2_FS_NAND is not defined, maybe the driver still 
> can work, 
> > but it is not good as the original one.
> 
> JFFS2 cannot work on NAND flash without the extra code enabled by 
> CONFIG_JFFS2_FS_NAND. You need to batch writes into 
> page-sized chunks and 
> use ECC. It looks like you have enabled CONFIG_JFFS2_FS_NAND 
> in the log you 
> show -- is that correct?
> 

Yes, I enable CONFIG_JFFS2_FS_NAND. I follow
http://www.linux-mtd.infradead.org/tech/nand.html to config the
settings. Can I do not care ECC on NAND flash?

Steve Tsai
