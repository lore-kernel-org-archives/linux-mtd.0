Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cUtN-0001rp-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Feb 2002 17:14:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02021712440204.08654@thomas> 
References: <02021712440204.08654@thomas>  <02021418433508.29375@thomas> <1035.1013707668@redhat.com> <7814.1013939475@redhat.com> 
To: gleixner@autronix.de
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 & NAND 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 17 Feb 2002 17:25:39 +0000
Message-ID: <21587.1013966739@redhat.com>
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

gleixner@autronix.de said:
> Maybe we  could reduce the information to a filesystem type and define
> the oob-layout  as constants in a .h file. That would be less overhead
> but gives the  flexibility for both chip and filesystem driver to use
> free oob layouts. It would be not a big hack to rearrange it that way.

I think that might be best. After all, there are only a limited number of 
such arrangements. 

I'd actually like to overhaul all the oob and ecc stuff in the mtd_info 
structure - I don't like any of it very much. If we can make do with the 
existing API for a while longer, then we can give some serious thought to 
its replacement. 

--
dwmw2
