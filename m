Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a08sE-0000ok-Oy
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 14:10:43 +0000
Received: by wmuu63 with SMTP id u63so7188808wmu.0
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2015 06:10:21 -0800 (PST)
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Mark Brown <broonie@kernel.org>, Martin Sperl <martin@sperl.org>
References: <564CEB61.2000601@gmail.com>
 <20151118215755.GL31303@sirena.org.uk> <564D0098.4030107@gmail.com>
 <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <56507B3B.4080608@gmail.com>
Date: Sat, 21 Nov 2015 15:10:03 +0100
MIME-Version: 1.0
In-Reply-To: <20151121134946.GI26072@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.11.2015 um 14:49 schrieb Mark Brown:
> On Fri, Nov 20, 2015 at 01:56:13PM +0100, Martin Sperl wrote:
> 
>>> Every line of code that's in a driver that could be in the core is a
>>> maintainence burden, people will want to start doing things like
>>> combining functions in fun ways and if we want to try to do things like
>>> figure out if we can coalesce adjacent transfers in the core (which we
>>> really ought to) it won't know what the limitations that exist are.
> 
>> this “colaesce” of transfers into one could be one of those 
>> “transformation” I am talking about - and this one would be implemented
>> in core making certain assumptions (like starting on a page, ...)
> 
> Why would we want to force that assumption?  It massively reduces the
> utility for DMA controllers that don't have such limitations.
> 
>>>> I wonder if such a variant-construct does not create more headaches in
>>>> the long run as each spi_driver wanting to do something “something”
>>>> special would then need to get updated for any additional constraint…
> 
>>> I'm sorry but I don't understand what you mean here.  However we
>>> implement things anything that wants to know about constraints is going
>>> to need to be updated to use them.
> 
>> That is what I want to avoid if possible - the one thing that may come
>> handy (at least from my perspective) could be to give some hints to
>> make optimal use of the HW
>> Say:
>> * preferred alignment on X byte boundry
>> * preferred max spi_transfer.length
> 
>> All the other possible constraints parameters should be opaque to 
>> a spi_device driver, so I would not want to include those inside the
>> spi_master structure, as _then_ these get used.
> 
> You're conflating two unrelated design decisions here.  Yes, it's
> unfortunate that the SPI API was written to allow client drivers to see
> the master structure but that doesn't mean that converting data into
> code is a good idea, that's still a bad pattern independently of the
> visibility issue.
> 
Currently the only (?) way for a protocol driver like spi-nor to get
info about HW restrictions described in the controller driver
is via the master structure and its "constraint" members.

As you say this visibility of the master structure is unfortunate:
What could be a (maybe long-term) better way to propagate restrictions
that can't be handled transparently in the core like max message size
and SPI NOR to protocol drivers?

>> Also the “restrictions” on the spi HW need to get defined inside the
>> driver, so there will not be a new “restriction” that applies to
>> an existing piece of HW just because we incorporate new options.
> 
> That's what I was saying?
> 
