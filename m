Received: from e35.co.us.ibm.com ([32.97.110.133])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CYnc4-0000e5-Fy
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2004 10:38:56 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id iATFcgQf460436
	for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2004 10:38:43 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iATFcgm2455738
	for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2004 08:38:42 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	iATFcfZg009243
	for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2004 08:38:42 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Andrew Carlisle <ACarlisle@acmepacket.com>
In-Reply-To: <200411291024906.SM01112@ACarlisle>
References: <200411291024906.SM01112@ACarlisle>
Content-Type: text/plain
Message-Id: <1101742712.23997.2.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 29 Nov 2004 09:38:32 -0600
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Multiple banks of flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-29 at 09:15, Andrew Carlisle wrote:
> I have two banks of flash that are physically located at different
> locations.  I have successfully mapped one bank.  I can also map the other
> bank, but the problem is that I can't map both the banks simultaneously.
> 
> I went into physmap.c and modified init_physmap() so that it basically does
> the same thing twice, two probes, two partition searches, but it doesn't
> seem to work mapping two banks which are located at different address mapped
> in at the same time.
> 
> I am using the Monta Vista 2.6 version of the kernel.

Joern Engel wrote a mphysmap driver some time ago.  It works fairly
well.  You might be able to find it if you google for it.  Not sure why
it wasn't included in MTD CVS.

Otherwise, you could always write your own mapping driver.  There are
multiple examples that deal with two or more flash banks in CVS.

josh
