Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14daAn-00009l-00
	for mtd-list@infradead.org; Thu, 15 Mar 2001 16:00:21 +0000
Date: Thu, 15 Mar 2001 11:00:17 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Alice Hennessy <ahennessy@mvista.com>,
        =?iso-8859-1?Q?K=E1ri_Dav=ED=F0sson?= <kd@flaga.is>,
        <mtd@infradead.org>
Subject: Re: cfi_endian.h 
In-Reply-To: <14974.984646309@redhat.com>
Message-ID: <Pine.LNX.4.30.0103151059450.561-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 15 Mar 2001, David Woodhouse wrote:

>
> ahennessy@mvista.com said:
> >  I just tested a board today (SH proc)  that if put in big endian mode
> > needs CFI_BIG_ENDIAN enabled.   The hardware guys didn't swap the
> > bytes for us this time :-)
>
> heh, ok. But to keep the complexity down for new users, let's hide them all
> behind 'CFI Advanced configuration options' choice, and probably stick the
> interleave/buswidth optimisation options behind it too.

Agreed.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
