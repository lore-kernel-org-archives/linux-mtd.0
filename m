Received: from [213.115.205.20] (helo=gw1.transmode.se)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSd3R-0006dn-5c
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 21:04:38 +0000
In-Reply-To: <Pine.LNX.4.64.1001062048090.26184@lnxricardw.se.axis.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
	<Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
	<a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>
	<Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
	<B125D8217ABC4B43826503DE00A2D44910DFCE341F@SJEXCHCCR01.corp.ad.broadcom.com>
	<OF8A2BBBA0.AB41AC26-ONC12576A2.005C2B63-C12576A2.005D212F@transmode.se>
	<Pine.LNX.4.64.1001062048090.26184@lnxricardw.se.axis.com>
Subject: RE: JFFS2 - speed up while booting
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Message-ID: <OFD9B736EF.C149F307-ONC12576A3.00730471-C12576A3.00734942@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 6 Jan 2010 21:59:13 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux newbie <linux.newbie79@gmail.com>, Darwin Rambo <drambo@broadcom.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof <ricard.wanderlof@axis.com> wrote on 06/01/2010 20:54:58:
>
>
> On Tue, 5 Jan 2010, Joakim Tjernlund wrote:
>
> >> The real reason for the long delay is not the erase time, but the time to
> >> validate that the erase actually worked and that all the data is 0xff.
> >> If you comment out the jffs2_block_check_erase function below
> >> as shown, then in my case, the 4.5 minute pdflush delay dropped to 2-3
> >> seconds! I was using a 16Gbit large page flash for this test.
> >
> > Ah, that make sense. Some new NOR parts form Numonyx has a new CFI command,
> > Blank Check, that indicates if it is all ones or not. That could be handy
> > to use in this case. You could even use that instead of erasing empty
> > block because they miss a clean marker.
>
> It is my understanding that the reason the blocks are erased when no
> cleanmarker is found, is that a potentially uncompleted previous erase may
> have left the block in an appearantly erased state, making future
> programming unreliable unless the block is erased properly. So the blocks
> would still have to be erased, but of course the checking function (which
> seems to be the main reason for the delay) could be considerably
> optimized.

I know but from a quick reading of the blank check feature, you don't have to.
The blank check is reliable w.r.t power loss and such. Seems like it
was designed for this purpose.

 Jocke
