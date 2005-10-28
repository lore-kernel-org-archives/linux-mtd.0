Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVZbR-0002V4-3M
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 15:09:28 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IP300E673VI2DA0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 15:09:18 -0400 (EDT)
Date: Fri, 28 Oct 2005 15:09:18 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1130524729.3775.39.camel@windu.rchland.ibm.com>
To: Josh Boyer <jdub@us.ibm.com>
Message-id: <Pine.LNX.4.64.0510281507530.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 28 Oct 2005, Josh Boyer wrote:

> For a fix, we added a conditional reschedule in the loop that calls
> do_write_buffer in the cfi_intelext_write_buffers function.  This made
> write times of 256KiB go from 20-50 seconds to 1-6 seconds on average.
> 
> Would adding a conditional reschedule be an acceptable fix?

I would think so.


Nicolas
