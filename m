Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CENxq-0003fR-48
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 04:13:06 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Nicolas Pouillon <nipo@ssji.net>
In-Reply-To: <20041003221827.7bea56fc.nipo@ssji.net>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
	<20041002155505.083d8440.nipo@ssji.net>
	<1096749729.21297.54.camel@thomas>
	<20041003030653.2e0452a7.nipo@ssji.net>
	<1096768161.21297.129.camel@thomas>
	<20041003221827.7bea56fc.nipo@ssji.net>
Content-Type: text/plain
Message-Id: <1096877111.21297.208.camel@thomas>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 10:05:11 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch !
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-10-03 at 22:18, Nicolas Pouillon wrote:
> Unless... Is there some means to access DoC through JTAG ?
> I've seens some pages saying it works, but I'm not too sure it actually
> was speaking of the case I have : A PXA and a M-Sys DoC.

If you can start something like a kernel or a repairtool via JTAG you
should have access.

> > The new code supports the usage of NAND aware
> > filesystems like JFFS2 too. So you don't even need the INFTL stuff, if
> > you must not provide compability with the M-Sys stuff.
> 
> Mh, what is "compatibility with M-Sys stuff" ?

The M-Sys INFTL format.

> > The MTD CVS patch (use patches/patchin.sh) should work with 2.6.7.
> > Hmm, the __iomem related changes are not in 2.6.7. Thats just a simple
> > #define. The code runs on 2.4 too. See compatmac.h
> 
> I'll have a look at it ;)

I really recommend you to use the new code, so ppl. which have such
devices around can help you.

> > > 
> > That's the only one I found on the M-Sys webpage which has a similar
> > type code.
> 
> This is it. Is chip ID 0xa5 ?

Of course not. It's 0x75 :)

Maybe that helps:

> *Interestingly* I got a5ec as the ID for my chip, but this was an 
> incorrect ID.
> the reason I got it was that on the toshiba controller I used, accessing 
> the data register bytewise read every *other* byte, returning ec and 
> garbage (which was  a5 always).
> Using a word access worked as expected and I got the correct id, 75 ec

Is the chip configured for 16-bit interface mode ? 
If yes, there are more tweaks neccecary.

tglx
