In-Reply-To: <1219815617.18027.132.camel@sauron>
To: dedekind@infradead.org
Subject: Re: [PATCH 2/2] Add support for > 2GiB MTD devices
MIME-Version: 1.0
Message-ID: <OF5BDBDD21.E5375C78-ON882574B2.0061B127-882574B2.00648B63@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 27 Aug 2008 11:18:23 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bruce Leonard <brucle@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

> > +/*
> > + * Inline function for determining the size of the MTD device, 
independant
> > + * of old or new way of doing things.
> > + *
> > + */
> > +static inline u_int64_t device_size(struct mtd_info *a)
> > +{
> > +   return a->num_eraseblocks == 0 ? a->size : a->num_eraseblocks * 
a->erasesize;
> > +}
> 
> I do not think it is a good idea to do multiplication every time we need
> MTD device size. It is unnecessarily large overhead in terms of speed
> and code size.
> 

I'm still reluctant to change size to a 64-bit value.  There's a vague 
recolection of early conversations on the list that there would be little 
acceptance for that.  And that probably has to do with the ongoing 
conversation about ABI changes.  What I could do to eliminate the 
multiplication is introduce the same concept that the NAND layer uses, 
shift values.  After all, erasesize should always be a power of 2, making 
that a power of 2 multiplication which can be done via shifts.  By 
changing erasesize to erasesize_shift, I'd get something like this:

return a->num_eraseblocks == 0 ? a->size : a->num_eraseblocks << 
a->erasesize_shift

How would that suit you?

Bruce
