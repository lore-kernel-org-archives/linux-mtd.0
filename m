Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14dTUD-0006Ov-00
	for mtd-list@infradead.org; Thu, 15 Mar 2001 08:51:57 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14dTUC-0006Op-00
	for mtd@infradead.org; Thu, 15 Mar 2001 08:51:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AB02C02.6C8A87C8@mvista.com> 
References: <3AB02C02.6C8A87C8@mvista.com>  <EADB10BAC266A14A85ECBF8686A73E3108AFCB@kolkrabbi.flaga.is> <17745.984564921@redhat.com> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>,
    mtd@infradead.org
Subject: Re: cfi_endian.h 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Mar 2001 08:51:49 +0000
Message-ID: <14974.984646309@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ahennessy@mvista.com said:
>  I just tested a board today (SH proc)  that if put in big endian mode
> needs CFI_BIG_ENDIAN enabled.   The hardware guys didn't swap the
> bytes for us this time :-) 

heh, ok. But to keep the complexity down for new users, let's hide them all 
behind 'CFI Advanced configuration options' choice, and probably stick the 
interleave/buswidth optimisation options behind it too.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
