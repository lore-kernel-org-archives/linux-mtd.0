Received: from mail7.cadvision.com ([207.228.64.92] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16RJMn-0008Ly-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2002 20:42:33 +0000
Message-ID: <002101c19f99$874d7e60$0100007f@localdomain.wni.com.wirelessnetworksinc.com>
From: "Herman Oosthuysen" <Herman@WirelessNetworksInc.com>
To: "dennis noermann" <dennis.noermann@noernet.de>,
        <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.33.0201170137210.18875-100000@chaingun.noernet.de>
Subject: Re: experience with max block erase  
Date: Thu, 17 Jan 2002 13:56:45 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

In practice, your product will probably fail due to some other reason,
before the flash memory will fail, so don't worry too much about it.  For
instance, if the product has a keyboard of sorts, that will almost certainly
fail first and if it has batteries, it will go to the big bit bucket in the
sky even sooner.

100 000 cycles is lot.  You have to erase the chip about ten times per hour
continuously for 100 years to reach that number...
--
Herman Oosthuysen
Herman@WirelessNetworksInc.com
Suite 300, #3016, 5th Ave NE,
Calgary, Alberta, T2A 6K4, Canada
Phone: (403) 569-5688, Fax: (403) 235-3965
----- Original Message -----
From: dennis noermann <dennis.noermann@noernet.de>
To: <linux-mtd@lists.infradead.org>
Sent: Wednesday, January 16, 2002 5:50 PM
Subject: experience with max block erase


> Hi
> i am intrested in testing some Intel Flash
> how much erase cycles it realy can do
>
> does someone has done this before ?
>
> i have some intel strata flash 28F640J3A
>
> "Each block can be independently erased 100,000 times"
>
> is this like the "food expiry date" ore "best before date" ?
> (sorry i dont know the right englisch word , but i think you undertstand
it :) )
>
>
> ore have i to write some eraseprogramm and wait a long time :)
>
> dennis
>
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
