Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CejJE-0005sf-Li
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 19:15:58 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id iBG0FhV8001306
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 19:15:43 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBG0Fhft288180
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 19:15:43 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id iBG0FhxY009282
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 19:15:43 -0500
Message-ID: <41C0D3AC.3050801@us.ibm.com>
Date: Wed, 15 Dec 2004 18:15:40 -0600
From: Josh Boyer <jdub@us.ibm.com>
MIME-Version: 1.0
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
In-Reply-To: <1103152743.15913.33.camel@squizzey.bult.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gareth Bult (Encryptec) wrote:
> Hi,
> 
> I've been working on the MTD block driver for JFFS2 and now seem to have
> a relatively stable environment with a JFFS2 root filesystem on a USB
> flash key device. 
> (mtd block device speed now approximates actual device speed on both
> read and write)

I assume you mean blkmtd here.  The mtdblock driver is used to present 
an IDE type interface to flash, whereas blkmtd is used to present a 
flash interface to an IDE type device.

> 
> It seems to be much quicker (generally) than the previous ext2
> incarnation.
> 
> However, I'm looking at 30secs to mount the root filesystem.

How big of a device?

> a. Is it possible (conceptually) to background the mount scan so the
> system can boot while the scan happens ?

Which version of the code are you using?  Mount time has been 
significantly improved in newer versions of the code.

> b. Is there an easy way to bypass the scan and does JFFS3 do this ? 

Not that I know of, because the code needs to read the node information 
in order to get the versioning of inodes, etc. correct.

JFFS3 is essentially the exact same code base as JFFS2 right now.  It 
was just forked about a week ago.

josh
