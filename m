Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.avab.com)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FTMDF-0004wr-14
	for linux-mtd@lists.infradead.org; Tue, 11 Apr 2006 12:59:39 -0400
Received: from [192.168.1.142] (w238.z208176144.sjc-ca.dsl.cnc.net
	[208.176.144.238])
	by ns1.avab.com (8.12.8/8.12.8) with ESMTP id k3BGN81h013326
	for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2006 09:23:08 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 11 Apr 2006 09:59:27 -0700
MIME-Version: 1.0
Message-ID: <443B7DFF.29677.2EE3D2@dupre.avab.com>
In-reply-to: <E1FTLID-0004I7-2m@canuck.infradead.org>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Re: Problem with DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 Apr 2006 at 12:00, linux-mtd-request@lists.infradead.org wrote:

>    1. Problem with DOC (C. Rahul)
> included all the neccessary MTD drivers and rebuilded
> the kernel.
>   During loading of OS the DiskOnChip was detected and
> was given out to device MTD2.
>   But after that I am unable to write into it
> anything.

More information please.  Which kernel drivers did you load?  How did 
you format the DOC?  What DOC (NFTL or INFTL, use DINFO tool)? What 
firmware?  How are you mounting the DOC...?

-J
