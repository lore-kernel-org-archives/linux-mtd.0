Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cbAp-0005DN-00
	for mtd-list@infradead.org; Mon, 12 Mar 2001 22:52:19 +0000
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14cbAo-0005DH-00
	for mtd@infradead.org; Mon, 12 Mar 2001 22:52:18 +0000
Message-ID: <3AAD5358.812F6E0@mvista.com>
Date: Mon, 12 Mar 2001 14:53:12 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: erase.c
References: <EADB10BAC266A14A85ECBF8686A73E3108AFC2@kolkrabbi.flaga.is>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Kári Davíðsson wrote:

> Hi,
>
> In the intel chip that we are using here all sectors seem to be locked
> by default.
> So in the erase utility I propose the following patch.
>
> Maybe it is ambigous to do force unlocking of sectors like this.
> Should we maybe have a separate utility to lock/unlock sectors?
>
> K.D.
>
> --- ../mtd/util/erase.c Thu Sep 21 22:00:07 2000
> +++ util/erase.c        Mon Mar 12 14:58:58 2001
> @@ -51,6 +51,12 @@
>                  erase.length, erase.start);
>           fflush(stdout);
>
> +         if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
> +         {
> +                 perror("\nMTD Unlock failure");
> +                 close(Fd);
> +                 return 8;

>
> +                }
>           if (ioctl(Fd,MEMERASE,&erase) != 0)
>               {
>                   perror("\nMTD Erase failure");
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

I have tests for both lock and unlock that can easily become the
utilities if desired.


lock.c: locks num sectors at ofs or all sectors
USAGE: %s <mtd device> <ofs> <num of sectors or -1 for all sectors>

unlock.c: unlocks all sectors since that's what Intel chips do
USAGE: %s <mtd device>

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
