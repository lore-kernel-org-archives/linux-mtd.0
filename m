Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sYof-0003VL-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 01:39:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <005701c1da70$1a0370f0$87657bc8@athlon> 
References: <005701c1da70$1a0370f0$87657bc8@athlon>  <01f601c1d9ce$b9a1e5d0$87657bc8@athlon> <3371.1017706441@redhat.com> 
To: "Derek Ross" <dross@iders.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Are erase suspends possible? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 Apr 2002 01:38:39 +0100
Message-ID: <19030.1017794319@redhat.com>
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

dross@iders.ca said:
> I'm looking at a recent version, and it has the function
> "cfi_intelext_suspend". 

That's for power management.


> "do_erase_oneblock_dont_wait", which doesn't wait for the erase to
> finish, and returns immediately,

You should not be looking in there. You should be calling the mtd->read(),
mtd->write() and mtd->erase() functions. The latter is already permitted to 
return immediately, calling a caller-provided callback later on completion.

The read function already suspends active erases to fulfil the read 
request. You can easily make the write function do the same, on chips that 
support it.

--
dwmw2
