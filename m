Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QTI8-0003hN-DK
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 15:43:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Pantelis Antoniou <panto@intracom.gr>
In-Reply-To: <3EE88C84.6020803@intracom.gr>
References: <3EE88C84.6020803@intracom.gr>
Message-Id: <1055429015.2097.466.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 12 Jun 2003 15:43:36 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Trivial fix for Oops on unmount.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-12 at 15:21, Pantelis Antoniou wrote:
> Hi
> 
> This is a trivial patch which fixes some oopses for me in 2.4.21-rc7 with
> MTD compiled in instead of modules.

Thanks... those were already fixed in CVS on the 26th of May, though.

-- 
dwmw2
