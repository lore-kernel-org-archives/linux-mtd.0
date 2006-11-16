Received: from mail.gdatech.co.in ([202.144.30.226] helo=gdatech.co.in)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkaZn-0006BN-Jk
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 01:18:24 -0500
Received: from [192.168.0.2] (localhost.localdomain [127.0.0.1])
	by predator.gdatech.co.in (Postfix-out) with ESMTP id E72A9878761
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Nov 2006 22:17:42 -0800 (PST)
Received: from gdatech.co.in ([192.168.0.3])
	by [127.0.0.1] ([127.0.0.1]) (port 7027) (Abaca EPG outproxy filter
	1.3.4.5154-maint13 $Rev: 5154 $) id r6bf221742-00-2
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 22:17:42 -0800
Received: from mail.gdatech.co.in (unknown [192.168.0.1])
	by predator.gdatech.co.in (Postfix-out) with ESMTP id B3D8F878760
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Nov 2006 22:17:42 -0800 (PST)
Message-ID: <455C02BC.60801@gdatech.co.in>
Date: Thu, 16 Nov 2006 11:48:36 +0530
From: "s.balamurugan" <s.balamurugan@gdatech.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: problem in writting more than 2k to nand flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello gurus,
 Nand flash size : 256Mb (samsung K9F2G08U0M)
Page size: 2k
Block size:128k.
File system :jffs2        

                  
I have the following problem.
1. after mounting the nand flash, first i have try to copy the  2kb size 
file it was copied. There was no error
2. if i try to copy above 2kb size means it will give  the following errors
                1. mtd-read returned ecc error
               2. Data CRC failed error.
My nand flash size : 256Mb (samsung K9F2G08U0M)
page size: 2k
block size:128k.
File system :jffs2                              Then i have verify my 
dirver, i think there is  no problem in my driver.
                   If i try to wirte 4k file means the nand_write_page() 
was called only once. i don't know where is the problem .
                             Then is start to trace jffs2 coding i that 
i have following problem.
                  1. jffs2_full_dode () : give worng file size.
                  2.__jffs2_flush_wbuf() : buffer size is very low.

            If any one know where is the problem means ,give some idea 
to overcome it        
     by
balamurugan
