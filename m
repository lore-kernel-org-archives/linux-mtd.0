Received: from msr64.hinet.net ([168.95.4.164] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AlXC-0000b0-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 06:53:10 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: FW: Zlib compress 
Date: Thu, 23 May 2002 13:52:53 +0800
Message-ID: <000201c2021e$159843d0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <30199.1022072805@redhat.com>
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

I replace zlib.c and I can read the file now. 
I only replace datum = *(__u16*)buf with datum =
get_unaligned((__u16*)buf) in cfi_amdstd_write funtion. Is is enough? I
read the discussion about alignment trap and mtd in armlinux mail list,
and it seems that I should modify more codes. 

Steve Tsai



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



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
