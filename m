Received: from mail.iok.net ([62.249.129.22] helo=mail05.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195Mck-0000Np-Vp
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 10:21:07 +0100
Received: from lin01.mn-logistik.de (frdb-d9b967f8.pool.mediaWays.net
	[217.185.103.248])
	by mail05.iok.net (8.12.5/8.12.5) with ESMTP id h3F9LBn5007977
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 11:21:11 +0200
Received: from mnz66.mn-logistik.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-logistik.de (Postfix) with ESMTP id CE5AB1FF32
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Apr 2003 10:51:34 +0200 (CEST)
From: Holger Schurig <h.schurig@mn-logistik.de>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 15 Apr 2003 10:51:34 +0200
References: <20030414230258.A173D155EF@desire.actrix.co.nz>
	<200304151006.51147.esn@cotas.dk>
In-Reply-To: <200304151006.51147.esn@cotas.dk>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304151051.34585.h.schurig@mn-logistik.de>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> into that now.  It has a log system. The most optimal would be if the
> database could be tuned not to write too often and on other hand when it
> does it is flush to flash immediately to prevent datacorruption.

That is simple to find out. sqllite is so small, you surely could add some 
printf() statements at the right place to find out when it writes date.

Hey, even "strace -efile" may help you. "man strace" is your friend.
