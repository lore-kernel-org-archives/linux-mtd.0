Received: from u-87-21.karlsruhe.ipdial.viaginterkom.de ([62.180.21.87] helo=dea.waldorf-gmbh.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157JBH-0004v1-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 16:55:44 +0100
Date: Tue, 5 Jun 2001 17:17:04 +0200
From: Ralf Baechle <ralf@uni-koblenz.de>
To: Chris Wedgwood <cw@f00f.org>
Cc: Bjorn Wesen <bjorn.wesen@axis.com>, David Woodhouse <dwmw2@infradead.org>,
   linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush.
Message-ID: <20010605171704.B30818@bacchus.dhis.org>
References: <13942.991696607@redhat.com> <Pine.LNX.4.21.0106051105110.1078-100000@godzilla.axis.se> <20010606005703.A23758@metastasis.f00f.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20010606005703.A23758@metastasis.f00f.org>; from cw@f00f.org on Wed, Jun 06, 2001 at 12:57:03AM +1200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, Jun 06, 2001 at 12:57:03AM +1200, Chris Wedgwood wrote:

> I don't know about the CRIS (never heard of it, what is it?), but on
> an Athlon when benchmarking stuff, I could still see L1 cache hits
> from data that was 15 seconds old under certain work-loads (obviously
> not gcc!). Does anyone know how old something may exisit in cache
> before being written back to RAM?

I know of no architecture that has a time limit that after which's expire
caches get written back to memory.  In other words cache lines may stay
dirty for an indefinate time if things are just right.

  Ralf
