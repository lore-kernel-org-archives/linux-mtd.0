Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172zTz-0002LU-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 May 2002 20:09:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <DJEELHNCJDICCAIMLCCCOEILCCAA.kasturi@utstar.com> 
References: <DJEELHNCJDICCAIMLCCCOEILCCAA.kasturi@utstar.com> 
To: "Kasturi Raghunath" <kasturi@utstar.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Running JFFS on ep8260 board 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 01 May 2002 20:09:29 +0100
Message-ID: <28470.1020280169@redhat.com>
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

kasturi@utstar.com said:
>  physmap flash device : 1000000 at ff000000 CFI: Found no Physically
> mapped flash device at location zero

Double-check your base address and buswidth, and whether you need to do 
anything special to enable write cycles and Vpen to your flash chips.

--
dwmw2
