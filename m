Received: from www2.levante.de ([212.101.151.130] helo=www.levante.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dd8an-0006H7-Pf
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 11:23:49 -0400
Message-ID: <429C8192.30004@fsforth.de>
Date: Tue, 31 May 2005 17:24:02 +0200
From: Jonas Dietsche <jdietsche@fsforth.de>
MIME-Version: 1.0
To: blair@circumnavnetworks.com
References: <B1091462CF5479489B1D8FE818330D2C80F27E@exchange2003.ad.skymv.com>	
	<429AEC25.4000309@fsforth.de>
	<1117478995.24559.12.camel@blairs-desktop>
In-Reply-To: <1117478995.24559.12.camel@blairs-desktop>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand write problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Blair,

thanks for your help!

>># ./nandwrite --jffs2 /dev/mtd/2 jffs2.img
>>Use -f option to enforce legacy placement on autoplacement enabled mtd 
>>device
> 
> What version of nandwrite (nandwrite -V) do you have? Version 1.30
> supports -f.

> 
>># ./nandwrite -f /dev/mtd/2 jffs2.img
>>./nandwrite: illegal option -- f
>>
>># ./nandwrite -f --jffs2 /dev/mtd/2 jffs2.img
>>./nandwrite: illegal option -- f
>>
>># ./nandwrite -p /dev/mtd/2 jffs2.img
>>this takes a long time until it is finished.
> 
> If your JFFS2 image has any size to it, I would expect it to take some
> time.
> 
>>then I mount it with
>># mount -t jffs2 /dev/mtdblock/2 /mnt/
>>and get a lot of
>>CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
>>
>>Copy the image with nandwrite is the correct and only way? Or is there 
>>another possibility?
> 
> I've seen the CLEANMARKER errors before. How did you create the JFFS2
> partition?
> 
> Check out this thread for a little more detail:
> http://lists.infradead.org/pipermail/linux-mtd/2005-March/012045.html
> 
> Good luck! 
> 
> -blair
> 

-- 
Jonas Dietsche, FS Forth-Systeme GmbH, www.fsforth.de
Kueferstrasse 8, 79206 Breisach, Germany
Phone: +49 (7667) 908 189, FAX +49 (7667) 908 200
