Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HFRn-0002lH-00
	for mtd-list@infradead.org; Wed, 26 Jul 2000 01:53:19 +0100
Received: from sis.com.tw ([203.67.208.2] helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13HFRm-0002lB-00
	for mtd@infradead.org; Wed, 26 Jul 2000 01:53:18 +0100
Message-ID: <397E360F.E799B99E@sis.com.tw>
Date: Wed, 26 Jul 2000 08:51:27 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
CC: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: muti-page-rw.diff follow-up
References: <397E2D5A.DFBB7741@evoserve.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=big5
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

"Rogelio M. Serrano Jr." wrote:
> 
> I hope my modifications doesnt break nftl. I needed modifications to
> make jffs work on the DOC. I am going to do the same to the DOCmil
> driver when I have read through the docs. I have broken the ecc
> functions in the doc2000 driver im afraid. I am fixing it now and I will
> send patches when I am done. The diff is against mtd-snapshot-20000725.
> 

I will try the DoC Mil part. Rogelio, please be careful that the ECC logic
and CDSNIO register should be programmed "as is" in the source I sent to you.
Or it will not work at all.

P.S. there seems to be some small bugs in the DoC Mil driver and I think
I have found the solution. I will send you a patch soon.

P.S. 2. David, did you commit the patch to CVS ??

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
