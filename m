Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Anu79-0003Dn-6x
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2004 06:32:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: leoli@motorola.com
In-Reply-To: <1075788182.20041.38.camel@Gundam>
References: <1075788182.20041.38.camel@Gundam>
Content-Type: text/plain
Message-Id: <1075789858.19654.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 03 Feb 2004 06:30:58 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Mtd compile fails on ppc arch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-03 at 14:03 +0800, Li Yang wrote:
> Hi,
> 
> I updated the mtd driver in kernel through the latest snapshot.  I have
> tested kernel 2.4.20 and 2.4.22.  The same parse error occurred for ppc
> arch.  I have tried two cross toolchains, the results are the same.  So
> it's unlikely to be cross compiler problem.  Btw: i386 compiles well.  I
> looked into some code, the problem seems to be related to headers.  But
> I can't figure it out.  Does anyone have a clue?

#include <linux/slab.h>

Evidently it gets included somehow on i386 via one of the other headers
we _do_ include -- but not on ppc. But sharp.c is deprecated and you
should be using jedec_probe and cfi_cmdset_0002 instead. 

-- 
dwmw2
