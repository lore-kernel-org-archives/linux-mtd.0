Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11fljt-0002Zm-00
	for mtd@infradead.org; Mon, 25 Oct 1999 16:08:49 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 11fljt-0000r3-00
	for mtd@infradead.org; Mon, 25 Oct 1999 16:08:49 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11fljt-0005J5-00; Mon, 25 Oct 1999 16:08:49 +0100
To: mtd@infradead.org
Subject: mtd-19991025 release.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Oct 1999 16:08:49 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11fljt-0005J5-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've just released the current version of my code. It's got a few bugfixes 
which people had sent me, and I've ported it to the 2.3 kernel.

Although I don't actually remember doing anything significant to the NFTL code,
I've been testing it with M-Systems own drivers, and it seems to interoperate
fairly happily with them now - which means you ought to be able to boot from it
now.

Go play.

	ftp://ftp.linux-mtd.infradead.org/pub/mtd/mtd-19990820.tar.gz



----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
