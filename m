Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9ISl-00010z-MU
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 19:09:44 +0000
Received: by mail-qg0-f52.google.com with SMTP id i50so4077360qgf.11
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 11:09:20 -0800 (PST)
Date: Thu, 8 Jan 2015 11:09:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: NAND ECC capabilities
Message-ID: <20150108190916.GT9759@ld-irv-0074>
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
 <alpine.DEB.2.02.1501080927090.27318@lnxricardw1.se.axis.com>
 <54AEB38D.4030403@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54AEB38D.4030403@vanguardiasur.com.ar>
Cc: Steve deRosier <derosier@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>, Huang Shijie <shijie8@gmail.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 08, 2015 at 01:42:53PM -0300, Ezequiel Garcia wrote:
> On 01/08/2015 05:32 AM, Ricard Wanderlof wrote:
> > On Thu, 8 Jan 2015, Steve deRosier wrote:
> >> Is my general understanding correct?
> > 
> > I'd say yes, but the ECC threshold should be per 512 byte ECC block (which 
> > seems to be the correct term rather than 'sector'), rather than per page. 
> > Are you sure that the threshold is set to 4 (see 
> > /sys/devices/virtual/mtd/mtd<n>/bitflip_threshold )?
> > 
> > Normally the threshold is set below the ECC correction capability, so that 
> > bit scrubbing has a chance to occur before the bits rot too far. Say you 
> > have the threshold set at 4 bits, and you have 3 bits that have flipped. 
> > If another bit flips, the block would be scrubbed, but say that two bits 
> > flipped before you read the data the next time. You would have lost your 
> > chance of recovery, so it makes sense to have the threshold lower than the 
> > ECC capability. I would say 3/4 of the ECC capability would be a 
> > reasonable value.
> > 
> 
> This makes a lot of sense. However, do we have any way of telling if the
> bitflips where produced on the same ECC sector?
> 
> From a cursory look to the code, I'd say there's no such feature with
> the current MTD/NAND design. So, if an mtd_read reports 3 bitflips you
> have no way of telling they happened on the same sector or not, so you
> can't implement your idea.

I'm not sure if I'm misunderstanding you or if you are misunderstanding
the code. Please review Documentation/ABI/testing/sysfs-class-mtd for
the 'bitflip_threshold' description. We only deal with the max # of
bitflips per sector (or block, or whatever you want to call it). No
ECC-related concept is handled on a per-page basis.

So I believe Ricard is accurately describing the current reality, not
"his idea."

Side note: I wonder if we want to change the nand_base defaults so

	bitflip_threshold == 3/4 * ecc_strength

rather than

	bitflip_threshold == ecc_strength

See in nand_scan_tail():

	if (!mtd->bitflip_threshold)
		mtd->bitflip_threshold = mtd->ecc_strength;

Brian
