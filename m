Received: from ipn36372-d52026.cidr.lightship.net ([216.204.15.186]
	helo=zeus.bittware.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWDUJ-0001hO-Ru
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 16:26:04 +0000
Message-ID: <47CC25BF.4030806@bittware.com>
Date: Mon, 03 Mar 2008 11:22:23 -0500
From: DMcLeod <dmcleod@bittware.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: querying status ?
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    Is there a way to query  the status of MTD devices? We are using mtd 
over a NOR flash device with jffs2 filesystem. At boot time, there are 
occasionally more than one processes accessing the filesystem and one of 
our utilities reads strange values (eg 0xff4fff4f) during bootup. It 
reads this value by dereferencing a pointer to a memory mapped address.. 
eg;

        U32 base = 0x7fc0000;
        memcpy(buff, (void *)base, sizeof(buff));

9 times out of 10, valid data is read using this method. But the other 
time it seems there's some operation keeping us from accessing flash...  
ideally, we'd like to be able to query (and maybe lock) flash during 
this read. Our first thought was to try to fopen /dev/mtdblockX for 
reading, but this does not work.

Thanks in advance,

-- 

Thank you,
Dennis McLeod
Software Engineer
BittWare, Inc
9 Hills Ave
Concord, NH 03301
dmcleod@bittware.com
603 226 0404 x514
