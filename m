Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1913L8-0002RG-5I
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 12:57:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Stephane Fillod <stephane.fillod@thomson.net>
In-Reply-To: <20030331115208.A32408@bond.rennes.thmulti.com>
References: <20030331115208.A32408@bond.rennes.thmulti.com>
Message-Id: <1049371023.14220.28.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 03 Apr 2003 12:57:04 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Misc util patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-03-31 at 10:52, Stephane Fillod wrote:
> Has anyone of you ported mkfs.jffs2 to Solaris?

Shouldn't be too hard. You need to fix cpu_to_jemode() so it mangles
from Solaris mode-bits to Linux mode-bits, since they're unlikely to be
the same. Possibly also dtype in dirent nodes?

Other than that, I think it should mostly work.

-- 
dwmw2
