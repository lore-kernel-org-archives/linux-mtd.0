Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19ywti-0006bY-NT
	for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2003 18:12:22 +0100
Sender: ahennessy@mvista.com
Message-ID: <3F658FFB.AC66C0C9@mvista.com>
Date: Mon, 15 Sep 2003 10:10:03 +0000
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <7vy8wvgnet.fsf@mae.twinsun.com>
	<1063364525.23778.423.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: TX49 NAND supported?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

> On Thu, 2003-09-11 at 12:01 -0700, Junio C Hamano wrote:
> > Does anybody have a working tx4925 NAND driver that can be used
> > with the latest mtd from infradead CVS?  I have located a copy
> > of tx4925ndfmc.c with 2002 timestamp by Toshiba Corporation
> > (GPLv2) but it appears to use an API incompatible with the
> > current one.
>
> At the time I changed the API, I also updated every driver which had
> been submitted to me and put in my CVS tree.
>
> If there are drivers out there from people who couldn't be bothered to
> do that, they broke.
>
> Please complain to the author of the module in question and ask them why
> they didn't let me have a copy.
>
>
> dwmw2
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

I'm in the process of updated tx4925ndfmc.c and tx4938ndfmc.c now.  I will
submit them
soon.   One problem I'm trying to work around is I have had to set and
clear  NAND_CTL_SETWP and
NAND_CTL_CLRWP around the writes.  Since this isn't already in nand.c, it
seems to be
unique to these chips.  I will investigate more to see if I really need to
do this or if I can
move this code into the mapping files.

Alice
