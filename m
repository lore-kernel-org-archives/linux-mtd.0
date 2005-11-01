Received: from greyhound.i3micro.com ([217.78.42.12] helo=mail.i3micro.net)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWyPJ-00046Z-8s
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2005 10:50:45 -0500
From: Leif Lindholm <leif.lindholm@i3micro.com>
To: Sergei Shtylylov <sshtylyov@ru.mvista.com>
In-Reply-To: <436789E3.6010706@ru.mvista.com>
References: <4363DF17.6080906@ru.mvista.com>
	<1130745519.12171.93.camel@localhost.localdomain>
	<1130769581.6003.43.camel@localhost>
	<1130774403.12171.111.camel@localhost.localdomain>
	<1130856543.16267.38.camel@localhost> <436789E3.6010706@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 01 Nov 2005 16:50:39 +0100
Message-Id: <1130860239.16267.62.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-11-01 at 18:29 +0300, Sergei Shtylylov wrote:
> > Attached is an incremental patch on top of Sergeys latest patch
> > (yesterday). Is that's ok, or should I do the same for the old one?
> 
>     Alas, I have to NAK your patch.

Ok.

>     Note, that with NAND_CMD_READID page_addr of -1 is always passed (so we 
> only write out the 1-byte column address) on the address phase, and we just 
> won't get there for READID command....

>     Therefore, neither -CE wil be overridden nor local_irq_save() be executed 
> for READID case...

Well, I guess I cheated a bit.

In the more well-tested version of the driver (using your older patch),
I actually do the force-assert for (column != -1) as well.

When doing the merge here, I must have messed up something while testing
and out of pure confusion decided that I didn't have to include that
part.

> > +	if (ce_override) {
> >  		/* Apply a short delay always to ensure that we do wait tWB. */
> >  		ndelay(100);
> >  		/* Wait for a chip to become ready... */
> > @@ -442,6 +431,19 @@ static void au1550_command(struct mtd_in
> >  		local_irq_restore(flags);
> 
>     ... and later you get the CPU flags corrupted.

Oops...
See above.

>     Has your READID problem arisen with or without my patch?

Your patch fixed the problem of a collision with the NOR flash.
But only after I added the READID force-assert. Before that it caused
the NAND chip to stop being detected.

regards
	/
		Leif
