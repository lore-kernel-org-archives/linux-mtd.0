Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16l4i9-00006z-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 09:06:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C8F04B4.D745D633@ctam.com.au> 
References: <3C8F04B4.D745D633@ctam.com.au> 
To: justin.ipsen@ctam.com.au
Cc: linux-mtd@lists.infradead.org
Subject: Re: ECC Reset problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Mar 2002 09:17:32 +0000
Message-ID: <25659.1016011052@redhat.com>
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

justin.ipsen@ctam.com.au said:
>  I'm running linux 2.4.1-pre11 on a powerPC platform. I have been
> using a 32M doc2000 with no problems. I've just started to use a 48M
> doc2000 but the On-Chip ECC engine seems to work just once after reset
> and not again.   It looks like the "ECC Config" Resets function has
> stopped working?

Hmmm. I can't see any documented timing constraints on the ECC Reset. But 
try adding a delay between...

		/* Prime the ECC engine */
		WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
		WriteDOC(DOC_ECC_EN, docptr, ECCConf);

Might also be worth looking in include/linux/mtd/doc2000.h and changing the 
definition of DOC_ECC_RESET to DOC_ECC_RESV instead of zero.


--
dwmw2
