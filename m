Received: from polonez.inetia.pl ([195.114.161.60])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19eiQk-0002m4-J1
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2003 22:42:50 +0100
Received: from www.n1.pl (www.n1.pl [195.114.173.151])
 by polonez.inetia.pl (Sun Internet Mail Server sims.4.0.1999.06.13.00.20)
 with ESMTP id <0HIE00E299AM4O@polonez.inetia.pl> for
 linux-mtd@lists.infradead.org; Mon, 21 Jul 2003 23:35:10 +0200 (MET DST)
Date: Mon, 21 Jul 2003 23:34:05 +0200
From: andrzej.mialkowski@inetia.pl
In-reply-to: <20030721160453.GA3677@wohnheim.fh-wedel.de>
To: =?iso-8859-2?b?SvZybg==?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <1058823245.3f1c5c4da93b0@imail.internetia.pl>
MIME-version: 1.0
References: <1058792691.3f1be4f31ca98@imail.internetia.pl>
 <20030721160453.GA3677@wohnheim.fh-wedel.de>
Content-type: text/plain; charset=ISO-8859-2
Content-transfer-encoding: 7BIT
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: hardcoded maximum number of CFI chips - continued
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, linked list is nice solution; I would also prefer it while writing a new 
module. 
Problem is that module exist and works pretty well. My priorities are time to 
solution and risk of bug avoidance. You must agree that this is big difference 
between changing number 8 to 10 and rewriting even only module initialization 
to linked lists. 
Compromise solution may be leave runtime structures as they are, and change 
chips table to be 'reallocated' for instance in 4-16 chip increments. This 
solution reduces to reasonable amount of copying and memory allocations (still 
not critical during initialization), supports 'unlimited' number of chips and 
may be implemented and tested in period of few hours. I can do this tomorrow.

Andrzej
