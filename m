Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14dNh3-0005Xg-00
	for mtd-list@infradead.org; Thu, 15 Mar 2001 02:40:49 +0000
Message-ID: <3AB02C02.6C8A87C8@mvista.com>
Date: Wed, 14 Mar 2001 18:42:10 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>, mtd@infradead.org,
   ahennessy@mvista.com
Subject: Re: cfi_endian.h
References: <EADB10BAC266A14A85ECBF8686A73E3108AFCB@kolkrabbi.flaga.is> <17745.984564921@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> kd@flaga.is said:
> > Why is it not always CFI_HOST_ENDIAN?
>
> The default is CFI_HOST_ENDIAN now. That's probably good enough for almost
> everyone, so it shouldn't be necessary to make it configurable.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

I just tested a board today (SH proc)  that if put in big endian mode
needs CFI_BIG_ENDIAN enabled.   The hardware guys didn't swap the
bytes for us this time :-)

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
