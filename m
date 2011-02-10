Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnXuD-0005Fl-Qo
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 14:54:02 +0000
In-Reply-To: <F3D5308D-6A78-4FD9-9FE5-3E9EE0A4EE12@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<4D4AD9ED.8060104@keymile.com>
	<4D4B37D4.4050204@keymile.com>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<F3D5308D-6A78-4FD9-9FE5-3E9EE0A4EE12@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF49420D3D.6DE91ADA-ONC1257833.00519B91-C1257833.0051D8E5@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 10 Feb 2011 15:53:59 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> On Feb 9, 2011, at 3:13 PM, Joakim Tjernlund wrote:
>
> > hmm, this sounds similar(from http://www.numonyx.com/Documents/Specification%20Updates/SU-309045_P30.pdf)
> >
> > 5. W602: erase suspend resume operation
> > Problem: P30 product may fail to erase in intensive erase/suspend/resume environments. This is
> >        due to an internal firmware issue that is exhibited in certain applications that require at
> >       least 3000 to 4000 erase/suspend/resume cycles during the erase of a single block.
> > Implication: Customer may see erase failure (SR reports “A0”) during a background erase. This
> >                does not damage the device in any way, but data in the block may be disturbed from its
> >               original state.
> > Workaround: If such an erase failure occurs, customer should retry the erase with an increase to the
> > Tres (W602) spec from 500uS to 1mS. If the device still fails, continue to increase Tres
> > in increments of 500uS up to a maximum Tres of 2.5mS. Once the failing block passes,
> > subsequent blocks should revert back to original erase algorithm and timing for Tres
> > (500uS typical).
> > Status:
> > June 2008
> > 309045-09
> > This erratum does not apply to material marked with an FPO code dated x806xxxx or
> > later.
>
> Interesting. Thanks for the URL. I'll explore it. I have a 2009 errata sheet but had not seen the 2008 one. (I'm wondering if that's because your's is for a batch of the older 130nm parts which are no longer made. Just guessing.)
>
> It doesn't match exactly, since I'm not seeing erase failures. I'm seeing buffered write failures where, after the 0xd0 Write Confirm command I get back nonsense status. (See the 0xffff reported in my log. I've also seen many values other than 0xffff.)
>
> So the the program operation (0xe8) begins OK, the count and data are written, the confirm command is written but then the status read reads as junk. I'm thinking about adding status-read logs to my buffer if I can do it without disturbing the timing.
>
> The reason that status is nonsense in the status register is only in the lower 8 bits. If it's in read-status mode (which it should be) we should never see any set bits in the upper byte. Because I do see such bits I've suspected from the start that somehow the part is exiting the status-read mode
and returning array-read mode when it should not. (My very first post mentions this suspicion.)
>
> One more log point I think I may check is to count and report the number of suspend/resumes for each erase. It would be interesting to see if some sort of spike in that count correlates with my failures.
>
> More as I find it.

Mike, what if you move the udelay to just before doing erase suspend? Perhaps
you need to increase it a bit.

 Jocke
