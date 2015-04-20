Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkB2N-00041R-V5
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2015 12:42:57 +0000
Date: Mon, 20 Apr 2015 15:42:26 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150420124226.GI5428@tarshish>
References: <20150420045614.GC5428@tarshish>
 <alpine.DEB.2.02.1504201417360.27750@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1504201417360.27750@lnxricardw1.se.axis.com>
Cc: Shawn Guo <shawn.guo@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard,

On Mon, Apr 20, 2015 at 02:19:43PM +0200, Ricard Wanderlof wrote:
> On Mon, 20 Apr 2015, Baruch Siach wrote:
> > I'm trying to get nand_ecclayout right on i.MX25 with the Micron 
> > MT29F8G08ABABA (page size: 4096, oob size: 224). The large OOB size allows 
> > using hardware ecc strength of 8bit per ecc step (512 bytes). The mxc_nand 
> > driver code (get_eccsize()) and the reference manual seems to indicate 
> > that enabling 8 bit ecc mode requires 26 oob bytes per ecc step.
> 
> Note sure if these really is relevant to this thread, but using BCH, 8 bit 
> error correction per 512 byte ECC step requires 13 bytes of ECC codes per 
> ECC step. (Depending on other factors, this will actually fit nicely even 
> in a 64 byte OOB).

The i.MX25 NFC hardware uses Reed-Solomon ECC, according to the documentation, 
and needs 18 ECC bytes per 512 step. But even with 13 bytes per step, you'll 
need at least 104 (13*8) OOB bytes for a 4K page.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
