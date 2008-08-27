Date: Wed, 27 Aug 2008 19:51:42 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Bruce_Leonard@selinc.com
Subject: Re: [PATCH 2/2] Add support for > 2GiB MTD devices
Message-ID: <20080827185142.GE27491@shareable.org>
References: <1219815617.18027.132.camel@sauron>
	<OF5BDBDD21.E5375C78-ON882574B2.0061B127-882574B2.00648B63@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF5BDBDD21.E5375C78-ON882574B2.0061B127-882574B2.00648B63@selinc.com>
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

Bruce_Leonard@selinc.com wrote:
> I'm still reluctant to change size to a 64-bit value.  There's a vague 
> recolection of early conversations on the list that there would be little 
> acceptance for that.  And that probably has to do with the ongoing 
> conversation about ABI changes.  What I could do to eliminate the 
> multiplication is introduce the same concept that the NAND layer uses, 
> shift values.  After all, erasesize should always be a power of 2, making 
> that a power of 2 multiplication which can be done via shifts.  By 
> changing erasesize to erasesize_shift, I'd get something like this:
> 
> return a->num_eraseblocks == 0 ? a->size : a->num_eraseblocks << 
> a->erasesize_shift
> 
> How would that suit you?

Are you sure it's always going to be a power of 2?

What if someone targets a board with 3 chips wired to shared address
and parallel data buses?

Or if someone makes a weird chip?  Or if you can format it in
different ways according to desired ECC level (like you can with CDs)?

If there's ongoing conversation about ABI changes, it sounds like it
would be good for this change to be done together that, instead of
doing this change then changing the ABI _again_ shortly after and
having to support 3 different ABIs in tools instead of 2.

-- Jamie
