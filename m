Received: from fmr20.intel.com ([134.134.136.19] helo=orsfmr005.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQMRe-00064L-Gw
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2005 11:05:51 +0100
From: "zhao, forrest" <forrest.zhao@intel.com>
To: z xw <zxwitsme@hotmail.com>
In-Reply-To: <BAY14-F27BE6C869E203D2FA57691DC7A0@phx.gbl>
References: <BAY14-F27BE6C869E203D2FA57691DC7A0@phx.gbl>
Content-Type: text/plain
Date: Fri, 14 Oct 2005 13:53:20 +0800
Message-Id: <1129269200.20274.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: About nand flash mtd block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> The mtd4 is the nand flash I added. But I can't find the device file in 
> /dev/mtdblock/
> The device file only 0,1,2,3.there is no device file for nand flash.
> Anybody have met such a problem? Any reply is welcome.
> Great appreciation to you help.
> 
I think you could manually create the device file 4 under /dev/mtdblock
by "mknod". Then you can proceed with /dev/mtdblock/4 as normal.......

Thanks,
Forrest
