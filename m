Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RdNL-0000Io-00
	for mtd-list@infradead.org; Wed, 23 Aug 2000 17:27:39 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13RdNK-0000Ii-00
	for mtd@infradead.org; Wed, 23 Aug 2000 17:27:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0008231742100.18491-100000@vvv.axis.se> 
References: <Pine.LNX.4.21.0008231742100.18491-100000@vvv.axis.se> 
To: =?ISO-8859-1?Q?Finn_H=E5kansson?= <finn@axis.com>
Cc: mtd@infradead.org, jffs-dev@axis.com,
  =?ISO-8859-1?Q?Simon_K=E5gstr=F6m?= <simonk@axis.com>,
  Per Knudsen <pk@axis.com>, Anders Laurin <andersl@axis.com>
Subject: Re: JFFS proc file system hierarchy 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 23 Aug 2000 17:27:34 +0100
Message-ID: <27593.967048054@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


finn@axis.com said:
> I have added some code that lets us monitor a mounted JFFS file system
> via the proc file system.

Excellent - I was wishing for something like this only yesterday ;)


finn@axis.com said:
>  I haven't compiled the MTD sources with these new changes but I am
> sure there are some things one have to tweak in order to be able to
> compile it.

Yeah - but it doesn't look like a lot is needed. I'll poke at it tomorrow.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
