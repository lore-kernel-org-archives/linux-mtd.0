Received: from [202.107.117.26] (helo=smtp.neusoft.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AymO1-000526-VR
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2004 06:31:15 +0000
Received: from Xhyper250RB ([192.168.31.49])
 by smtp2.neusoft.com (iPlanet Messaging Server 5.2 Patch 1 (built Aug 19
 2002)) with ESMTPA id <0HU100G2CGI930@smtp2.neusoft.com> for
 linux-mtd@lists.infradead.org; Thu, 04 Mar 2004 14:25:21 +0800 (CST)
Date: Thu, 04 Mar 2004 14:36:18 +0800
From: "Roy.King" <ruy@neusoft.com>
To: linux-mtd@lists.infradead.org
Message-id: <1078382177.905.26.camel@KING>
MIME-version: 1.0
Content-type: text/plain; charset=gb2312
Content-transfer-encoding: 8BIT
Subject: about samsung nandflash maker id!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a samsung nandflash, connect like that: 

  	D0~D7£º          D0~D7
  	ALE£º            A3
        CLE£º            A2
        #CE£º            #CE6    £¨adds: 0x400000£©
        #WE£º            #WR
        #RE£º            #RD
        Ready£º          K54

and I use mtd nand drivers from uClinux-dist-20030522.
Firstly, I want test the nandflash Maker id and Device id
in nand_scan():
...
...
nand_select(); //just set  *(volatile unsigned char *)0x400004 = 0xff;

*(volatile unsigned char *)0x400004 = 0x90;
*(volatile unsigned char *)0x400008 = 0x0;

nand_maf_id = *(volatile unsigned char *)0x400000;
nand_dev_id = *(volatile unsigned char *)0x400000;
...
...

But, when I print the nand_maf_id and nand_dev_id, they are always 0x41 
and 0x42. according the Manufacture document, the maker id is 0xEC and
 the device id is 0x53. I want know what else I must be done.
thanks!
