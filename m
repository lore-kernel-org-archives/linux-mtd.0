Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175i9D-00079V-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 08:15:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFCELHDGAA.acurtis@onz.com> 
References: <NCBBIINEHIPFGJPLBEIFCELHDGAA.acurtis@onz.com> 
To: acurtis@onz.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: 64bit bus patch for 2.4.19pre7? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 May 2002 08:15:07 +0100
Message-ID: <1656.1020928507@redhat.com>
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

acurtis@onz.com said:
> I recently acquired the 2.4.19pre8 kernel sources and was surprise
> when I configured the kernel. The 64-bit bus option was not available
> in MTD. Has this been pushed to the main kernel sources? 

Not yet. I sent quite a lot of stuff to Marcelo for 2.4.19-pre, and I'm 
waiting for 2.4.20-pre to send the final changes, which are slightly more 
intrusive.

When that's done, I'll sync up with the 2.5 kernel too.

--
dwmw2
