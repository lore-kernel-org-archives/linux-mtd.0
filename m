Received: from www.itv-con.net ([203.125.253.66] helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKuCc-0001nR-6M
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 04:56:02 -0400
Received: from yahoo.com.sg (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id j8T8hefu005707
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 16:43:40 +0800
Message-ID: <433BA93B.80007@yahoo.com.sg>
Date: Thu, 29 Sep 2005 16:43:39 +0800
From: Chen Zhigao <banyan8@yahoo.com.sg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <433B9AF6.6020202@yahoo.com.sg>
	<20050929080244.GE16687@wohnheim.fh-wedel.de>
In-Reply-To: <20050929080244.GE16687@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Wrong CLEANMARKER Position
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:

>On Thu, 29 September 2005 15:42:46 +0800, Chen Zhigao wrote:
>  
>
>>I try to boot my IXP425 board with a JFFS2 root FS on the MTD, into 
>>which I burned two images, "zImage" and "jffs2". I got a lot of messages 
>>regarding wrong CLEANMARKER position during booting, although I can use 
>>the root FS. What's wrong here?
>>    
>>
>
>Cleanmarkers were put every 0x00010000 bytes (64k), block size for
>jffs2 is 128k.  What is the real block size for the flashes?
>
>Jörn
>
>  
>
I think IXP425 flash block size is 128k, because RedBoot asked me to 
start a flash address on multiple of 0x20000 when I burned the images. 
How can I fix the errors?

Thanks,
Zhigao
