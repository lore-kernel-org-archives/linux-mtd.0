Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSHOE-0008Sw-Tx
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 08:09:40 +0000
Date: Thu, 29 Nov 2018 09:09:23 +0100
From: Greg KH <greg@kroah.com>
To: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Cc: stable@vger.kernel.org, dedekind1@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubi: fastmap: Check each mapping only once
Message-ID: <20181129080923.GE13859@kroah.com>
References: <20181126103842.3249-1-martin.kepplinger@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181126103842.3249-1-martin.kepplinger@ginzinger.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 26, 2018 at 11:38:42AM +0100, Martin Kepplinger wrote:
> From: Richard Weinberger <richard@nod.at>
> 
> [ Upstream commit 34653fd8c46e771585fce5975e4243f8fd401914 ]
> 
> This commit got merged along with commit 781932375ffc
> ("ubi: fastmap: Correctly handle interrupted erasures in EBA") upstream but
> only the latter has been applied to stable v4.14.54 as commit a23cf10d9abb.
> This resulted in a performance regression. Startup on i.MX platforms is
> delayed for up to a few seconds depending on the platform.
> This fixes ubi fastmap to be of the same performance as it has been before
> said fastmap changes.
> 
> Fixes: a23cf10d9abb ("ubi: fastmap: Correctly handle interrupted erasures in EBA")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
> 
> Richard, although this fixes a major slowdown regression in -stable, do you
> consider this "stable" too?
> 
> This applies and is tested only for the 4.14 stable tree. It seems to be
> equally relevant for 4.9 and 4.4 though.

Now queued up for 4.14.y, thanks.

greg k-h
