Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lcwt1-0001By-1e
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2009 07:11:57 +0000
Date: Fri, 27 Feb 2009 16:08:05 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH] mtd: sh: maple: Support the Dreamcast visual memory unit
	as a flash mapping
Message-ID: <20090227070805.GD28802@linux-sh.org>
References: <1234641948.6609.13.camel@localhost.localdomain>
	<1234642605.6609.17.camel@localhost.localdomain>
	<1234643202.6609.25.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1234643202.6609.25.camel@localhost.localdomain>
Cc: linux-sh <linux-sh@vger.kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 14, 2009 at 08:26:42PM +0000, Adrian McMenamin wrote:
> This patch adds support for the Sega Dreamcast visual memory unit as a
> flash mapping. It requires changes in the maple bus driver (posted
> separately) to support block reads and writes.
> 
> The VMU is a 'smart' flash device, with a built-in 8-bit controller -
> for instance there is an erase before a write but it is hidden from the
> user. But the device's overall behaviour means it works well with the
> mtd layer and it is appropriate to add it as an mtd mapping.
> 
> Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>

If someone from the MTD side wants to Ack this, I can fold it in to my
tree on top of the maple patch that it depends on, which I already have
queued.
