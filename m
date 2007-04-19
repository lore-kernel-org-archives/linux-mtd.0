Received: from ultra7.eskimo.com ([204.122.16.70])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeUXZ-0001Ze-Ip
	for linux-mtd@lists.infradead.org; Thu, 19 Apr 2007 12:11:06 +0100
Received: from [192.168.1.3] (c-24-22-32-76.hsd1.or.comcast.net [24.22.32.76])
	by ultra7.eskimo.com (8.14.0/8.14.0) with ESMTP id l3JBAxAc002434
	for <linux-mtd@lists.infradead.org>; Thu, 19 Apr 2007 04:11:00 -0700
Subject: Re: Working with Intel 440BX Bios socket & flash parts
From: roger <roger@eskimo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1176977145.10132.33.camel@localhost2.localdomain>
References: <1176977145.10132.33.camel@localhost2.localdomain>
Content-Type: text/plain
Date: Thu, 19 Apr 2007 04:10:48 -0700
Message-Id: <1176981048.10132.45.camel@localhost2.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Addtional Info:


# ftl_check /dev/mtd0
Memory region info:
  Region size = 1024 kb  Erase block size = 1024 kb

No valid erase unit headers!

# ftl_check /dev/mtdblock0 
get info failed: Inappropriate ioctl for device

# ls -alh /dev/mtd*
crwxrwxrwx 1 root root 90, 0 Apr 19 02:53 /dev/mtd0
crw-rw---- 1 root root 90, 1 Apr 19 02:53 /dev/mtd0ro
brw-rw---- 1 root disk 31, 0 Apr 19 02:53 /dev/mtdblock0 



--
Roger
http://www.eskimo.com/~roger/index.html
Key fingerprint = 8977 A252 2623 F567 70CD 1261 640F C963 1005 1D61

Thu Apr 19 04:09:51 PDT 2007
