Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVbrz-0003yi-NO
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 17:34:41 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IP300FBDALQMTN0@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 17:34:38 -0400 (EDT)
Date: Fri, 28 Oct 2005 17:34:38 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1130524729.3775.39.camel@windu.rchland.ibm.com>
To: Josh Boyer <jdub@us.ibm.com>
Message-id: <Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
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

> I'll preface this with a disclaimer that we saw this on 2.4, however the
> same general issue still seems to be present in MTD CVS.

For 2.6.x? Are you sure?

> Basically, the writing thread was starving kupdated from making any
> progress and since kupdated was never charged with any time, the writing
> thread was always being marked as needing to be scheduled in the wake_up
> code.  This cause it to do a schedule_timeout(1) every buffer write (32
> bytes).  In 2.4, that's approximately 10 milliseconds of wait time
> because it's based on jiffies.

In 2.6 there is no schedule_timeout() anywhere in the MTD code.

> For a fix, we added a conditional reschedule in the loop that calls
> do_write_buffer in the cfi_intelext_write_buffers function.  This made
> write times of 256KiB go from 20-50 seconds to 1-6 seconds on average.

I still can't figure out the linear sequence of events that can lead to 
the behavior you're seeing.

Mind re-doing your explanation in pseudocode-like form to help my poor 
brain please?


Nicolas
