Received: from smtp0.libero.it ([193.70.192.33])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAQJc-0000M7-1r
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 05:55:41 -0400
Received: from localhost (172.16.1.83) by smtp0.libero.it (7.0.027-DD01)
	id 40D2BD6001411A37 for linux-mtd@lists.infradead.org;
	Thu, 23 Sep 2004 11:54:47 +0200
Received: from libero.it (172.16.1.109) by smtp3.libero.it (7.0.027-DD01)
	id 40D05CC20083FDD1 for linux-mtd@lists.infradead.org;
	Thu, 23 Sep 2004 11:54:47 +0200
Date: Thu, 23 Sep 2004 11:54:47 +0200
Message-Id: <I4HNJB$733ED100B2A7DCACE394A820AA6E46D2@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "lp4u\@inwind\.it" <lp4u@inwind.it>
To: "MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: NAND detect
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,   
   
I have a s3c2410 board (BAST architecture).   
I have insta=
lled on board a kernel2.4.26 patched and with MTD.   
But the board, at =
boot (OF LINUX), don't detect the NAND (I've 3 NANDs on board: 2 samsung =
 
& 1 STM).   
The MTD detect only NOR Flash.   
   
This is my confi=
guration:   
   
#   
CONFIG_ARM=3Dy   
.....  
.....   
   
Thank=
s. 
 
PS: excuse my imprecision. 
  
  
____________________________=
__________________________  
Linux MTD discussion mailing list  
http:/=
/lists.infradead.org/mailman/listinfo/linux-mtd/  
  
