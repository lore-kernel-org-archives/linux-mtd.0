Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbgUo-0000ev-SN
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 06:15:04 +0000
Date: Sat, 7 Jul 2018 08:14:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: dwmw2@infradead.org, robert.jarzmik@free.fr,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH 3/3] mtd: rawnand: marvell: add suspend and resume hooks
Message-ID: <20180707081451.7263e09f@bbrezillon>
In-Reply-To: <20180707080713.4ec570df@bbrezillon>
References: <20180706201415.1930-1-daniel@zonque.org>
 <20180706201415.1930-3-daniel@zonque.org>
 <20180706232239.269a8d61@bbrezillon>
 <c7a90dd5-e474-bca4-cd35-c8ccce05edcc@zonque.org>
 <82165d1d-7cfd-28b0-89d6-dbaa24a658d5@zonque.org>
 <20180707080713.4ec570df@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 7 Jul 2018 08:07:13 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hi Daniel,
> 
> On Sat, 7 Jul 2018 00:26:22 +0200
> Daniel Mack <daniel@zonque.org> wrote:
> 
> > On Saturday, July 07, 2018 12:15 AM, Daniel Mack wrote:  
> > > Hi,
> > > 
> > > On 07/06/2018 11:22 PM, Boris Brezillon wrote:    
> > >> On Fri,  6 Jul 2018 22:14:15 +0200
> > >> Daniel Mack <daniel@zonque.org> wrote:
> > >>    
> > >>> This patch restores the suspend and resume hooks that the old driver used
> > >>> to have. Apart from stopping and starting the clocks, the resume callback
> > >>> also nullifies the selected_chip pointer, so the next command that is issued
> > >>> will re-select the chip and thereby restore the timing registers.
> > >>>
> > >>> Without this patch, a PXA3xx based system would cough up an error similar to
> > >>> the one below after resume.
> > >>>
> > >>> [   44.660162] marvell-nfc 43100000.nand-controller: Timeout waiting for  RB signal
> > >>> [   44.671492] ubi0 error: ubi_io_write: error -110 while writing 2048 bytes to PEB 102:38912, written 0 bytes
> > >>> [   44.682887] CPU: 0 PID: 1417 Comm: remote-control Not tainted 4.18.0-rc2+ #344
> > >>> [   44.691197] Hardware name: Marvell PXA3xx (Device Tree Support)
> > >>> [   44.697111] Backtrace:
> > >>> [   44.699593] [<c0106458>] (dump_backtrace) from [<c0106718>] (show_stack+0x18/0x1c)
> > >>> [   44.708931]  r7:00000800 r6:00009800 r5:00000066 r4:c6139000
> > >>> [   44.715833] [<c0106700>] (show_stack) from [<c0678a60>] (dump_stack+0x20/0x28)
> > >>> [   44.724206] [<c0678a40>] (dump_stack) from [<c0456cbc>] (ubi_io_write+0x3d4/0x630)
> > >>> [   44.732925] [<c04568e8>] (ubi_io_write) from [<c0454428>] (ubi_eba_write_leb+0x690/0x6fc)
> > >>> ...
> > >>>
> > >>> Signed-off-by: Daniel Mack <daniel@zonque.org>    
> > >>
> > >> You probably want patch 2 and 3 backported to stable.    
> > > 
> > > Given that nobody has cared so far and the only board that depends on
> > > proper PM that seems to be using this driver has bitrot quite badly in
> > > the past and is undergoing a major rewrite currently, I'm not sure
> > > whether it's worth it really.    
> > 
> > Ah, I only see this now, but patch 2 also fixes a problem with the 
> > .remove() callback of this driver which also blindly grabs ->reg_clk 
> > without further checks.  
> 
> Nope, because the clk framework checks for both ERR and NULL (see
> [1]). I'm definitely not arguing that patch 2 is not needed (actually I
> pushed for this solution when Greg initially added these new clks [2]),
> just that it should not be flagged as stable.
> 
> > 
> > Hence the entire series actually qualifies for stable@ I figure?  
> 
> I'd really prefer to have a single patch go into stable. Patch 1 is
> clearly not a bug fix, and patch 2 is just a dependency of patch 3, so
> let's remove this dependency by either squashing both patches into a
> single one or by reordering the changes.

Forgot to mention that you should also add

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
