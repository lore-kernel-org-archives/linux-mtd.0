Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4Jyl-0007Pj-Qj
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 09:28:37 -0500
To: David Woodhouse <dwmw2@infradead.org>
References: <20050224111125.GH8651@stusta.de>
	<1109251232.5420.55.camel@hades.cambridge.redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 24 Feb 2005 07:28:32 -0700
In-Reply-To: <1109251232.5420.55.camel@hades.cambridge.redhat.com>
Message-ID: <m3acpurq0f.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	"Eric W. Biederman" <ebiederman@lnxi.com>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [2.6 patch] remove drivers/mtd/maps/ich2rom.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> writes:

> On Thu, 2005-02-24 at 12:11 +0100, Adrian Bunk wrote:
> > drivers/mtd/maps/ich2rom.c is completely unused because it was renamed 
> > to drivers/mtd/maps/ichxrom.c .
> > 
> > This patch removes the stale ich2rom.c file.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> ack.

ack.

Eric
