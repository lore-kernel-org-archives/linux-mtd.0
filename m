Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14djT8-0003uC-00
	for mtd-list@infradead.org; Fri, 16 Mar 2001 01:55:54 +0000
Message-ID: <3AB17308.DADE4BA@mvista.com>
Date: Thu, 15 Mar 2001 17:57:28 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>, mtd@infradead.org,
   Nicolas Pitre <nico@cam.org>, ahennessy@mvista.com
Subject: Re: cfi_endian.h
References: <3AB02C02.6C8A87C8@mvista.com>  <EADB10BAC266A14A85ECBF8686A73E3108AFCB@kolkrabbi.flaga.is> <17745.984564921@redhat.com> <14974.984646309@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> ahennessy@mvista.com said:
> >  I just tested a board today (SH proc)  that if put in big endian mode
> > needs CFI_BIG_ENDIAN enabled.   The hardware guys didn't swap the
> > bytes for us this time :-)
>
> heh, ok. But to keep the complexity down for new users, let's hide them all
> behind 'CFI Advanced configuration options' choice, and probably stick the
> interleave/buswidth optimisation options behind it too.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Done.   I created "CFI Advanced configuration options" under CFI, moved the
geometry
selection  under it and added the endianness selection under it as well.

So, a new Config.in and cfi_endian.h

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
