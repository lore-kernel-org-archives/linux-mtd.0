Received: from mail.cis.nctu.edu.tw ([140.113.23.5])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E5DmA-0001iZ-FB
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 22:35:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.cis.nctu.edu.tw (8.13.3/8.12.9) with ESMTP id j7H2U0wo084590
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Aug 2005 10:30:00 +0800 (CST)
	(envelope-from is87074@cis.nctu.edu.tw)
From: 8723074 <is87074@cis.nctu.edu.tw>
Received: from mail.cis.nctu.edu.tw ([127.0.0.1])
	by localhost (mail.cis.nctu.edu.tw [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 71275-25 for <linux-mtd@lists.infradead.org>;
	Wed, 17 Aug 2005 10:30:00 +0800 (CST)
Received: from cis.nctu.edu.tw (mail.cis.nctu.edu.tw [140.113.23.5])
	by mail.cis.nctu.edu.tw (8.13.3/8.12.9) with SMTP id j7H2TtUJ084531
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Aug 2005 10:30:00 +0800 (CST)
	(envelope-from is87074@cis.nctu.edu.tw)
Date: Wed, 17 Aug 2005 02:29:55 -0000
To: <linux-mtd@lists.infradead.org>
Message-ID: <twig.1124245795.38458@cis.nctu.edu.tw>
Subject: Questions of NFTL and NAND Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear All,

   I have traced the code of NFTL (NAND Flash Translation Layer), and I  
found that NFTL will write the spare area of NAND flash (OOB data) several 
times. However, I found that there are limited number of partial programming 
in spare area of NAND Flash (described in many specifications of NAND 
Flash). Does the data will write into spare area successfully without a 
erasing? 

Please help me, Thanks!
                                                              Joe
