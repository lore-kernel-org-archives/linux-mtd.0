Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14DpKH-0004WB-00
	for mtd-list@infradead.org; Wed, 03 Jan 2001 14:55:41 +0000
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14DpKF-0004W5-00
	for mtd@infradead.org; Wed, 03 Jan 2001 14:55:39 +0000
Received: from m4exch.m4data.co.uk (host2.m4data.co.uk [212.49.209.214] (may be forged))
	by mx0.i-way.net.uk (8.10.2/8.10.2) with ESMTP id f03F7rK24572
	for <mtd@infradead.org>; Wed, 3 Jan 2001 15:07:54 GMT
Message-ID: <52AF3CB987C7D41183CD0090271F67C3010613@m4eng.m4data.co.uk>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "MTD (E-mail)" <mtd@infradead.org>
Subject: Possible problem with unlock bypass in cfi_cmdset_0002.c?
Date: Wed, 3 Jan 2001 14:55:09 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Looking at the code (in cfi_amdstd_write) which turns on the bypass program
mode, it appears that the command is issued without locking the chip first. 

Is this likely to be a problem, if, for example, it is halfway through
issuing the command and then gets interrupted by another thread that
writes/erases another part of the flash chip? It would seem to me that in
this case the bypass command wouldn't be recognised by the device, and the
subsequent 'fast' writes would fail.

Simon



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
