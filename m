Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBzg3-000164-TO
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 13:25:00 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j2HIOv9q013360
	for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2005 13:24:57 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j2HIOu5u080096
	for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2005 13:24:56 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j2HIOuWP000754
	for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2005 13:24:56 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Mark A. Greer" <mgreer@mvista.com>
In-Reply-To: <4239C51B.70101@mvista.com>
References: <42323A97.5070105@mvista.com>
	<20050317163526.GB10864@wohnheim.fh-wedel.de>
	<4239C51B.70101@mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 17 Mar 2005 12:24:31 -0600
Message-Id: <1111083871.7610.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Embedded PPC Linux list <linuxppc-embedded@ozlabs.org>
Subject: Re: [PATCH 2.6.12] mtd: Remove MTD map file for Chestnut platform.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-17 at 10:57 -0700, Mark A. Greer wrote:
> Jörn Engel wrote:
> >
> >Applied to mtd cvs.  It will make its way to Linus eventually...
> >
> >Thanks!
> >  
> >
> 
> Jörn,
> 
> Thanks for looking into this but Andrew has already pushed that through 
> from his end.  (I had posted an earler patch with the map removal in it 
> before I broke it out and sent that part to you and the rest to Andrew 
> again.)
> 
> Sorry for wasting your time.

Not a waste of time.  It's been removed from MTD CVS so it doesn't
magically reappear later (or cause headaches when doing a merge).

Jörn meant that the next time the MTD BK tree is synced with Linus,
it'll show up.  If it's already there, then no big deal :).

josh
