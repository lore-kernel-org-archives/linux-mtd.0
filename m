Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AVrD-0007pU-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 14:08:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002a01c2017b$682474a0$5501a8c0@synso.com.tw> 
References: <002a01c2017b$682474a0$5501a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: FW: Zlib compress 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 22 May 2002 14:06:45 +0100
Message-ID: <30199.1022072805@redhat.com>
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

startec@ms11.hinet.net said:
>  I can not use alignment trap with SamsungS3C4510 which is a ARM7TDMI
> processor, because ARM7TDMI does not have coprocessor 15 using in
> alignment trap codes. Now I try to use get_unaligned to fix the
> alignment problem in my platform and I can write the file into the
> flash, but when I read the file, I got decompressing error, then
> unalignment exception. How many codes do I need to modify?  

I'm not aware of any related to JFFS2 or MTD other than the ones in the 
flash driver. Did you decode the oops you got? Where was it from?

--
dwmw2
