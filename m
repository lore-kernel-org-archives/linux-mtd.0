Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOZh6-0002WS-Hy
 for linux-mtd@lists.infradead.org; Mon, 01 Sep 2014 22:03:25 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by gateway2.nyi.internal (Postfix) with ESMTP id 6589E202E9
 for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2014 18:02:59 -0400 (EDT)
Date: Mon, 1 Sep 2014 15:02:58 -0700
From: Greg KH <greg@kroah.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: Ubi patch proposition for 3.10.y
Message-ID: <20140901220258.GA28791@kroah.com>
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
 <5404EA4F.1040508@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5404EA4F.1040508@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 jean-philippe francois <jp.francois@cynove.com>, stable@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 01, 2014 at 11:51:11PM +0200, Richard Weinberger wrote:
> Am 29.08.2014 14:26, schrieb jean-philippe francois:
> > I think commit 4b3e0a25... [1] (UBI: Call scan_all() with correct
> > offset in error case) should be added to 3.10.y stable branch.
> > 
> > It solves an ubifs corruption problem on my board. Edited bootlog for
> > each case are attached.
> > 
> > ubifs corruption can be easily reproduced on this board :
> > 1) format nand partition and flash rootfs
> > 2) record h264 stream on nand
> > 3) scp a file from host pc to rootfs while 2 is ongoing
> > 4) unplug power
> 
> Hmm, I think this is a good point to bite the bullet and backport all
> UBI fastmap related fixes to -stable.

And what exactly would those commits be?

thanks,

greg k-h
