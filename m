Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175ozW-0007bq-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 15:33:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFEELMDGAA.acurtis@onz.com> 
References: <NCBBIINEHIPFGJPLBEIFEELMDGAA.acurtis@onz.com> 
To: acurtis@onz.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: 64bit bus patch for 2.4.19pre7? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 May 2002 15:33:48 +0100
Message-ID: <15214.1020954828@redhat.com>
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
> What would be a good CVS version to use or is HEAD good enough?

Yeah. I think it needs a one-line addition to compatmac.h to make bits of it 
compile with 2.4, but that should be a no-brainer.

--
dwmw2
