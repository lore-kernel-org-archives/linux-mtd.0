Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Q2G7-0001yJ-00
	for <linux-mtd@lists.infradead.org>; Sun, 22 Dec 2002 09:18:55 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H7I00E5DLXUKD@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 22 Dec 2002 10:49:07 +0100 (MET)
Date: Sun, 22 Dec 2002 10:46:24 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Stable MTD + JFFS2 for 2.4.19 kernel
In-reply-to: <PKEDKBLDKFHINBMPOMCHOEBDCHAA.ilanp@galileo.co.il>
To: Ilan Pollak <ilanp@galileo.co.il>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212221046.24606.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <PKEDKBLDKFHINBMPOMCHOEBDCHAA.ilanp@galileo.co.il>
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

On Sunday 22 December 2002 08:37, Ilan Pollak wrote:
> Hi list,
> I've searched for a stable MTD 'release' but all I found was snapshots of
> the daily work done on MTD et al. Is there a *stable* porting for 2.4.19
> kernels ?
As we had a lot of changes in JFFS2 in the last months, I recommend you to 
work with current CVS code. It can be considered as almost stable at the 
moment.
> another thing: If my board has a strata flash, do I need to make a map file
No. You can use the generic mapping driver and define the paritions via kernel 
commandline.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
