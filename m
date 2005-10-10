Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EOzlc-0004Xt-85
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2005 16:40:45 +0100
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9AFclZX018522
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2005 11:38:47 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9AFcl2t096216
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2005 11:38:47 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j9AFcbcw007567
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2005 11:38:37 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <434A2452.3090107@arcom.com>
References: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>
	<43479777.5060309@ru.mvista.com>
	<1128765885.1728.82.camel@tglx.tec.linutronix.de>
	<4347C82A.3060209@ru.mvista.com>  <434A2452.3090107@arcom.com>
Content-Type: text/plain
Date: Mon, 10 Oct 2005 10:38:13 -0500
Message-Id: <1128958693.32503.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nreddy@netenrich.com, tglx@linutronix.de, Vitaly Wool <vwool@ru.mvista.com>,
	linux-mtd@lists.infradead.org
Subject: Re: "Timing issue when we use SPANSION 8MB Flash"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-10-10 at 09:20 +0100, David Vrabel wrote:
> Vitaly Wool wrote:
> > Thomas Gleixner wrote:
> >> Vitaly Wool wrote:
> >>>
> >>> am I right that it's a NOR flash? What's the reason for using JFFS2
> >>> on it then?
> >>
> >> Err, why shouldnt he use JFFS2 on NOR ? Is there a better suited file
> >> system which can handle NOR FLASH?
> >
> > cramfs ;)
> 
> When you can write to cramfs let me know!
> 
> In case you didn't know, JFFS2 (and its predecessor, JFFS) was actually
> originally designed for NOR flash -- NAND support was added later.

And if what you are after is a read-only compressed filesystem, I would
recommend squashfs over cramfs.

josh
