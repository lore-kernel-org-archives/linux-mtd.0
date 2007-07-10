Received: from mtagate6.de.ibm.com ([195.212.29.155])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8CkY-000877-EG
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 11:15:19 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id l6AAF7hM539578
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2007 10:15:07 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l6AAF7bq1953978
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2007 12:15:07 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l6AAF75f008275
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2007 12:15:07 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org, haver@ipnet.vnet.ibm.com
Subject: Re: [RFC/PATCH] Ubi-Utils: add compare feature
Date: Tue, 10 Jul 2007 12:14:50 +0200
References: <200707092132.02839.alexs@linux.vnet.ibm.com>
	<1184050337.5944.2.camel@august>
In-Reply-To: <1184050337.5944.2.camel@august>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707101214.50385.alexs@linux.vnet.ibm.com>
Cc: Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frank,

> > +#define COMPARE_BUFFER_SIZE 1024
> 
> I think using the something like 2KiB or even the 128KiB would be nicer.

I've played around with several buffer sizes (1KiB, 2KiB, 4KiB and
128KiB), and to my surprise, there was no performance impact.
I've used a 11MiB pfi file and the comparison always takes 5.5 seconds.
But I will change the value to 2KiB, it at least looks nicer.
 
> > +
> >  static const char copyright [] __unused =
> >         "Copyright (c) International Business Machines Corp., 2006";
> 2007

Done.

Thanks for taking a look.
Alex 
