Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QCYV-0003Yk-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 18:09:31 +0000
Received: from celeborn.rivendell.insynq.com ([216.174.202.131] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14QCYU-0003Ye-00
	for mtd@infradead.org; Tue, 06 Feb 2001 18:09:30 +0000
Received: from pyramid.insynq.com (pyramid.office.insynq.com [10.2.2.10])
	by celeborn.rivendell.insynq.com (8.9.3/8.8.7) with ESMTP id KAA14278
	for <mtd@infradead.org>; Tue, 6 Feb 2001 10:08:55 -0800
Received: by insynq.com
	via sendmail from stdin
	id <m14QCXk-0016mGC@pyramid.insynq.com> (Debian Smail3.2.0.102)
	for mtd@infradead.org; Tue, 6 Feb 2001 10:08:44 -0800 (PST)
From: "Ian Eure <Ian Eure" <ieure@insynq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14976.15788.166844.107972@pyramid.insynq.com>
Date: Tue, 6 Feb 2001 10:08:44 -0800 (PST)
To: mtd@infradead.org
Cc: 
Subject: Re: NFTL Performance
In-Reply-To: <20010206100044.27105.qmail@web6304.mail.yahoo.com>
References: <20010206100044.27105.qmail@web6304.mail.yahoo.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

i'm seeing about 5.7 seconds to write 1mb. i'm using a 32mb doc2000 on
the isa eval board, with a vanilla 2.4.1 kernel.

a more important problem that i see is that when blocks are being
flushed to the DOC, certain parts of the system (mouse, maybe others) stop
responding until the write is complete.

i think it's caused by DoC_Delay, which is called from
DoC_WaitReady. can someone confirm/deny?

Alessandro Staltari writes:
 > It seems GPL'd NFTL driver is a lot slower than the
 > M-Systems's propietary driver, it takes about 10
 > seconds to sync 1MB of data written to the flash. Does
 > is it confirmed by your experience?
 > 


-- 
 ___________________________________
| Ian Eure - <ieure@insynq.com>     | "You're living in a facist world...
|         -  Developer -            | Freedom is a luxury." -Front Line
|        -  InsynQ, Inc. -          | Assembly, "Digital Tension Dementia"
| Your Internet Utility Company.tm  |________________________________________


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
