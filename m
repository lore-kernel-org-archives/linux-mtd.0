Received: from mail3.deltamobile.com ([66.92.131.124])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3zlW-00030c-A9
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 15:34:56 -0400
Message-ID: <46840D5A.3050306@deltamobile.com>
Date: Thu, 28 Jun 2007 14:34:50 -0500
From: James Graves <jgraves@deltamobile.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: File system testing
References: <46829827.20508@deltamobile.com>
	<1183057642.1170.197.camel@pmac.infradead.org>
In-Reply-To: <1183057642.1170.197.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thanks for the reply David.

Turns out to apparently be a hardware problem.

Data written to the last 512 of flash memory (of a 32Mbyte flash part) 
sometimes doesn't work.  Sometimes, even though the programming 
apparently worked, you'll just get back 0xff anyway.  The rest of the 
flash memory works fine, and we were able to run our filesystem 
exerciser for over 12 hours solid, with no errors, once we excluded that 
part of the flash memory.

So, obviously, any block at the end of memory was getting corrupted.

I'm expecting there's some kind of memory mapping conflict, but that'll 
take further investigation.

----------------------------------------------------------------

What's funny is that we'd previously done some informal testing of the 
raw partition.  Reading and writing images to the /dev/mtdblock3 device 
directly.

And it seemed to be working fine.  But, as it turns out, we were only 
testing approximately 32Mbytes... and not _exactly_ 32Mbytes.

Let that be a lesson to you all!

Thanks again,

James Graves
