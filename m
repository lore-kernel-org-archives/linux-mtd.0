From: Stefan Roese <sr@denx.de>
To: dedekind@infradead.org
Subject: Re: [PATCH 0/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Thu, 16 Apr 2009 14:52:25 +0200
References: <200904161405.04100.sr@denx.de>
	<1239884344.3390.213.camel@localhost.localdomain>
In-Reply-To: <1239884344.3390.213.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904161452.25393.sr@denx.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org,
	devicetree-discuss <devicetree-discuss@ozlabs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 April 2009, Artem Bityutskiy wrote:
> On Thu, 2009-04-16 at 14:05 +0200, Stefan Roese wrote:
> > This patchset adds support to handle multiple non-identical chips in one
> > flash device tree node. It also adds concat support to physmap_of. This
> > makes it possible to support e.g. the Intel P30 48F4400 chip which
> > internally consists of 2 non-identical NOR chips on one die. Additionally
> > partitions now can span over multiple chips:
> >
> >     mtd: physmap_of: Add multiple regions and concatenation support
> >     mtd/powerpc: Factor out MTD physmap bindings into mtd-physmap.txt
> >     mtd/powerpc: Describe multiple "reg" tuples usage
> >
> > v2 addresses all comments from Grant Likely, including factoring out the
> > MTD dts bindings documentation into a separate file.
> >
> > v3 addresses all comments (again from Grant).
>
> Sorry for my ignorance, but could you please explain why regions
> exists as an MTD concept? Why different regions could not be
> represented as different MTD devices? The benefit is - simplicity.

The result of these multiple "reg" tuples *is* multiple MTD devices. Not sure 
if this explains your comment/question. Please let me know if you still have 
some comments.

Thanks.

Best regards,
Stefan
