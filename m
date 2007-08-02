Date: Thu, 2 Aug 2007 08:03:49 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Unlocking with Intel J3 series flash
Message-ID: <20070802120349.GB1645@marvin.netwinder.org>
References: <20070731153547.GA24705@marvin.netwinder.org>
	<20070731162331.GA31821@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070731162331.GA31821@fluff.org.uk>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 31, 2007 at 05:23:31PM +0100, Ben Dooks wrote:
> 
> My solution, which I can post the patch for, is to check the lock
> status of the page before trying to unlock the device.
> 
> | 2621-rc6-trizeps2-mtd-chip-unlock-check2.patch

I have tested this and it "works for me", thanks!

> | Note, we make the assumption that all flashes return the correct
> | sector status, and that there is no need to force an lock or
> | unlock if the status is the same as the chip is reporting.

That is indeed a bit of departure from previous way that unlock/lock
commands worked.  And I suspect its enough reason for this patch to
not be accepted into mainline.  Then again, there are bound to be a
whole lot of J3 flash parts out there.

So, can this patch be merged, and if not, what needs to be done to
make it acceptible?

-R
