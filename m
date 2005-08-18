Received: from mail.cis.nctu.edu.tw ([140.113.23.5])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E5hhq-0006ZD-1W
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 06:33:10 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.cis.nctu.edu.tw (8.13.3/8.12.9) with ESMTP id j7IAX31e019873
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Aug 2005 18:33:03 +0800 (CST)
	(envelope-from is87074@cis.nctu.edu.tw)
Received: from mail.cis.nctu.edu.tw ([127.0.0.1])
	by localhost (mail.cis.nctu.edu.tw [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 02439-18 for <linux-mtd@lists.infradead.org>;
	Thu, 18 Aug 2005 18:33:02 +0800 (CST)
Received: from mail.cis.nctu.edu.tw (localhost [127.0.0.1])
	by mail.cis.nctu.edu.tw (8.13.3/8.12.9) with ESMTP id j7IAX1M8019827
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Aug 2005 18:33:02 +0800 (CST)
	(envelope-from is87074@cis.nctu.edu.tw)
Received: (from nobody@localhost)
	by mail.cis.nctu.edu.tw (8.13.3/8.12.9/Submit) id j7IAWuxG019727
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 18:32:56 +0800 (CST)
Message-ID: <1124361176.430463d83a722@mail.cis.nctu.edu.tw>
Date: Thu, 18 Aug 2005 18:32:56 +0800
From: 8723074 <is87074@cis.nctu.edu.tw>
To: "" <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=BIG5
Content-Transfer-Encoding: 8bit
Subject: Questions about the NFTL driver of Linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 
     I slightly traced the code of NFTL (in Linux), and I found that NFTL 
will write the spare area of NAND Flash (OOB data) in the same page about 
three times. However, I found that there is a limted number of partial 
programming in spare area in the same page (almost only two times in many NAND 
Flash spec.). Does OOB data be written in spare area successfully without 
erasing? Or this is not a partial programming.

Please help me to clarify this question.
Thank you very much.

Best regards,
                                                                Joe

-------------------------------------------------
交通大學資訊科學系 WebMail https://mail.cis.nctu.edu.tw
