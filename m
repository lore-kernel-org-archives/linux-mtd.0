Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTNTl-0002eI-M6
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 08:51:55 +0000
From: Richard Weinberger <richard@nod.at>
To: Greg KH <greg@kroah.com>
Cc: Martin Kepplinger <martin.kepplinger@ginzinger.com>, stable@vger.kernel.org,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Juergen <juergen.lachmann@harman.com>
Subject: Re: [PATCH] ubi: fastmap: Check each mapping only once
Date: Sun, 02 Dec 2018 09:51:34 +0100
Message-ID: <1676802.TThbbZSlzy@blindfold>
In-Reply-To: <20181129080923.GE13859@kroah.com>
References: <20181126103842.3249-1-martin.kepplinger@ginzinger.com>
 <20181129080923.GE13859@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greg,

Am Donnerstag, 29. November 2018, 09:09:23 CET schrieb Greg KH:
> On Mon, Nov 26, 2018 at 11:38:42AM +0100, Martin Kepplinger wrote:
> > From: Richard Weinberger <richard@nod.at>
> > 
> > [ Upstream commit 34653fd8c46e771585fce5975e4243f8fd401914 ]
> > 
> > This commit got merged along with commit 781932375ffc
> > ("ubi: fastmap: Correctly handle interrupted erasures in EBA") upstream but
> > only the latter has been applied to stable v4.14.54 as commit a23cf10d9abb.
> > This resulted in a performance regression. Startup on i.MX platforms is
> > delayed for up to a few seconds depending on the platform.
> > This fixes ubi fastmap to be of the same performance as it has been before
> > said fastmap changes.
> > 
> > Fixes: a23cf10d9abb ("ubi: fastmap: Correctly handle interrupted erasures in EBA")
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> > ---
> > 
> > Richard, although this fixes a major slowdown regression in -stable, do you
> > consider this "stable" too?
> > 
> > This applies and is tested only for the 4.14 stable tree. It seems to be
> > equally relevant for 4.9 and 4.4 though.
> 
> Now queued up for 4.14.y, thanks.

can you *please* slow a little down?

There are times (e.g. when I travel, visit customers on-site, being sick, etc...)
where I don't have the resources to monitor the mailinglists
in detail. Adding patches to stable on shout asks for trouble.

As Sudip points out, this patch needs a further fix patch:
25677478474a ("ubi: Initialize Fastmap checkmapping correctly")

Thanks,
//richard
