Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19E7Ge-0003dt-4e
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 13:46:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Hans_Peter Urbanek <Hans-Peter.Urbanek.extern@icn.siemens.de>
In-Reply-To: <3EBB9EDF.A1DE0AE9@icn.siemens.de>
References: <3EBB9EDF.A1DE0AE9@icn.siemens.de>
Message-Id: <1052484402.23135.192.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 09 May 2003 13:46:43 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Linux-MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 and kupdated
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-09 at 13:28, Hans_Peter Urbanek wrote:
> Now, as new logs are being written (and older ones are deleted), JFFS2
> at some point has to reuse blocks. I observe occasional delays in
> write system calls which appear to come from waiting for the completion
> of an erase operation. The completion of the erase operation is done
> through the `kupdated', which then wakes the `write' task.
> 
> In order not to wait up to five seconds for `kupdated' to become
> active again, I made a change in `jffs2_do_reserve_space'
> fs/jffs2/nodemgmt.c that wakes `kupdated' immediately and saves these
> seconds. For me this change seems to work. 

I think you'd do better just to call jffs2_erase_pending_blocks()
directly as we are doing anyway in the eCos case. Just remove the ifdef
and everything within the '#else' case, leaving only the call to
jffs2_erase_pending_blocks().


-- 
dwmw2
