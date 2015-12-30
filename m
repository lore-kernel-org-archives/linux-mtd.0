Received: from mail-yk0-x22d.google.com ([2607:f8b0:4002:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEJzD-0005pT-0U
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 16:52:31 +0000
Received: by mail-yk0-x22d.google.com with SMTP id k129so137365222yke.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Dec 2015 08:52:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56840911.7080404@ti.com>
References: <5683E5CC.6020008@ti.com> <20151230154055.662b4df8@bbrezillon>
 <5683F960.90901@ti.com> <20151230170207.45e7fb01@bbrezillon>
 <56840911.7080404@ti.com>
Date: Wed, 30 Dec 2015 08:52:09 -0800
Message-ID: <CALupW3BqcfHJWYBPjQJr-tBhPZNxSWWBouBF31UY2Cc=h9vwfA@mail.gmail.com>
Subject: Re: Testing generic empty page bit flips recovery
From: Steve deRosier <derosier@gmail.com>
To: "Franklin S Cooper Jr." <fcooper@ti.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 30, 2015 at 8:40 AM, Franklin S Cooper Jr. <fcooper@ti.com> wrote:
>
> One thing that confuses me is if I repeatedly call nanddump
> I continue to get the "ECC: 4 corrected bitflips" message
> and the "ECC corrected" count increases by 4 each time. If
> these bits are being corrected which is apparent from
> looking at the output of nanddump shouldn't sequential calls
> indicate that no bitflips needed to be corrected since it
> was corrected previously?
>

Hi Franklin,

I'm making a guess at the source of your confusion, but I've had to
answer this to repeated colleagues recently, so I'll give it a try.

I think you're expecting the "correction" to actually be written and
fixed on-flash. This is not the case.

Bitflip corrections are applied as the flash data is read. Every time.
So once a bit is flipped on the NAND, it will always stay that way on
the physical device until erased and rewritten. Which doesn't happen
for something as minor as a single bit-flip. So from that point on, it
will always read and correct the flip and report it to the kernel log.

UBI will move the data once the threshold gets hit, but up until that
point it will continue to read the same bitflip and correct it.

Hope that helps.

- Steve
