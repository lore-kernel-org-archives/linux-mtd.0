Received: from tanthi.amplewave.com ([164.164.94.19] helo=tanthi.teneoris.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AkKtg-0000oi-I0
	for linux-mtd@lists.infradead.org; Sat, 24 Jan 2004 10:20:13 +0000
Received: from anche.teneoris.com (anche.teneoris.com [192.168.1.10])
	by tanthi.teneoris.com (8.12.5/8.12.5) with ESMTP id i0OBKf7A000798
	for <linux-mtd@lists.infradead.org>; Sat, 24 Jan 2004 16:50:41 +0530
Received: from [192.168.1.147] ([192.168.1.147])
	by anche.teneoris.com (8.12.8/8.12.8) with ESMTP id i0OAKL04019605
	for <linux-mtd@lists.infradead.org>; Sat, 24 Jan 2004 15:50:21 +0530
From: "Shailesh P. Shirali" <shailesh@teneoris.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1074939438.2382.16.camel@shailesh.amplewave.com>
Mime-Version: 1.0
Date: 24 Jan 2004 15:47:18 +0530
Content-Transfer-Encoding: 7bit
Subject: mtd partitions in user space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello,
      My user-space application needs to know the
partition table as in contents /proc/mtd. Can I 
achieve this through ioctls...basically want to avoid 
parsing the /proc/mtd file itself.
    pls give me some pointers on this

thanks
Shailesh P Shirali   
 
    
