Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19c1Cp-0003go-31
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 12:09:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: roger <rogerxxmaillist@san.rr.com>
In-Reply-To: <1058094420.2750.13.camel@localhost3.localdomain>
References: <1058094420.2750.13.camel@localhost3.localdomain>
Message-Id: <1058180967.26819.83.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 14 Jul 2003 12:09:27 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: intel 440bx unshadow for doc2001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-07-13 at 12:08, roger wrote:
> If i'm correct, the unshadow code just needs to be written into MTD for
> everything to work easily? 

Seems perfectly reasonable.

In theory, we ought to already have the appropriate unshadowing code in
drivers/mtd/maps/l440gx.c; it's just that that driver will only then
look for NOR flash chips rather than a DiskOnChip. Does it work if you
load l440gx.c, watch it fail to find any flash chips, then unload it and
load docprobe.c?

I'm working on a rewrite of the DiskOnChip drivers; I'll probably make
it so that a separate driver can call a 'probe for DiskOnChip at address
XXXX' function, then we can make that an option for l440gx and other
such drivers rather than having hard-coded tables in the docprobe code
itself.

-- 
dwmw2
