Received: from mo-p05-ob.rzone.de ([81.169.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lthy4-0007aV-23
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 12:42:30 +0000
From: Stefan Roese <sr@denx.de>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/4 v2] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Tue, 14 Apr 2009 14:42:19 +0200
References: <1239093559-12043-1-git-send-email-sr@denx.de>
	<fa686aa40904112258n1cc23b48t80b135b7016e9760@mail.gmail.com>
In-Reply-To: <fa686aa40904112258n1cc23b48t80b135b7016e9760@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904141442.19456.sr@denx.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 12 April 2009, Grant Likely wrote:
> On Tue, Apr 7, 2009 at 2:39 AM, Stefan Roese <sr@denx.de> wrote:
> > This patch adds support to handle multiple non-identical chips in one
> > flash device tree node. It also adds concat support to physmap_of. This
> > makes it possible to support e.g. the Intel P30 48F4400 chips which
> > internally consists of 2 non-identical NOR chips on one die. Additionally
> > partitions now can span over multiple chips.
>
> [...]
>
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > CC: Grant Likely <grant.likely@secretlab.ca>
>
> Looks good to me.  To comments below, but neither are enough to hold back
> my:
>
> Reviewd-by: Grant Likely <grant.likely@secretlab.ca>

Thanks.

> However, I have not tested this.  I'd like to hear of some larger
> field testing before it is merged.

OK, I'll address your latest comments and resend a (hopefully) last version of 
this patchset.

Thanks.

Stefan
