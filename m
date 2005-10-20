Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EScfY-0002y7-69
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 11:49:32 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IOO000VR19Z77A0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 11:49:11 -0400 (EDT)
Date: Thu, 20 Oct 2005 11:49:11 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1129819053.4219.10.camel@windu.rchland.ibm.com>
To: Josh Boyer <jdub@us.ibm.com>
Message-id: <Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Oct 2005, Josh Boyer wrote:

> Hi,
> 
> Support for Extended Query Table version 1.4 was added to
> cfi_cmdset_0001.c recent.  For the most part it works, however I'm
> seeing it detect an incorrect number of hardware partitions on an Intel
> P30 chip.  Adding some debug printks showed it reported 7, which is
> incorrect for this chip.

7 is indeed an "odd" value in all its meanings.

> Digging through the code, I noticed the following lines:
> 
> 		/* Burst Read info */
> 		extra_size += (extp->MinorVersion < '4') ? 6 : 5;
> 
> I think the values to be used are reversed here.

They are certainly not reversed as it used to be 6 for version 1.3 only.

> Version 1.4 of the extended query table shows that the Burst Read info 
> spans 6 bytes, whereas the above code results in a value of 5 being 
> used.  This also accounts for the incorrect 7 value I'm seeing, since 
> the last byte of the burst read info is 7.

Could you double check with other flash model docs please?

I don't have the Intel M18/M30 documentation handy but I think the 
current code is right in that case.


Nicolas
