Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eFpp-0006Na-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 12:57:13 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13eFpn-0006NU-00
	for mtd@infradead.org; Wed, 27 Sep 2000 12:57:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39D1DB9E.D1BAA64E@auriga.ru> 
References: <39D1DB9E.D1BAA64E@auriga.ru>  <39D091DC.3218DE2D@cotw.com> <21835.969974378@passion.cygnus.co.uk> 
To: Nick <nick@auriga.ru>
Cc: jffs-dev <jffs-dev@axis.com>, mtd <mtd@infradead.org>
Subject: Re: Finalized TODO list for NAND and JFFS... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Sep 2000 12:57:32 +0100
Message-ID: <9974.970055852@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nick@auriga.ru said:
>  By the way, can't we shorten mount time for Intel chips by rewriting
> read routines in such a way that they don't send Read Status Register
> command when chip->status is FL_READY?

Yes - well spotted.

nick@auriga.ru said:
>  So the question, as I can see it, is can we be sure that Status
> Register has 7th bit set when chip->status == FL_READY?

Yes. If that's ever _not_ the case, then consider it a bug in whatever code 
is setting the state to FL_READY.

Please supply either a SSH public key, so I can give you write access to 
CVS, or a patch that I can apply. The former is probably better.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
