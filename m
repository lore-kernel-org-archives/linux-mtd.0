Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaOzY-0002NA-7k
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 12:31:05 +0000
From: Marek Vasut <marex@denx.de>
To: Austin Boyle <boyle.austin@gmail.com>
Subject: Re: [PATCH v2] mtd: m25p80: Calculate flash block protect bits based
 on number of sectors
Date: Wed, 16 Apr 2014 14:30:39 +0200
References: <alpine.DEB.2.02.1404062115570.19515@austin-Satellite-L510>
 <201404131924.03967.marex@denx.de>
 <alpine.DEB.2.02.1404162216160.3848@austin-Satellite-L510>
In-Reply-To: <alpine.DEB.2.02.1404162216160.3848@austin-Satellite-L510>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404161430.39384.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 16, 2014 at 02:26:41 PM, Austin Boyle wrote:
> On Sun, 13 Apr 2014, Marek Vasut wrote:
> > This portion of code looks like a duplicate of ...
> > 
> > > +	for (lock_bits = 1; lock_bits < 7; lock_bits++) {
> > > +		protected_area_start = flash->mtd.size -
> > > +					get_protected_area(flash, lock_bits);
> > > +		if (offset+len >= protected_area_start)
> > > +			break;
> > > +	}
> > > +	lock_bits--;
> > > +
> > > +	status_new = (status_old & ~SR_BP_BIT_MASK) |
> > > +			((lock_bits << SR_BP_BIT_OFFSET) & SR_BP_BIT_MASK);
> > 
> > ... this here (if you don't consider the lock_bits--) . Why don't we move
> > this into a separate function to avoid the duplication?
> 
> Thanks for reviewing this patch Marek, your suggestions were very
> helpful. I am about to post another version that
> hopefully addresses the issues raised, I would appreciate if you can take
> another look at it.

Actually, thank _you_ for working on this :)

Best regards,
Marek Vasut
