Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sbr0-0004cK-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 09:34:34 +0000
Message-ID: <003701c0959f$411c0d30$0a070d0a@axis.se>
Reply-To: "Johan Adolfsson" <johan.adolfsson@axis.com>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
        "Jonas Holmberg" <jonas.holmberg@axis.com>
Cc: "Johan Adolfsson" <johan.adolfsson@axis.com>, <mtd@infradead.org>
References: <151F3D2AE9F0D3119E480004ACB8EA3701DEC943@cluster01.axis.se>  <10951.982055836@redhat.com>
Subject: Re: Problems with cfi_cmdset_0002.c 
Date: Tue, 13 Feb 2001 10:27:59 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Maybe we need
CONFIG_MTD_IF_ALL_ELSE_FAILS_ASSUME_TOPBOOT
CONFIG_MTD_IF_ALL_ELSE_FAILS_ASSUME_BOTTOMBOOT

:o)

----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
To: Jonas Holmberg <jonashg@axis.com>
Cc: Johan Adolfsson <johana@axis.com>; <mtd@infradead.org>
Sent: Tuesday, February 13, 2001 10:17
Subject: Re: Problems with cfi_cmdset_0002.c


>
> jonas.holmberg@axis.com said:
> > I have two AM29LV160D one top and one bottom boot and the both say
> > bootloc==0 :(
>
> One of these days I really am going to painfully slaughter a hardware
> designer. The engineers at an unnamed company who decided to route the
> PCMCIA socket's interrupt line to a general purpose I/O line on the SH3
CPU
> without any possibility of generating an interrupt were prime targets a
few
> weeks ago. AMD are in that spot now. Strange - the chip manufacturers are
> generally more clueful - it's the monkeys who glue them together who
> usually screw it up (present company excepted :)
>
> Is there _any_ difference between these chips which is detectable without
> actually trying to erase the damn things and observing how much data gets
> removed?
>
> --
> dwmw2
>
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
