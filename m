Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gvmC-0003Ag-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 22:45:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0203011524580.842-100000@ba.devicemonsters.com> 
References: <Pine.LNX.4.21.0203011524580.842-100000@ba.devicemonsters.com> 
To: "Brian P. Austin" <baustin@codemonsters.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Reproduction of NFTL Bug with DOC 2000 288MB FULL DEBUG 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Mar 2002 22:56:07 +0000
Message-ID: <16482.1015023367@redhat.com>
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

baustin@codemonsters.net said:
> re-did everything from scratch.  Dformat doc42.exb and loaded modules 

> _DoC_WaitReady called for out-of-line wait
> -- A whole lot of this --

You could comment that one out.

It doesn't look like anything's gone wrong with it (yet). Make a filesystem 
on it and do some dbenches or something.


--
dwmw2
