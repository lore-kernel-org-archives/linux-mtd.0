Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JdBg-0008HZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 17:19:52 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6L00384W783D@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 04 Dec 2002 18:49:57 +0100 (MET)
Date: Wed, 04 Dec 2002 18:47:56 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Problem: 51MB partition max size on jffs2
In-reply-to: <0067E3B6-07A9-11D7-937A-000393467F1A@arlut.utexas.edu>
To: Ken Offer <koffer@arlut.utexas.edu>,
 LinuxMTD <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200212041847.56760.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <0067E3B6-07A9-11D7-937A-000393467F1A@arlut.utexas.edu>
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

On Wednesday 04 December 2002 17:54, Ken Offer wrote:
> Hello all,
>
> I've run into a strange problem and I wonder if any of you have seen
> this and perhaps understand it better.
>
> I've got a Toshiba 128MB Smart Card in my embedded system and I wrote a
> custom nand driver to support it.  I have discovered that I cannot
> mount a jffs2 partition larger than 51MB on the card (so at this point
> I have two 51MB partitions and 1 26MB partition).  Trying to mount a
> larger partition yields a less than helpful error message from mount.
> I've tried adding printk statements to the jffs2 code, but none of them
> get hit during the errant mount process.
>
> So... is 51MB a valid jffs2 limitation?  If so, why?
Latest CVS code ?
-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
