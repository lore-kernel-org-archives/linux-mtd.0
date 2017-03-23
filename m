Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzJu-0000lI-Om
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:46:18 +0000
Date: Thu, 23 Mar 2017 10:45:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, Yuanjie.Huang@windriver.com,
 raj.khem@gmail.com, Richard Weinberger <richard@nod.at>
Subject: Re: mtd-utils: various fixes, apply OpenEmbedded patches
Message-ID: <20170323104556.185f92e0@free-electrons.com>
In-Reply-To: <1b4bbd29-c93e-3e75-b01d-7b7b2ac93385@sigma-star.at>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
 <20170322161323.22b7489c@free-electrons.com>
 <1b4bbd29-c93e-3e75-b01d-7b7b2ac93385@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, 23 Mar 2017 10:33:21 +0100, David Oberhollenzer wrote:

> The first one (ubinize return status) has been applied shortly after
> the mtd-utils 1.5.2 release.
> 
> The second patch (about execinfo.h) sparked a discussion with Richard
> prefering a libmissing implementation instead. A libmissing has been
> added in August last year that provides a dummy implementation of the
> backtrace family of functions for libraries like musl that don't
> provided them.
> 
> The third patch, that removes the bits/stdio_lim.h inclusion was also
> applied already between the 1.5.2 and 2.0.0-rc1 releases.

Awesome, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
