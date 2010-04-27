Subject: Re: [PATCH] mtd: Extend physmap_of to let the device tree specify
	the parition probe
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
In-Reply-To: <20100412212005.GX15629@obsidianresearch.com>
References: <20100309192756.GC30462@obsidianresearch.com>
	<1270543478.6754.10.camel@localhost>
	<20100412212005.GX15629@obsidianresearch.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 15:53:59 +0300
Message-ID: <1272372839.7750.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-04-12 at 15:20 -0600, Jason Gunthorpe wrote:
> On Tue, Apr 06, 2010 at 11:44:38AM +0300, Artem Bityutskiy wrote:
> > On Tue, 2010-03-09 at 12:27 -0700, Jason Gunthorpe wrote:
> > > This is to support custom partitioning schemes for embedded PPC. To use
> > > define your own mtd_part_parser and then add something like:
> > >    linux,part-probe = "my_probe", "cmdlinepart";
> > > To the board's dts file.
> > > 
> > > If linux,part-probe is not specified then this behaves the same as before.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> > 
> > Taken to my l2-mtd-2.6.git / dunno
> 
> Thanks Artem, not sure what that means? Do you need anything
> additional from me?

This means that this patch will most probably not forgotten by David
Woodhouse. So for nothing is required from you. But if you do not see
your patch in 2.6.35, then you should probably sent a question.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
