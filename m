Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsZUJ-00022A-HQ
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 11:36:04 +0000
In-Reply-To: <OF4F0E6D3D.15AAB003-ONC1257841.0039EF76-C1257841.003B8AD2@transmode.se>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>
	<OF4F0E6D3D.15AAB003-ONC1257841.0039EF76-C1257841.003B8AD2@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
Message-ID: <OF0FFD2DBC.5843B9BB-ONC1257841.003E2BAB-C1257841.003FB8B7@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 24 Feb 2011 12:36:00 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, stefan.bigler@keymile.com,
	Holger brunck <holger.brunck@keymile.com>,
	=?ISO-8859-15?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>,
	Michael Cashwell <mboards@prograde.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Anders Grafström <grfstrm@users.sourceforge.net> wrote on 2011/02/10 14:21:36:
> >
> > On 2011-02-09 22:59, Michael Cashwell wrote:
> > > On Feb 9, 2011, at 3:13 PM, Joakim Tjernlund wrote:
> > >
> > >> hmm, this sounds similar(from http://www.numonyx.com/Documents/Specification%20Updates/SU-309045_P30.pdf)
> > >>
> > >> 5. W602: erase suspend resume operation
> > >> Problem: P30 product may fail to erase in intensive erase/suspend/resume environments. This is
> > >>        due to an internal firmware issue that is exhibited in certain applications that require at
> > >>       least 3000 to 4000 erase/suspend/resume cycles during the erase of a single block.
> > >> Implication: Customer may see erase failure (SR reports “A0”) during a background erase. This
> > >>                does not damage the device in any way, but data in the block may be disturbed from its
> > >>               original state.
> >
> > I've seen this issue with Intel 28F640J5 chips as well.
> >
> > There's an old thread on it.
> > http://lists.infradead.org/pipermail/linux-mtd/2008-April/021266.html
> >
> > A delay was suggested similar to the one you're experimenting with I think.
> > http://lists.infradead.org/pipermail/linux-mtd/2008-April/021436.html
>
> Been a while but it just occurred to me that you might see something similar as
> Michael.
>
> This program of yours:
>
> static void erase_suspend(unsigned int loops)
> {
>    volatile unsigned int *flash = (unsigned int *)0x41040000;
>    unsigned int i;
>    unsigned int suspends = 0;
>    unsigned int words = 2;
>    unsigned int timeout;
>
>    /* Make sure there's something to erase */
>    for (i = 0; i < 0x10000; i++) {
>       if (flash[i] == 0xffffffff) {
>          flash[i] = 0x00400040;
>          flash[i] = 0;
>          while ((flash[i] & 0x00800080) != 0x00800080);
>       }
>    }
>
>    /* Clear status */
>    flash[0] = 0x00500050;
>
>    /* Erase */
>    flash[0] = 0x00200020;
>    flash[0] = 0x00d000d0;
>
>    while (1) {
>       /* Suspend */
>       flash[0] = 0x00b000b0;
>       flash[0] = 0x00700070;
>       timeout = 100000;
>       while ((flash[0] & 0x00800080) != 0x00800080 && --timeout);
>       if (!timeout)
>          printf("suspend timeout\n");
>       suspends++;
>
>       /* Short delay */
>       for (i = 0; i < 1000; i++);
>
>       /* Resume */
>       flash[0] = 0x00d000d0;
>       flash[0] = 0x00700070;
>
>       /* Erase done ? */
>       if ((flash[0] & 0x00800080) == 0x00800080) {
>          printf("\nstatus %08x\n", flash[0]);
>          break;
>       }
>
>       /* Short delay */
>       for (i = 0; i < loops; i++);
>    }
>
>    /* Read array */
>    flash[0] = 0x00ff00ff;
>
>    /* Show the first 2 failed words */
>    for (i = 0; i < 0x10000; i++) {
>       if (flash[i] != 0xffffffff) {
>          printf("%08x\n", flash[i]);
>          if (--words == 0)
>             break;
>       }
>    }
>
>    printf("%d suspends\n", suspends);
> }
>
> void test_flash_erase_suspend(void)
> {
>    unsigned int loops;
>
>    for (loops = 6000; loops > 2000; loops -= 500) {
>       printf("\n%d loops", loops);
>       erase_suspend(loops);
>    }
> }
>
>
> It produced this output at one occasion:
>
> 6000 loops
> status 00800080
> ffff0000
> ffff0000
> 4783 suspends
> ---------------------
> See the status 00800080 ?
> Looking at the code this should not be possible, right?

ehh, looking at my own post I see that I misread == as !=


> looking closer though it becomes clearer:
>
> if ((flash[0] & 0x00800080) == 0x00800080) {
>    printf("\nstatus %08x\n", flash[0]);
>    break;
> }
> There are two status reads here, one where you test and one where you
> print. I suspect that if you add a dummy status read like Michael need to do:
> stat = flash[0]; /* dummy, will contain garbage sometimes */
> stat = flash[0];
> if ((stat & 0x00800080) == 0x00800080) {
>    printf("\nstatus %08x\n", stat);
>    break;
> }
> You will see an improvement.
>
> Michael, have you made any progress? Can you run Anders program too?
>
>  Jocke
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
